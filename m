Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35F73DFE5B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:48:09 +0200 (CEST)
Received: from localhost ([::1]:35626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDVQ-00077o-TS
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMb-0004lq-AK; Wed, 04 Aug 2021 05:39:02 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:35908 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMZ-00062H-D3; Wed, 04 Aug 2021 05:39:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZ+eI3QluE5mJJt3I2QhEn8kfVi/l9EL4CyRO0mr087gvVmgmFvzEJpBDMJUWXbXgZ0X7N7Xu+eJx1XtJzPtJaQ/sk0nnFTpYKq0009Ohur5xSGq43JG625Es0iYM++1RLsSkvHLGwPzrNKcskadLBVyK/WPHWZRNhomJrkQhLobSO2FLVHSjvjJh+8xPEZ3c9Sfz9fbfrwEVB4hwb12aiG0dnAuLrRYQ82FFz3dktZEV4qNcqC7lfpzr9bHiTGXzknd5QK60hrOlWxR5fDvM0oYNUo+kJz/cA6ixfzxdkM7HX2e+hzmVI4yfgsmAbyPoYyS8U1C20GWmsHMgTtBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N2uiVLFU5ZMtznDXUsWnweG+NBu3A9QkTphI8xiDcg=;
 b=YN1XalhWTsZoHGrsJbC8QrrPP5UZ7KivvPD/gto6l9qSS3encH3aXe5WuvYgYUHCUzjCdRV+10PYRp02M+T0MNUju1TdBXAJOwUkxkSa6tqLo+DWi3R6+Jo5I8FK9+WntqHdkSTV5C5kh4MxOyubkCsIemcLfNE+hBq/7A0UaGjmAFX0vmFs8lBs9bYdxftBrSNljDYh/b5DuIGpL2Auo0h5VnWRWpab8FlqMVu74S6iUX45egVmTshb5+i7ROUBTpVoIIfc+ZhJwv83Dt0remiS+M7zF/RZ+zBGo9JRpkwFGLUr76YkF0l1xut6LCUJwBwRQ48LJFUL0FfCTl9Klg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N2uiVLFU5ZMtznDXUsWnweG+NBu3A9QkTphI8xiDcg=;
 b=S2hOgfSoFK4uLLNrggPCAk21TDl93Raiyd8eQP5DDgo1iO5qAzGYevhULp+e5yTZRw6bFLeA9Ap5enYAHiImp9nVsUetinTh8Xf2he0405gwvzliQ5BHOn4vQjnYYTT0sA2TGgq6e2nZW+J+GcotD1qVq5oLjER8nHyGP5geeAM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:38:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 11/33] block/copy-before-write: drop extra bdrv_unref on
 failure path
Date: Wed,  4 Aug 2021 12:37:51 +0300
Message-Id: <20210804093813.20688-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2717cf2-5220-43ba-557c-08d9572baafd
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5032F1C3429A65E28BA32F3FC1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6z32N29nWUBTe/FcCDyeEgyKRkoosz8cx8jXNU3K5Ug+kDx5ixWfVF2xxG3nV702/O5BozxDIWq/t1cuYMmVNjBVh4/Kc/duY9BribrW5sFSTJQe/udMRWfVi2Ns0umlDKapqtDttaABURwRC2IclvnJ2rsvR+urPEWI3TmPsqbwSdwNTYYAwygIzbVGIUtO1Vaaq8AD5TIbAxuTVDuUQx4y5s4F0iikIBfntf3sycLtgSjXLuFjPf7aYL2/G9j2/4hWaWSxyTjq8rJgt+hFbYPd1Y3VXuvCY+yMB0ULdECDHO+5Ehrczf3BpbEfBr6qZGwRGQZ5bfj+SgDo5E8r3ZbhZLCrmoukiJsYT3MK9glzxKtBS41YgMGK+XmO26i6P3o7mbSQK+SGZfZWD3OifWfwyBvLzuRQzX7dH13UueT0wMcGWGsgDcs4chdO05v71lRUDaEvooQrgbCA2vHhm6hKbb5GuHjsFvWrVYSUTPknoZGF0O5DNvoM5bX3RtRzGItGEnaAoloxh2jz6w19GQuAhmOn7hwYusnj+fJ4QrRPIrDzWglUfIrEWi7DUxgx3AgRCe1R6IMe8oXbVn/6/Ev0cPwFAcNQkgaUHh7Ei+9il2l3+BxrrP/wF0ZwG8sFIKT1iyP3UNA/8rlnx4casLS/cqV8OJwv6R/wwlgSzVVXJlu0zIamS4z5dMvB5oRsIZCvHdv6LGn7Nwd7/Fwemg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(4744005)(26005)(7416002)(2906002)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P/FwBe/22WQ//7g0Up636ltTD1ow7ccIImLN5YcThM3mYoDhZ/IFLY4kANU8?=
 =?us-ascii?Q?RR1CXmQxCHeVva+EjY1quAlbBtNR3WSpqjQpR2UQ+2Nk+Z86QB62MZ11ZezN?=
 =?us-ascii?Q?XDmUUTLEvu34brhLX1aBA/5nUUY3Xry0HzYwNXkO+gY/Dt8C8KCYvR31MjLM?=
 =?us-ascii?Q?8gKF9OFSvY/hBLfN1RHI7t/If26wevEkK9fpPTnpIyi0B6D92k69ukWIns5G?=
 =?us-ascii?Q?Q24IVi1r2aRtx3RLKdqQUUr2r9KZ9lfGFsnpuImPng2Vsg0almKPWa6jCe/G?=
 =?us-ascii?Q?908jEpoPcpoOQF5TUaPjmvOSb9cW/ch6tXulN39kQL2TelzEq6cQGHQqMuYo?=
 =?us-ascii?Q?uH9SU0dnENJchkcMXcEyOkUdeGsDcLnkVU/yLfv+ibobfBtORrSwQS7EtjjL?=
 =?us-ascii?Q?ejL9XFVN5l4zEchyd7OcvnadcqUCvrJai1bNiopNPmryxfKvzmx6eWirtpSY?=
 =?us-ascii?Q?7mUvLeIsUgHjQvyjURLLn2thNGkL8lxBBXkj+Vxqvot0UWXfpDdwb6Q5/+PG?=
 =?us-ascii?Q?Ti/xaBVYuj+VAZuPnOthuTeMj7xmUaDLiyYsy0tLcwnZ5gpbwvgpwnW0x6ug?=
 =?us-ascii?Q?lMczSdMr+8hYCKiDeiV1PN0Tah3K2oudvcomxxkBat8iBrIUnB5RAEvU0eVl?=
 =?us-ascii?Q?Q2wnrTkqUh77Hd11B+m1cNPrVcN5P7BdXeCzWUYnaZ5frIhC8UkG5xy0sHAB?=
 =?us-ascii?Q?1hj57JSHB0tYfxQQ3XP5t4rMREvIPgUce9mPGVOUX385rsfTu2hU7isRr0o1?=
 =?us-ascii?Q?HE5z/DReRVYDVeHqVFsF/LHAZc3CtYL6AJXHvPGXfkIFgDJB84vltWSQB7Dm?=
 =?us-ascii?Q?nyeY06lGWHbVoCPYwX1Gonz4XeSDhlP8fmkTxrIRakc1f2iJ1T6rFKGdb/ft?=
 =?us-ascii?Q?gJ7UMH+BqARrFNeqrOUT+ZsFxG7IUEqWIyIt7rSrLjjIeA6PstRsp0y+VCwV?=
 =?us-ascii?Q?QhG1mIFdjJlR99Y70w/vaTtbVXW7nBVncftVhX60ULGjvAoSSOEBQVU1cCaC?=
 =?us-ascii?Q?Qr7tvcyBEFxHzv3znaaR0fyLtpS1V14C4Dmbw1Q5HlkDzCXUO5ndQLXQwJrc?=
 =?us-ascii?Q?YKRq003coBVHBJTiK/MccOLjdwFXg5yb1FdDgRq/b7pFcR2Q1FW1Un88Tcpe?=
 =?us-ascii?Q?AHSsWTfyqNKjvugG7oSLmfKzEiVBHhuSK3AOox9kOME0ManQRg7nLjsABeZE?=
 =?us-ascii?Q?hmXxILv1fXxIQi666Ct+xiKt4Q/0AaDYzFuiVVIG1jvAIDpa61uCSVKiMcEh?=
 =?us-ascii?Q?Dp8E7AdlvYUgwS8kLF5MWp132CglGnwLXhAFoKHtDP81PjKA4tJEzl635G2A?=
 =?us-ascii?Q?7ck0VXRt+HBORPKq8yQUWLw1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2717cf2-5220-43ba-557c-08d9572baafd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:51.5506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NpiWz9cfZDrccPXGW8FTj4BxOMxHR2+pDVX2ygy5c4RpG93d9bx1/gC6VE4SIVyjKf+aIM0+WILkG3YBHPiiF1GoLb2eofQ3RJDkfD6tXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

bdrv_attach_child() do bdrv_unref() on failure, so we shouldn't do it
by hand here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2a51cc64e4..945d9340f4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -201,7 +201,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
-        bdrv_unref(target);
         bdrv_unref(top);
         return NULL;
     }
-- 
2.29.2


