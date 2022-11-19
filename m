Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85454630DDA
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 10:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owKHH-0000EJ-37; Sat, 19 Nov 2022 04:36:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1owKHD-0000CK-SI
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 04:36:43 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1owKHA-00077t-Gl
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 04:36:43 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AJ4enlQ017629; Sat, 19 Nov 2022 01:36:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=tG+W1Is+2Y9shVXbqZvnbRlyfc8kLqy6ZDsk3aF+/MI=;
 b=YmZ6pV1C1jkfAAliwROa0fNuisCMNxju4Q7FyEX6VVpKDIMpeb3FwWE4VX/m/Xza6yYC
 aRryEUo+NRpaGfE7dLHDXdt08Iw3ByyE/dENJaeLO/AfPeOiWWftlUKFL2TX7YEFx10O
 bcIXjN/SqRqNm0hrzbG1FhJUY5i1RmwEjIKqdXXjlaKPRO1C0aZX2WXY27B+K9Ux7wzz
 HfvDYv5HSgAPCOVKzuuxyrWpWV9GqhhgLwUtyhcT6kPY5otPJBw1nzO3tepM6vUk1jjZ
 h9CwyGJYOlNYSpfJ8rk0lXjP+TXSXtQtIbgFbXsm4wKBAnmDn31H1/LP2QK42FGFx6Te uw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxraw0c5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Nov 2022 01:36:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocVs3SP4McVcwL602cMe+HSpzaOeXxWK3GAOOeFM5X3vX0GIR+UspIvVDsEVYhel7Jdn3J0wKPUkaCd/Ng/fru1fnsPjprHZ2MoIO8l4TYcFq/j3eCwA7dOWZvxjy/DjgOOPWY03MbSLhZKU0HiMagAHk86ZnnhzaqiLVRbUMpKimQbpi8iEUdAPlBHRYlCY+2YGymOYM+J5wcHV0czHrRSle4M0w+0+5clx7yX0jiDPUp4MTt/RnjGSbMANPD+gsWoWnooJYkrxRssu/fLJP/+v+eUJrGtswMrBTS41rdkpeKPKuJeTWYlnNgYersXBlpXfp9wQDIju6wkJVv10xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tG+W1Is+2Y9shVXbqZvnbRlyfc8kLqy6ZDsk3aF+/MI=;
 b=l35K/NsLYHxipv7B8AnJXnIo4a8tLsmEg2ZfrDbrPZI9bupQVspGty57W5fXdPJ+GNMhFSo+R26Zgoqtrw8ROWjEa+bhlazjBRQiouQwxarHknhsbJ5kZ04Un6lK57lTlAWHdr44YdW8MPLRwBI6TiYLB+X3MFuX63R6iKkmZkdMnB8UyoLpSeA3eYpbvDp7FuOT6hafcxO+ScU3Km4kZu9RhwdOJnNP+4ADCD0xilCMGPgu3Og8YI3DxEB7b/Uqjp1BgDl0v4juKkhV+J3lkgdPphSiVEoRcM4+cOFPjvqAqmHKaXUM/arynX3aOC0r74/Cx/Z4/QSWyLq8YH/SuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG+W1Is+2Y9shVXbqZvnbRlyfc8kLqy6ZDsk3aF+/MI=;
 b=qBoTk7EvFq1wcdFFn0+0WK+V8gT7yZlR1SyjYQa9exbYuMDRE4XAhtL/9+O+OjMl9bQOvXXPm6b/h/QMVglbU9gF1Dbtd50YBIr2s/PzbgnTK8N2173J3ApK6DOhcsBLXyzQvj9yzB+gInTdSzpAjPLWYckpVw2EzLWpbXgmukdkWNIegQ0SiumcSg7+GIwZtw5nPc+SdzU7YnVlYS5UzSBNuJqTm+MzWujLuyynwbXfJrXkAiOuTjYGwhowHZ3v1OlswaXWdUO2RDrw7lzXGHEOomutUtuECgjr5xk5PPCQgnQ8YjUMicnwdft997QdOYRXgISNYQveVzuMo2J4pQ==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB7479.namprd02.prod.outlook.com (2603:10b6:510:a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sat, 19 Nov
 2022 09:36:32 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 09:36:32 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH 1/2] io: Add support for MSG_PEEK for socket channel
Date: Sat, 19 Nov 2022 09:36:11 +0000
Message-Id: <20221119093615.158072-1-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35)
 To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|PH0PR02MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 366024e4-0885-46e7-3762-08daca118a87
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3d0ebtuG3bHPkB0/fQ4D8cxUnpA6pbwxPcOG0vf2tcB1/9GqMUZnH7VXH1JI86dI44h6gz1xtjmHG4mOiCbTwXSinLVAr48cvcZ506VopferkwgGfVB1RaUTyFOIiS3/8EDEF7zmKGtaqttUURNYPQsj+O5WdqKW1qPv6vNFlbJZBJuWY75d/cYNvllE1VV33qTSmdhuyXS5PGOrVJ0ah+pCobTOPVYVsON4MUO42QAu1f9IaTlbefmszdQIQmXw59qwPisvgJxGLD7vduMaY7LRlYLr1ZBM0CsR57uH61nxjuf4nF2A/TGXk1AMjAPLiR338ZFBHMWDJeHPu4t26SdK/c9RiqS7e+cSEkRZbCA6DGMxJ3BKLnfVWhBQH4DR7+13JrXx1Qdmkl8Gr4Tx4d11HtfWrc2PsJ1FFH44spKtMZc73kV1opFxMUZGTvFN52iDbk/dsAhS8jUdyDvkGSL+bKhTH/ke+5yEXksBcm2UmVevuO3c8NODZIEjB/FmHc4/Vp19UUCCBJXIBExOpO+vWwuTGXygI+rZctEvwA1Ej/Utm8YpcAQLZhK0/y1TcXg9mL7QXoctXq3HiKYwMIrTaNOAXWpZ+3YD51CRkufYCUDHFpmwaTOGBUy+4PqHhUlS3wq4Dq14FqOK3Ibym8gWzJggpuTLowqg4FE+kKgREqipn23ZLSbItghN6Uuh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(478600001)(6512007)(6506007)(6666004)(6486002)(52116002)(107886003)(86362001)(316002)(6916009)(38350700002)(38100700002)(66476007)(66556008)(66946007)(4326008)(8676002)(36756003)(26005)(2906002)(30864003)(41300700001)(83380400001)(186003)(8936002)(1076003)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HiWPiPWpzznbm62cqcPEEW20zg4erMmg7admdDK91FWNDenMBX6lstH2pv/y?=
 =?us-ascii?Q?94B7J6guojRKOnSFwZsCxd77TEO6gAMYZDPrjiGYDkcdNE+0JUlCqIbf2V2W?=
 =?us-ascii?Q?Rm1oACgvbRAgeR7U7Pb4FiZtcuLWQe2qNFuKLYA6dYOHK4h+ARv9apsS4lIL?=
 =?us-ascii?Q?1dXa1nYLtanFtr27qwtFt4U2EnTQtS45q0JZowW1KJ0i2WxWx0k4hmL7tu76?=
 =?us-ascii?Q?ECbd7/SZdb44Hg5FkS4dtqt3d6aEpnaHk63g2wSG1i1twXiu6JMEmK0uV7nz?=
 =?us-ascii?Q?1px0IQR7HtpjWzQFqLxl+kBaiWVtd4RDaRDlLSTzAv/Hp84PZeAOblG9MRvz?=
 =?us-ascii?Q?DYbzadanH9JuqBQ7p+oQb/Loj28RYV/wS+Xlosn/NxJSjypDsS1Dv4LNl4oX?=
 =?us-ascii?Q?15Hp5fnDeOBYlOIqT9izw+5LW4DV7QikeMzL3e7kapYGaXOwDFZ4F5caV6fx?=
 =?us-ascii?Q?8OqF0ghJVm3+je5f8LMYgew4uWw1u9Yc9cItOwtiSGIkWpqD2IkiXYT0pFwI?=
 =?us-ascii?Q?vYCbIJyZlebkusofz6G1e90KcEFqwlw8sP9DYWffXluBEq/cxcgTtrSz+F0M?=
 =?us-ascii?Q?Il/N5RwxD0Caht0JcV4szwMYPv8rF+TsFPSrlTHK1oMiMhfkJu7VP9MU4FCh?=
 =?us-ascii?Q?6fWInAm+EVN67CTAsiNcbbjNsKRBHGhrswqPXQGkWttd4sg9gCvFaH8r4OlH?=
 =?us-ascii?Q?1BUlecAqFImsR41TvkUcCu/i5TDz9nOdAy8oeeQmplv3SRWM4mAEnu261r/I?=
 =?us-ascii?Q?MVH7egBWZF74IVVUpixOQJI+tBkuBcCkhZ+WOWsS2uFhh+bDIHWROOUmwGDW?=
 =?us-ascii?Q?CfMqPrc+0xvifQ5jYwkMD3X33GLDe71iLS+MGiJEYqthMvrQt1KXSL5Gf1Ao?=
 =?us-ascii?Q?FcdniEpXAxA0iJzK0D5q1SfO4SrdPnIHGGtM6WPMZb5hb+XR9cYo7OXTe5CH?=
 =?us-ascii?Q?pP1i1KkeCozCUKzYJlASSrMwcMOlsH11VGuJUNHEKiW32cDrnPDTqk9gILxr?=
 =?us-ascii?Q?YtSrdexDChxfO1rFGZjUojVnCsFgDaKWUTNc076Y8huRhetAe4lL2R7AWrKE?=
 =?us-ascii?Q?8Xok0tNqZDlH79tqlRRtvIpE0TikeFbBK4urzn5E8PLH+OcN7H17xhbEY/i2?=
 =?us-ascii?Q?p434SIjFD88/Sk4qyVUdpZMB529UXCk6GHNmoXWUrSPpnOs+MYXIC+EvQ+u2?=
 =?us-ascii?Q?rUE56RSU1Bq5dc2J3LoH/bpAWRu/TeTlxtVEScqHKtY6Bkd2XOpu+MXxgeug?=
 =?us-ascii?Q?Fkt9Wn2/oOG9GD+zEtNIhhVoG6G9P1nztrss2HQ6ftSyyChpGGl4HsKQZxDu?=
 =?us-ascii?Q?xrSEtS+OqK/pgW5Sqt796bJrRhyafFrod/KNlWTQxmnm4+tv8BcwNVjRB8Tr?=
 =?us-ascii?Q?p0Eq1PnNfZyVxWvzCWiCzbrm2H9cFdak68a/c5T59J3yuCdHHLHy+tgNnKPY?=
 =?us-ascii?Q?7y4KPLDm3Tx53ZP5mpMWaOFnFOREGkQJZ+j6lpiDUWCyaku09KReju0ppSHt?=
 =?us-ascii?Q?o4PWtKtNIYj2I4O73a++3ky0/bKJySstkQqGU6N9dd2SnSFFjrY+HUwb5qpA?=
 =?us-ascii?Q?J6V3D2zoZrocgKcKNrIe9PtgZ885yDHoZCXdlGef/aB06ZCB6j3R3+M4Cl72?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366024e4-0885-46e7-3762-08daca118a87
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 09:36:32.7166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wH94HvQPc8Bk48oWatJ5is9K8hUXTKHDI3UlVsKT5ukA33k0EXFvLEBWc8n+sRqj1chMsP+cEzJM2eVXsUMkUZNsUFydScU3RtZ8dwkbrYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7479
X-Proofpoint-ORIG-GUID: Jp5A0zpOKrZP5HZ71S8040fFjgP41ojA
X-Proofpoint-GUID: Jp5A0zpOKrZP5HZ71S8040fFjgP41ojA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_08,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

MSG_PEEK reads from the peek of channel, The data is treated as
unread and the next read shall still return this data. This
support is currently added only for socket class. Extra parameter
'flags' is added to io_readv calls to pass extra read flags like
MSG_PEEK.
---
 chardev/char-socket.c               |  4 +-
 include/io/channel.h                | 83 +++++++++++++++++++++++++++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 16 +++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 73 +++++++++++++++++++++++--
 migration/channel-block.c           |  1 +
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 15 files changed, 179 insertions(+), 11 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 879564aa8a..5afce9a464 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -283,11 +283,11 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
     if (qio_channel_has_feature(s->ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
         ret = qio_channel_readv_full(s->ioc, &iov, 1,
                                      &msgfds, &msgfds_num,
-                                     NULL);
+                                     0, NULL);
     } else {
         ret = qio_channel_readv_full(s->ioc, &iov, 1,
                                      NULL, NULL,
-                                     NULL);
+                                     0, NULL);
     }
 
     if (msgfds_num) {
diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee7480..cbcde4b88f 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -34,6 +34,8 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
 
 #define QIO_CHANNEL_WRITE_FLAG_ZERO_COPY 0x1
 
+#define QIO_CHANNEL_READ_FLAG_MSG_PEEK 0x1
+
 typedef enum QIOChannelFeature QIOChannelFeature;
 
 enum QIOChannelFeature {
@@ -41,6 +43,7 @@ enum QIOChannelFeature {
     QIO_CHANNEL_FEATURE_SHUTDOWN,
     QIO_CHANNEL_FEATURE_LISTEN,
     QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
+    QIO_CHANNEL_FEATURE_READ_MSG_PEEK,
 };
 
 
@@ -114,6 +117,7 @@ struct QIOChannelClass {
                         size_t niov,
                         int **fds,
                         size_t *nfds,
+                        int flags,
                         Error **errp);
     int (*io_close)(QIOChannel *ioc,
                     Error **errp);
@@ -188,6 +192,7 @@ void qio_channel_set_name(QIOChannel *ioc,
  * @niov: the length of the @iov array
  * @fds: pointer to an array that will received file handles
  * @nfds: pointer filled with number of elements in @fds on return
+ * @flags: read flags (QIO_CHANNEL_READ_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  * Read data from the IO channel, storing it in the
@@ -224,6 +229,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
                                size_t niov,
                                int **fds,
                                size_t *nfds,
+                               int flags,
                                Error **errp);
 
 
@@ -300,6 +306,34 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
                               size_t niov,
                               Error **errp);
 
+/**
+ * qio_channel_readv_peek_all_eof:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data into
+ * @niov: the length of the @iov array
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Read data from the peek of IO channel without
+ * actually removing it from channel buffer, storing
+ * it in the memory regions referenced by @iov. Each
+ * element in the @iov will be fully populated with
+ * data before the next one is used. The @niov
+ * parameter specifies the total number of elements
+ * in @iov.
+ *
+ * The function will wait for all requested data
+ * to be read, yielding from the current coroutine
+ * if required.
+ *
+ * Returns: 1 if all bytes were read, 0 if end-of-file
+ *          occurs without data, or -1 on error
+ */
+int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
+                                   const struct iovec *iov,
+                                   size_t niov,
+                                   Error **errp);
+
+
 /**
  * qio_channel_readv_all:
  * @ioc: the channel object
@@ -328,6 +362,34 @@ int qio_channel_readv_all(QIOChannel *ioc,
                           Error **errp);
 
 
+/**
+ * qio_channel_readv_peek_all:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data into
+ * @niov: the length of the @iov array
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Read data from the the peek of IO channel without
+ * removing from channel buffer, storing it in the
+ * memory regions referenced by @iov. Each element
+ * in the @iov will be fully populated with data
+ * before the next one is used. The @niov parameter
+ * specifies the total number of elements in @iov.
+ *
+ * The function will wait for all requested data
+ * to be read, yielding from the current coroutine
+ * if required.
+ *
+ * If end-of-file occurs before all requested data
+ * has been read, an error will be reported.
+ *
+ * Returns: 0 if all bytes were read, or -1 on error
+ */
+int qio_channel_readv_peek_all(QIOChannel *ioc,
+                               const struct iovec *iov,
+                               size_t niov,
+                               Error **errp);
+
 /**
  * qio_channel_writev_all:
  * @ioc: the channel object
@@ -456,6 +518,27 @@ int qio_channel_read_all(QIOChannel *ioc,
                          size_t buflen,
                          Error **errp);
 
+/**
+ * qio_channel_read_peek_all:
+ * @ioc: the channel object
+ * @buf: the memory region to read data into
+ * @buflen: the number of bytes to @buf
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Reads @buflen bytes from the peek of channel into @buf without
+ * removing it from channel buffer, possibly blocking or (if the
+ * channel is non-blocking) yielding from the current coroutine
+ * multiple times until the entire content is read. If end-of-file
+ * occurs it will return an error rather than a short-read. Otherwise
+ * behaves as qio_channel_read().
+ *
+ * Returns: 0 if all bytes were read, or -1 on error
+ */
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              const char *buf,
+                              size_t buflen,
+                              Error **errp);
+
 /**
  * qio_channel_write_all:
  * @ioc: the channel object
diff --git a/io/channel-buffer.c b/io/channel-buffer.c
index bf52011be2..8096180f85 100644
--- a/io/channel-buffer.c
+++ b/io/channel-buffer.c
@@ -54,6 +54,7 @@ static ssize_t qio_channel_buffer_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelBuffer *bioc = QIO_CHANNEL_BUFFER(ioc);
diff --git a/io/channel-command.c b/io/channel-command.c
index 74516252ba..e7edd091af 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -203,6 +203,7 @@ static ssize_t qio_channel_command_readv(QIOChannel *ioc,
                                          size_t niov,
                                          int **fds,
                                          size_t *nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
diff --git a/io/channel-file.c b/io/channel-file.c
index b67687c2aa..d76663e6ae 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -86,6 +86,7 @@ static ssize_t qio_channel_file_readv(QIOChannel *ioc,
                                       size_t niov,
                                       int **fds,
                                       size_t *nfds,
+                                      int flags,
                                       Error **errp)
 {
     QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
diff --git a/io/channel-null.c b/io/channel-null.c
index 75e3781507..4fafdb770d 100644
--- a/io/channel-null.c
+++ b/io/channel-null.c
@@ -60,6 +60,7 @@ qio_channel_null_readv(QIOChannel *ioc,
                        size_t niov,
                        int **fds G_GNUC_UNUSED,
                        size_t *nfds G_GNUC_UNUSED,
+                       int flags,
                        Error **errp)
 {
     QIOChannelNull *nioc = QIO_CHANNEL_NULL(ioc);
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b76dca9cc1..a06b24766d 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -406,6 +406,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
     }
 #endif /* WIN32 */
 
+    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
+
     trace_qio_channel_socket_accept_complete(ioc, cioc, cioc->fd);
     return cioc;
 
@@ -496,6 +498,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
@@ -517,6 +520,10 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
 
     }
 
+    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
+        sflags |= MSG_PEEK;
+    }
+
  retry:
     ret = recvmsg(sioc->fd, &msg, sflags);
     if (ret < 0) {
@@ -624,11 +631,17 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
     ssize_t done = 0;
     ssize_t i;
+    int sflags = 0;
+
+    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
+        sflags |= MSG_PEEK;
+    }
 
     for (i = 0; i < niov; i++) {
         ssize_t ret;
@@ -636,7 +649,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
         ret = recv(sioc->fd,
                    iov[i].iov_base,
                    iov[i].iov_len,
-                   0);
+                   sflags);
         if (ret < 0) {
             if (errno == EAGAIN) {
                 if (done) {
@@ -705,7 +718,6 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
 }
 #endif /* WIN32 */
 
-
 #ifdef QEMU_MSG_ZEROCOPY
 static int qio_channel_socket_flush(QIOChannel *ioc,
                                     Error **errp)
diff --git a/io/channel-tls.c b/io/channel-tls.c
index 4ce890a538..c730cb8ec5 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -260,6 +260,7 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
                                      size_t niov,
                                      int **fds,
                                      size_t *nfds,
+                                     int flags,
                                      Error **errp)
 {
     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
diff --git a/io/channel-websock.c b/io/channel-websock.c
index fb4932ade7..a12acc27cf 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -1081,6 +1081,7 @@ static ssize_t qio_channel_websock_readv(QIOChannel *ioc,
                                          size_t niov,
                                          int **fds,
                                          size_t *nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelWebsock *wioc = QIO_CHANNEL_WEBSOCK(ioc);
diff --git a/io/channel.c b/io/channel.c
index 0640941ac5..23c8752918 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -52,6 +52,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
                                size_t niov,
                                int **fds,
                                size_t *nfds,
+                               int flags,
                                Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
@@ -63,7 +64,14 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
         return -1;
     }
 
-    return klass->io_readv(ioc, iov, niov, fds, nfds, errp);
+    if ((flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) &&
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        error_setg_errno(errp, EINVAL,
+                         "Channel does not support peek read");
+        return -1;
+    }
+
+    return klass->io_readv(ioc, iov, niov, fds, nfds, flags, errp);
 }
 
 
@@ -109,6 +117,37 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
     return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
 }
 
+int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
+                                   const struct iovec *iov,
+                                   size_t niov,
+                                   Error **errp)
+{
+   ssize_t len = 0;
+   ssize_t total = iov_size(iov, niov);
+
+   while (len < total) {
+       len = qio_channel_readv_full(ioc, iov, niov, NULL,
+                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
+
+       if (len == QIO_CHANNEL_ERR_BLOCK) {
+            if (qemu_in_coroutine()) {
+                qio_channel_yield(ioc, G_IO_IN);
+            } else {
+                qio_channel_wait(ioc, G_IO_IN);
+            }
+            continue;
+       }
+       if (len == 0) {
+           return 0;
+       }
+       if (len < 0) {
+           return -1;
+       }
+   }
+
+   return 1;
+}
+
 int qio_channel_readv_all(QIOChannel *ioc,
                           const struct iovec *iov,
                           size_t niov,
@@ -117,6 +156,24 @@ int qio_channel_readv_all(QIOChannel *ioc,
     return qio_channel_readv_full_all(ioc, iov, niov, NULL, NULL, errp);
 }
 
+int qio_channel_readv_peek_all(QIOChannel *ioc,
+                               const struct iovec *iov,
+                               size_t niov,
+                               Error **errp)
+{
+    int ret = qio_channel_readv_peek_all_eof(ioc, iov, niov, errp);
+
+    if (ret == 0) {
+        error_setg(errp, "Unexpected end-of-file before all data were read");
+        return -1;
+    }
+    if (ret == 1) {
+        return 0;
+    }
+
+    return ret;
+}
+
 int qio_channel_readv_full_all_eof(QIOChannel *ioc,
                                    const struct iovec *iov,
                                    size_t niov,
@@ -146,7 +203,7 @@ int qio_channel_readv_full_all_eof(QIOChannel *ioc,
     while ((nlocal_iov > 0) || local_fds) {
         ssize_t len;
         len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
-                                     local_nfds, errp);
+                                     local_nfds, 0, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_IN);
@@ -284,7 +341,7 @@ ssize_t qio_channel_readv(QIOChannel *ioc,
                           size_t niov,
                           Error **errp)
 {
-    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, errp);
+    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, 0, errp);
 }
 
 
@@ -303,7 +360,7 @@ ssize_t qio_channel_read(QIOChannel *ioc,
                          Error **errp)
 {
     struct iovec iov = { .iov_base = buf, .iov_len = buflen };
-    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, errp);
+    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, 0, errp);
 }
 
 
@@ -336,6 +393,14 @@ int qio_channel_read_all(QIOChannel *ioc,
     return qio_channel_readv_all(ioc, &iov, 1, errp);
 }
 
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              const char *buf,
+                              size_t buflen,
+                              Error **errp)
+{
+    struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
+    return qio_channel_readv_peek_all(ioc, &iov, 1, errp);
+}
 
 int qio_channel_write_all(QIOChannel *ioc,
                           const char *buf,
diff --git a/migration/channel-block.c b/migration/channel-block.c
index c55c8c93ce..0b0deeb919 100644
--- a/migration/channel-block.c
+++ b/migration/channel-block.c
@@ -53,6 +53,7 @@ qio_channel_block_readv(QIOChannel *ioc,
                         size_t niov,
                         int **fds,
                         size_t *nfds,
+                        int flags,
                         Error **errp)
 {
     QIOChannelBlock *bioc = QIO_CHANNEL_BLOCK(ioc);
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 196b78c00d..199227a556 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -614,7 +614,7 @@ static int coroutine_fn prh_read(PRHelperClient *client, void *buf, int sz,
         iov.iov_base = buf;
         iov.iov_len = sz;
         n_read = qio_channel_readv_full(QIO_CHANNEL(client->ioc), &iov, 1,
-                                        &fds, &nfds, errp);
+                                        &fds, &nfds, 0, errp);
 
         if (n_read == QIO_CHANNEL_ERR_BLOCK) {
             qio_channel_yield(QIO_CHANNEL(client->ioc), G_IO_IN);
diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index 2994d1cf42..3cf1acaf7d 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -106,7 +106,7 @@ void *tpm_emu_ctrl_thread(void *data)
         int *pfd = NULL;
         size_t nfd = 0;
 
-        qio_channel_readv_full(ioc, &iov, 1, &pfd, &nfd, &error_abort);
+        qio_channel_readv_full(ioc, &iov, 1, &pfd, &nfd, 0, &error_abort);
         cmd = be32_to_cpu(cmd);
         g_assert_cmpint(cmd, ==, CMD_SET_DATAFD);
         g_assert_cmpint(nfd, ==, 1);
diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-channel-socket.c
index b36a5d972a..b964bb202d 100644
--- a/tests/unit/test-io-channel-socket.c
+++ b/tests/unit/test-io-channel-socket.c
@@ -460,6 +460,7 @@ static void test_io_channel_unix_fd_pass(void)
                            G_N_ELEMENTS(iorecv),
                            &fdrecv,
                            &nfdrecv,
+                           0,
                            &error_abort);
 
     g_assert(nfdrecv == G_N_ELEMENTS(fdsend));
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 232984ace6..145eb17c08 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -116,7 +116,7 @@ vu_message_read(VuDev *vu_dev, int conn_fd, VhostUserMsg *vmsg)
          * qio_channel_readv_full may have short reads, keeping calling it
          * until getting VHOST_USER_HDR_SIZE or 0 bytes in total
          */
-        rc = qio_channel_readv_full(ioc, &iov, 1, &fds, &nfds, &local_err);
+        rc = qio_channel_readv_full(ioc, &iov, 1, &fds, &nfds, 0, &local_err);
         if (rc < 0) {
             if (rc == QIO_CHANNEL_ERR_BLOCK) {
                 assert(local_err == NULL);
-- 
2.22.3


