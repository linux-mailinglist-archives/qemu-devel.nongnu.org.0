Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3116D341488
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 06:10:44 +0100 (CET)
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN7PG-00069U-Oi
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 01:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lN7O7-0005dz-Cd; Fri, 19 Mar 2021 01:09:31 -0400
Received: from mail-dm6nam12on2110.outbound.protection.outlook.com
 ([40.107.243.110]:5728 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lN7O5-0005UR-6b; Fri, 19 Mar 2021 01:09:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mScMEVmcPpXMerKC6sPUdiXYKkl91G+ZP1SDzUzKYUCoSPvMqSy0b7ClGUS0iaIaB0wtmmbm8FY6IYwTUGgLPKxDKDG/FG5V7Liseh+GnKFnq7dV69inHf1kj+ij19+mCJ07kwl7E3OiryLnXqAnuZN7TdVxq8KICk2pDoQAnOdqO7xRrSvqZd4Gr+heWCby1GNEByKZ8PRH6h3ykLpPisb40w/M6MrP0wKtLcF/8ciPmZJbhKHIDJmDAQW0FQ9jc0QziJz7OTdV1Wt76rz3lRKocRZkGitAe52gdpvSme7M5oKyjwxXDZD3JlhPuZ81EOtBAJft/7oEdgwnT+zMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+WKv2TW4UE4/uc0MenZG3Lc6P1fSAeIduZcjBuKggk=;
 b=FciqUE+LlqqEmYM917gV5gnu8RkePiRPZuhJKst9J3L9fuM0W5Mv91mAiWZekN6CndNRZId/ZA3sSbcly6jigVyUSm3MDbthR/7Czj4l5dvHq3aq9C9I8t/abmV6iZPwmEhGhTiw0Lcohj6UlAkFPhimVQt+EMXvrLAAoqVIRZtJnAX3BcXElzA6YHN2WEp98OV1rd+QVGVLES12kNrUgeyQquuASVqu3PsGYwheMFiiXo8Qe6+RBE558h5idRNIK2lLQRE7HNhLgBXLTIbNWs9MHJa5HGrHgxU0EOS9+VMjSMA+AE3N0Kw+L9ZZA/opIVyC6iIUhWyCIRxZ7QdwuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+WKv2TW4UE4/uc0MenZG3Lc6P1fSAeIduZcjBuKggk=;
 b=MCdCCQW03A/anKPw2tBiIMM4nFVLXgO/WOwxlpuwSRdSTlIlQPD4qPAlnwGOJZx8lx2leppbTMrV1L7fBy0JU4Dt5my1GjY7RFLrQbWk7hBnxstglD2eT3vWm4QTakknm1TtGnswlzj7QyAehhi2ngMEHoBPfjVmFguZwsLTy80=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from DM6PR03MB3865.namprd03.prod.outlook.com (2603:10b6:5:47::31) by
 DM6PR03MB4506.namprd03.prod.outlook.com (2603:10b6:5:109::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Fri, 19 Mar 2021 05:09:24 +0000
Received: from DM6PR03MB3865.namprd03.prod.outlook.com
 ([fe80::3d08:f80f:7252:a948]) by DM6PR03MB3865.namprd03.prod.outlook.com
 ([fe80::3d08:f80f:7252:a948%4]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 05:09:23 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: John Snow <jsnow@redhat.com>
Subject: [PATCH 1/2] floppy: add a regression test for CVE-2020-25741
Date: Fri, 19 Mar 2021 01:09:05 -0400
Message-Id: <20210319050906.14875-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200827113806.1850687-1-ppandit@redhat.com>
References: <20200827113806.1850687-1-ppandit@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: MN2PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:208:d4::24) To DM6PR03MB3865.namprd03.prod.outlook.com
 (2603:10b6:5:47::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 MN2PR04CA0011.namprd04.prod.outlook.com (2603:10b6:208:d4::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 05:09:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae628b78-e980-44ca-ef77-08d8ea9528eb
X-MS-TrafficTypeDiagnostic: DM6PR03MB4506:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4506E9EFDEBAA6126FF11B38BA689@DM6PR03MB4506.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:155;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HpxnRRW1X+MBTWwBHYhvMcxb3Xp/WhoO6/UII43RLgOeXMeYFpeZJOCcB4YRFG4naPKEbl4OR6rplj9XPSF2gqoPS22BUHkZirlDDWn6R2BRYMXcAsMBYInz7UUKHQiulMxEfGLCKFtvKA9nHQ+MGHbwif//C4XA1lR+dGok60KIaYmiQfC7fLPeHmhxVQ71OYMR4mQhQwOQZwIb1BcDAllOKbtZx2kDp+OutIX6GTRgT0sEUYHYpJLr1LCGKRF0GAExF0bqtvFXK+lWMS/lc51rOvA0YtCT20MfwcttO42sofJXHemgqlIcJpq1qGPtW5hMzIw7KmHwN2Ahgm1qU0BlTaqDuO0rwJvf7uvBjGZh9l4th02euztu+3RhSrZmllTmm07Shh322HCAa2oJQrwLR5f/QbxqfaHHu6RYkpypkC4jHm+6tYwuLjafrqlhxn4bLKd87TUWouVbDvmt5DA9PYUjd2iiMBLYRdrcVf7XTXijOH1H9RO9Yg4pQupYjlr3k3B5HYPcBSreGSw2MxIjqTTkO8vteqpOPkCmQRXl3HeYzuy71pgvhtzMz1m5rJct18uTDtiviaMtUl6K6EPiATw+WrJ6YeYjXQrqYGxMY9TPv3dx5qclsbQqv+9Cdng00eSHToDvfuxh7UE27fUCg4kqe9EfTX8qHyQk1xA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB3865.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(16526019)(54906003)(66476007)(66946007)(186003)(478600001)(75432002)(52116002)(6486002)(8676002)(786003)(7696005)(5660300002)(26005)(2906002)(6916009)(1076003)(6666004)(66556008)(956004)(4326008)(36756003)(316002)(8936002)(2616005)(86362001)(83380400001)(38100700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6OOpGCurZXG73QeyugGjiYrR0TFu2ODwNKUqavIl0MwpWqmrUJapIO480iBE?=
 =?us-ascii?Q?9iC12BF/pE+DfDOoj+PB8snPvKu07CRQDmN6sSWbDCkwoa2Rg8PxgbcYQw4o?=
 =?us-ascii?Q?bPqbOtaBcvXBQ87jAzASRmHC16g6udAbZFFQKj/9kRmevWGbROilDpBtHpRM?=
 =?us-ascii?Q?OQIyueOwJ3CfebLShkIIiNnqSDE5uqkqOOLu7QFocpi+TZ0WFxyIISa70wQ0?=
 =?us-ascii?Q?Cxtle3KPeVxSo30Jd5EaV/wlRaNLqe7BGuZrumLyzjMCB599CZTnTFgditnj?=
 =?us-ascii?Q?+1zVDFKU9uW6uAgr8tjEKrVsXD9fn1SKwGMY+Vl4RX0WeHcyR6TGQeScfDGk?=
 =?us-ascii?Q?tz3JupE5GLE/vnbrY0Gf4uadtDaHOW6252kkbRYGBQoKgqyrEAe/IPZf7TeY?=
 =?us-ascii?Q?4A9OGWj9KP2d9nV5t3dAmtJxiyXqCaSkUCNtk/1Jge8jSQqUqZsz7ywGEG++?=
 =?us-ascii?Q?2W+gttkq8kDozsGyhgJAzCbNJpi5HD6aKB6JQk+TbC5Utip/KTsE7EUrLxoO?=
 =?us-ascii?Q?/G3dVQhgssjlHQpQwpHbZGRTkR7MlkTyrTDV3c+cAwFa+YzVbAk+xfoErYWv?=
 =?us-ascii?Q?CBF4LaSwMg6X3CX+Z9Sxkun/bAM0MLalCGWcWl7XS7fTepzdVdzZDISCDIxs?=
 =?us-ascii?Q?44zJ5ZXRdELVnTh2Mj3euWwlvX7X525fawSgJHxSY4QSDPvRUcPK4WVyzLXm?=
 =?us-ascii?Q?oP+utH8zdaXxCNNq1t9+ozBG+ZuOhHpP44ZkLCD3gPl+JIzNCw1wfDTdnLAC?=
 =?us-ascii?Q?tutezh8chA6et8+s0ZGH8wPLy62yag81LOCApMRPsmK7rKjuiyaGqmpVVRoi?=
 =?us-ascii?Q?WHTnUzpmRgrIAarxThJ5dQ2dzQbYutYSM2+ZddCshRNiaBjaOPADaqfBAhnm?=
 =?us-ascii?Q?tLAAk+NSaUKd8uRqceyUmdyvFZW8tG2RPAGTIAJGv5eokeXTkmMAXUrGU1zs?=
 =?us-ascii?Q?9agR09MqeUriQWgTXfqzWA8j9yd2rkUBs5wRJkYlBIx6FXYSrpowgnUoFBzT?=
 =?us-ascii?Q?mDsArM9SW8yN/yphOzahh1RNsSZAvBKJNdGAEtLQZ8dFURf+6VpkE80L3JQ8?=
 =?us-ascii?Q?H0KFEqPJY0+beXVf2lXZsREGFORrVkqnTDMzj9EWCUVtrV/XX5j2MUgyEdq/?=
 =?us-ascii?Q?d116MUiHgmEOf5FhddRluY962M4oAtkndezGbsjgetHNaq8can2PJGy/xZHX?=
 =?us-ascii?Q?XPpsVHe1+xrWhT+IUkadzgjyucYAuTrSYPfwJF9B2FypyiTdf/ep776BoLcy?=
 =?us-ascii?Q?xL3PnfK7rdgm58yrrdHjXX396FkRMVEhoNV0Ab/pZLqrsn7SWMzEK6/5DGPN?=
 =?us-ascii?Q?TSEnY8tQ9bEDVOCH3LrfyTlX?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: ae628b78-e980-44ca-ef77-08d8ea9528eb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB3865.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 05:09:23.3471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Wo04OcPNyhJrWR39XPY7UZApkQL+XHgE3f859X83/6Wu/clvdrcVBz1XYj+y7I3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4506
Received-SPF: pass client-ip=40.107.243.110; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Li Qiang <liq3ea@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dd if=/dev/zero of=/tmp/fda.img bs=1024 count=1440
cat << EOF | ./qemu-system-i386 -nographic -m 512M -nodefaults \
-accel qtest -fda /tmp/fda.img -qtest stdio
outw 0x3f4 0x0500
outb 0x3f5 0x00
outb 0x3f5 0x00
outw 0x3f4 0x00
outb 0x3f5 0x00
outw 0x3f1 0x0400
outw 0x3f4 0x0
outw 0x3f4 0x00
outb 0x3f5 0x0
outb 0x3f5 0x01
outw 0x3f1 0x0500
outb 0x3f5 0x00
EOF

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

Might be useful for reproducing/regression testing

 tests/qtest/fuzz-test.c | 54 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index 00149abec7..62ececc66f 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -24,6 +24,58 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
     qtest_quit(s);
 }
 
+/*
+ * ERROR: AddressSanitizer: SEGV on unknown address 0x000000000344
+ * The signal is caused by a WRITE memory access.
+ * #0 0x555559d7f519 in blk_inc_in_flight /block/block-backend.c:1356:5
+ * #1 0x555559d7f519 in blk_prw /block/block-backend.c:1328:5
+ * #2 0x555559d81673 in blk_pwrite /block/block-backend.c:1501:15
+ * #3 0x555558fc763f in fdctrl_write_data /hw/block/fdc.c:2414:17
+ * #4 0x555558fc763f in fdctrl_write /hw/block/fdc.c:967:9
+ * #5 0x5555594a622c in memory_region_write_accessor /softmmu/memory.c:491:5
+ * #6 0x5555594a5c93 in access_with_adjusted_size /softmmu/memory.c:552:18
+ * #7 0x5555594a54f0 in memory_region_dispatch_write /softmmu/memory.c
+ * #8 0x55555964a686 in flatview_write_continue /softmmu/physmem.c:2776:23
+ * #9 0x55555963fde8 in flatview_write /softmmu/physmem.c:2816:14
+ * #10 0x55555963fde8 in address_space_write /softmmu/physmem.c:2908:18
+ * #11 0x55555968f8a1 in cpu_outb /softmmu/ioport.c:60:5
+ * #12 0x5555597d5619 in qtest_process_command /softmmu/qtest.c:479:13
+ * #13 0x5555597d34bf in qtest_process_inbuf /softmmu/qtest.c:797:9
+ * #14 0x555559b4539d in fd_chr_read /chardev/char-fd.c:68:9
+ * #15 0x7ffff7b7dc3e in g_main_context_dispatch
+ * #16 0x55555a4facdc in glib_pollfds_poll /util/main-loop.c:231:9
+ * #17 0x55555a4facdc in os_host_main_loop_wait /util/main-loop.c:254:5
+ * #18 0x55555a4facdc in main_loop_wait /util/main-loop.c:530:11
+ * #19 0x555559a6dec9 in qemu_main_loop /softmmu/runstate.c:725:9
+ * #20 0x5555581a3085 in main /softmmu/main.c:50:5
+ */
+static void test_fdc_cve_2020_25741(void)
+{
+    QTestState *s;
+    int fd;
+    char tmpdisk[] = "/tmp/fda.XXXXXX";
+    fd = mkstemp(tmpdisk);
+    assert(fd >= 0);
+    ftruncate(fd, 1440 * 1024);
+    close(fd);
+
+    s = qtest_initf("-nographic -m 512M -nodefaults "
+                    "-drive file=%s,format=raw,if=floppy", tmpdisk);
+    qtest_outw(s, 0x3f4, 0x0500);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_outw(s, 0x3f4, 0x00);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_outw(s, 0x3f1, 0x0400);
+    qtest_outw(s, 0x3f4, 0x0);
+    qtest_outw(s, 0x3f4, 0x00);
+    qtest_outb(s, 0x3f5, 0x0);
+    qtest_outb(s, 0x3f5, 0x01);
+    qtest_outw(s, 0x3f1, 0x0500);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -33,6 +85,8 @@ int main(int argc, char **argv)
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
                        test_lp1878642_pci_bus_get_irq_level_assert);
+        qtest_add_func("fuzz/test_fdc_cve_2020_25741",
+                       test_fdc_cve_2020_25741);
     }
 
     return g_test_run();
-- 
2.27.0


