Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94C3CF93F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:57:13 +0200 (CEST)
Received: from localhost ([::1]:33690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oN6-0003UC-Gl
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o65-0003aZ-Jl; Tue, 20 Jul 2021 07:39:37 -0400
Received: from mail-db8eur05on2136.outbound.protection.outlook.com
 ([40.107.20.136]:65205 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o63-00077C-ON; Tue, 20 Jul 2021 07:39:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOW2B3q2sc9ud6Jo1z6pyT4sxTIefbBuVJLRc7E3W92aJUfGtBc1ZhawOES77dSPPJEeIgcquwd9y0bVHpW0wAKLNrt1bIZEFe66tsTIbZ/qD8qRgxlUOUBd181q90RruqHAfxpEnBNKagHLqWuJOW83ZD06PmJ8nmwI9LTaAZAz16D1vfLaT8kQOEEzPbkxOQn2IrLps8SBi8mc2lb5bZYaBfczaZelKRvdEVFqpn/ZMloa+vLZJvmTu113gC3MNRhDfRB70qKeg0cxEj3MC8frHhX2/vnUEObfMNrdA5jIjTKMvGgVmC4v3wGfB3Q8zhojrDn/WeE93pfij5zzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6J+dwDpCysg/7qyJjv5QTvew3DzMfuZNessktrypt4w=;
 b=FRvLPgg/JR7k9klfeKHuZDSMr0B+MJ6LxrFdmT1pu3+Lw5iqUtdWeZ65ujZTohUbsbGkQvXiWq3yGg71G1J/srnAL4lg0F/Ww3Wf0mqYs5VZVWFWEog3NVTBgiq6FIWgtT4avx2Z1MHcLR2TDnYjW9M36bhS6lfQyU9UbskwobtRwtnAKBY5P2FYWOPnyKYUDEVen4Nx5eVnJYn5o+uv2qLbwJijZ8LQb/ETQVOJc0StoIKSUU2aH/79tvSxilgRk/hMsVGDmrPgHwOE5MctiiOcf5zYIAxzSTbltR05cuUq4tWRX4o19WhEW8FNEwcLns9odaI51X6kzQ8ylPeWHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6J+dwDpCysg/7qyJjv5QTvew3DzMfuZNessktrypt4w=;
 b=qRj2Ei/LHnM7Li9YpCsYtv7MKDZBrbDker/JO6pfhLBuIXg3tdkLN4iw3JGKSBdbMesnmP4pHUC9KT1wL4ivSSXq8EPEzVt58fPDNpDQOtat5giPBesJHYAPZSnzVqdi0mlThvUnR2Gh8+cjqMkap8TECa0F0FGi2xi46OaoMk8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:39:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:39:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 13/17] iotest 39: use _qcow2_dump_header
Date: Tue, 20 Jul 2021 14:38:28 +0300
Message-Id: <20210720113832.586428-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720113832.586428-1-vsementsov@virtuozzo.com>
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (31.173.85.199) by
 HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:39:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82ef6d5c-1f0b-40dc-d86b-08d94b72fcff
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61192C0EA4C281F4EA3BC70CC1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5mHvpz7iMRzNRasqCpOTG7rTOoHk76qxyn3TMyl6f5lGD22244C+HFFraYBjUauWeaOcZQjqMAeGU5e+pbFigBVpbeRiClRazcZzZiEc+dzY3/HrUfc6dX7SlKzHXyrc7x5sY/JyYja8Eb+qf3B3tH7Xmlo3GA+EnX64+7Bmy/EGddYq7guQOuDgCKgH3+JpiOe98V2LdSOLuTL168jNBm7EZy0qmbSG99N7bfSMcMbkpGESyLFS5bPxzivevJkceNaU6n9kCdGN4dbXom1cQezpzQwAlKTL3B3rzZ1VH+WigBksv1Rd9O+qBYuwVM/R2RVgsvGIsqLtqFr59721AIRR9FZKWP7X3SRv3W/AXTZhhoRqfOMBl+UXcGlJCsB5KAHjCHOjQaE++TJXLPHCWaETdAw0YYbl+XzNSmXADRvYknA5DtAIxpidRRG8lMoKEuYOg5uvnCEkZDImkDqmfcNuIKo5n4+nhBzW8vjdUjVmTREeWxO3VYJK0nsIXvuAEvPsrIGBNCIXCpKpw5E83L7cd144KIjUXB/YNyWCeklWPLXb3RlT6qm1P4ooZ3qv9nRVGw19q5SqVk243TU7k+0eVhQgz1Czz2k+XzuedMSzqJ3lO+cU7fsNxF5ePP9EelLS1Be3Ojk4yw8l1fvqUGoZiyIz/vj9xwawAnxg6jK8ike6704hHZacz8BhUacZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(4744005)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h/WgqnGV7i6jpSoBeXkIP/lKE6WHyJ8MA2tElpVElnDASpyHcKzK7pnlSaAA?=
 =?us-ascii?Q?i+tNJWYA7zTgLpQ+l4K4QnmtH695I+qjDA3+vcJYtGER6p3d8cUygLTE3MvH?=
 =?us-ascii?Q?2W/+wS154IffdoNrg6CDB044Q+hVvF41qScPSiD7BrI/Z9fH03UC6lwX9Lqa?=
 =?us-ascii?Q?eKjALZfpvfAWEoTp+qw2L0qKK3uC2XEVL0BnLNBe4jvFpFb2sF690n8Fh/2F?=
 =?us-ascii?Q?jciEdLJ/ZYBVYO+Mxb72aDq5uoZTtM2gn5Wwvm+Q6LhRLWiDnZYYmuQtUSId?=
 =?us-ascii?Q?epThfqT2gboQLNl2HcQlnRYhCrvJVFyTLurllpXjTL6iAtYGEmGoZxD3L+9d?=
 =?us-ascii?Q?iOPwa/SJSNOLrSEGPvyu03Qoh/tazxHdYwf82nfvAm96habNl52F7JFTcIql?=
 =?us-ascii?Q?RCGeZpUTHbLyPX25QxTTHj6mZBShjoOB5hbR4ZSs4L8CgTdiDO2H0v9VbRsB?=
 =?us-ascii?Q?85xDC01dlRsOcjyPpguC9W/IJ26JF1eH/dTiEjP0AcocGlp+tuETqOGi3YqR?=
 =?us-ascii?Q?7SavDMoN6g8E9kXYbluvRm0v7gNZxrxidf8+TERV3sccWYRvweJ478d7129Q?=
 =?us-ascii?Q?Y31UZftcXLHxcbtPSp+56d35JMI+Fn83kvkFarSsFy7PQD5w/5Vpa/4AQPeF?=
 =?us-ascii?Q?4iWu/5X4Pzy8HSS1eTj73ou+bMErWbi7RS9PeCFhlSGuXniC5Ly1Rjt37zDS?=
 =?us-ascii?Q?3A1z926RlMd2qH1KouF7WebCUD880fHkN6lgZsDjHF9PhK2rS/0k/VUa4for?=
 =?us-ascii?Q?d/zVINYU9E1sjWkX8evPGYDPs27jPeZYqTPJye9pHiqYBzFoIKrz1Wmk/L2g?=
 =?us-ascii?Q?5jZjftZruHfu2apwb93pB2p7Mp6B3WY0BeNRUtPpmwAdmckcOJuTX/0zPoq1?=
 =?us-ascii?Q?0ZAOj93MK5gWc/plmcdGMgcoCdSEINliOfXbKjV4fGJ7FbPx0Gg1DjCzmwJN?=
 =?us-ascii?Q?FjVjtw1+b+WrBs2ISXQpk+hrM6o/YYbRANSI1tqgMDF3v9bW1BKBjrAElP6Q?=
 =?us-ascii?Q?+PToBInk/WivHB6nhLmisOwFe0XVm6dmU8Bzv5Ft8TviqnEcbGeYy35/ioSy?=
 =?us-ascii?Q?R3b7NFMgoAnTgLYeddqrO+f3iw05zrhQ14yNgPRf1kqdv+1PDCIJyEXm921J?=
 =?us-ascii?Q?d4F+SuycYSNADGCOcI/pu3cFqEiE6T7CDk+V/b1WIlvlEDJ6yA3epD7xnZPl?=
 =?us-ascii?Q?w31rIIE5i6M1kVhGZOMidaYrQTnqd7XeE9ds12RmPLk1Q40TEWR0ns6iCLct?=
 =?us-ascii?Q?GQlAvFDRIa9485ejAOTzOo3oOIpGHeQHt5TUmGLYCfPQ/Qp8LQTmAByMfFq/?=
 =?us-ascii?Q?nbeD6Wv84un+5MsEWi4XzHHu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ef6d5c-1f0b-40dc-d86b-08d94b72fcff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:39:09.4229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TViTCxtqiJhqd6WZRQIG0kjAFk4FaMA7CH55n/7i1+ywV+pI+jm5As1BKOFF+1aDeSu6paTUM1KyJYbrucdVBazii9TBFgShoXB5sLSJ9lA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

_qcow2_dump_header has filter for compression type, so this change
makes test pass with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/039 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index 8e783a8380..00d379cde2 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -142,7 +142,7 @@ $QEMU_IMG commit "$TEST_IMG"
 
 # The dirty bit must not be set
 _qcow2_dump_header | grep incompatible_features
-$PYTHON qcow2.py "$TEST_IMG".base dump-header | grep incompatible_features
+_qcow2_dump_header "$TEST_IMG".base | grep incompatible_features
 
 _check_test_img
 TEST_IMG="$TEST_IMG".base _check_test_img
-- 
2.29.2


