Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3F44B13DE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:07:07 +0100 (CET)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICuP-00032H-LP
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:07:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIATm-0005XV-9H
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:31:26 -0500
Received: from [2a01:111:f400:fe1e::72c] (port=41191
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIATF-0005X3-U4
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:30:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3rurBybYzkoKwHTbGU3+D1Bf3N4+1rlyX/et7zRfC0AZBVndQJy881/+waAagVgrcYhub7eOBCReR6PTINnMa26qR+L1t6qmOVsgYrXq7isqbbOyGHDVaPLB9XVRz4jZuQc9xCMBVTA181cqApmigS+OTGuuCqsL4Yfu58qYAhUVQRsJ5M8S71tNdU0Q09kEiI+eCBO6b0zCbVbHrbCWp6kehTXAcWNZ/pVXQ9bXfhDTn5vJJx6y2X7FJWhn+Kg3xvm7Q6Mp8Nr9bXfh4H8c/iznpLVf/IXr7JuVvbbKcHkeLMzF/xc5QKzPQNnC7LdmUf7aurMU0zRarSjBiB9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aadJ4ExH3KQ+75/4/9k8ql2bl0KZ61ZerqL7j1feb2w=;
 b=CE8tiHRhAN0xN9BsdRm0x5UUlkjXkDVE3J9SKYpiz0iHIxh5CaIWKzwJo+jL6zICtD35CrNvAyhU29jNprj4IjNJVYamdNmbMDAancliNnPh/1KoZPgH7n8bTt5Khp1T4f/0M2HChKuOhh7alMI+lPCbeiff9XKaVIXMQd5fjNDQM4A12DrSY2cZGJMfYQx3nlXScorswIh9Pw8nNnc3KqpOf2n8KZLKE5XFROMCC/a/YQ16LEayXGZnYke0R+r1Dmg/bJGmI09nI4OHtGT5fr4gva5TjCo49YpuSpV1g5tvU0fKyqL/Z6yDNVnd2Jbz3uSyUikTTkizkzwRe2bZ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aadJ4ExH3KQ+75/4/9k8ql2bl0KZ61ZerqL7j1feb2w=;
 b=Mf1gaMsx2Cm/sV69DlCK/DisGp57K7cnV0osZCJUj+4sej8eQEFsfVEOVeZYmR3D7x/lUETdNZg2rIgSNhZ6rM9/ESwFU+GvAUwFnuCJgd/mRcaz+PToeoLlHAtkPrAqV0CjaJiXdA0ieTbgo4/kK5ySVuv4+HWT+0AkibnehyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM7PR08MB5413.eurprd08.prod.outlook.com (2603:10a6:20b:10a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 14:15:11 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 14:15:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, f4bug@amsat.org, crosa@redhat.com,
 eblake@redhat.com, armbru@redhat.com, kraxel@redhat.com,
 vsementsov@virtuozzo.com, berrange@redhat.com, marcandre.lureau@redhat.com
Subject: [PATCH v4 1/3] ui/vnc: refactor arrays of addresses to
 SocketAddressList
Date: Thu, 10 Feb 2022 15:14:55 +0100
Message-Id: <20220210141457.539582-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210141457.539582-1-vsementsov@virtuozzo.com>
References: <20220210141457.539582-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR05CA0036.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::49) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68c5237d-18c4-4ed7-13ba-08d9ec9fbf1d
X-MS-TrafficTypeDiagnostic: AM7PR08MB5413:EE_
X-Microsoft-Antispam-PRVS: <AM7PR08MB541331D0428CC56D46026E8BC12F9@AM7PR08MB5413.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WOkqc3Yqi89MkFJzizTShp7n2NOvjdpV+4amD5J27fK30VorW4UwBoEgFimNkE/XxmxHunyQm8MY9++DQ2JYrWig1+9Y25ohlSUKkEm7K8/DH+nDZoX0SxR5aLvy+NfI/QCOQizUt23C0WrzThoupJJCFML3x85LbKtDdWUu8l9dwrqyk2bm0qlJHbwpZT4dEk779wjab8Z45M1dLZfWFJNU0ruie4NGlkWiA+HlqPh6j4/eJIjXfpxiEr9cGCJqC6xPy5R4gtfaiWK6xgbWc6C+Zn7mA6rxL5L4hCt6xhOgvYy7b2C+qmmx1lOB0sJAE4wnTF7jiMpevTBcKCevWjj6xcp17KlylPdHRqo+D39ogthu02dp+0U+KKFG1ffnhj99zuTN40jiK2Xb8c+Ua1ifhPoTUSAZxhwHdsN//rq0daTcjKoVbziwRtUtc+ctFYqkF3idtBYAb7Xx0LH56pR7hBrdj+XlPic80p5G3TJ8xaBojA+p/Yi9bs3KFMmS789AgAJ5VUoJPx2ekCTdJMJ5zMRX0yK6zgtEf7kqKmq9/V2R76dswWmw35m6ef9N8CGuk25GTX17jj24GOpZurl1SBAg93iBG63eKLG2beUgmMXTe60Q0ZfoxPo6j75vwP32byCSxUh5mrDLZe7TBNaLb5wd80A9MqnE/Q5zRAcz5yBKtM9d23w9ekdz0YbHOB82lqd17T5xpxbp9oQTCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(52116002)(2616005)(2906002)(6506007)(38100700002)(316002)(86362001)(6916009)(38350700002)(66946007)(1076003)(66556008)(66476007)(4326008)(8676002)(5660300002)(8936002)(6486002)(6512007)(83380400001)(7416002)(6666004)(508600001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXJ2YUdSS2R3c0h0U1J6YXUwNlFIbTliNS9pT0t3aTdEOXJGUlpkc3B0dW1V?=
 =?utf-8?B?ZUtDT292UlhwSjFJamdyRDFCb2NhTmlIM0t3OTR4ZDRKcXNMWDg4QzliNlpV?=
 =?utf-8?B?RGhVY24vUUJqNnVkcHpyUWRlTk9pTDZlN3pBTTFSM3ZDRmtBaG5uaUhscE9H?=
 =?utf-8?B?aEROODR3Y3MwTEsvaU1IK281SEdzbCtFVmYzQysxbmUxSlF3Z1dBR2Q4Rkgr?=
 =?utf-8?B?OXB5OVUwQzlKa1R0eEREY3dERVplazE5UHk5TnJjenF1Nnc4UzZkMXhucG9H?=
 =?utf-8?B?RnBRdFpMcm1VbXRVOVBITHhMUXh6TmVoemNJYjdtd1BZZ25CL1ZkYU9GMW42?=
 =?utf-8?B?NkpTQ1FzT3hwRlFob3VSaitWNXM0RGpGQnBqTlhzY0VlV0NVSE1IN1FodFUx?=
 =?utf-8?B?MnhSWXphalVPL2JkWDIvMGxoa3p4VzFFU3ZrUWdSQy9NVnI2MHljRS9BVkhP?=
 =?utf-8?B?OExNNjhOVzdwaEFlUXk2QWRJMjJzUmVOaTBzb1lDOXBZYmF0RUREL1JnZnI3?=
 =?utf-8?B?R2dlaW0wbTI5SGNXak1KQUpwMVE5VnRvMWtiWXVySlRUUjl0RmF2VnQxTjV6?=
 =?utf-8?B?TW9paXF1eEdVU3piWlAvS21UVnRpVW1ja1d4dlBRdHIwOCtlSEl0anZJa0s1?=
 =?utf-8?B?VHZGRXFvRGxWY2dlOE00TkVRM0M3R0tIV0UyeEhqZHVMQ3dORkJMSkNxdUtP?=
 =?utf-8?B?UStBL1lSUW5UYzl2WjQwVmc2Ti9PTVhSUWVUbkF2c2xHNis1MWY3cEZwSHQr?=
 =?utf-8?B?bTRrZGdLWnlqWmZPVEs5Q1lSNlkyTWVRaSttZ1ZoS3kzTWhrUkN1cW13ZDZ0?=
 =?utf-8?B?dFJRMWNva1d6b1EwUHdWVVNvSFNzZUxROWtyUVRSdFpFT0FJWkc0Vnp1Qy9K?=
 =?utf-8?B?V0M4bXQwQi9wRCtiRzh5b1pNY0dIQS9scFJHUmpjN0pDeHZEU21ycnlidTdZ?=
 =?utf-8?B?ZmY3QkNYczFTQThRbUV3L2swd1IvcVVqaiszRXlTZ29VVVRnSytaSGxDRXBv?=
 =?utf-8?B?QjVWNE92eTE0a0VXZlpCVkQrRFZ4NXBUZDlFYklnNWFPcnVoV2xrV0J6cjA5?=
 =?utf-8?B?bEVFYkhQb2dOcnNaR3hJMmtqRnRMMnZZalJnc2NsREF0MytMMlkzOXN1Y2Q5?=
 =?utf-8?B?WW81SlYzNkY1bENjN0dyVTlNaEF0UytOMzZQbzNFYTRIRkZIMDgxYkcxdjk1?=
 =?utf-8?B?LzRTS0xvZ1Z2dS9TOGNkRVRyUDZGWHVTNHgycVM4dGIvWDNlTEdERXp1K1Zv?=
 =?utf-8?B?ZzArRHRpR0gvaDBFbmxqRGpZOWtmcFA0YWw2b2w0SnZIcnhsRmRJM0FTZ1FI?=
 =?utf-8?B?UFF1NzVWcVk4bm5nL1pSbzQ5bkZvYmNobVBxa0lGcXZ5UDhRaEJkZkZkcTln?=
 =?utf-8?B?RWNyakx3cmtxNGoyYnJZR3M1MVdDcmtMQnlxRlNROXEwSitlWDBMRmdMcFY0?=
 =?utf-8?B?dFBQbUxCdGVxMGMxcXdFSE50L2QvYm00UjFXTnVWUkNVbWFLcUhVZUF6dC83?=
 =?utf-8?B?cHIrL3IyMDBNZHRueisvYjlDVGxUV2RMUXR3Sit4VkNaWlRHRFBTVmZpOUJx?=
 =?utf-8?B?ZnI0Q2tEdVpGKzQ2Wk5GSDRWVUxZSUdRUXUzc2x5SkpHN2FzTnBYaWYzeGk1?=
 =?utf-8?B?azZoQnZwaGw3aUhrcXVMRytZbGhZS1lWMUg4SXJlWTVCMC9UWTB1cENpUEJi?=
 =?utf-8?B?cjBUVE9OM0ZrWXRSckhoQVYzT2p1VHIzS2FzM1k5b1RBeE5CakkvclAvdDBm?=
 =?utf-8?B?UUcwUlE2TlUrVXpPU0p4WWtZelZwK0xJQUZIZUV5ODlxazNyYXE3dmZDMnNv?=
 =?utf-8?B?OUJERmlCMVA3Um1pTGNiejU3YlVTNWRkK0NzZVp1cjRkaFMwSHB4MUNRUEtF?=
 =?utf-8?B?NElFL2FjVnRyRE4za1FiT2FyL2V6LzJMNmdZdTdhQXpHYkVmam4vUSsxc1hW?=
 =?utf-8?B?N1lpUHVZQ1l2eVZ4aHFCVEJxMk1sZVAweVBUYXlkUnpDZTdpNDk4RlhaTWxz?=
 =?utf-8?B?ekNBQmdGdnJpazZ4TElUWldOQ1NPdEhueGdsTzlsR2ZMUGFhcHI3SmtyUEN6?=
 =?utf-8?B?V3ljRGlYU09CaG5QY0pMVldnSUR4Q2JkK29LUHY5VW9wdERTMzIwVHRhQWdR?=
 =?utf-8?B?UzNLREorRWxMWVZ0L3k3bFhnc0tMS0FTQkx1eVRPVEx6RjZUOGZpTkpyT0NJ?=
 =?utf-8?B?ZytQMEcxZURnTkl4b3dBUmY2REcrSnNXdUVMelNHa2JZTnNnZ3BqNlp1OC9H?=
 =?utf-8?B?T1dNY3IzWTF1M3RyWEs5cjJsMDJRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c5237d-18c4-4ed7-13ba-08d9ec9fbf1d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 14:15:10.8385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +etmNaEF6AIeMsHbLGyecB6w766ScPjft2mhQjBjM+KZaGwc/wYFvS7fqLhqWloFKWahxP+HeLRc+kQiXygUtAyM91qzOVW+923Z3i3cwg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5413
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1e::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1e::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's use SocketAddressList instead of dynamic arrays.
Benefits:
 - Automatic cleanup: don't need specific freeing function and drop
   some gotos.
 - Less indirection: no triple asterix anymore!
 - Prepare for the following commit, which will reuse new interface of
   vnc_display_listen().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/vnc.c | 129 ++++++++++++++++++++++---------------------------------
 1 file changed, 51 insertions(+), 78 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 3ccd33dedc..fa0fb736d3 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3812,30 +3812,19 @@ static int vnc_display_get_address(const char *addrstr,
     return ret;
 }
 
-static void vnc_free_addresses(SocketAddress ***retsaddr,
-                               size_t *retnsaddr)
-{
-    size_t i;
-
-    for (i = 0; i < *retnsaddr; i++) {
-        qapi_free_SocketAddress((*retsaddr)[i]);
-    }
-    g_free(*retsaddr);
-
-    *retsaddr = NULL;
-    *retnsaddr = 0;
-}
-
 static int vnc_display_get_addresses(QemuOpts *opts,
                                      bool reverse,
-                                     SocketAddress ***retsaddr,
-                                     size_t *retnsaddr,
-                                     SocketAddress ***retwsaddr,
-                                     size_t *retnwsaddr,
+                                     SocketAddressList **saddr_list_ret,
+                                     SocketAddressList **wsaddr_list_ret,
                                      Error **errp)
 {
     SocketAddress *saddr = NULL;
     SocketAddress *wsaddr = NULL;
+    g_autoptr(SocketAddressList) saddr_list = NULL;
+    SocketAddressList **saddr_tail = &saddr_list;
+    SocketAddress *single_saddr = NULL;
+    g_autoptr(SocketAddressList) wsaddr_list = NULL;
+    SocketAddressList **wsaddr_tail = &wsaddr_list;
     QemuOptsIter addriter;
     const char *addr;
     int to = qemu_opt_get_number(opts, "to", 0);
@@ -3844,23 +3833,16 @@ static int vnc_display_get_addresses(QemuOpts *opts,
     bool ipv4 = qemu_opt_get_bool(opts, "ipv4", false);
     bool ipv6 = qemu_opt_get_bool(opts, "ipv6", false);
     int displaynum = -1;
-    int ret = -1;
-
-    *retsaddr = NULL;
-    *retnsaddr = 0;
-    *retwsaddr = NULL;
-    *retnwsaddr = 0;
 
     addr = qemu_opt_get(opts, "vnc");
     if (addr == NULL || g_str_equal(addr, "none")) {
-        ret = 0;
-        goto cleanup;
+        return 0;
     }
     if (qemu_opt_get(opts, "websocket") &&
         !qcrypto_hash_supports(QCRYPTO_HASH_ALG_SHA1)) {
         error_setg(errp,
                    "SHA1 hash support is required for websockets");
-        goto cleanup;
+        return -1;
     }
 
     qemu_opt_iter_init(&addriter, opts, "vnc");
@@ -3871,7 +3853,7 @@ static int vnc_display_get_addresses(QemuOpts *opts,
                                      ipv4, ipv6,
                                      &saddr, errp);
         if (rv < 0) {
-            goto cleanup;
+            return -1;
         }
         /* Historical compat - first listen address can be used
          * to set the default websocket port
@@ -3879,13 +3861,16 @@ static int vnc_display_get_addresses(QemuOpts *opts,
         if (displaynum == -1) {
             displaynum = rv;
         }
-        *retsaddr = g_renew(SocketAddress *, *retsaddr, *retnsaddr + 1);
-        (*retsaddr)[(*retnsaddr)++] = saddr;
+        QAPI_LIST_APPEND(saddr_tail, saddr);
     }
 
-    /* If we had multiple primary displays, we don't do defaults
-     * for websocket, and require explicit config instead. */
-    if (*retnsaddr > 1) {
+    if (saddr_list && !saddr_list->next) {
+        single_saddr = saddr_list->value;
+    } else {
+        /*
+         * If we had multiple primary displays, we don't do defaults
+         * for websocket, and require explicit config instead.
+         */
         displaynum = -1;
     }
 
@@ -3895,57 +3880,50 @@ static int vnc_display_get_addresses(QemuOpts *opts,
                                     has_ipv4, has_ipv6,
                                     ipv4, ipv6,
                                     &wsaddr, errp) < 0) {
-            goto cleanup;
+            return -1;
         }
 
         /* Historical compat - if only a single listen address was
          * provided, then this is used to set the default listen
          * address for websocket too
          */
-        if (*retnsaddr == 1 &&
-            (*retsaddr)[0]->type == SOCKET_ADDRESS_TYPE_INET &&
+        if (single_saddr &&
+            single_saddr->type == SOCKET_ADDRESS_TYPE_INET &&
             wsaddr->type == SOCKET_ADDRESS_TYPE_INET &&
             g_str_equal(wsaddr->u.inet.host, "") &&
-            !g_str_equal((*retsaddr)[0]->u.inet.host, "")) {
+            !g_str_equal(single_saddr->u.inet.host, "")) {
             g_free(wsaddr->u.inet.host);
-            wsaddr->u.inet.host = g_strdup((*retsaddr)[0]->u.inet.host);
+            wsaddr->u.inet.host = g_strdup(single_saddr->u.inet.host);
         }
 
-        *retwsaddr = g_renew(SocketAddress *, *retwsaddr, *retnwsaddr + 1);
-        (*retwsaddr)[(*retnwsaddr)++] = wsaddr;
+        QAPI_LIST_APPEND(wsaddr_tail, wsaddr);
     }
 
-    ret = 0;
- cleanup:
-    if (ret < 0) {
-        vnc_free_addresses(retsaddr, retnsaddr);
-        vnc_free_addresses(retwsaddr, retnwsaddr);
-    }
-    return ret;
+    *saddr_list_ret = g_steal_pointer(&saddr_list);
+    *wsaddr_list_ret = g_steal_pointer(&wsaddr_list);
+    return 0;
 }
 
 static int vnc_display_connect(VncDisplay *vd,
-                               SocketAddress **saddr,
-                               size_t nsaddr,
-                               SocketAddress **wsaddr,
-                               size_t nwsaddr,
+                               SocketAddressList *saddr_list,
+                               SocketAddressList *wsaddr_list,
                                Error **errp)
 {
     /* connect to viewer */
     QIOChannelSocket *sioc = NULL;
-    if (nwsaddr != 0) {
+    if (wsaddr_list) {
         error_setg(errp, "Cannot use websockets in reverse mode");
         return -1;
     }
-    if (nsaddr != 1) {
+    if (!saddr_list || saddr_list->next) {
         error_setg(errp, "Expected a single address in reverse mode");
         return -1;
     }
     /* TODO SOCKET_ADDRESS_TYPE_FD when fd has AF_UNIX */
-    vd->is_unix = saddr[0]->type == SOCKET_ADDRESS_TYPE_UNIX;
+    vd->is_unix = saddr_list->value->type == SOCKET_ADDRESS_TYPE_UNIX;
     sioc = qio_channel_socket_new();
     qio_channel_set_name(QIO_CHANNEL(sioc), "vnc-reverse");
-    if (qio_channel_socket_connect_sync(sioc, saddr[0], errp) < 0) {
+    if (qio_channel_socket_connect_sync(sioc, saddr_list->value, errp) < 0) {
         object_unref(OBJECT(sioc));
         return -1;
     }
@@ -3956,20 +3934,18 @@ static int vnc_display_connect(VncDisplay *vd,
 
 
 static int vnc_display_listen(VncDisplay *vd,
-                              SocketAddress **saddr,
-                              size_t nsaddr,
-                              SocketAddress **wsaddr,
-                              size_t nwsaddr,
+                              SocketAddressList *saddr_list,
+                              SocketAddressList *wsaddr_list,
                               Error **errp)
 {
-    size_t i;
+    SocketAddressList *el;
 
-    if (nsaddr) {
+    if (saddr_list) {
         vd->listener = qio_net_listener_new();
         qio_net_listener_set_name(vd->listener, "vnc-listen");
-        for (i = 0; i < nsaddr; i++) {
+        for (el = saddr_list; el; el = el->next) {
             if (qio_net_listener_open_sync(vd->listener,
-                                           saddr[i], 1,
+                                           el->value, 1,
                                            errp) < 0)  {
                 return -1;
             }
@@ -3979,12 +3955,12 @@ static int vnc_display_listen(VncDisplay *vd,
                                          vnc_listen_io, vd, NULL);
     }
 
-    if (nwsaddr) {
+    if (wsaddr_list) {
         vd->wslistener = qio_net_listener_new();
         qio_net_listener_set_name(vd->wslistener, "vnc-ws-listen");
-        for (i = 0; i < nwsaddr; i++) {
+        for (el = wsaddr_list; el; el = el->next) {
             if (qio_net_listener_open_sync(vd->wslistener,
-                                           wsaddr[i], 1,
+                                           el->value, 1,
                                            errp) < 0)  {
                 return -1;
             }
@@ -4002,8 +3978,8 @@ void vnc_display_open(const char *id, Error **errp)
 {
     VncDisplay *vd = vnc_display_find(id);
     QemuOpts *opts = qemu_opts_find(&qemu_vnc_opts, id);
-    SocketAddress **saddr = NULL, **wsaddr = NULL;
-    size_t nsaddr, nwsaddr;
+    g_autoptr(SocketAddressList) saddr_list = NULL;
+    g_autoptr(SocketAddressList) wsaddr_list = NULL;
     const char *share, *device_id;
     QemuConsole *con;
     bool password = false;
@@ -4028,8 +4004,8 @@ void vnc_display_open(const char *id, Error **errp)
     }
 
     reverse = qemu_opt_get_bool(opts, "reverse", false);
-    if (vnc_display_get_addresses(opts, reverse, &saddr, &nsaddr,
-                                  &wsaddr, &nwsaddr, errp) < 0) {
+    if (vnc_display_get_addresses(opts, reverse, &saddr_list, &wsaddr_list,
+                                  errp) < 0) {
         goto fail;
     }
 
@@ -4211,16 +4187,16 @@ void vnc_display_open(const char *id, Error **errp)
     }
     qkbd_state_set_delay(vd->kbd, key_delay_ms);
 
-    if (saddr == NULL) {
-        goto cleanup;
+    if (saddr_list == NULL) {
+        return;
     }
 
     if (reverse) {
-        if (vnc_display_connect(vd, saddr, nsaddr, wsaddr, nwsaddr, errp) < 0) {
+        if (vnc_display_connect(vd, saddr_list, wsaddr_list, errp) < 0) {
             goto fail;
         }
     } else {
-        if (vnc_display_listen(vd, saddr, nsaddr, wsaddr, nwsaddr, errp) < 0) {
+        if (vnc_display_listen(vd, saddr_list, wsaddr_list, errp) < 0) {
             goto fail;
         }
     }
@@ -4229,14 +4205,11 @@ void vnc_display_open(const char *id, Error **errp)
         vnc_display_print_local_addr(vd);
     }
 
- cleanup:
-    vnc_free_addresses(&saddr, &nsaddr);
-    vnc_free_addresses(&wsaddr, &nwsaddr);
+    /* Success */
     return;
 
 fail:
     vnc_display_close(vd);
-    goto cleanup;
 }
 
 void vnc_display_add_client(const char *id, int csock, bool skipauth)
-- 
2.31.1


