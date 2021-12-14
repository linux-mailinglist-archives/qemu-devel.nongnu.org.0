Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81704749AA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 18:37:35 +0100 (CET)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxBk6-000071-Bv
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 12:37:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <petr.pavlu@suse.com>)
 id 1mxBba-0002Ks-Ml
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 12:28:46 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:57229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <petr.pavlu@suse.com>)
 id 1mxBbU-0005Ux-Cz
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 12:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1639502914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zUSudDcSoiRbSlYKGQwPNsObuJeXAj1guZevQEEjBH8=;
 b=c1uBc55vP7IL+Q5Ad6QAtvCb6s9FYtmr4qwS0oxRnTWsYCSC6q5slt+mAi4Ip2DcikZ/jT
 vU5BpHblEVcVMxPaVFaiSoocOwQT4xtF6/2926CMajpgtXd5H/inzsSE4mWCVVEb0ouBh4
 5a1Zm6p/aHBnIUiQlh+gZRerBa2QMAY=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-degZBCf9MfW_9-qzvONTRg-1; Tue, 14 Dec 2021 18:28:33 +0100
X-MC-Unique: degZBCf9MfW_9-qzvONTRg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0bHn01jHahrC7/ZgS55gXqqX6YMbeFYP7AwbwMsuwHT9gFoOPWo1n2jMpcD/khKWrtWxYgwZStcSScgR8m5g9pIm1/ZzVDZ2frk3/HAFqOKlLKKC3IbjTXhjlgS6H74STKnRXXrj6KpN7a3AA/i+jaiIBIsJcbmLOi+AdDzFJVr5YFrLr36O1WiQMp+sd79KMPQ82Ii/il5QHfXtZv+Dg9FRiUvtmOpFEiLPVRq1MhvZ4rsquj08Q1nFC6A5l26BhoC4BSg1KdwUaRJBbB5Dp43k62mJ+/tV22wZN+3srOeBZxv1MO2TKoiIz6qgAvv/O8YlkUVeeV4E3PA94MPYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUSudDcSoiRbSlYKGQwPNsObuJeXAj1guZevQEEjBH8=;
 b=ELxPwn1cx1qOawukt9welx3mhkbWiM/3+SFk1qeLL2IDEjKDAniI8tzDz4zfHu2PhcwG6O8mYcnHOK/9dn1lbBBYX5pgSNO5JCxV7wIelgtZcoeivipBygFwyU9pA6IyzotcpV9qWQJph9aNZOWgU6lkIxM7o5PruXyoFfGyovfCXL4iPjmezAGQJZSibFN5ArYSF1xNKlXCCM88V6OaCNI6eEwP6zlDMWJOH8b+pqHlz5mxPGhYnqc91EL3gfUDHZx1MZ+vasph485ZHpxVrgs3yRP9kHBNC/agMpacG5T1/HafhiZIatbDROJLOrpd4Vzz6nf/adWm/KozMNrB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM0PR0402MB3395.eurprd04.prod.outlook.com
 (2603:10a6:208:1a::16) by AM0PR04MB5154.eurprd04.prod.outlook.com
 (2603:10a6:208:c4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 17:28:32 +0000
Received: from AM0PR0402MB3395.eurprd04.prod.outlook.com
 ([fe80::488f:35ef:e500:1a94]) by AM0PR0402MB3395.eurprd04.prod.outlook.com
 ([fe80::488f:35ef:e500:1a94%3]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 17:28:32 +0000
From: Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH] hw/intc/arm_gic: Allow reset of the running priority
To: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Message-ID: <771c599a-3ea5-8d59-909a-05f127c8ff0e@suse.com>
Date: Tue, 14 Dec 2021 18:28:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0211.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::15) To AM0PR0402MB3395.eurprd04.prod.outlook.com
 (2603:10a6:208:1a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4d3357f-a6d2-448e-0b19-08d9bf2726c2
X-MS-TrafficTypeDiagnostic: AM0PR04MB5154:EE_
X-Microsoft-Antispam-PRVS: <AM0PR04MB51542E47984BD4761F6872C8E6759@AM0PR04MB5154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PL2owmKtiFWMAhExTeGGeGWcEJ59NA2I8Ef8Lfy6GC+RJ4oqBBT7Chx50H8yg0Qq8a7vCMnpAqqc/MNu/vWM+5NISu9k9L5SrWKTGRW9uq1VtAfUVfUUlpEVuyaeJCGA4GQDfL2sh4cXIJ0Vm9sglYuKH+bFX25HY4v7xK/d9brh3S0toYcrdoVeepV1IMdO+RaxIxhgH/OFVwVNgdJskuZQVjM+NVy8Ea18Ok9pVtEq3PypUQqTiYUUEqrMFFL/eq0Rp7hJFbbqM0Lif9iZWzHT/cCIJ/w5jtuGjqohO/Y1PdfN+UiWZ68RuBwxnwYM8GAyJNBSbOHFApbUgwZk2quDoGeS9Om/hstFUXHAyYiw0ofY2JhMRGEIM0LOaircqdAwuypwff/2CwKxASIhKPFZs+wsy/WKwHqKAE+8wjj02Emo20dSj/w644nGmrhFkMcFrwQeSFVTKpkyOCMOLYlU1qw9yt3FspFU/U0kpFoR+oapDjlrn5JEmkgmHSq42jZrMG2imSUfGAAtXq0FRJtbza6LL7H0iV95BbFuoOXwdcyeyoY1l/cnBf4rBTOQysrjdu+pzI6CisGimizCgyyG5SttWTvmIeTEI1p+cyDWP5jw3FRkR/MXd/Bl/LwG1GW/v6t+dHFybp9gB/JHN1XgGHSfCRRDRLQUcFs7cJFK36edAysQSUWxxReVDAgSJr6WwbREeuSYLFHIVDB0TuQlR8tsLjoef0sShQFsL18=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0402MB3395.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(5660300002)(2906002)(316002)(44832011)(66946007)(31696002)(508600001)(66556008)(31686004)(36756003)(8936002)(8676002)(86362001)(6486002)(6512007)(186003)(2616005)(6506007)(26005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elBXNU5CYStxbXdOVHc1d0d0UVh0ajJvWnlWOHJSb0pWSlBxUFEzZHExMjNQ?=
 =?utf-8?B?OCtSa1NxRHZxRFRSaHJIZTJ4ZmozdWVKaW1sVVVoWFdMKzVlMHEzSENhRHNh?=
 =?utf-8?B?ZDN6dVFQRFAvM3E5cDdFa0xBTG03WWJac0xpQUg1QUVtWFpiR0NRTDlCd2Fp?=
 =?utf-8?B?LzZvM2d4OEpGdkdsNWFibnVEa0hUMFFzY2JRWkdJWE5DQ3QybHpHNVRaTUly?=
 =?utf-8?B?dHV6azU4K3hPaUNWRFE1RUpEZzYyc3RhRnhkaW1iYXRicDA0NE5xSFZhUjQ0?=
 =?utf-8?B?bzVWd0ZwWXpaNEZ3aVkvNzFxcDNZSTdLQW5EcEtsRG81TVpUMVMwL3lZM24w?=
 =?utf-8?B?bkdBN1Q1cUxlUDR4NXMwcUdnQVlYRTBObEpOTVV6V21iYTd4RytndStBT0po?=
 =?utf-8?B?cWtnMENaMTZodDdrdVhwM0xuMTAvQ3JKNmlyUVdlalJPM0p1VEUrdFVKaGd6?=
 =?utf-8?B?aVNiMEx4a1Z0a2Z3NzJpK2hOd0JVOHQyWjBtb0lhM0ZVQWRaQ29XRnM1U1Qx?=
 =?utf-8?B?bDNVOVlraHAzZ25BdjJVMUhGVDRRdWVPZXdXd1NSV3RmTlJYMlQ1SmhPMGZx?=
 =?utf-8?B?dTZTTFFnV0lENmplZXJRUUV5ZWxlTWYwV1NpdkNVbzFubzh0VVhLWHpVTm5x?=
 =?utf-8?B?ejlhVGo2ZDFlZFNmWmcvNlNhZG5FTnZ2cloyckdiWjF5TVVaSkcwSUdOWkVZ?=
 =?utf-8?B?UFRUS1lHYi9Rek9ZL21QSHBhKzlRblhOQ3JueTl2WGU1S3JoTkJjNng0eUdK?=
 =?utf-8?B?V0RYVE1EN2tFV094dldlbVpJU21vVGhDME5VbWxWUFd3VFAvWGJabXl2ODBQ?=
 =?utf-8?B?SExVTXVrSm5IVW53N3pRbzQ5SmxQODVoMUdKTVVKRzczNnVzOHNwdmtGNUtE?=
 =?utf-8?B?UkdyejI1ZUtZeW9uYzl4bWhEbGo3blFKdW1LVnNpdUZFbWNKWHl4V3B4SlBN?=
 =?utf-8?B?a3lSNnRDREphYUp6T2pueEFsbDdEN05FSkV5aXlvbkZZT3BhYXcySG9ScDVi?=
 =?utf-8?B?ZFhJaDFXNGRxanRRKzlPaFhHUHhpMktqZ0pUbzMxQjloTisxV0lHbE9HK2Jn?=
 =?utf-8?B?Qk44RUEyODJuZnlQMUEvTVd1dHdKbWNNR2pmMnVFb2FiNGRSejRUSnBCVHYw?=
 =?utf-8?B?TTZURXlKUVJpdTZyMkRlMGdGZFkwMVJjaHBjM2JWNURUbzZUcjh4VGMvenZI?=
 =?utf-8?B?RWZSYWIrZzN6Smw0ckxITjJQby9ML295L1hEbFhVczl0MG1TbUV5L1Zqa1Vu?=
 =?utf-8?B?YlJ3WEZBOU9JMlZ6RlJDS1ZSL0YyaGswdFJmYkxZV0VBYTg1R2JrUjZKeGpw?=
 =?utf-8?B?emhEa2ZCd1h6cEVzTlBIZThOSEh1dkVFRHJCcUdFeWVrSEN1dTVsSW1FY0pn?=
 =?utf-8?B?SWRqZmsraWhYbnNQbjF3RU5qclozOFlBS2F1VVBOLzd0bk9SU1pkSTFjcHA1?=
 =?utf-8?B?akZTZ0xLRHF6Lzg2bTNFb1FvNnJrQ3dQWG5GSmVPaENKZndvVHI2bUdZWkNv?=
 =?utf-8?B?bEJQNTRrSzNuMXBpL214blkraEpqTVBYamw5NzlNR1h6bk50QmNnVHBpekZk?=
 =?utf-8?B?ZnhXcG02SHdVUThaOEZIRjcxalRHcGc0Vjg2dU5idlVNbVlnSlVDYXlkQ0M4?=
 =?utf-8?B?eHQwbG9FaEVsUkgyeUwvREEvWXR2Q0ZvWGYxU3JkRmhWUGw5TVc3amgwRkVY?=
 =?utf-8?B?eVlKQUE4aFUyZFNxUWRQNEgxeWc5NndRVVhPVERuQjFjWWkxbFFkRnVaYVhn?=
 =?utf-8?B?N2lkelcybENVOW1FZ0V0SitMOXdTM1ZiTG1kTHcxZC9jNTVGaFE0WnZrVVRE?=
 =?utf-8?B?RStydUhkQVJ1ek1BUXJMNGJyc3BxUjUyMkNhYmJQYlJjQzN2MkxPa3NoMUFa?=
 =?utf-8?B?bDU2eFlYN2F5bGU5V0VkbVVWSWZwUmdKQTZ6VllDdGdQcFRTeHAyTnAyUEJa?=
 =?utf-8?B?WGpOT3N1Rnhta3owN0RmVy92SGtaQ0RVQ25hUlZka1hacDlBVmNHczlsSWp1?=
 =?utf-8?B?SnFFa3lVOVlSdk5vdTgvdTlOY05nUE5jTmJHOWlwYjU3eUcxU1NPTWdmc1lI?=
 =?utf-8?B?TEJGZVFsMHJDNmlhbWkydUJhUmF4QWVlRWNLaDJzSjJPNzhSaUV2TWhjU1Nl?=
 =?utf-8?B?MklhWHBLdlZ2Z0JOaFZTc2tDRFA3dDZoL2RjYUJ4NEJxTjJsaVFnQzFXVVg3?=
 =?utf-8?Q?+S8yaGCUXiV84SyR/PtZQ48=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d3357f-a6d2-448e-0b19-08d9bf2726c2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3395.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 17:28:32.5476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXX2HdaU5FiTv6g48QhfKOQmJ/avviTMpwuxNwrMEHqrlYT1ZVD57gzTxJ224CTiWhX/t/qnPmqKAS6z6R3USg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5154
Received-SPF: pass client-ip=194.104.111.102; envelope-from=petr.pavlu@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 14 Dec 2021 12:35:42 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running Linux on a machine with GICv2, the kernel can crash while
processing an interrupt and can subsequently start a kdump kernel from
the active interrupt handler. In such a case, the crashed kernel might
not gracefully signal the end of interrupt to the GICv2 hardware. The
kdump kernel will however try to reset the GIC state on startup to get
the controller into a sane state, in particular the kernel writes ones
to GICD_ICACTIVERn and wipes out GICC_APRn to make sure that no
interrupt is active.

The patch makes sure that this reset works for the GICv2 emulation in
QEMU too and the kdump kernel starts receiving interrupts. It adds
a logic to recalculate the running priority when GICC_APRn/GICC_NSAPRn
is written and implements read of GICC_IIDR so the kernel can recognize
that the GICv2 with GICC_APRn is present.

The described scenario can be reproduced on an AArch64 QEMU virt machine
with a kdump-enabled Linux system by using the softdog module. The kdump
kernel will hang at some point because QEMU still thinks the running
priority is that of the timer interrupt and asserts no new interrupts to
the system:
$ modprobe softdog soft_margin=10 soft_panic=1
$ cat > /dev/watchdog
[Press Enter to start the watchdog, wait for its timeout and observe
that the kdump kernel hangs on startup.]

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 hw/intc/arm_gic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index a994b1f024..2edbc4cb46 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1662,6 +1662,10 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         }
         break;
     }
+    case 0xfc:
+        /* GICv1/2, ARM implementation */
+        *data = (s->revision << 16) + 0x43b;
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_cpu_read: Bad offset %x\n", (int)offset);
@@ -1727,6 +1731,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         } else {
             s->apr[regno][cpu] = value;
         }
+        s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
         break;
     }
     case 0xe0: case 0xe4: case 0xe8: case 0xec:
@@ -1743,6 +1748,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
             return MEMTX_OK;
         }
         s->nsapr[regno][cpu] = value;
+        s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
         break;
     }
     case 0x1000:
-- 
2.34.1


