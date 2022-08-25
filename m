Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E709A5A13DC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:38:31 +0200 (CEST)
Received: from localhost ([::1]:40654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRE06-0007Ro-VH
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtR-0000Wm-P4; Thu, 25 Aug 2022 10:31:39 -0400
Received: from mail-vi1eur05on2096.outbound.protection.outlook.com
 ([40.107.21.96]:43230 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtP-0004oG-7Q; Thu, 25 Aug 2022 10:31:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdChmIzHPW5tFYyJQUjCmZv3qJHlKDaCc1GAe5drU7yEjJl2qcardtZZ4xp3RvaTVvykKlr6YLhIrU5ArsrIh6s4M3d7Ch9xPnQF3uMiqveh5aAgOOJADnRAnH+Clye4ruouidaYP6vhxSaKH4T+7gxnP+bm4XJtEFDqxL1G/JXVWHLKLZUDAJvxPZIS7AWHz5FTJEitki9YSmyqwSKj4oieFOYKp5HIkbE5qUhfrSAYX+XlguCKPOvj4XJclgqXlNAVoaBBwIvQkfQTPI6WuGCiVygJiBX1NNOvfyS1q9i9ghpALzoA2HopmMr1IxGDKdjNBQVt3saS2lDX18fbGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rq5hwGgaO6eNpjMhSkXsvgMlf+r/yhu7Q3ZMuq/welw=;
 b=lqxk3k62NL6m60tF2/p6N+WeVecv6zSo8MAC9bAg+AuajCCmQbZ95wFYYXA+uH5ZpmjXiO+syD7Qndv173R5f5i4D9HRNOIe++p5uYDKvlBQCLJPql85Z0sIInxOvVCvlkrL4oBRVMMcO/RJwb1UnS3RKQeUam79nii6Hd9BBRHNvI2jCNauGNJCFi/rx9aQY2Hl/jky1xw7nPzFAJRC8rgdnJAb3Quz19pqGyjMwd/VNrHxHJqjed8yHRruxCxW9fg0YZz3ssagYImYuXW9pnWD9BHKjoRIeceu0edocMyfchu8KB6i8c9zivo3+r0ukSp3I1/J0/H0NWI/uoVURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rq5hwGgaO6eNpjMhSkXsvgMlf+r/yhu7Q3ZMuq/welw=;
 b=wj5IvuRn0nWvtBwjk/gM57nR+DwOlja7sKn2h89BYj/ZDnSOV2+1HpGiQpjacPcWMbU/tx/TkSy259uWej9qbGVpx+0lFYDokTpaDgVVNqD1IR/P9MziTRGU4oscTvt1d39LoOTcQcSj+dV/oARYxnkpPkSXqBLIkNCdvab2oz1IptD49FpfS0KWjIaMaM3f7w4oNO0r9GwOd1OihavL6FYjPqy47jIvdI0bDVbLHnkOYx21Dv/HQPHWfYFR0hlF3+w+bWz+p0QuY4UKdix4ANnpGxDdR/IWA4+xHWxPBymgKlYQaBbnjbiy8LRYXrCOrE4i7mhbXPvs2dATZf3UBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by HE1PR0802MB2298.eurprd08.prod.outlook.com (2603:10a6:3:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 14:31:17 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:31:17 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v6 01/10] parallels: Out of image offset in BAT leads to image
 inflation
Date: Thu, 25 Aug 2022 16:31:00 +0200
Message-Id: <20220825143109.176582-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::29) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6774e6c-f228-4d30-0189-08da86a678d5
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2298:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VV60teKEBYROOI43z6t3uiX61dVG80rcderoW4S8jPC66TvciRX3AvyIxJlPdvLH7FdERZrrXXofW3xcLCYczOuyhuf4+VkEk5A1f96y2wtTM6SGR3tbXItPwCSWG/cTMd9H+lQ63KQX9X8uYhRAMXGyuHjncxYI1hJZr8q0+kklXNxZpFDJ+EG2XN3mD4Vu1plrvqD9bMEbVvMQPzrbAOFn1ODpgGhDSVbK8VeAJ0tSR84dyPBaqJZr18uWrlvf02Xcot1YwXbbxFDLOO/vUqcBV4IA0rYZi6fylJXH4wa331vSglnhKEUnBeS9J53IhJ214kdQc8wC5JyDQk71n0hJXbUxRQwZsr49Oj0PIQ8pSnhkaB0fptkTS34bFsdgv+f7b0/Ek1iWwIjKb8vZvdwrVzV8gNx8r/vGr1aQi2zwT8WhZ1U70dNEYL9CNtgV1+FJrvDBFGExp5g+mcde2Hpo1mpTW+Uq2E1mvOmd3ernQW+a/iVgvMS4IDlQV2+NKxks2inEwIIRodhoS3/pM30OXHy5E4anQ0aNo1/RizFBw6F2CeXO3KneOBqJvNcFNdDT/B1FjmftQ0w6HUwLrvyPg6obHEecWmyUH/U6xQQx+V5K3Q8vttqSkZuenkOP+NQ2xUlhfPDWO6g3ZyYsD+QMkAOtgiQw4xmRlP+rxYj5NW0/d3HfPCTUP9lwZ0Zq7dSpf1zl8HXFXAlR9byNaD5OFwROuHC+rsFTEuOC6dqZBQjBcinEns+h9qDtorTLZCRvERW1kWTek7j7kGgQkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(376002)(366004)(396003)(136003)(346002)(36756003)(83380400001)(186003)(1076003)(2616005)(6506007)(6512007)(5660300002)(52116002)(2906002)(26005)(44832011)(478600001)(38100700002)(38350700002)(8676002)(6916009)(316002)(66946007)(4326008)(86362001)(66556008)(6666004)(66476007)(8936002)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lhAxyLThY6/Ctzk5nwQVLXUoRd2FVSEfZpkWJ7xF977dvuRb68746DqXuyrr?=
 =?us-ascii?Q?aPF0UTK6YuqIMaNtO1lZE771tvMCbccjIEs1LsysEwnJuSPjLgheRTATX91X?=
 =?us-ascii?Q?edQnFp05gxsHIFuv8z+Tbq3QQzSjLbQ+t8X5qJCzm8CQKz/xjinuImdql0oB?=
 =?us-ascii?Q?fstud6nPgDpsNE2o6CYSDOpSoidhnCPoZAZ8rvi171t2eYtiUTD5XFFvMbdE?=
 =?us-ascii?Q?F0xiybAvvCBj04UVn3VleK7cUXNHscEIkRYWfvJni5nG/VwkZfFuygD3utVt?=
 =?us-ascii?Q?fnH/fVGnoOa1vtFUlorMpLUppk+BTlicXe4knBqpzeHP9eYqaqeb1NLiQTxe?=
 =?us-ascii?Q?ruQ/XxDdkxRGpozq6RMwBEUTN51LcweSI37TCcOs5NpIKeDzUrWfGCiOisSs?=
 =?us-ascii?Q?o9tEpAhq6WbI42kj9pMzQkjHCzVm+wCvLSCjlwhwZZ7vomxYafSU1mlADIsb?=
 =?us-ascii?Q?CtHW5wYAVaJdXwwIr9TtuticcDKrZkYOxpIgEEns5VwJFpxmv8hT5RMid2wg?=
 =?us-ascii?Q?acL30KvRiQ9ztNxwGve8/Y62HTgpG3USaOHNwQFaUimwG2lUykgCah0c7ZyB?=
 =?us-ascii?Q?CiPZ0HvjniYXQtk8y077KG3z2ZenuOTxsov9Ugh8fHfkaT0HBGz0EqWQZpUS?=
 =?us-ascii?Q?8U43VBQ5Q5va4YATuHDWKcd7SjVWXxOFHChg+nqIYOjJUhfpWDfmw7kmG/Bk?=
 =?us-ascii?Q?XJsWliXyJz2ZS3qM2yKTnHN9LxpTIJuC2HAV6stQNiv0bh1BIy1AeSjHsy37?=
 =?us-ascii?Q?dJ2yztmYma/4aA6M9/8i9LeDqfLjKWjX3G4dOJKYMN+Z/dbN/MD6ULf/ad57?=
 =?us-ascii?Q?wbZh/bNoCa3vS0o/dM5inyy4xRb8Wkz1Dch43hvW3/6XXdN0CqfJF1zRWE4d?=
 =?us-ascii?Q?EYaW9ZUiC5R3CSRoCk1u1rGHsvMRJoRDMLBwdMhBeJxHXG4L2IgiGwtXHr7W?=
 =?us-ascii?Q?rm8lxij6ljDtd7dWP4PHJ53iP3/KzpJXz4e0hVOuJspHfvoFR+/qGQVngv8T?=
 =?us-ascii?Q?EMoozeEVqxq4hPLOtxGyvxm5QD9nhHZkMoYheW1BOgW5WJLkErnpzn0rRwy6?=
 =?us-ascii?Q?xqEp1vAGUyzyTwr6Puuax9zrQBP8B4aJZ1PM1R/5PYxl5ta9jWIIXcQRG6Sz?=
 =?us-ascii?Q?xKMXuZDYu83uI7y+UYprIABNphAON2HJIn23B7U4sUhE7PsI6bal/8zpskvr?=
 =?us-ascii?Q?rN1BfMveqj1205kYGnLt5kHngxZaDuYYLEWI2TJxG5JgWIJTWJpu1XGQN1gX?=
 =?us-ascii?Q?UIWfxZZPJ1zWbtIkELxp9ViZK/r/Bj1vUbZE8Cf93sWvna56u5/eAVdjkqqP?=
 =?us-ascii?Q?CazCgtA4ffTSX38kUee+9eyPp+nn4cDmHKzb2hdacH+OKepJ/SP7pj9DsTkD?=
 =?us-ascii?Q?FUous7VBwuLFk6I1eiPzCwXmBCubJKtU2bIAsJQirp90XcftoJnzMER+J1RF?=
 =?us-ascii?Q?qVELHk7zWJaooqeQZjKnka6Yc3DYX5fEqhqyp/iD9kfcb2WJWP4+6C54Vivc?=
 =?us-ascii?Q?4A4YoyK6ED091OCcBya6zYPdRUBfqFRZEF0uNRv6ZPLj5biaSRlWP5cqRIEr?=
 =?us-ascii?Q?hRwE3nUbNjKH46DCzD2olQz5GttMgceAB3rtfX0fxmPnnepo5lThC4LuZ+X7?=
 =?us-ascii?Q?ZSAFVqNs8bVQABiMhvy3Hf8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6774e6c-f228-4d30-0189-08da86a678d5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:31:17.7357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tebQDigtuV1xxMNRQODCfXNWgslC3MD+68fxdw9S3WIu/pmwIkkV/1ev+JR7OiZ5DaTXgDadk5e73x+93N+Sq1dkcWK/mcsS7lRmjFdMllU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2298
Received-SPF: pass client-ip=40.107.21.96;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

data_end field in BDRVParallelsState is set to the biggest offset present
in BAT. If this offset is outside of the image, any further write will create
the cluster at this offset and/or the image will be truncated to this
offset on close. This is definitely not correct.
Raise an error in parallels_open() if data_end points outside the image and
it is not a check (let the check to repaire the image).
Set data_end to the end of the cluster with the last correct offset.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index a229c06f25..93bc2750ef 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
+    int64_t file_size;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -742,6 +743,12 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    file_size = bdrv_getlength(bs->file->bs);
+    if (file_size < 0) {
+        return -EINVAL;
+    }
+    file_size >>= BDRV_SECTOR_BITS;
+
     ret = bdrv_pread(bs->file, 0, sizeof(ph), &ph, 0);
     if (ret < 0) {
         goto fail;
@@ -806,6 +813,16 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
 
     for (i = 0; i < s->bat_size; i++) {
         int64_t off = bat2sect(s, i);
+        if (off >= file_size) {
+            if (flags & BDRV_O_CHECK) {
+                continue;
+            }
+            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
+                       "is larger than file size (%" PRIi64 ")",
+                       off, i, file_size);
+            ret = -EINVAL;
+            goto fail;
+        }
         if (off >= s->data_end) {
             s->data_end = off + s->tracks;
         }
-- 
2.34.1


