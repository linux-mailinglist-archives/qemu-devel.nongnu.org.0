Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70CA3B7444
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:26:17 +0200 (CEST)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEgl-0001Cf-2z
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEao-0008Vx-SL
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:02 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:57014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEam-0003e8-P8
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624976399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSBbX1WXaZu+QwP+EK4Jb0gewy9eheCKRm2hVCQfCLs=;
 b=h0B4EYnH345vdGQSlnDxby6zwd1cH1t+VeeyBtd4oFE3tJ4g9WIuagc3OWbHH+4HUlJXZX
 /IIHUcQAYvp4+uaD7GSfN3HNd+6wv1aCO5qyIXR5mWCeYimqCip0Ro7ZVXGqnAVGaytwSx
 xdGj3pL5wn59fznthQ+AZFWI64IBPcY=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-DEduSXoOO7O9XSntx2H3Vg-1; Tue, 29 Jun 2021 16:19:58 +0200
X-MC-Unique: DEduSXoOO7O9XSntx2H3Vg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXa4jXlaUUS/TQ38+jKRDIn1EeUD+0I5aBJPON9uuGAY5LwxyCSnNT1f2twDTrPpbJWQOb/LRRiWEWU+UuM1PEd5p/fyIve4O7Eb3ACEjwbXIvaXJTuYPXu/xOuKGpNNWe5tZNgS7d/w9l5E42iaPH29Xp/uHHZ4+bRCuB/1ojP6wctnTF30QpxQWEkKldCUDnrUFsVCaJ7q7n5LQdKcK71L4PWbmmhRywEfa7jbyvtu7qqsRMk9aVl1tSNxMz5Bd5Cv8ueHwpgwfREEynO7eUDjS3D4NpVx7eE2VC/iUHvrSXGk2sfQwyCKffa/LJsHykbA03HhFuejJ97OF3JG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsJ4x9wsHMPluQQrp0HAkUlVSXc/ogjdBWddnj//TUk=;
 b=Z1QkJ8IMhPLk5owaZLr374iP/DK9h/Er187+hUWN9ByOFQ+XYn1Nsah85N/yfeTdvKcQDIYu/xeGFq+kqSiFNHQh+8Pej54b0iuLPoKSgdodBuznyRnr1vGlQ9KC4OWMEW5xsZdbl2f0Yzj4SG3LZP138HR7Tqd7R7HvY9DEYKICavW+P3gLD5VzDSq76ZvBV9HRhlfbpKvk9AdUO5UQu6hdubAWcF8D+ZQPRmvMowQA/Q+rW0OwYGPXC5hKnnNz+7KyHlVondTIJHo0aGEVFCTXnR/Jy9so/Ti2jKHC1+xiMa1qnURSimdjuH+It8Nfs6yYv/FUYCdfLElNhkyf2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VE1PR04MB6445.eurprd04.prod.outlook.com
 (2603:10a6:803:11c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 14:19:55 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:19:55 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v6 03/13] hw/s390x: only build tod-tcg from the CONFIG_TCG build
Date: Tue, 29 Jun 2021 22:19:21 +0800
Message-ID: <20210629141931.4489-4-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629141931.4489-1-acho@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.28.175]
X-ClientProxiedBy: HKAPR03CA0033.apcprd03.prod.outlook.com
 (2603:1096:203:c9::20) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.28.175) by
 HKAPR03CA0033.apcprd03.prod.outlook.com (2603:1096:203:c9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Tue, 29 Jun 2021 14:19:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 067ed03f-5716-4aa2-2d53-08d93b08f80a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6445:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB64456F0D10CD142AC007BED2A0029@VE1PR04MB6445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82KFtMul7vC1017vS0u5ZEiC3VU4YKb9UHVvwz51ro4H80dmI1njQEhfnlIue5RNSzMitOZHuCTbPTbluBmjUuJ7zckKkWg9Ktg0DgzkViASyUOZr91Q/khwoFtBSyh/BWQuqy8a2aEbi3jGhGEsM9rsiuK6XVElBxTAKvEIsYwYMcq2X/nTnLCich3YwshL9hwlPzhjKt8fwaaEojWJ3CHN6k57W7ApjY0J+ewhBsfoIe4foNPDdFi6eKyNQ8m7uQvMAHXJgyUpruJJUEGBncOMA0VfVcD/M424UzyL3oVcl5SZ2vjZMH4ez8UVc50p6tAT+3QVk4X1p3bvtvbOAGpA2cbXShz8HnvXs3WyW2s4+xL8N0NpsyDz2lC18kCUqq44uKd5HppXbTnhUI685m+5doHZdqte36ihYMUykt9VpWG0j1V2RkfVUHVwxEKxG2IxlAheQ+M0+SnXgKP7XFEPvaesHLTRPh0fOT+CwXNPV5c0IwGJ1MQgWVZp0rcJ3AmkIyCk1dZDOKZBByAW0DP4E8rL2I9tZnQ8Qw/5dPES1/vgQdwKPrDNPeafiLBqO2Y2Zg49/VJVzUUZEZ5jUYohGfkK4H4r/iDe9YUtV/JKDaX+gSvSevsKRM0IvJGGkIun9Aic0eOBdPIzOUyWkwZcdlCTvwRFO47hKDsywRrIfWwQkFB8N+3MY8dO5qxH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(136003)(396003)(376002)(39850400004)(38100700002)(6496006)(86362001)(186003)(4326008)(2616005)(6666004)(956004)(16526019)(8936002)(54906003)(8676002)(66946007)(26005)(36756003)(6486002)(1076003)(66556008)(66476007)(5660300002)(83380400001)(2906002)(316002)(478600001)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?20UUSsUIX2244CG60mvHv5lBpBOPcY1KKay3U7jQth+/YhrAnbGN50lrlww7?=
 =?us-ascii?Q?kwwhxJPRjVXUOs8JXiRL5Fe7iGpL9mYDjbCYxMUBY2Gy1nprFUsO7+8BT2Tb?=
 =?us-ascii?Q?PZhwAvSKuBtTGKPyWt1wyBdBUw20O9aso44lL9DXEKvd5wj6uRLxcwZ+hG+E?=
 =?us-ascii?Q?+aFHzhWISJpA3Xzw46IEsl6cRFBRRvJONSfcXSJBi2zEkwUnjhSOxczHDdV6?=
 =?us-ascii?Q?XORlC0cg+McsTWGPFXBYA8yOZRvGzysqDZaj9+0T4OLSld4fC+qO3ggt/Rul?=
 =?us-ascii?Q?RWl/dTN0b4RK7uGRGz1o6wne2LdNg1SoRXfFHM0EL1J2bUTtC6DgD6iVBGyh?=
 =?us-ascii?Q?k0YXHZYdm9aZ9u1PCV2o+A3duYOK+mziABGOO3LtRluz9m4OA3c1jZ9inkGc?=
 =?us-ascii?Q?R3dCaSUBtnlETOroCWSxrjLXuL/Gz8Dd4tdwrk5iS8F7dqT80HKaIsowF7QH?=
 =?us-ascii?Q?DfZUP/zUeNwtRrKk1As9fIcRUBtjDgIxlvTGpotG1todYqP6GoSMvvrAYSGu?=
 =?us-ascii?Q?qX4qDQzy/rrOWpy1nEwzv1IuMB770YfMz6zw472mLWHbKO9jKjgB44foNTwh?=
 =?us-ascii?Q?sKEEU7N/CPvUPKIpfXAysqeSjeOYcj/BV5FBwUSY/ExXEjQeuQ41MYlsf6qI?=
 =?us-ascii?Q?gP6qRoXt6YCDdS2S1CqlxObWebL7gket28bNKp+bxa8jMU6dg7zmznVwpvx6?=
 =?us-ascii?Q?2ZFpp6d8AioXQQWPNV6etPge7pA6NUCtz14GIT5fmQGWexHkncHZA31TMhGj?=
 =?us-ascii?Q?1bH9mB8kW8rN0RSF5SY7+bdwksqQLKZ62GfP1TNRNLOIVFirVjohPap4peYk?=
 =?us-ascii?Q?fZwYthnD6lAvlCgNEoJ1uaXgdbnS1FntpskwTmNljHbElwOmVfdyfm8k3Ljj?=
 =?us-ascii?Q?Qb09uYtieuEL/8ml5HMosVP1nUPhMo9tVecSuybLhNO5LW04RJ8TqQRF2Mnq?=
 =?us-ascii?Q?fMv5/g8/Vlpk+dCToELzyA6GwIzuKxzZGFkPtywZ4HX6kz7b+PKLv3C5yLvb?=
 =?us-ascii?Q?lOfH8ewNFTOsivXEAPw/6g36u/1Ncw+SS6b7iTke/E3jxDjaNIiMtmEPOIjD?=
 =?us-ascii?Q?hXyMwJwdXOY994YYZ66mFp5OKcDqeMeSR2TVni6o+GFd/WGI2iUrjXh4WBY2?=
 =?us-ascii?Q?l9zsy1mevN2Ne6c2hInjjPwVPCoi+a325sOeQv0pLUMzvq2mGQmdRG9aCxOk?=
 =?us-ascii?Q?VrLc+2+vAko+pqiPBGoPdBnUzXo8pskOGbrYmcV424rqQ8VkB9xnCck146ua?=
 =?us-ascii?Q?7cA9X+2rvH7gJErOizcDYS5ptFP3885aTrSU282+Gs7PyWYmV9XDxiusJYiQ?=
 =?us-ascii?Q?FizMR6x2cPsJdywAaZB7b2jr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067ed03f-5716-4aa2-2d53-08d93b08f80a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:19:55.7928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRF41w8XzXM3Z9uhOFq9Y0LTzEDqFnGoHhep4RsliUBPIpOEksiouQ3S3fGvlyuW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6445
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

this will allow in later patches to remove unneeded stubs
in target/s390x.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 hw/s390x/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 02e81a9467..28484256ec 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -16,7 +16,6 @@ s390x_ss.add(files(
   'sclp.c',
   'sclpcpu.c',
   'sclpquiesce.c',
-  'tod-tcg.c',
   'tod.c',
 ))
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
@@ -25,6 +24,9 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
   's390-stattrib-kvm.c',
   'pv.c',
 ))
+s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'tod-tcg.c',
+))
 s390x_ss.add(when: 'CONFIG_S390_CCW_VIRTIO', if_true: files('s390-virtio-c=
cw.c'))
 s390x_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('3270-ccw.c'))
 s390x_ss.add(when: 'CONFIG_VFIO', if_true: files('s390-pci-vfio.c'))
--=20
2.32.0


