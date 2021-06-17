Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4388A3ABD2A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:54:06 +0200 (CEST)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lty5T-0005oJ-SZ
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lty3K-0003fe-Ou; Thu, 17 Jun 2021 15:51:52 -0400
Received: from mail-vi1eur05on2119.outbound.protection.outlook.com
 ([40.107.21.119]:42273 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lty3H-0004JQ-8l; Thu, 17 Jun 2021 15:51:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctV66zA4KkTkxJJjy4ZbDTL4fZbMABFqcwtLCG8kjYRaIGazqJIcKrU/yS+2IDp7Le1K90fMvG321r4zHRsupzOwFZFBG2ar7REV/sIchfE0hGwqhD5ouqAtJ+ayW7yXRgcr5eeyy61tkk9IR1BswHXhmjLBD4be5u+7BzC7ZE8tpgInGJ1r6Ug3KaaiiVQjbXsCm3AcQaVGtMwkhXEUGv2VjLfI6JntR/8cTXvfMQ/j0NbD3O/4J34asragJ+V02pNEWaOuThaS0nPUsQmi5NQD6/ZNmNNKMe6xRqzpSLWh4HOm9p5Nf9QAUTo+KboXmzs2u0zyvlnCwAQ9YXCJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfWfzRi+WfUx0nrSavGOHb6+cn69+TzM4Mvbl7b4h5E=;
 b=FlhGEf09CQjy0dOW/OpS0a83wP0t5UCs3qwSNtI98OLxjeTvXTYY2s22sFk/pojlAZ/qj+ATRIQemZ3yw5dBP4BJKN+iOkAk7S3KYn+QZZU56+Vaf/3e8dhkSrDfX7yPwsyjpgA2RUyAJrfTS4vxvlPMsxaX8hODqiBYl8WCIY/FW/nHVLi25K28zuFw0nvpdO3YcvhNoOjbIeghBrEQJAWsWsUsrHYT4jRwW47bDLbok0Hbunqi7zg/rEK2MGNzX5TkS2oG+XNUbUQdf/rq2lglyMTKH0/8KSZP5mKsV8l1hjYwwIFRRHORrDXtS3Nmlcir1Xp7U0zyuP88mBPCjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfWfzRi+WfUx0nrSavGOHb6+cn69+TzM4Mvbl7b4h5E=;
 b=ombXO+wyXSUkRGgYU584uubJhADZbsv+pnwMXQ0o0KMRgwmDkW3TsO0b1skpanL13jnEs4m1tFhEz7zG/R2mSEeX5dUtvkmTeR9zi9WTvOpp7hqYUMjIZmdzlpiF3MPPA0ZhUf6e8clBPLzdNIU1E5zG5pZwU8HaXhx80k/S0g4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4600.eurprd08.prod.outlook.com (2603:10a6:20b:84::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 19:51:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 19:51:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com
Subject: [PATCH RFC] meson: add option to use zstd for qcow2 compression by
 default
Date: Thu, 17 Jun 2021 22:51:28 +0300
Message-Id: <20210617195128.66675-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1P189CA0005.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::18)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1P189CA0005.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 19:51:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8adad54-6f2f-4c17-20c3-08d931c95539
X-MS-TrafficTypeDiagnostic: AM6PR08MB4600:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46007FCB2808E07C3765D6CEC10E9@AM6PR08MB4600.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Q79IriqaICqRxuo1kNXao644K0/t0LAO5FWLsUshd7oUIUrfzynSTqEjnoZVWPr1abedljtBkYzimt7qdqa7+C8GaOoutBTkv9Wo2Xbw8BW3eRBAZ+SHIOSVF6FuJ9x68n1/ixV7a7sFEER6WWFFx5OsKMH7ZFwHxVF3/uX6YpAbeIm3tASO8g6RmpfEKI5kVVHNqrtTTuux06xuA3fBsa2xL4JXNXzurPlsfIsd94esZVqRaNszvEDXR8TyGalvxpZ0gnSLQQRY0D00B5EsCP45ewWC2stXRm02YDpAuOFAGdmchjmO7UhYIIZh/gSquh1rCW87TCABxonUA6Cl9sdOebH1G01rvoPh4nYbCZFLOMROVpZ4E5hal7Kjnfa1MHEaAHSTR27tHkyLt2l74s6hTBQyOuRAy3b8J01/KbR7EsUeWHcHNzZ/DPdjv03hQa6MUB4Ovuwx3iL84utjypaBWuIX+GrBb3fOaZgsx2wpofNCZdtl5Dyym71+4CJVbgf/HJ7OxaWaDH/T+8+Mv/NUNEdX6pW6GY5VZlwQAV4h7DOJLLNkkhXHdGoV/6ZvTDBmprjogAjRCRN/UarVwa45Rq4U0yPRw+sMhxU4caAng0gl31zFL69hMTpc4nqT05SC+Js9HV/2fW5fION1l8AikXoVZajOaTb7DMlTDF087+SZVHFR/BN3QmDk3Vg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39850400004)(366004)(376002)(346002)(8936002)(1076003)(186003)(36756003)(956004)(2616005)(6512007)(83380400001)(8676002)(6916009)(5660300002)(316002)(2906002)(478600001)(66946007)(52116002)(66476007)(4326008)(6506007)(66556008)(26005)(38350700002)(6486002)(16526019)(86362001)(38100700002)(6666004)(107886003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RgKf2AbGrFiC8RoBqCh6e8Gc6eZTT7GpaGc2ifxa9i+HudZL1NvtDA5l850E?=
 =?us-ascii?Q?wVPjVwoDVyChNbd6igGVUpgsKHCgjtezW+ewh3yg+6r4zePovbM0wRUc9wOq?=
 =?us-ascii?Q?bOLxn0K/0+unli0dGPi938x23CzMj5DTOqLtx1s2Hh2pDFmOiX5hmWoAV6MI?=
 =?us-ascii?Q?rEcbnTWw9PpeVtSHfT8FpI+WaqCOJw/hMGcdDWGk/IdblwRgWCacjS7Js+vR?=
 =?us-ascii?Q?3io/dlyAcnOi0RsBE41P1GRuLSTOv9id2CrAAJjoUWTX6nMxyP4U6ezEO3/9?=
 =?us-ascii?Q?+As98x9YXWGlWAzbqigq2UWQl1bk0v9TlEL4JEKoLgYDz1c9g7ydg0u4ponw?=
 =?us-ascii?Q?5KItCyD2Vijr4XyZPEO/6+V0l4GnKAIRw2p3CeaboLAAm10uj6JVgCZ+bU0v?=
 =?us-ascii?Q?ObDEmVin/S8qH9Kba6zdWGoUF6r2EPs12iEd6Pm0u3e3OuTPLYB5VlGo/TaB?=
 =?us-ascii?Q?9zq1oeWd8ASJWDehZk2WbRKnrTcvv7sUDmLwPVZhuUhd6fzmV4hDaOSWO9Ju?=
 =?us-ascii?Q?aQw5wnuue1tbf4Q3v0l1NNPG10aLkyoMClDnBhb/7pv0iW16nZBCgd6Y/Djz?=
 =?us-ascii?Q?8TUbJXsjsN077XnqdIuAgpXIChXb9nPvr8Ex0UMaGqRcqmNeUSBBHGjoWdMF?=
 =?us-ascii?Q?5vblsWm1mBSDZMclt9VycIaZlIvS2K5ShLoD8267qA3JBXFemLqo33SwwiJJ?=
 =?us-ascii?Q?zVGEgKU+czZwI3DxPcKMTlNadp6Dmcp0dkRHR2783eSMT+qfOogPEFqkeV8t?=
 =?us-ascii?Q?QVZ8/2fni/F1fp3pTx+GusPT2BkOUWolVCsN5SxTJ2HAt13MycHHNE9ObOeG?=
 =?us-ascii?Q?/oTy2LsfeiX3Gic+8iHtr3GqGY48EPPF257CCnqMk05LM+T5d12AG/IwXhkM?=
 =?us-ascii?Q?uGo4OpLkyTLozasXKOd66vMfYhxR0Y4iK/fSO4ysesB76BEcvyAkO9WckTU8?=
 =?us-ascii?Q?YahLkKkt/YJtjDBUBOhMoi7yp45z1EOWxXryjRbAmqSKBiV4eG9kFoYlgw2g?=
 =?us-ascii?Q?h10pfaYJOrgm96ukl8tdLEvdasZmvr5Pucxb5g0uHBQvGbgf+xN7287iLXW8?=
 =?us-ascii?Q?hngXn1yoK0phfEN+oGWHS1UNiWoj5Jz1O9cbQfDRJrJhI/cQSAxJaufcgC6W?=
 =?us-ascii?Q?vwuZLzalu6lVxMAhbU2S2XcDlfda7K5mxXLNCpgqlPENvFfcTYgFxsEQ4XoD?=
 =?us-ascii?Q?1B/DIkeyltgOwaqlx2mIFmFADyCoTBSkGjotjM3X4Xn5VCV8f8nP5MesvdA1?=
 =?us-ascii?Q?Sbrytj6EJcL5inNJph2yZhGIZvI9LIaHcJUrGzLf5WVdlk+8aoH+LDRZ4oL8?=
 =?us-ascii?Q?73ASCB6aLwDi/RHQFeSQnMGS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8adad54-6f2f-4c17-20c3-08d931c95539
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 19:51:43.9472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bU7GNjB5gVLZ4bvD1phwU52ajJfZW8pdRXdQ0FZZptCqDHSiu7sifPIiCC/FZc/x9jqY3IWpXj3gK92J5pou5EHR/UkDegs+2qFb+b82lOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4600
Received-SPF: pass client-ip=40.107.21.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recently we added support of zstd to qcow2 format, as zstd seems to be
better than zlib in general, and which is important (as qcow2
compression used mostly for backups) compressed writes are faster with
zstd.

Let's add a build option to use zstd by default.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all! We want to use zstd as a default compression type for newly
created qcow2 images in upcoming Virtuozzo 8.

I am not sure, how much the community interested in such option,
probably I should just keep a downstream-only patch changing the
default.

But if you like it, I'd be happy to only set new config option in our
qemu build instead of maintaining extra downstream-only patch :)

So, it's an RFC. I also can split the patch so that refactoring of 
qcow2_co_create() go in a separate preparation patch.

Another RFC question, shouldn't we move to zstd by default in upstream
too?

 configure         | 10 +++++++++-
 meson.build       |  4 ++++
 block/qcow2.c     | 32 +++++++++++++++++++++++++-------
 meson_options.txt |  2 ++
 4 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index debd50c085..b19af43525 100755
--- a/configure
+++ b/configure
@@ -385,6 +385,7 @@ snappy="auto"
 bzip2="auto"
 lzfse="auto"
 zstd="auto"
+qcow2_zstd_default="no"
 guest_agent="$default_feature"
 guest_agent_with_vss="no"
 guest_agent_ntddscsi="no"
@@ -1318,6 +1319,10 @@ for opt do
   ;;
   --enable-zstd) zstd="enabled"
   ;;
+  --disable-qcow2-zstd-default) qcow2_zstd_default="disabled"
+  ;;
+  --enable-qcow2-zstd-default) qcow2_zstd_default="enabled"
+  ;;
   --enable-guest-agent) guest_agent="yes"
   ;;
   --disable-guest-agent) guest_agent="no"
@@ -1903,6 +1908,8 @@ disabled with --disable-FEATURE, default is enabled if available
                   (for reading lzfse-compressed dmg images)
   zstd            support for zstd compression library
                   (for migration compression and qcow2 cluster compression)
+  qcow2-zstd-default  Use zstd by default for qcow2 image creation
+                  (requires zstd enabled)
   seccomp         seccomp support
   coroutine-pool  coroutine freelist (better performance)
   glusterfs       GlusterFS backend
@@ -6424,7 +6431,8 @@ if test "$skip_meson" = no; then
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
+        -Dzstd=$zstd -Dqcow2_zstd_default=$qcow2_zstd_default \
+        -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Dattr=$attr -Ddefault_devices=$default_devices \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
diff --git a/meson.build b/meson.build
index d8a92666fb..3d65b6c46b 100644
--- a/meson.build
+++ b/meson.build
@@ -484,6 +484,9 @@ if not get_option('zstd').auto() or have_block
                     required: get_option('zstd'),
                     method: 'pkg-config', kwargs: static_kwargs)
 endif
+if not zstd.found() and get_option('qcow2_zstd_default').enabled()
+  error('--enable-qcow2-zstd-default: Cannot use zstd by default without enabling zstd')
+endif
 gbm = not_found
 if 'CONFIG_GBM' in config_host
   gbm = declare_dependency(compile_args: config_host['GBM_CFLAGS'].split(),
@@ -1168,6 +1171,7 @@ config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
 config_host_data.set('CONFIG_STATX', has_statx)
 config_host_data.set('CONFIG_ZSTD', zstd.found())
+config_host_data.set('CONFIG_QCOW2_ZSTD_DEFAULT', get_option('qcow2_zstd_default').enabled())
 config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
 config_host_data.set('CONFIG_X11', x11.found())
diff --git a/block/qcow2.c b/block/qcow2.c
index ee4530cdbd..06bfbbf7b8 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3540,17 +3540,36 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         }
     }
 
-    if (qcow2_opts->has_compression_type &&
-        qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {
-
-        ret = -EINVAL;
-
-        if (version < 3) {
+    if (version < 3) {
+        if (qcow2_opts->has_compression_type &&
+            qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB)
+        {
+            ret = -EINVAL;
             error_setg(errp, "Non-zlib compression type is only supported with "
                        "compatibility level 1.1 and above (use version=v3 or "
                        "greater)");
             goto out;
         }
+    } else {
+        if (qcow2_opts->has_compression_type) {
+            compression_type = qcow2_opts->compression_type;
+#ifdef CONFIG_QCOW2_ZSTD_DEFAULT
+        } else {
+            compression_type = QCOW2_COMPRESSION_TYPE_ZSTD;
+#endif
+        }
+
+#ifndef CONFIG_ZSTD
+        assert(compression_type == QCOW2_COMPRESSION_TYPE_ZLIB);
+#endif
+    }
+
+    if (qcow2_opts->has_compression_type &&
+        qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {
+
+        ret = -EINVAL;
+
+        compression_type = qcow2_opts->compression_type;
 
         switch (qcow2_opts->compression_type) {
 #ifdef CONFIG_ZSTD
@@ -3562,7 +3581,6 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
             goto out;
         }
 
-        compression_type = qcow2_opts->compression_type;
     }
 
     /* Create BlockBackend to write to the image */
diff --git a/meson_options.txt b/meson_options.txt
index 3d304cac96..8af9bb97f5 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -108,6 +108,8 @@ option('xkbcommon', type : 'feature', value : 'auto',
        description: 'xkbcommon support')
 option('zstd', type : 'feature', value : 'auto',
        description: 'zstd compression support')
+option('qcow2_zstd_default', type : 'feature', value : 'disabled',
+       description: 'Use zstd compression type for qcow2 image creation by default')
 option('fuse', type: 'feature', value: 'auto',
        description: 'FUSE block device export')
 option('fuse_lseek', type : 'feature', value : 'auto',
-- 
2.29.2


