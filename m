Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F96B65E89F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 11:07:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDN86-000497-JU; Thu, 05 Jan 2023 05:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1pDN83-00048x-KW
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 05:05:43 -0500
Received: from mail-be0deu01on2062d.outbound.protection.outlook.com
 ([2a01:111:f400:7e23::62d]
 helo=DEU01-BE0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1pDN81-0004Jd-Fq
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 05:05:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ja8w+RV3SuxGW8ePh8in64dnSybkO852nuZqn9T55xYngnEWZ2TeSuB8ONMNZ9dY1gzQwYP0C5Zk06t9dt8TulXRx+mf8PXY1gYeSJnHk2JHzZdvYq5iiFnHLPJTUn6JLngDCH7nrwSs02GuoJEikBfWfImgygRkOujKRGaKK7BXhjpXMAuHDhwKnbSubytbz2PMArMvKPJLLSkjC2bt/Jz9vvpBwC8abMc2KFk9FyOoIWhA8nrcdKhosUWQB+3mYLTgxxpvwOMz9MFFI99Kz5D1KMv6fg6jUW8WnASUnIWXH8pc6vh3o2yyZ53mGN7SlC3s7FOsI5YY+N1uyRcOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jswzNhQ+BR0/j8b+7pvGA/Hc04QW9H+hz2cUPQpnirg=;
 b=ViMAnH/MplBkW4sR63DQx5/njs42jpjWgUKm3ZziUZA/Q0HCXeGDqM+ApCs6OwoIsHnWNUvdIIG3qdaYDC0v3D3+k4yhD3EY1yiILv2x4m60ldB6mzZ+igvbDFERH5YZLKxkz3GRLq948YVVvTWLVj5OSmV4gEJxdHahAYj+lCL2igrgg+lNRLXHIKk6sQ2+uc9iWPa/0EKm+JD9as9N7H6v37olmmjNTGYKmFTXJbZ1e4hrljBVGsYM0a5GAlTJD+yi/DaUMQit9xK1zeQnf3/Wxy0Vt3A34TxpKjsDR1BflLztKlNv4EIuxL6U4Ag1ul8E0S5XaV1+9tEwz695JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.62.97.192) smtp.rcpttodomain=nongnu.org smtp.mailfrom=kamp.de;
 dmarc=bestguesspass action=none header.from=kamp.de; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmdo.onmicrosoft.com; 
 s=selector2-bmdo-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jswzNhQ+BR0/j8b+7pvGA/Hc04QW9H+hz2cUPQpnirg=;
 b=o5XoRrhKTvHzxZ/PXV/dyuNlQIay0SlSagzOk8zC16GVWfcGe05fiLn3V+UMUC+MJycuOpGNb9WVdqgoeMAarZ+aB46QeRza+BUbUKlhLVa1p5b+lt/TB6kA8R5dCb3vJKUnmsfEAcnTNEFUd5LpLy67X1B0Ha5ON4ueY+An4/s=
Received: from DBBPR09CA0031.eurprd09.prod.outlook.com (2603:10a6:10:d4::19)
 by FR2P281MB2638.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:61::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 10:00:34 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::ce) by DBBPR09CA0031.outlook.office365.com
 (2603:10a6:10:d4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 10:00:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.62.97.192)
 smtp.mailfrom=kamp.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=kamp.de;
Received-SPF: Pass (protection.outlook.com: domain of kamp.de designates
 195.62.97.192 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.62.97.192; helo=kerio.kamp.de; pr=C
Received: from kerio.kamp.de (195.62.97.192) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 10:00:34 +0000
X-Footer: a2FtcC5kZQ==
Received: from lieven-pc ([172.21.12.60]) (authenticated user relay@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits));
 Thu, 5 Jan 2023 11:00:33 +0100
Received: by lieven-pc (Postfix, from userid 1060)
 id 7F9C513DB37; Thu,  5 Jan 2023 10:50:40 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>
Subject: [PATCH] MAINTAINERS: update email of Peter Lieven
Date: Thu,  5 Jan 2023 10:50:39 +0100
Message-Id: <20230105095039.182718-1-pl@kamp.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBAEUR03FT005:EE_|FR2P281MB2638:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6cd2e3f1-6819-4193-5e0a-08daef03affb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jsNXEQ9Yra2z/mvAzOo2hNu2FC7yokd516/Wjfh1wmkb+/PrVwYToKxwtK5DXpFNC7Zz5eCk9zind3DvarL785jEbEKtaK9gZisG88BK/kKrvRVdDsMb945TwmRBfzepA+YNAK/CHgdwlKJSJmWTKHQCHpViHNucZ/3hr2vZylmnDCcK169PmV1Fy/f7nPo7XQLZhtjil0RyEINtmYVPwUgUaZ6Jf6CJaUt9gf5PNbNKLewb0d+1rjbjxRiTtUvo85jBUwjizbbJJcTNYC7xHT6M95ucvE/kDwkyYoVRDJ57jVHXldL91lsyhvvLMINCJKNHnwlLeZMhWF1Qy+O7qOLz9ptyoCzlXP7r1FqyGsPv4Uc8zj8Nd6c77wxIJP3Lpjeu6exMMUYlCXFTxZ490P0jPY4jtQLDg25ZkMHjK6LBWfiM5fMFhA6OCbIaVBZSE/gV6bBh+1VlAEAYe5AI4GMSCMQpsdK8c7PFWtBwbT5YFKNHpYMfIiRcMhb43wnViFez6R2qpV5LMVlmB7796IbcbdlI/aqfUycw+NCuRNkQovAzRHu5czvE6Lv1JKaO+Jzzf+9T0P+wPi6gaptsJ4ShZADg5OmFu9AXc+zsGGhe2BO5C4dUWQjnq7MQm3KoSMUC+EKboUW3LdNBWsSFqK8/Jfuw2gmwBVeYZAZCJtwttWhSgTy40kt/0oDdSieqxKcaX2ofguYH34oaYvqV+hU2Gx8v7drS1+cQcwmve1PJNI/1A0gma3yiC1RIom8FX3B1y23DM6fJO8tvGXnUzg==
X-Forefront-Antispam-Report: CIP:195.62.97.192; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:kerio.kamp.de; PTR:kerio.kamp.de; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39850400004)(451199015)(36840700001)(46966006)(186003)(6266002)(26005)(7636003)(7596003)(478600001)(316002)(6916009)(42186006)(966005)(107886003)(4326008)(8676002)(1076003)(70206006)(336012)(2616005)(82740400003)(47076005)(8936002)(15650500001)(5660300002)(83380400001)(2906002)(426003)(41300700001)(36860700001)(36756003)(356005)(82310400005)(40480700001)(86362001)(2620500001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: kamp.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 10:00:34.1367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd2e3f1-6819-4193-5e0a-08daef03affb
X-MS-Exchange-CrossTenant-Id: b3201e87-5c43-439a-8fa3-eab13a770d4a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b3201e87-5c43-439a-8fa3-eab13a770d4a; Ip=[195.62.97.192];
 Helo=[kerio.kamp.de]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2638
Received-SPF: permerror client-ip=2a01:111:f400:7e23::62d;
 envelope-from=pl@kamp.de; helo=DEU01-BE0-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_SPF_HELO=1, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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

I will leave KAMP in the next days. Update email to stay reachable.

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b270eb8e5b..995f1156f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3428,7 +3428,7 @@ F: block/vmdk.c

 RBD
 M: Ilya Dryomov <idryomov@gmail.com>
-R: Peter Lieven <pl@kamp.de>
+R: Peter Lieven <pl@dlhnet.de>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/rbd.c
@@ -3454,7 +3454,7 @@ F: block/blkio.c
 iSCSI
 M: Ronnie Sahlberg <ronniesahlberg@gmail.com>
 M: Paolo Bonzini <pbonzini@redhat.com>
-M: Peter Lieven <pl@kamp.de>
+M: Peter Lieven <pl@dlhnet.de>
 L: qemu-block@nongnu.org
 S: Odd Fixes
 F: block/iscsi.c
@@ -3477,7 +3477,7 @@ T: git https://repo.or.cz/qemu/ericb.git nbd
 T: git https://gitlab.com/vsementsov/qemu.git block

 NFS
-M: Peter Lieven <pl@kamp.de>
+M: Peter Lieven <pl@dlhnet.de>
 L: qemu-block@nongnu.org
 S: Maintained
 F: block/nfs.c
--
2.34.1




________________________________
KAMP Netzwerkdienste GmbH
Vestische Stra=DFe 89-91 | 46117 Oberhausen

Fon:    +49 (0) 208 89 402-0<tel:+49208894020>
Fax:    +49 (0) 208 89 402-40<tel:+492088940240>
WWW:    http://www.kamp.de<https://www.kamp.de/>

Gesch=E4ftsf=FChrer: Michael Lante | Falk Brockerhoff | Daniel Hagemeier | =
Marcel Chorengel | Dr. Claus Boyens
Amtsgericht Duisburg | HRB Nr. 12154 | USt-IdNr.: DE120607556

HINWEIS: UNSERE HINWEISE ZUM UMGANG MIT PERSONENBEZOGENEN DATEN FINDEN SIE =
IN UNSERER DATENSCHUTZERKL=C4RUNG UNTER HTTPS://WWW.KAMP.DE/DATENSCHUTZ.HTM=
L<https://www.kamp.de/DATENSCHUTZ.HTML>

DIESE NACHRICHT IST NUR F=DCR DEN ADRESSATEN BESTIMMT. ES IST NICHT ERLAUBT=
, DIESE NACHRICHT ZU KOPIEREN ODER DRITTEN ZUG=C4NGLICH ZU MACHEN. SOLLTEN =
SIE IRRT=DCMLICH DIESE NACHRICHT ERHALTEN HABEN, BITTE ICH UM IHRE MITTEILU=
NG PER E-MAIL ODER UNTER DER OBEN ANGEGEBENEN TELEFONNUMMER.

________________________________

