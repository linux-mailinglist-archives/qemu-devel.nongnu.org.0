Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD7B67FAFE
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 21:51:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLs9x-0006Zv-D6; Sat, 28 Jan 2023 15:50:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9q-0006YB-6B
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:43 -0500
Received: from mail-db8eur05hn2032d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::32d]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9o-0005Ml-Qw
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eH7M1gnurI76z6Jf8EEW+kgr7/1qWyWc6OF/q0G9NHKGTeqDudLBUQvYbvXUeJpfrynEA14ltwONep2wUgKJvMbgClPnCDGjpGydRCVgmdCtl3/cBTtgXS7nC7VmDHZjUfaGeFOWDNdMrCYfCxPPlA+ErE9ymltSBLXP3wDv3QCy9i0WMHM4M+TRj1UZIYW5WrQpwtDL3MCEI2aYb6aQGlJ+1KiHAMHibMYVbdw8Z4yHO3MeLNdo5EgMGZjigIxOHWJhwxOoWnY+X18en2VflOc4a84Kl42GqvDWMnMk8Qq4ukqmMiljfCPOaGAU1o7QPl9gEVJighmKMpQShc9NRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWlyb/2xjYrrjPXGZnRZBO9TdxBIGj+8g6NmikAJhj4=;
 b=NFA6CiErbru5t+FuTuJXbBLx0DI3z9ayL2YMxgkSdtZ1/kJMJ8sAvj+hsmzoVWS3fOOl7m96tlITxaVvJsJ/nQuvA0Cvhvdz5YXKwwk9Njs+pN2rHaueT2R8B+ng6ONOKsD6dxMwgbF2AjPlZ+l61gHvxAhjeEGCyQ6hJ/rKcjGrSCGTROwOCQAG6BM5m9y3ehFUlYxboW/XghLYOC3rKMyyVOcCRpvxjiz22LF5hQvXk5HB9MQaJTnuei5aDyUHTx4/iprEjO8f1cy6OI8wjAOslBopO/ZODVv+J4PF23eTjX1ySjtV+lAfoK6Tk9ppP3DmH5qAQS3CR6DyeRyJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWlyb/2xjYrrjPXGZnRZBO9TdxBIGj+8g6NmikAJhj4=;
 b=K2pg8Vi0SjnPDfkR26GIfwBKvSOyJ3RqikTKtoy+NfjoQQGaStt5woHiskeoaoOkQ1bWIianw3GbqoU8Vl82Qnp8PvqbFjKaRoGulXdB/G1OmvKcelTBVv8aFdAcpvL6+UKrzvnV/1S1QvoHz1S4VOD8YW5LhD8IBBtdu5uFkcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0661.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sat, 28 Jan
 2023 20:50:21 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.030; Sat, 28 Jan 2023
 20:50:21 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 8/9] igb: respect VT_CTL ignore MAC field
Date: Sat, 28 Jan 2023 14:46:32 +0100
Message-Id: <20230128134633.22730-9-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0036.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::13) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM7P189MB0661:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb6e3f7-d8c6-4dc7-f53a-08db017144dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7bYEZr+Cj4XWzU+o2DAfuVBSwTTqON+Xncp+4iIzxPHUY/Ow31r4wIDa2fVdouC3Xf42eeml7hOW3ALkH255a6rW8gyaaP50DMI9MiU3BTWk3l7ykTiE8l/br9Kcc3gseLeUCn6EnW8hwELVIh3+QQskRvQFCFo584bSsFJTFqiPWt5YPCiXlrIbE6O/+FeBlpYaigiuduchoqynNhBV0q4F2t+qkKkqqldOpk9PdpTb3l2NYoFRSYqEDOUIMIWbaBUGCj0Din63Zkoca9egMI1vX2P98vwf8u/JIxp7cp6jpSE8oAVayph/Wjq4YOF9ipCxKlEKkaPtiA+1YjiswyosKVFd6vVLM5b+jCzM5LLdhArwxV9WDsiAkovQMPBGbNM//qgRteDnRgYZyqBwR3KVLi3mMbQWjvEZehtM8+X7Sz2gHd2ZNsWgnljfqrU9ZTTska6BWKX5CDyN8LMPm/UNuVBhAqcvH+pqBpJ67VQtTBebiWGjCPpXPqpc9dp+7yEmN3EOoaLw/8PcwAQ4Mm7wsYFd5zllfnukXnFG3xs4hk91z6VXi3C1Wl5IKdWZEO0DzI9ga8yPWsQLKfji4G0jE2GZU7eYB9RavimPckL2rgJ54S/iRqmpksVrPAXBTA8LD59U9pV7kTXRkMO6EdTOS/cmLfzbMVWbjo0KYGWqEBgQC0qA47MqMDCmJmH7H1Ip08MH7iCcKm6PQDdyxsfaXeLsDdtPpi6PVP/XZ5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(396003)(346002)(376002)(136003)(34036004)(109986016)(451199018)(8936002)(41300700001)(86362001)(2616005)(83380400001)(810100004)(38100700002)(41320700001)(316002)(8676002)(54906003)(36756003)(4326008)(66556008)(66476007)(70586007)(66946007)(1076003)(6506007)(6666004)(6512007)(26005)(186003)(6486002)(508600001)(44832011)(2906002)(5660300002)(266003)(37730700002);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i9j4EsdGI/gV5Oml2fpqwDxBVSVyYPsu1b7pOuKpJODASlbnlLCte7yVlzuw?=
 =?us-ascii?Q?M1y8hYDbeUxjqPwtdmJE5lgWqCcpBrKp8ba8r2uNOs/f04T31scKIWt5rFmE?=
 =?us-ascii?Q?mApPnmj0812PPoANTy+4baJiWe9TdcZe5Ycn2BUrvp74VNyrpdF9l57KpAcs?=
 =?us-ascii?Q?plq1mOMvmK2Jrcku7ROfL2RPss+f2l1Pg2v2QWZjwSqNUOoyDZP5ILviAsFC?=
 =?us-ascii?Q?x6uh1Wm1E1bEHUuBmZSDWFIO5yPUOu649fuT9aUqbFT3K04u+YiMCD8Igllv?=
 =?us-ascii?Q?lbue6i91rtdxwPfcSVjPhuROPmXus2P2KE1rBB/eXW2Pu64tzj4qmrFwEImr?=
 =?us-ascii?Q?tUAVXG7QgRGPbvS2roNIbXQb6wHpKi5ATb3Az9YarC2Upik9/E7+uCzH9/Rx?=
 =?us-ascii?Q?WJ9eGU+G1yHbseKRPshpE9xxyWaH1mSUx94T5UKtzOeFeOapNvGvWxTSju/b?=
 =?us-ascii?Q?5EoCkoiJztSuGbOc6w7RzewQkr/TD1oCumPLub1BA4/BO5o7cmFHTBnaDd7Z?=
 =?us-ascii?Q?+NMlSQPLas7ACNKg6bU9kp0/egEO9/OzH83hdvKR1pPi5NJAtHTyaUY3xMiZ?=
 =?us-ascii?Q?Cwk30iHZp61HC1grCx6EgbDUwyi9SQol8H1nlRgQtkV4Lm7XxTbpP3KteIZs?=
 =?us-ascii?Q?Qm10fJ2FDamkynmPF8uscxE6w/AmdvWD7RNDFlBF+o2pc7QPObogt6GdM/Jr?=
 =?us-ascii?Q?YmT/XXFRW5qfey1XbOP+b6ffTtyyKEXREzUcnNPb5Ly4hiRSWj+NaMV0vjco?=
 =?us-ascii?Q?U2sq3MLJSyhrGwPLoP33ljqOTVjmzGD7tS4GPOX/+hz0tsS9Reb+wzxP5SdF?=
 =?us-ascii?Q?V6c7HP5KFVpd6zMTIe6XdXrhIrWtBvaob2Emuy4MpccSredD/7BvHpOdcwWM?=
 =?us-ascii?Q?dTq8x6tSqA7F0WpLiXAwo4jJXn+UZyYe5Hs9daZJ98hKgfbRkS5HqfdiWDSM?=
 =?us-ascii?Q?oddifW+5yk1/kHV4UhwmQJx2eY1pW9FEU8sIO7+b/qXHoNEpgrP3IBu4h3Yt?=
 =?us-ascii?Q?MryE+yi/+WdPXDSec/X73mf2CPdeKIXUs0T3qElZrEjQbf/x8kp/yk28VLsO?=
 =?us-ascii?Q?ucDno7OgW7IJkfyn30JkUpAASr1y2vsnHymGwKhmqtreHMEn52h+a+AZuElV?=
 =?us-ascii?Q?uW62yTTrpqiHLzUDvYtGYw14fj3CR6TUxoNJ7yha6BN457FDpmJIjmfm6It1?=
 =?us-ascii?Q?eSIF//zxL5EArA+yEarhgcxWutSmkTF9rFTV/cWlnFu8UqiijlXSNT4BLQED?=
 =?us-ascii?Q?N4kYC/9qCtecqg0syyT62wmmpcHfde/lt5OWe0p35q4eK3z3MgfhtxJgplRP?=
 =?us-ascii?Q?FtRelcPvjJUzpmDMM/KxjEDRCLX4/ia6iGh6tQFXC5uO3sigyvN8jdFnzPCN?=
 =?us-ascii?Q?dcJ22VUmmEUjYCfvuAeUGCbZd7q69SCwsGpoSIHWl8QKfrhrtfASlmoRlSOE?=
 =?us-ascii?Q?kSjb8j1T43TVTSEyEPxBuMnV7bqU8NJpWEEeRF4lIJ7y5jG8BtDjOG6712Lq?=
 =?us-ascii?Q?GJiOORlomAXvXXel/oV7hXDVgrpKSy8dGupghx9Cso7hoNueDFTGghzRevK8?=
 =?us-ascii?Q?B729/kqm2cXL4OnJ0FcqtL+sPiFDiOGu3ZBZ4H3X3WT39lNHdqx+nkRp9ubp?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb6e3f7-d8c6-4dc7-f53a-08db017144dd
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 20:50:20.3885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSS+E7Kv6cvAhKtsDsUoWUVhUXQI7zrYtCfgAdNT6GPR/ViyV31nKkD8l5xaROjRTrGkURSb6zT9kBF+P6cfYpswVVXOCH8jD75kcxjo4jE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0661
Received-SPF: pass client-ip=2a01:111:f400:7e1a::32d;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Also trace out a warning if replication mode is disabled, since we only
support replication mode enabled.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c   | 9 +++++++++
 hw/net/trace-events | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 375d9d5e34..8e33e15505 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -949,6 +949,10 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
     }
 
     if (core->mac[MRQC] & 1) {
+        if (!(core->mac[VT_CTL] & E1000_VT_CTL_VM_REPL_EN)) {
+            trace_igb_rx_vmdq_replication_mode_disabled();
+        }
+
         if (is_broadcast_ether_addr(ehdr->h_dest)) {
             for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
                 if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
@@ -995,6 +999,11 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
             }
         }
 
+        /* assume a full pool list if IGMAC is set */
+        if (core->mac[VT_CTL] & E1000_VT_CTL_IGNORE_MAC) {
+            queues = BIT(IGB_MAX_VF_FUNCTIONS) - 1;
+        }
+
         if (e1000x_vlan_rx_filter_enabled(core->mac)) {
             uint16_t mask = 0;
 
diff --git a/hw/net/trace-events b/hw/net/trace-events
index e94172e748..9bc7658692 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -288,6 +288,8 @@ igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint3
 
 igb_rx_metadata_rss(uint32_t rss) "RSS data: 0x%X"
 
+igb_rx_vmdq_replication_mode_disabled(void) "WARN: Only replication mode enabled is supported"
+
 igb_irq_icr_clear_gpie_nsicr(void) "Clearing ICR on read due to GPIE.NSICR enabled"
 igb_irq_icr_write(uint32_t bits, uint32_t old_icr, uint32_t new_icr) "Clearing ICR bits 0x%x: 0x%x --> 0x%x"
 igb_irq_set_iam(uint32_t icr) "Update IAM: 0x%x"
-- 
2.34.1


