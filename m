Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC366C4CB5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:01:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pez0k-0003kS-1U; Wed, 22 Mar 2023 10:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0f-0003jZ-VI
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:13 -0400
Received: from mail-db8eur05on20704.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::704]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0e-0002Do-C9
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKJNLlEPUK+oIF+ZcAQcEr0uruNIcXuuYE1h06W3eJK9tDHGGIax8n4XqxSrMQcU8+cQQLR4JjLpINvJE9OI+rrK3Whtt3Ujv40rTvFqUY7Ptnziy7FCut44z9S25VOdflJWo68cTlsZIAzEpebGSAOz2qQa5iYv0Emp89iUD4EqyjIheIYUZeAwxIF+vk+lzU69pI0oTh4N0vFGlmzbVMi1gpk0RUmVSzLwmmkiplnbtqQUQLKdSBuJS0PwyOfd2KltFpvtXU9ZvtmwgT255LkLMwpvD3/O/6Bki2YgbIyrA5KIi9pBIHgyaxxHtgrcX+N4TvYMWvsvreAegEr1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7rXmYXABBswyd27QivX/Mb+ZbjzqGDygjR+CkDuce8=;
 b=E6ZY6yD7ewaltffzZ5GL0pN4bx3rskb4mrAbakAwP2+j5mYZAaGDNd5qc6LdbgRF6ITDnh/Xn3yt1XjnkjH4lxThVfD7r9zgpwVUJIBDQkpRr8DpyUeYNpSX1JcmDR7ifu359gYr7gJVo2Tp70SQ6a89TpbubqvZKHMds8+jaT1245lFm21UiMlKE4CLk3YNviEqb3werPqnd8jxuLQOR4rGYA7yRZxJnVRsBIhfTwW4VIy0jhxD/b4qfwg1waB2Pz63CmT2nCfytr8b3cSrcunbQCLqOZryBZve1FuILtiuSgia4GKyH1h7Y49SHi8hIVCa2pjhVcBKQT/g+bjJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7rXmYXABBswyd27QivX/Mb+ZbjzqGDygjR+CkDuce8=;
 b=AQWep78WI2aEhrc9RhfrGuYTv+Ur8OiNlvYguAsLFBJmaN34kWLpbum+TrU+jPC5DIADdyHGofdHBG7jtzjSDOU9jQ/0rlIaSq5jwPxb7hn35/XKZ1mAHMvmLhpN6ogf/667isvdWI0Ad33tXDsDdmjec15Sf6eJcz9nsozcx94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PRAP189MB1850.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:27b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:00:04 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:00:04 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v9 0/8] igb: merge changes from
 <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Date: Wed, 22 Mar 2023 14:04:32 +0100
Message-Id: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0108.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::19) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PRAP189MB1850:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e146b13-def1-4f5a-2913-08db2addbb7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zcrpn4enjbpFwYz+HtRTLlA0dCzyflYyG2ZIHKMv/CQlPHrq69Hfd2QMyU0CUrEMcRV5rLcDRdHXmbRPw19KFkAEjB7r8nKVDdC9ZyhA/65OMNay2jE7/F/7bCoiQeXS21Qf3VwSAgohG3tYkAC2yeUx8nLNKT8FUdfoyBF/zmRMMN8w01qMt67bMYCFvsCTwm8FqtcXio3Vq/4AKI+ozbFXl0ujW9XDT5atn7YP9mQtiunTykqtBgVH3QEjLTjwgWJzdHvlP5JbDtfXjB2u9cJldcF+QvvGha9aHa8T1KCgwkMsKULWOXSxzbEGNmD8/Qq9M64f3v3EwV9dR2y2Yw0TZ8wrDhCJKPxu7ztHJ0rOxhccggIuD7RLzGT1Z5tlPlBljILg0063FCgTT2kx1Se/dmB85mhFixJz1NSrT6XfojZXrgBD6SJqShX/iiUULCpi5ps9IT/Lq7Vd8iMm7ltxIjz6ICwGLa4q9ssxujPyqMqJWMVPCUx8MsFuecJEv+5YwzKk+MkxRcwoeHkHkBF9DBiijXVOc9ohFZIYgveLIuCVOCzRNA+XOveIRNNcS4stzT1zIxa/fcUFoOOAf/dcsZWQl+Ktcqq+Nef1I3b0Xgit7zPGrFIk+nI5Rh4Ad255UO7Rwi6EF1o2o2U6OICAxCb80u0tyv62QpB0XpXaJvoDHvHu53WKuOE8pUkdfl5NFOi2zEfiZEyKpxmffntmzShEa00t1bSmBt8LGks=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39840400004)(376002)(346002)(109986016)(451199018)(86362001)(36756003)(83380400001)(186003)(66476007)(8676002)(316002)(4326008)(66946007)(70586007)(478600001)(2616005)(54906003)(1076003)(6506007)(26005)(6512007)(6486002)(6666004)(66556008)(38100700002)(5660300002)(44832011)(41300700001)(8936002)(2906002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1RAkZX55YnJVNkjYIQvnUzibGlatkQ1WDWpXANJEeC/0JWMyhijRaI7IQgin?=
 =?us-ascii?Q?6zyTBDDHdlAo9mG+hHXY6216u68W/MBXZR6UsJt59ZZy0sXYLpowncu0VvL7?=
 =?us-ascii?Q?+Ik56tusKLDRZ4PO8fp/VYqk4t4fdwJPB/L3V2D+5TltIvcywHqCgmPxTgkH?=
 =?us-ascii?Q?QFS9FxSQ3M1C5XV02VjvErcAQy9GqTO7zQ/53XtmJZhYNoBf6WzfbBcijwy5?=
 =?us-ascii?Q?EILX7g+WpEyFtjgENlPLLvU+DT1mJTVJSNuBLkWwGrBi30q8xrmzyQKGWKQo?=
 =?us-ascii?Q?o9D+Ld/Za7KUTvnMh1dMf+NQrxBqzq30YeKs3K6jC6IDjClFFe/5Rex7MicB?=
 =?us-ascii?Q?PLyCCccFx6nKn9opfS7iniQjKSmxgMGrvSuSt0VbV79Ap3XIQhMJLUqT/aYP?=
 =?us-ascii?Q?jK1S6uieizVUSZktEn/xVl3Llu0hh9l2qRXKvoCiksIyWYKZiEXXsHlLZnL8?=
 =?us-ascii?Q?Z9MGbplQ2q7Zuag6pEScsHjZsxIAIPITs9eaMVuO/kHCfAN9WlRC0eNEEq0f?=
 =?us-ascii?Q?xRCD+RQDxMlELqfTntg0H4RXQGdf2Dfm0xlQQCDzFFQ9naAbPohU01wQqYRD?=
 =?us-ascii?Q?6Hda8qfH5tBbKTE6EV+Y1C3SUlbtZRJaNBgN+PPoS/s+tgn9uUczupHHBypa?=
 =?us-ascii?Q?zNxHKXCzQ8yTb33uoDn5DjreNhOuRM9ZOwoO8+D+nTGTb1syHdO5IR3ibbxB?=
 =?us-ascii?Q?jsLYgYVEPw20WPuQt825u9NhWbxwO6tyyKPLy2sF1XoP3kxfq/dXhSZYTM5b?=
 =?us-ascii?Q?0tqlkWpdCQOe2M/TaE0PLIMFrEyFkVW/7COe1AUDsr7yR/Y8TBU99BIuwoph?=
 =?us-ascii?Q?Q4YZcePIw2Om5F4eVmicxNFiATLdsxwU4/epkwU8AEWk8cSAKNLtSCW8sULI?=
 =?us-ascii?Q?UxKN18OaFJBCNBt5bxRWl9cTX5XQR2FyI1DDfuxSeaodNjmQAsth+UGr31Od?=
 =?us-ascii?Q?xXj9C+a/OTS4kjlUJvJs0X4oKn3xBAOR/PjBWVsjPpkAtMbK3C/tyIyaLkxl?=
 =?us-ascii?Q?xGYc3nwZ5lCJbMThSoDf46pTXdSfq6TaZsdKdHp2sBNx+5+bTtDx8SdCVsCn?=
 =?us-ascii?Q?NRPADnjKGXqjGnn5Avs5ylrEAor3026c1VIvNiaczqJgjKdSCfIsQpt/lQwk?=
 =?us-ascii?Q?vM3m6Y6CYbctznbhofJCRUZGitnnsmzlhnFaNAVQZoThuL/ItLR8essJlq0P?=
 =?us-ascii?Q?TKLWhN6weTeZxdUzLFcBYwjK2cu8IEMy58riTPlncLXu94i3owE/JsmWWFk7?=
 =?us-ascii?Q?BMnPuhaP7caFcmCsAnZeBnoHa5oXZjqUhFa1CuB18t8DVas1vfA5LJVFQzKC?=
 =?us-ascii?Q?3kQvjVTPwGXR4KUDN5iL3o440tC9Z/8YGxLkO1UMQ20H4WmFgGE7E0fDilYe?=
 =?us-ascii?Q?+JybJyHvB7sshorprYnNMolF5wSkDoKluOdWxF8XItFcjw5ghFSWLOgfv167?=
 =?us-ascii?Q?oPr781P1IidyjH3BoTwh0MAcAY0h+AHreIMkIbfeEn8ZzpuWAugG0X38kJVP?=
 =?us-ascii?Q?XwzcDHcxsM1TT5JKj3We8e3P0cArJ4fvZnHrL8e9OIgi3ozf1IdJ76n0pZLM?=
 =?us-ascii?Q?Il+amUQvk8Rder2G0gSwP3OIH8LaXGmYd1+G3tgluf7rCBc6TgO+5aWySwq1?=
 =?us-ascii?Q?PQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e146b13-def1-4f5a-2913-08db2addbb7f
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:00:02.5806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DkiTiTKeHJWiqGPoFaor7zMUaeQ0dZ6nNvK5t5ScWr+7koFTVLElZrr7b+kQ8aC4rHqxuUs3O1kGxdgv36XFjVZgFTGE0Fu4OhlWDU8piE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1850
Received-SPF: pass client-ip=2a01:111:f400:7e1a::704;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Based-on: <20230322042044.25136-1-akihiko.odaki@daynix.com>
([PATCH for 8.0 v2] igb: Save more Tx states)

Now that Akhiko's patchset for introducing igb device is merged, I have
rebased my changes on master. The changes proposed here adds support
for 
 - Correct PF/VF reset handling
 - Introduce ICR_RXDW register definition
 - Impement support for VFTE/VFRE/VMOLR_RSSE/VMVIR/VMOLR registers
 - Check oversized packet for VMDq
 - VF statistics

Changes since v8:
- Set RSTI bit on PF reset

Changes since v7:
- Adapt to "igb: Save more Tx states" patch from Akhiko
- Fix bug in VMVIR patch for inserting vlan, do not overwrite context

Changes since v6:
- Rebased on latest, which includes igb device introduction.

Changes since v5:
- Added back an unecessarily removed empty line

Changes since v4:
- Removed the change implementing VTCTL.IGMAC, it needs more thought
  and implementation of DTXSWC.LLE and VLVF.LVLAN first

Changes since v3:
- Fix comments
- Rebased on latest patchset from Akihiko
- Remove Rx loop improvements that Akihiko has pulled into his patchset

Changes since v2:
- Fixed more comments from Akhiko
- Reordered the patches to make changes easier to understand

Changes since v1:
- Fix review comments from Akihiko


Sriram Yagnaraman (8):
  MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
  igb: handle PF/VF reset properly
  igb: add ICR_RXDW
  igb: implement VFRE and VFTE registers
  igb: check oversized packets for VMDq
  igb: respect E1000_VMOLR_RSSE
  igb: implement VF Tx and Rx stats
  igb: respect VMVIR and VMOLR for VLAN

 MAINTAINERS          |   1 +
 hw/net/e1000x_regs.h |   4 +
 hw/net/igb_core.c    | 212 ++++++++++++++++++++++++++++++++++---------
 hw/net/igb_core.h    |   1 +
 hw/net/igb_regs.h    |   6 ++
 hw/net/trace-events  |   2 +
 6 files changed, 185 insertions(+), 41 deletions(-)

-- 
2.34.1


