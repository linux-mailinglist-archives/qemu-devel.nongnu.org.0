Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17153BE6BC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:57:15 +0200 (CEST)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15Ew-0000vj-Vh
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Bc-0002Nf-GQ
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:53:48 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:37691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Ba-00020E-PO
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=klJhR5wQmE3TtVScDc9Ipt5W56waTw2Bx8x9lWL+irE=;
 b=P7QoSfFwHIQutFNSYD9hRG0MdBiESd/nidAj8/GMmytP38lNniZF5D0gUrMv780UdIdG1T
 sixaqDsmG+xLStrGPjIqLC6soobxlROMf9bm9cUXce7qxs9sR9cbTkMQJXjCMer9T5ucXI
 sr606HcZQaQUjPCt6bjnw4X0km488e8=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-VzcTJgwxP6iXDe_aIoixow-1;
 Wed, 07 Jul 2021 12:53:44 +0200
X-MC-Unique: VzcTJgwxP6iXDe_aIoixow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SosfeE22xugzOFDP628gZGRFLyV6zIcEeVZIX/DbDBaNYn4wqVknLRvOXUb3m07SgaJPrQrKunT2ON0gfkh95I81dq6amaMnTt1xYyFuyLLRuiVbYtto812dDig9e94LFj3l2FguUxXWcj0amMl9q+zM9U2NZtwb+wyoaFiwwohLG6U2SfoKcHerQy9bi0vQCWA6mtA4tMl9E7Cn2HbwvxBRR6me4CsgIhjnoRw1iADnuwzHXb0n4V5+BBHXHZugbDBQX+Ib2r0vGB5cmmtZCKm5biOeqvMJr9vg6Iiqmr55xetjlxG/vb9kmOYkotT1Q3YzpoMRQOvCTcCIiPYHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDpvCG0fhr9NBozkv3Cm7NSL/0RDStUpphJdG/tdzTI=;
 b=YPdPzzaU0uGA4Ebcy5vIsxtkNFMdCrYF8Ad6C72dTqzOcakphtAwf5+JRUfgQNg2iAAe3yedPXtjP5iu4OMv2nyM3P91haq15i7acee6C6kjeyREcWTuPEfKMJ2U5XJadc6/UlW5NaPgCKK9XPFsvXYeZOJ+Ywn2k37ahG5HGxHj0CJHX/1BN725EUpAmVD5dFy3gRy1F3BFtgZEBk+6v/PajSyt3gLlLLq2dy6KBv8QAXIG8qft2L15ztXD9V+32ZBfzgfJfjoAMeGYTk1j+xSkBEoQDZ1KcXVR+Hmsv6RD9oD57F88fmBP6YAfEyvXfh2yfuvbmBEFYThKSUsaYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0401MB2238.eurprd04.prod.outlook.com
 (2603:10a6:800:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 10:53:42 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:53:42 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v7 02/14] hw/s390x: rename tod-qemu.c to tod-tcg.c
Date: Wed,  7 Jul 2021 18:53:12 +0800
Message-ID: <20210707105324.23400-3-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 7 Jul 2021 10:53:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eb8eeb6-d94d-4403-304e-08d941357c2a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2238:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2238F6CF558C1DA306A07EAEA01A9@VI1PR0401MB2238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwQ6Iv3su7mUvKefoTBViuh7njurruG+SsS9plA+70r0U7W33nk1hgiU/4Yb+zMH5cEVhcms/D2hNibGpoSijVMcQ3soT7UYyJXwmF0g02WKL/B1Hz/hEkCQ7eIprgGBWAHu1zex611hP2EC1mnq97rxdbnRtuDpqlxEg2A7haKepHKrUSmr32R8uzk8F0UMoX4UO7dt6uvsCIPdVnHYi38d34Ony4feOodfOYWhu2nLrMD6aY2pkG8RhI9yl+7hd6EFthVxtvNcTJccct+AkAwAbp4j9CNiYejoc4bwtWR4+DnoqFE50jFNndeVxKJDVMcaDXvXLupQAnalOaF8PPWCZlO1aHQrgVX9/L95zQFIhfVKjizVgEwPKB8QmkOguthDLSVFTqlL16mgJX1ySk2QeSsw0+UBvs6M6FckiVXmX5Jsc2G9VXLRW7RwyGrB0tI3ysrgFstEvgaBP6CucbmNz+RqiP+cRyhtqHFMpI/RzZ14BQXyG4PpkjYhttAwXeX72HZql+GUEishXWFLf3nWkk+lPrXb0oERzmVLpIQKOm99JIYLFnRVOiFLzcFeJT70MvCvSwX198TakE6L0HgHHUMFELfeGm4BhgDQoCSzFYbn1MXrQZ2DUF5QANXKYbEOBP8JBYfypF4HxYvaVxLunCwVetrJvVMU/BHFo1w/ixaiaDNlXKwQtckvaVrLplUql4yIcXpZIomCOTVhyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(366004)(396003)(136003)(54906003)(316002)(26005)(66946007)(66556008)(6496006)(6486002)(186003)(6666004)(86362001)(8936002)(8676002)(83380400001)(2906002)(5660300002)(66476007)(478600001)(36756003)(4326008)(2616005)(956004)(1076003)(38100700002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QGtVrR0aoogCCvKBuRpNdA1AQF1IE2oBzZN8a00DAxUFGyiWCBd4Mdm2EuUE?=
 =?us-ascii?Q?oehiwBTDDXphDVZl79Bm/nluzdVzcsyMVHTUZFTTjaVkCQpMUK9plTu1BYtt?=
 =?us-ascii?Q?n32FrpcPluC8yMSXkYLcFlJxq+h/XO37jxJ0chy/gVZgTiLDyuxqx/UZjMdO?=
 =?us-ascii?Q?l3aVl3QkwSKhtHn7DcywqD4NeV74h0Vk/57Tg8FENKKl58hwxzuHXpZnEeiD?=
 =?us-ascii?Q?+ciWutt1P3GFsLrds0jCYqhAd+IwozqsHvge6o+zmOQZe5vhzZYvgLOXgupM?=
 =?us-ascii?Q?FCfnqdWATf+oo3WjoVPSVOUlR1taJvt90/mg6/MKkY5M7iKVAj313SRGkL/l?=
 =?us-ascii?Q?2TMMy7xJf1lYfjbQ49Gq6Bk9kGTbKbIPyaFLsebxiU90NmoTL98CqA/xnuqU?=
 =?us-ascii?Q?eVcH9jR238OXGS+hrggzZUu1qeWQArzx0IuGm5GKDLLCqvNJre5Yq/VUrY8x?=
 =?us-ascii?Q?F5wPTzeRH8s2iiY8axhIekerWAcZ/8a5nAa4G+0Vjuc8ZmiyAAhWfxUxdUTS?=
 =?us-ascii?Q?uzVmiCKnj39shae6kh3591i+uEOqtv0oCLHEtchKBpEayvU1kvGb6bNWs0/t?=
 =?us-ascii?Q?jseDA7Qsj8gE3m6iNXUQCyA5EhMWKXjXVvwgDMuY+t9beV+ectXrU3s7gzei?=
 =?us-ascii?Q?NC9GhzCsSzonCIsj/eLPq/ErOji6vzsCXhrqaiwY0FQiFKkzdmXWnpX79Qqv?=
 =?us-ascii?Q?CCDJinHUjSR8b+XunpdVtbojRXVrp0O4k/I15UirG8FbQLuVCXH1JNQj3TzC?=
 =?us-ascii?Q?jUq9vG2unohod0sKb/1nDRmV5JwfM75OFdXJLY6GRJgo+ADFIdDPSjdBtKGA?=
 =?us-ascii?Q?NHgyZCzyqAOKDjmU2RUbJ3SEpe5Iv8Jp/rsQ5Zh0m5A5FFwOUP8ECvvvJREg?=
 =?us-ascii?Q?+1s5ew2U1D9eeRRKSnNvr619nrNKxq027+7GDV/ypchFnSE8hnjlDCjtX3Po?=
 =?us-ascii?Q?m2jwJ6vdbC52EDZf5CEwjZc6c5ekZ2JT83ydKE+HZukcrF1c66Fz9TzMmV72?=
 =?us-ascii?Q?TyXGs79Ww+fksfQV898Hsqa/r4e4GJUeLy+RwFp8J1FRd9lwDjucjqCd2YSm?=
 =?us-ascii?Q?OQbTAuXfd9djzBDrO0KSqeKHCY4r/uKtxbgOxhPQVDLQOpdWH0Vxb6F/iOEA?=
 =?us-ascii?Q?s7plE7ITaaJm7LeMpFmRzsHpeYasPsagSYEb7jKsGLDFd9TVgRHM7zUxT5sr?=
 =?us-ascii?Q?tH/8dUFshI2TjuX+IVdxGl6xs3AVqCFcVsW4l/uzMkexGbOKxv4+uZNLvBqR?=
 =?us-ascii?Q?xruoz9HgnExstBdFvcdu5pmD9/Hlx6Zrh/TaEHtJQrwaFG5iFFn4/IXNXWqM?=
 =?us-ascii?Q?ejpFBUqn6Y5bbY8ilbAgl/F6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb8eeb6-d94d-4403-304e-08d941357c2a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:53:42.3056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIrAzBpMLTZcQmB7uZH+njDmmgSLduzfdPlKL/6FWLr9wYA7v8DWCiCcRWCVzmlV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2238
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

we stop short of renaming the actual qom object though,
so type remains TYPE_QEMU_S390_TOD, ie "s390-tod-qemu".

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/meson.build               | 2 +-
 hw/s390x/{tod-qemu.c =3D> tod-tcg.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename hw/s390x/{tod-qemu.c =3D> tod-tcg.c} (97%)

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 327e9c93af..02e81a9467 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -16,7 +16,7 @@ s390x_ss.add(files(
   'sclp.c',
   'sclpcpu.c',
   'sclpquiesce.c',
-  'tod-qemu.c',
+  'tod-tcg.c',
   'tod.c',
 ))
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
diff --git a/hw/s390x/tod-qemu.c b/hw/s390x/tod-tcg.c
similarity index 97%
rename from hw/s390x/tod-qemu.c
rename to hw/s390x/tod-tcg.c
index e91b9590f5..aa44deb809 100644
--- a/hw/s390x/tod-qemu.c
+++ b/hw/s390x/tod-tcg.c
@@ -1,5 +1,5 @@
 /*
- * TOD (Time Of Day) clock - QEMU implementation
+ * TOD (Time Of Day) clock - TCG implementation
  *
  * Copyright 2018 Red Hat, Inc.
  * Author(s): David Hildenbrand <david@redhat.com>
--=20
2.32.0


