Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE6190687
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 08:44:36 +0100 (CET)
Received: from localhost ([::1]:44054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGeEl-0003Hx-4H
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 03:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jGeDU-0002rz-NJ
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 03:43:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jGeDK-0000yf-Sg
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 03:43:16 -0400
Received: from mail-eopbgr70124.outbound.protection.outlook.com
 ([40.107.7.124]:39625 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jGeCy-0000rT-U2; Tue, 24 Mar 2020 03:42:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcVzEFGSBEpb+g5ccbu3XY3LW1buCIR7fOhgdejrNxc17AdaAEF3Z4Ip8B45+hbPrflzKcUfQLKhQrSNUNHD0OS/kGEcLGeNXcq442ULmSN9MLNEyt/5KnVAGC23aFfE4eW2IxKlkVcbcCUKrTUGNqMKl+aWZI9EjLltISSofxDDtcM3Im747kok8enzPRX42SX0Y5ZBzT2t3uvHlr1ohqxQ2WtrTKCGz7EalZ/+ZN6wT3GkEi3NuZAYZZzbv/HujDOkijUIX+Xhl1oFQw6JiCY9kNA+LuvD3Mk4XY1Mz/0XzLDRtUa7PdJHuNZ7JlKFrvipxiOaZNJpVsow6yAxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCrpoZEncripjwP4/sFOFhqG2BYnXvf8PzlUKCFetWA=;
 b=XxjD7k7XAPOpUVmqJbAc7ZTsDqJ+TKISkmv9r2y06fH0AxfwpbYCx32MgGsJkOJpsHsBJibWNNDuWTR5iDs7dH/DXdhMZl+MQpsjsdudv9j8ArbCAGuMW/rvq7K65tj9QihpJE2NCJMmIa58Xnb7+CcTSgQZ7Fx7yz3v4FvX3CwXbEySnZsf7PNPhUq5+ZScPVOX2qzcpHOVX5uRvK6b5Z/ubNVFQqU7gvDefosOzLlKRQhK3zjwG9wajuqRBIcqvfih4PGxbIdOM/cs0mP+SL8UtBAt3xrz0XPWfi5SL4HPybSLAAa+2XCqL4g/mcQ141bqRGBbb4jg6C5YBjlZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCrpoZEncripjwP4/sFOFhqG2BYnXvf8PzlUKCFetWA=;
 b=IJ1pDEby8EflLE4AIGMz+jxUpv67ZhDiyhn4BnFCImvX1mPht65Np7uLFthbJorp9wHpcKEO2cUXxgfh+NjNLpAQvad9qJTQEW31cNmGoVbP/469PT20q1d2BarHCKja/eUowJQpndCuwxowUffGh10iGRSIiNlcQ01uMGBy5HU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (10.141.175.15) by
 AM7PR08MB5318.eurprd08.prod.outlook.com (10.141.172.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Tue, 24 Mar 2020 07:42:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::9057:6f5a:378c:7533]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::9057:6f5a:378c:7533%6]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 07:42:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests: drop group file
Date: Tue, 24 Mar 2020 10:41:56 +0300
Message-ID: <20200324074156.5330-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0802CA0013.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.15) by
 HE1PR0802CA0013.eurprd08.prod.outlook.com (2603:10a6:3:bd::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18 via Frontend Transport; Tue, 24 Mar 2020 07:42:35 +0000
X-Mailer: git-send-email 2.21.0
X-Originating-IP: [185.215.60.15]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3807cc19-a135-4fc1-866a-08d7cfc6ebd3
X-MS-TrafficTypeDiagnostic: AM7PR08MB5318:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5318CDD614A70114D231444DC1F10@AM7PR08MB5318.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(136003)(346002)(39850400004)(396003)(316002)(6486002)(186003)(6506007)(6666004)(16526019)(26005)(36756003)(66476007)(66946007)(66556008)(30864003)(86362001)(478600001)(8676002)(956004)(6512007)(2616005)(8936002)(5660300002)(52116002)(6916009)(1076003)(81166006)(107886003)(4326008)(2906002)(81156014)(559001)(579004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR08MB5318;
 H:AM7PR08MB5494.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: snk7OZv4oGn/fbnt0ALcBPBDurhSpSoGjQVB0K39gwnLAyRPSTm6eLbnJ/rw7j2YQOu8/TkR87R8twQZVdwF6R0Vh+EEQ8eubJ4udctqW1398Kdj1TXCBHr69RXfQg9Z7vnDBF3zFmUPS9+FfS/P3dQPeWnTPuSvxar9JE0D3eLjjdnFYh6kx+BKVObfcNFWAkiDg6ndWOD0AfnqCZDgUECLhFj86dxQkvlCdAsFuszrXc/A4jM/atZpRhiCdqyEVuhQNKK2EnRcwMmeSW/yJJR8Q6HsBBDSBWpi3v49cUXlH0p1/+hJ+HEEPQO/FHso+J8j8CaeZSa2Z2moy1+NKCcAd0tr5WbyN8/V36mpMlcJ9y7Jl4l9jeemBcAm2H9lc+o02cGVO7fEjquYdcLsuYQ7D+VOP3hCMCbC3EGNxI4BtcCHExtNGdflne0ngmX+
X-MS-Exchange-AntiSpam-MessageData: rJ5pU7Ip2cuq+6be40KWWWzebVunbSsqMzCFErgBuoa1Rg0AZ6/TPJVYKPM2liQJi9rnPBgdaia0KDDbC4UJhteCjUltqdBLboNNzsXQTPQIFHTl8X2058B48UbxMLKfUSeRpwi1P4RXyn22JHw53Q==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3807cc19-a135-4fc1-866a-08d7cfc6ebd3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 07:42:36.7627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9hWLnlZX9SMkPZOYSFLxweKUzmVzts3K30/xNdlhJ/63OVh4U5aMgtdKgxriKMQ8uUOvp0hIY3+YIWGicfGG6LWZ1nDm1D8vH9TPNS0rP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5318
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.7.124
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When sending iotests to upstream or do patch porting from one branch
to another we very often have to resolve conflicts in group file, as
many absolutely independent features are intersecting by this file.
These conflicts are simple, but imagine how much time we all have
already spent on resolving them? Let's finally get rid of group file.

This patch transposes group info: instead of collecting it in one file,
let each test define its groups by itself.

Several steps are done to achive it:

1. Define groups in test files automatically:

    grep '^[0-9]\{3\} ' group | while read line; do
        file=3D$(awk '{print $1}' <<< "$line");
        groups=3D$(sed -e 's/^... //' <<< "$line");
        awk "NR=3D=3D2{print \"# group: $groups\"}1" $file > tmp;
        cat tmp > $file;
    done

2. Copy groups documentation into docs/devel/testing.rst, which already
   has a section about iotests.

3. Modify check script to work without group file.

   Here is a logic change: before, even if test do not belong to any
   group (only iotest 142 currently) it should be defined in group
   file. Now, test is not forced to define any group. Instead check
   considers all files with names matching [0-9][0-9][0-9] as tests.

   check script is also refactored to make it simple to do next cool
   thing about iotests: allow meaningful names for test-case files.

4. Remove group file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all!

I understand, that it's 5.1 material, and I will have to regenerate
generated part and resend, but I just really want to share the idea
with you. Hope you like it:)

 docs/devel/testing.rst   |  30 +++-
 tests/qemu-iotests/001   |   1 +
 tests/qemu-iotests/002   |   1 +
 tests/qemu-iotests/003   |   1 +
 tests/qemu-iotests/004   |   1 +
 tests/qemu-iotests/005   |   1 +
 tests/qemu-iotests/007   |   1 +
 tests/qemu-iotests/008   |   1 +
 tests/qemu-iotests/009   |   1 +
 tests/qemu-iotests/010   |   1 +
 tests/qemu-iotests/011   |   1 +
 tests/qemu-iotests/012   |   1 +
 tests/qemu-iotests/013   |   1 +
 tests/qemu-iotests/014   |   1 +
 tests/qemu-iotests/015   |   1 +
 tests/qemu-iotests/017   |   1 +
 tests/qemu-iotests/018   |   1 +
 tests/qemu-iotests/019   |   1 +
 tests/qemu-iotests/020   |   1 +
 tests/qemu-iotests/021   |   1 +
 tests/qemu-iotests/022   |   1 +
 tests/qemu-iotests/023   |   1 +
 tests/qemu-iotests/024   |   1 +
 tests/qemu-iotests/025   |   1 +
 tests/qemu-iotests/026   |   1 +
 tests/qemu-iotests/027   |   1 +
 tests/qemu-iotests/028   |   1 +
 tests/qemu-iotests/029   |   1 +
 tests/qemu-iotests/030   |   1 +
 tests/qemu-iotests/031   |   1 +
 tests/qemu-iotests/032   |   1 +
 tests/qemu-iotests/033   |   1 +
 tests/qemu-iotests/034   |   1 +
 tests/qemu-iotests/035   |   1 +
 tests/qemu-iotests/036   |   1 +
 tests/qemu-iotests/037   |   1 +
 tests/qemu-iotests/038   |   1 +
 tests/qemu-iotests/039   |   1 +
 tests/qemu-iotests/040   |   1 +
 tests/qemu-iotests/041   |   1 +
 tests/qemu-iotests/042   |   1 +
 tests/qemu-iotests/043   |   1 +
 tests/qemu-iotests/044   |   1 +
 tests/qemu-iotests/045   |   1 +
 tests/qemu-iotests/046   |   1 +
 tests/qemu-iotests/047   |   1 +
 tests/qemu-iotests/048   |   1 +
 tests/qemu-iotests/049   |   1 +
 tests/qemu-iotests/050   |   1 +
 tests/qemu-iotests/051   |   1 +
 tests/qemu-iotests/052   |   1 +
 tests/qemu-iotests/053   |   1 +
 tests/qemu-iotests/054   |   1 +
 tests/qemu-iotests/055   |   1 +
 tests/qemu-iotests/056   |   1 +
 tests/qemu-iotests/057   |   1 +
 tests/qemu-iotests/058   |   1 +
 tests/qemu-iotests/059   |   1 +
 tests/qemu-iotests/060   |   1 +
 tests/qemu-iotests/061   |   1 +
 tests/qemu-iotests/062   |   1 +
 tests/qemu-iotests/063   |   1 +
 tests/qemu-iotests/064   |   1 +
 tests/qemu-iotests/065   |   1 +
 tests/qemu-iotests/066   |   1 +
 tests/qemu-iotests/067   |   1 +
 tests/qemu-iotests/068   |   1 +
 tests/qemu-iotests/069   |   1 +
 tests/qemu-iotests/070   |   1 +
 tests/qemu-iotests/071   |   1 +
 tests/qemu-iotests/072   |   1 +
 tests/qemu-iotests/073   |   1 +
 tests/qemu-iotests/074   |   1 +
 tests/qemu-iotests/075   |   1 +
 tests/qemu-iotests/076   |   1 +
 tests/qemu-iotests/077   |   1 +
 tests/qemu-iotests/078   |   1 +
 tests/qemu-iotests/079   |   1 +
 tests/qemu-iotests/080   |   1 +
 tests/qemu-iotests/081   |   1 +
 tests/qemu-iotests/082   |   1 +
 tests/qemu-iotests/083   |   1 +
 tests/qemu-iotests/084   |   1 +
 tests/qemu-iotests/085   |   1 +
 tests/qemu-iotests/086   |   1 +
 tests/qemu-iotests/087   |   1 +
 tests/qemu-iotests/088   |   1 +
 tests/qemu-iotests/089   |   1 +
 tests/qemu-iotests/090   |   1 +
 tests/qemu-iotests/091   |   1 +
 tests/qemu-iotests/092   |   1 +
 tests/qemu-iotests/093   |   1 +
 tests/qemu-iotests/094   |   1 +
 tests/qemu-iotests/095   |   1 +
 tests/qemu-iotests/096   |   1 +
 tests/qemu-iotests/097   |   1 +
 tests/qemu-iotests/098   |   1 +
 tests/qemu-iotests/099   |   1 +
 tests/qemu-iotests/101   |   1 +
 tests/qemu-iotests/102   |   1 +
 tests/qemu-iotests/103   |   1 +
 tests/qemu-iotests/104   |   1 +
 tests/qemu-iotests/105   |   1 +
 tests/qemu-iotests/106   |   1 +
 tests/qemu-iotests/107   |   1 +
 tests/qemu-iotests/108   |   1 +
 tests/qemu-iotests/109   |   1 +
 tests/qemu-iotests/110   |   1 +
 tests/qemu-iotests/111   |   1 +
 tests/qemu-iotests/112   |   1 +
 tests/qemu-iotests/113   |   1 +
 tests/qemu-iotests/114   |   1 +
 tests/qemu-iotests/115   |   1 +
 tests/qemu-iotests/116   |   1 +
 tests/qemu-iotests/117   |   1 +
 tests/qemu-iotests/118   |   1 +
 tests/qemu-iotests/119   |   1 +
 tests/qemu-iotests/120   |   1 +
 tests/qemu-iotests/121   |   1 +
 tests/qemu-iotests/122   |   1 +
 tests/qemu-iotests/123   |   1 +
 tests/qemu-iotests/124   |   1 +
 tests/qemu-iotests/125   |   1 +
 tests/qemu-iotests/126   |   1 +
 tests/qemu-iotests/127   |   1 +
 tests/qemu-iotests/128   |   1 +
 tests/qemu-iotests/129   |   1 +
 tests/qemu-iotests/130   |   1 +
 tests/qemu-iotests/131   |   1 +
 tests/qemu-iotests/132   |   1 +
 tests/qemu-iotests/133   |   1 +
 tests/qemu-iotests/134   |   1 +
 tests/qemu-iotests/135   |   1 +
 tests/qemu-iotests/136   |   1 +
 tests/qemu-iotests/137   |   1 +
 tests/qemu-iotests/138   |   1 +
 tests/qemu-iotests/139   |   1 +
 tests/qemu-iotests/140   |   1 +
 tests/qemu-iotests/141   |   1 +
 tests/qemu-iotests/143   |   1 +
 tests/qemu-iotests/144   |   1 +
 tests/qemu-iotests/145   |   1 +
 tests/qemu-iotests/146   |   1 +
 tests/qemu-iotests/147   |   1 +
 tests/qemu-iotests/148   |   1 +
 tests/qemu-iotests/149   |   1 +
 tests/qemu-iotests/150   |   1 +
 tests/qemu-iotests/151   |   1 +
 tests/qemu-iotests/152   |   1 +
 tests/qemu-iotests/153   |   1 +
 tests/qemu-iotests/154   |   1 +
 tests/qemu-iotests/155   |   1 +
 tests/qemu-iotests/156   |   1 +
 tests/qemu-iotests/157   |   1 +
 tests/qemu-iotests/158   |   1 +
 tests/qemu-iotests/159   |   1 +
 tests/qemu-iotests/160   |   1 +
 tests/qemu-iotests/161   |   1 +
 tests/qemu-iotests/162   |   1 +
 tests/qemu-iotests/163   |   1 +
 tests/qemu-iotests/165   |   1 +
 tests/qemu-iotests/169   |   1 +
 tests/qemu-iotests/170   |   1 +
 tests/qemu-iotests/171   |   1 +
 tests/qemu-iotests/172   |   1 +
 tests/qemu-iotests/173   |   1 +
 tests/qemu-iotests/174   |   1 +
 tests/qemu-iotests/175   |   1 +
 tests/qemu-iotests/176   |   1 +
 tests/qemu-iotests/177   |   1 +
 tests/qemu-iotests/178   |   1 +
 tests/qemu-iotests/179   |   1 +
 tests/qemu-iotests/181   |   1 +
 tests/qemu-iotests/182   |   1 +
 tests/qemu-iotests/183   |   1 +
 tests/qemu-iotests/184   |   1 +
 tests/qemu-iotests/185   |   1 +
 tests/qemu-iotests/186   |   1 +
 tests/qemu-iotests/187   |   1 +
 tests/qemu-iotests/188   |   1 +
 tests/qemu-iotests/189   |   1 +
 tests/qemu-iotests/190   |   1 +
 tests/qemu-iotests/191   |   1 +
 tests/qemu-iotests/192   |   1 +
 tests/qemu-iotests/194   |   1 +
 tests/qemu-iotests/195   |   1 +
 tests/qemu-iotests/196   |   1 +
 tests/qemu-iotests/197   |   1 +
 tests/qemu-iotests/198   |   1 +
 tests/qemu-iotests/199   |   1 +
 tests/qemu-iotests/200   |   1 +
 tests/qemu-iotests/201   |   1 +
 tests/qemu-iotests/202   |   1 +
 tests/qemu-iotests/203   |   1 +
 tests/qemu-iotests/204   |   1 +
 tests/qemu-iotests/205   |   1 +
 tests/qemu-iotests/206   |   1 +
 tests/qemu-iotests/207   |   1 +
 tests/qemu-iotests/208   |   1 +
 tests/qemu-iotests/209   |   1 +
 tests/qemu-iotests/210   |   1 +
 tests/qemu-iotests/211   |   1 +
 tests/qemu-iotests/212   |   1 +
 tests/qemu-iotests/213   |   1 +
 tests/qemu-iotests/214   |   1 +
 tests/qemu-iotests/215   |   1 +
 tests/qemu-iotests/216   |   1 +
 tests/qemu-iotests/217   |   1 +
 tests/qemu-iotests/218   |   1 +
 tests/qemu-iotests/219   |   1 +
 tests/qemu-iotests/220   |   1 +
 tests/qemu-iotests/221   |   1 +
 tests/qemu-iotests/222   |   1 +
 tests/qemu-iotests/223   |   1 +
 tests/qemu-iotests/224   |   1 +
 tests/qemu-iotests/225   |   1 +
 tests/qemu-iotests/226   |   1 +
 tests/qemu-iotests/227   |   1 +
 tests/qemu-iotests/228   |   1 +
 tests/qemu-iotests/229   |   1 +
 tests/qemu-iotests/231   |   1 +
 tests/qemu-iotests/232   |   1 +
 tests/qemu-iotests/233   |   1 +
 tests/qemu-iotests/234   |   1 +
 tests/qemu-iotests/235   |   1 +
 tests/qemu-iotests/236   |   1 +
 tests/qemu-iotests/237   |   1 +
 tests/qemu-iotests/238   |   1 +
 tests/qemu-iotests/239   |   1 +
 tests/qemu-iotests/240   |   1 +
 tests/qemu-iotests/241   |   1 +
 tests/qemu-iotests/242   |   1 +
 tests/qemu-iotests/243   |   1 +
 tests/qemu-iotests/244   |   1 +
 tests/qemu-iotests/245   |   1 +
 tests/qemu-iotests/246   |   1 +
 tests/qemu-iotests/247   |   1 +
 tests/qemu-iotests/248   |   1 +
 tests/qemu-iotests/249   |   1 +
 tests/qemu-iotests/250   |   1 +
 tests/qemu-iotests/251   |   1 +
 tests/qemu-iotests/252   |   1 +
 tests/qemu-iotests/253   |   1 +
 tests/qemu-iotests/254   |   1 +
 tests/qemu-iotests/255   |   1 +
 tests/qemu-iotests/256   |   1 +
 tests/qemu-iotests/257   |   1 +
 tests/qemu-iotests/258   |   1 +
 tests/qemu-iotests/259   |   1 +
 tests/qemu-iotests/260   |   1 +
 tests/qemu-iotests/261   |   1 +
 tests/qemu-iotests/262   |   1 +
 tests/qemu-iotests/263   |   1 +
 tests/qemu-iotests/264   |   1 +
 tests/qemu-iotests/265   |   1 +
 tests/qemu-iotests/266   |   1 +
 tests/qemu-iotests/267   |   1 +
 tests/qemu-iotests/268   |   1 +
 tests/qemu-iotests/270   |   1 +
 tests/qemu-iotests/272   |   1 +
 tests/qemu-iotests/273   |   1 +
 tests/qemu-iotests/277   |   1 +
 tests/qemu-iotests/279   |   1 +
 tests/qemu-iotests/280   |   1 +
 tests/qemu-iotests/281   |   1 +
 tests/qemu-iotests/282   |   1 +
 tests/qemu-iotests/283   |   1 +
 tests/qemu-iotests/284   |   1 +
 tests/qemu-iotests/286   |   1 +
 tests/qemu-iotests/288   |   1 +
 tests/qemu-iotests/check |  22 +--
 tests/qemu-iotests/group | 297 ---------------------------------------
 272 files changed, 311 insertions(+), 307 deletions(-)
 delete mode 100644 tests/qemu-iotests/group

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 770a987ea4..fdf3a08fd4 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -153,7 +153,7 @@ check-block
 -----------
=20
 ``make check-block`` runs a subset of the block layer iotests (the tests t=
hat
-are in the "auto" group in ``tests/qemu-iotests/group``).
+are in the "auto" group).
 See the "QEMU iotests" section below for more information.
=20
 GCC gcov support
@@ -267,6 +267,34 @@ another application on the host may have locked the fi=
le, possibly leading to a
 test failure.  If using such devices are explicitly desired, consider addi=
ng
 ``locking=3Doff`` option to disable image locking.
=20
+Test case groups
+----------------
+
+Test may belong to some groups, you may define it in the comment inside th=
e
+test. By convention, test groups are listed in the second line of the test
+file, after "#!/..." line, like this:
+
+.. code::
+
+  #!/usr/bin/env python3
+  # group: auto quick
+  #
+  ...
+
+The following groups are defined:
+
+- quick : Tests in this group should finish within some few seconds.
+
+- img : Tests in this group can be used to excercise the qemu-img tool.
+
+- auto : Tests in this group are used during "make check" and should be
+  runnable in any case. That means they should run with every QEMU binary
+  (also non-x86), with every QEMU configuration (i.e. must not fail if
+  an optional feature is not compiled in - but reporting a "skip" is ok),
+  work at least with the qcow2 file format, work with all kind of host
+  filesystems and users (e.g. "nobody" or "root") and must not take too
+  much memory and disk space (since CI pipelines tend to fail otherwise).
+
 .. _docker-ref:
=20
 Docker based tests
diff --git a/tests/qemu-iotests/001 b/tests/qemu-iotests/001
index d87a535c33..67ff7e3291 100755
--- a/tests/qemu-iotests/001
+++ b/tests/qemu-iotests/001
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test simple read/write using plain bdrv_read/bdrv_write
 #
diff --git a/tests/qemu-iotests/002 b/tests/qemu-iotests/002
index 1a0d411df5..5ce1647531 100755
--- a/tests/qemu-iotests/002
+++ b/tests/qemu-iotests/002
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test simple read/write using plain bdrv_pread/bdrv_pwrite
 #
diff --git a/tests/qemu-iotests/003 b/tests/qemu-iotests/003
index 33eeade0de..03f902a83c 100755
--- a/tests/qemu-iotests/003
+++ b/tests/qemu-iotests/003
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test simple read/write using bdrv_aio_readv/bdrv_aio_writev
 #
diff --git a/tests/qemu-iotests/004 b/tests/qemu-iotests/004
index d308dc4b49..e955579a67 100755
--- a/tests/qemu-iotests/004
+++ b/tests/qemu-iotests/004
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Make sure we can't read and write outside of the image size.
 #
diff --git a/tests/qemu-iotests/005 b/tests/qemu-iotests/005
index b6d03ac37d..40e64a9a8f 100755
--- a/tests/qemu-iotests/005
+++ b/tests/qemu-iotests/005
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: img auto quick
 #
 # Make sure qemu-img can create 5TB images
 #
diff --git a/tests/qemu-iotests/007 b/tests/qemu-iotests/007
index 160683adf8..936d3f14fb 100755
--- a/tests/qemu-iotests/007
+++ b/tests/qemu-iotests/007
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: snapshot auto
 #
 # Check for one possible case of qcow2 refcount corruption.
 #
diff --git a/tests/qemu-iotests/008 b/tests/qemu-iotests/008
index 2b81b119bf..fa4990b513 100755
--- a/tests/qemu-iotests/008
+++ b/tests/qemu-iotests/008
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test simple asynchronous read/write operations.
 #
diff --git a/tests/qemu-iotests/009 b/tests/qemu-iotests/009
index 4dc7d210f9..efa852bad3 100755
--- a/tests/qemu-iotests/009
+++ b/tests/qemu-iotests/009
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Nolan I qcow2 corruption - incorrectly reports free clusters
 #
diff --git a/tests/qemu-iotests/010 b/tests/qemu-iotests/010
index df809b3088..4ae9027b47 100755
--- a/tests/qemu-iotests/010
+++ b/tests/qemu-iotests/010
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Nolan II qcow2 corruption - wrong used cluster
 #
diff --git a/tests/qemu-iotests/011 b/tests/qemu-iotests/011
index 57b99ae4a9..5c99ac987f 100755
--- a/tests/qemu-iotests/011
+++ b/tests/qemu-iotests/011
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test for AIO allocation on the same cluster
 #
diff --git a/tests/qemu-iotests/012 b/tests/qemu-iotests/012
index 12957285b3..3a24d2ca8d 100755
--- a/tests/qemu-iotests/012
+++ b/tests/qemu-iotests/012
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto quick
 #
 # Make sure we can open read-only images
 #
diff --git a/tests/qemu-iotests/013 b/tests/qemu-iotests/013
index 5cb9032f16..d39d0cd88b 100755
--- a/tests/qemu-iotests/013
+++ b/tests/qemu-iotests/013
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # qcow2 pattern test, empty and compressed image - 4k cluster patterns
 #
diff --git a/tests/qemu-iotests/014 b/tests/qemu-iotests/014
index e1221c0fff..2d23469332 100755
--- a/tests/qemu-iotests/014
+++ b/tests/qemu-iotests/014
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # qcow2 pattern test, complex patterns including compression and snapshots
 # Using patterns for 4k cluster size.
diff --git a/tests/qemu-iotests/015 b/tests/qemu-iotests/015
index 4d8effd0ae..40c23235a6 100755
--- a/tests/qemu-iotests/015
+++ b/tests/qemu-iotests/015
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw snapshot
 #
 # Combined test to grow the refcount table and test snapshots.
 #
diff --git a/tests/qemu-iotests/017 b/tests/qemu-iotests/017
index 0a4b854e65..3cab97ad94 100755
--- a/tests/qemu-iotests/017
+++ b/tests/qemu-iotests/017
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing auto quick
 #
 # Simple backing file reads
 #
diff --git a/tests/qemu-iotests/018 b/tests/qemu-iotests/018
index c69ce09209..a946243450 100755
--- a/tests/qemu-iotests/018
+++ b/tests/qemu-iotests/018
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing auto quick
 #
 # Merge backing file into test image when converting the image
 #
diff --git a/tests/qemu-iotests/019 b/tests/qemu-iotests/019
index 813a84acac..a1a2065f6a 100755
--- a/tests/qemu-iotests/019
+++ b/tests/qemu-iotests/019
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing auto quick
 #
 # When using a backing file for the output image in qemu-img convert,
 # the backing file clusters must not copied. The data must still be
diff --git a/tests/qemu-iotests/020 b/tests/qemu-iotests/020
index 20f8f185d0..a4ae2e1017 100755
--- a/tests/qemu-iotests/020
+++ b/tests/qemu-iotests/020
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing auto quick
 #
 # Commit changes to backing file
 #
diff --git a/tests/qemu-iotests/021 b/tests/qemu-iotests/021
index f888269fd4..0fc89df2fe 100755
--- a/tests/qemu-iotests/021
+++ b/tests/qemu-iotests/021
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: io auto quick
 #
 # Test handling of invalid patterns arguments to qemu-io
 #
diff --git a/tests/qemu-iotests/022 b/tests/qemu-iotests/022
index 99eb08f57f..a116cfe255 100755
--- a/tests/qemu-iotests/022
+++ b/tests/qemu-iotests/022
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw snapshot auto
 #
 # Test bdrv_load/save_vmstate using the usual patterns
 #
diff --git a/tests/qemu-iotests/023 b/tests/qemu-iotests/023
index 02ed047820..d19d13ff5d 100755
--- a/tests/qemu-iotests/023
+++ b/tests/qemu-iotests/023
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # qcow2 pattern test with various cluster sizes
 #
diff --git a/tests/qemu-iotests/024 b/tests/qemu-iotests/024
index e2e766241e..de70aeac1c 100755
--- a/tests/qemu-iotests/024
+++ b/tests/qemu-iotests/024
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing auto quick
 #
 # Rebasing COW images
 #
diff --git a/tests/qemu-iotests/025 b/tests/qemu-iotests/025
index e05d833452..0047969d17 100755
--- a/tests/qemu-iotests/025
+++ b/tests/qemu-iotests/025
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Resizing images
 #
diff --git a/tests/qemu-iotests/026 b/tests/qemu-iotests/026
index b05a4692cf..825e6b5210 100755
--- a/tests/qemu-iotests/026
+++ b/tests/qemu-iotests/026
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw blkdbg
 #
 # qcow2 error path testing
 #
diff --git a/tests/qemu-iotests/027 b/tests/qemu-iotests/027
index 494be0921f..b279c88f33 100755
--- a/tests/qemu-iotests/027
+++ b/tests/qemu-iotests/027
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test that sub-cluster allocating writes zero the rest of the cluster
 #
diff --git a/tests/qemu-iotests/028 b/tests/qemu-iotests/028
index 797dae5350..665889297f 100755
--- a/tests/qemu-iotests/028
+++ b/tests/qemu-iotests/028
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing quick
 #
 # Test that backing files can be smaller than the image
 #
diff --git a/tests/qemu-iotests/029 b/tests/qemu-iotests/029
index 2161a4b87a..3a20d2d1ff 100755
--- a/tests/qemu-iotests/029
+++ b/tests/qemu-iotests/029
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # qcow2 internal snapshots/VM state tests
 #
diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index aa911d266a..a9066d4947 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw auto backing
 #
 # Tests for image streaming.
 #
diff --git a/tests/qemu-iotests/031 b/tests/qemu-iotests/031
index 646ecd593f..af167e85be 100755
--- a/tests/qemu-iotests/031
+++ b/tests/qemu-iotests/031
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test that all qcow2 header extensions survive a header rewrite
 #
diff --git a/tests/qemu-iotests/032 b/tests/qemu-iotests/032
index 8337a4d825..ebbe7cb0ba 100755
--- a/tests/qemu-iotests/032
+++ b/tests/qemu-iotests/032
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test that AIO requests are drained before an image is closed. This used
 # to segfault because the request coroutine kept running even after the
diff --git a/tests/qemu-iotests/033 b/tests/qemu-iotests/033
index 8b40991d55..da9133c44b 100755
--- a/tests/qemu-iotests/033
+++ b/tests/qemu-iotests/033
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test aligned and misaligned write zeroes operations.
 #
diff --git a/tests/qemu-iotests/034 b/tests/qemu-iotests/034
index da4cea1571..e5d5996aa0 100755
--- a/tests/qemu-iotests/034
+++ b/tests/qemu-iotests/034
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test bdrv_pwrite_zeroes with backing files (see also 154)
 #
diff --git a/tests/qemu-iotests/035 b/tests/qemu-iotests/035
index d950a0dd1e..0c0c4fdd42 100755
--- a/tests/qemu-iotests/035
+++ b/tests/qemu-iotests/035
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Let a few AIO requests run in parallel and have them access different L2
 # tables so that the cache has a chance to get used up.
diff --git a/tests/qemu-iotests/036 b/tests/qemu-iotests/036
index 512598421c..5daa745b82 100755
--- a/tests/qemu-iotests/036
+++ b/tests/qemu-iotests/036
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qcow2 feature bits
 #
diff --git a/tests/qemu-iotests/037 b/tests/qemu-iotests/037
index e6517acbd4..9bcc7695a6 100755
--- a/tests/qemu-iotests/037
+++ b/tests/qemu-iotests/037
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test COW from backing files
 #
diff --git a/tests/qemu-iotests/038 b/tests/qemu-iotests/038
index 707e2d72e9..63dff13827 100755
--- a/tests/qemu-iotests/038
+++ b/tests/qemu-iotests/038
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test COW from backing files with AIO
 #
diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index ddce48ab47..3cddb8a720 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qcow2 lazy refcounts
 #
diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 32c82b4ec6..1a8bd3f613 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw auto
 #
 # Tests for image block commit.
 #
diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 5d67bf14bf..b6a14dc1b2 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw auto backing
 #
 # Tests for image mirroring.
 #
diff --git a/tests/qemu-iotests/042 b/tests/qemu-iotests/042
index 0e85b356b7..6cf823fa74 100755
--- a/tests/qemu-iotests/042
+++ b/tests/qemu-iotests/042
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qemu-img operation on zero size images
 #
diff --git a/tests/qemu-iotests/043 b/tests/qemu-iotests/043
index b102e49208..83b97cccaf 100755
--- a/tests/qemu-iotests/043
+++ b/tests/qemu-iotests/043
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing
 #
 # Test that qemu-img info --backing-chain detects infinite loops
 #
diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index 7e99ea7c68..64b18eb7c8 100755
--- a/tests/qemu-iotests/044
+++ b/tests/qemu-iotests/044
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Tests growing a large refcount table.
 #
diff --git a/tests/qemu-iotests/045 b/tests/qemu-iotests/045
index 5acc89099c..45eb239baa 100755
--- a/tests/qemu-iotests/045
+++ b/tests/qemu-iotests/045
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests for fdsets and getfd.
 #
diff --git a/tests/qemu-iotests/046 b/tests/qemu-iotests/046
index a066eec605..969008ed20 100755
--- a/tests/qemu-iotests/046
+++ b/tests/qemu-iotests/046
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto aio quick
 #
 # Test concurrent cluster allocations
 #
diff --git a/tests/qemu-iotests/047 b/tests/qemu-iotests/047
index 4528465fb0..8dd21e0a81 100755
--- a/tests/qemu-iotests/047
+++ b/tests/qemu-iotests/047
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Regression test for commit b7ab0fea (which was a corruption fix,
 # despite the commit message claiming otherwise)
diff --git a/tests/qemu-iotests/048 b/tests/qemu-iotests/048
index 2af6b74b41..bf8e4bf528 100755
--- a/tests/qemu-iotests/048
+++ b/tests/qemu-iotests/048
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: img auto quick
 ##
 ## qemu-img compare test
 ##
diff --git a/tests/qemu-iotests/049 b/tests/qemu-iotests/049
index 051a1c79e0..ed6730c4e8 100755
--- a/tests/qemu-iotests/049
+++ b/tests/qemu-iotests/049
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Check qemu-img option parsing
 #
diff --git a/tests/qemu-iotests/050 b/tests/qemu-iotests/050
index cdc5356541..62cc29f756 100755
--- a/tests/qemu-iotests/050
+++ b/tests/qemu-iotests/050
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test qemu-img rebase with zero clusters
 #
diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 034d3a3250..833aeda9f7 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test command line configuration of block devices and driver-specific opt=
ions
 #
diff --git a/tests/qemu-iotests/052 b/tests/qemu-iotests/052
index 45a140910d..44c7895b80 100755
--- a/tests/qemu-iotests/052
+++ b/tests/qemu-iotests/052
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test bdrv_read/bdrv_write using BDRV_O_SNAPSHOT
 #
diff --git a/tests/qemu-iotests/053 b/tests/qemu-iotests/053
index 71d299c4f9..9a2958d42d 100755
--- a/tests/qemu-iotests/053
+++ b/tests/qemu-iotests/053
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qemu-img convert when image length is not a multiple of cluster siz=
e
 #
diff --git a/tests/qemu-iotests/054 b/tests/qemu-iotests/054
index a8905b60d0..a796f565e0 100755
--- a/tests/qemu-iotests/054
+++ b/tests/qemu-iotests/054
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test huge qcow2 images
 #
diff --git a/tests/qemu-iotests/055 b/tests/qemu-iotests/055
index 82b9f5f47d..c70664dac6 100755
--- a/tests/qemu-iotests/055
+++ b/tests/qemu-iotests/055
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Tests for drive-backup and blockdev-backup
 #
diff --git a/tests/qemu-iotests/056 b/tests/qemu-iotests/056
index f73fc74457..ffb2077a03 100755
--- a/tests/qemu-iotests/056
+++ b/tests/qemu-iotests/056
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw backing
 #
 # Tests for drive-backup
 #
diff --git a/tests/qemu-iotests/057 b/tests/qemu-iotests/057
index a8b4bb60e0..b0d431999e 100755
--- a/tests/qemu-iotests/057
+++ b/tests/qemu-iotests/057
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Tests for internal snapshot.
 #
diff --git a/tests/qemu-iotests/058 b/tests/qemu-iotests/058
index d84740ed9f..ce35ff4ee0 100755
--- a/tests/qemu-iotests/058
+++ b/tests/qemu-iotests/058
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test export internal snapshot by qemu-nbd, convert it by qemu-img.
 #
diff --git a/tests/qemu-iotests/059 b/tests/qemu-iotests/059
index 5438025285..33f5450edd 100755
--- a/tests/qemu-iotests/059
+++ b/tests/qemu-iotests/059
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for vmdk
 #
diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index 043f12904a..4ec86931e1 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for image corruption (overlapping data structures) in qcow2
 #
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index 36b040491f..67355510d8 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test case for image option amendment in qcow2.
 #
diff --git a/tests/qemu-iotests/062 b/tests/qemu-iotests/062
index f26b88df9d..321252298d 100755
--- a/tests/qemu-iotests/062
+++ b/tests/qemu-iotests/062
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for snapshotting images with unallocated zero clusters in
 # qcow2
diff --git a/tests/qemu-iotests/063 b/tests/qemu-iotests/063
index c750b3806e..3a44758053 100755
--- a/tests/qemu-iotests/063
+++ b/tests/qemu-iotests/063
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # test of qemu-img convert -n - convert without creation
 #
diff --git a/tests/qemu-iotests/064 b/tests/qemu-iotests/064
index 90673186ec..71fc575b21 100755
--- a/tests/qemu-iotests/064
+++ b/tests/qemu-iotests/064
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test VHDX read/write from a sample image created with Hyper-V
 #
diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index 6426474271..2d76287d44 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test for additional information emitted by qemu-img info on qcow2
 # images
diff --git a/tests/qemu-iotests/066 b/tests/qemu-iotests/066
index a4ac613f8e..a780ed7ab5 100755
--- a/tests/qemu-iotests/066
+++ b/tests/qemu-iotests/066
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for preallocated zero clusters in qcow2
 #
diff --git a/tests/qemu-iotests/067 b/tests/qemu-iotests/067
index a63be9cabf..b23f8c65de 100755
--- a/tests/qemu-iotests/067
+++ b/tests/qemu-iotests/067
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test automatic deletion of BDSes created by -drive/drive_add
 #
diff --git a/tests/qemu-iotests/068 b/tests/qemu-iotests/068
index ccd1a9f1db..03e03508a6 100755
--- a/tests/qemu-iotests/068
+++ b/tests/qemu-iotests/068
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for loading a saved VM state from a qcow2 image
 #
diff --git a/tests/qemu-iotests/069 b/tests/qemu-iotests/069
index b997b127f0..ccb24bc948 100755
--- a/tests/qemu-iotests/069
+++ b/tests/qemu-iotests/069
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for deleting a backing file
 #
diff --git a/tests/qemu-iotests/070 b/tests/qemu-iotests/070
index cb0f927c16..b181e00f9b 100755
--- a/tests/qemu-iotests/070
+++ b/tests/qemu-iotests/070
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test VHDX log replay from an image with a journal that needs to be
 # replayed
diff --git a/tests/qemu-iotests/071 b/tests/qemu-iotests/071
index 88faebcc1d..1d92f7f4a6 100755
--- a/tests/qemu-iotests/071
+++ b/tests/qemu-iotests/071
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for the QMP blkdebug and blkverify interfaces
 #
diff --git a/tests/qemu-iotests/072 b/tests/qemu-iotests/072
index f0b73e7e65..c492ab8a78 100755
--- a/tests/qemu-iotests/072
+++ b/tests/qemu-iotests/072
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for nested image formats
 #
diff --git a/tests/qemu-iotests/073 b/tests/qemu-iotests/073
index 23a1bdf890..ccdd465bbf 100755
--- a/tests/qemu-iotests/073
+++ b/tests/qemu-iotests/073
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test count_contiguous_clusters in qcow2
 #
diff --git a/tests/qemu-iotests/074 b/tests/qemu-iotests/074
index db03edf0b0..c32c94b50d 100755
--- a/tests/qemu-iotests/074
+++ b/tests/qemu-iotests/074
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 ##
 ## qemu-img compare test (qcow2 only ones)
 ##
diff --git a/tests/qemu-iotests/075 b/tests/qemu-iotests/075
index 389d5675fa..ca2ed2a05c 100755
--- a/tests/qemu-iotests/075
+++ b/tests/qemu-iotests/075
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # cloop format input validation tests
 #
diff --git a/tests/qemu-iotests/076 b/tests/qemu-iotests/076
index 0d405ef3f2..1a8927d765 100755
--- a/tests/qemu-iotests/076
+++ b/tests/qemu-iotests/076
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: io
 #
 # parallels format input validation tests
 #
diff --git a/tests/qemu-iotests/077 b/tests/qemu-iotests/077
index c284952082..fbb90d8036 100755
--- a/tests/qemu-iotests/077
+++ b/tests/qemu-iotests/077
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test concurrent pread/pwrite
 #
diff --git a/tests/qemu-iotests/078 b/tests/qemu-iotests/078
index 54fc654d8e..0b48b7f137 100755
--- a/tests/qemu-iotests/078
+++ b/tests/qemu-iotests/078
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # bochs format input validation tests
 #
diff --git a/tests/qemu-iotests/079 b/tests/qemu-iotests/079
index 3642b51feb..e00a3cda2f 100755
--- a/tests/qemu-iotests/079
+++ b/tests/qemu-iotests/079
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test qcow2 preallocation with different cluster_sizes
 #
diff --git a/tests/qemu-iotests/080 b/tests/qemu-iotests/080
index a3d13c414e..e0bdef11f4 100755
--- a/tests/qemu-iotests/080
+++ b/tests/qemu-iotests/080
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # qcow2 format input validation tests
 #
diff --git a/tests/qemu-iotests/081 b/tests/qemu-iotests/081
index 537d40dfd5..a8185036cb 100755
--- a/tests/qemu-iotests/081
+++ b/tests/qemu-iotests/081
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test Quorum block driver
 #
diff --git a/tests/qemu-iotests/082 b/tests/qemu-iotests/082
index 3286c2c6db..2259c9d9f7 100755
--- a/tests/qemu-iotests/082
+++ b/tests/qemu-iotests/082
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qemu-img command line parsing
 #
diff --git a/tests/qemu-iotests/083 b/tests/qemu-iotests/083
index 10fdfc8ebb..bc32b537b2 100755
--- a/tests/qemu-iotests/083
+++ b/tests/qemu-iotests/083
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test NBD client unexpected disconnect
 #
diff --git a/tests/qemu-iotests/084 b/tests/qemu-iotests/084
index c29d7395e9..e51e91a7c8 100755
--- a/tests/qemu-iotests/084
+++ b/tests/qemu-iotests/084
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: img quick
 #
 # Test case for VDI header corruption; image too large, and too many block=
s.
 # Also simple test for creating dynamic and static VDI images.
diff --git a/tests/qemu-iotests/085 b/tests/qemu-iotests/085
index 46981dbb64..3f098d4e07 100755
--- a/tests/qemu-iotests/085
+++ b/tests/qemu-iotests/085
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Live snapshot tests
 #
diff --git a/tests/qemu-iotests/086 b/tests/qemu-iotests/086
index fea1a7bd8a..c055e7bfe1 100755
--- a/tests/qemu-iotests/086
+++ b/tests/qemu-iotests/086
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qemu-img progress output
 #
diff --git a/tests/qemu-iotests/087 b/tests/qemu-iotests/087
index d6c8613419..4df975d0cd 100755
--- a/tests/qemu-iotests/087
+++ b/tests/qemu-iotests/087
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test unsupported blockdev-add cases
 #
diff --git a/tests/qemu-iotests/088 b/tests/qemu-iotests/088
index ef1163346c..e3102fe888 100755
--- a/tests/qemu-iotests/088
+++ b/tests/qemu-iotests/088
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # vpc (VHD) format input validation tests
 #
diff --git a/tests/qemu-iotests/089 b/tests/qemu-iotests/089
index 059ad75e28..1041cde0a1 100755
--- a/tests/qemu-iotests/089
+++ b/tests/qemu-iotests/089
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for support of JSON filenames
 #
diff --git a/tests/qemu-iotests/090 b/tests/qemu-iotests/090
index 1246e4f910..cda38eeef2 100755
--- a/tests/qemu-iotests/090
+++ b/tests/qemu-iotests/090
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test for discarding compressed clusters on qcow2 images
 #
diff --git a/tests/qemu-iotests/091 b/tests/qemu-iotests/091
index d2a2aca347..988ea12b39 100755
--- a/tests/qemu-iotests/091
+++ b/tests/qemu-iotests/091
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw migration
 #
 # Live migration test
 #
diff --git a/tests/qemu-iotests/092 b/tests/qemu-iotests/092
index 40ec62b6f1..bfa116d191 100755
--- a/tests/qemu-iotests/092
+++ b/tests/qemu-iotests/092
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # qcow1 format input validation tests
 #
diff --git a/tests/qemu-iotests/093 b/tests/qemu-iotests/093
index 32ded11430..7745cb04b6 100755
--- a/tests/qemu-iotests/093
+++ b/tests/qemu-iotests/093
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: throttle
 #
 # Tests for IO throttling
 #
diff --git a/tests/qemu-iotests/094 b/tests/qemu-iotests/094
index 2d3e1004d3..a295fb20ef 100755
--- a/tests/qemu-iotests/094
+++ b/tests/qemu-iotests/094
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for drive-mirror to NBD
 #
diff --git a/tests/qemu-iotests/095 b/tests/qemu-iotests/095
index 155ae86aa7..24c8ca2672 100755
--- a/tests/qemu-iotests/095
+++ b/tests/qemu-iotests/095
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test for commit of larger active layer
 #
diff --git a/tests/qemu-iotests/096 b/tests/qemu-iotests/096
index 5915f92786..b5d7636bdc 100755
--- a/tests/qemu-iotests/096
+++ b/tests/qemu-iotests/096
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test that snapshots move the throttling configuration to the active
 # layer
diff --git a/tests/qemu-iotests/097 b/tests/qemu-iotests/097
index 690f3d3ce1..2a95ee0c0f 100755
--- a/tests/qemu-iotests/097
+++ b/tests/qemu-iotests/097
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing
 #
 # Commit changes into backing chains and empty the top image if the
 # backing image is not explicitly specified
diff --git a/tests/qemu-iotests/098 b/tests/qemu-iotests/098
index 1e29d96b3d..2b029a41c8 100755
--- a/tests/qemu-iotests/098
+++ b/tests/qemu-iotests/098
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test qcow2's bdrv_make_empty for images without internal snapshots
 #
diff --git a/tests/qemu-iotests/099 b/tests/qemu-iotests/099
index 65e8e92572..2f1199ce04 100755
--- a/tests/qemu-iotests/099
+++ b/tests/qemu-iotests/099
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test valid filenames for blkdebug and blkverify representatively for
 # other protocols (such as NBD) when queried
diff --git a/tests/qemu-iotests/101 b/tests/qemu-iotests/101
index a4c1b6366a..4c4a8cea11 100755
--- a/tests/qemu-iotests/101
+++ b/tests/qemu-iotests/101
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test short file I/O
 #
diff --git a/tests/qemu-iotests/102 b/tests/qemu-iotests/102
index b898df436f..0dd3cee426 100755
--- a/tests/qemu-iotests/102
+++ b/tests/qemu-iotests/102
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for qemu-io -c map and qemu-img map
 #
diff --git a/tests/qemu-iotests/103 b/tests/qemu-iotests/103
index 8c1ebe0443..5fee8a0119 100755
--- a/tests/qemu-iotests/103
+++ b/tests/qemu-iotests/103
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for qcow2 metadata cache size specification
 #
diff --git a/tests/qemu-iotests/104 b/tests/qemu-iotests/104
index c70f28a9a1..3ebb74cf6e 100755
--- a/tests/qemu-iotests/104
+++ b/tests/qemu-iotests/104
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test image creation with aligned and unaligned sizes
 #
diff --git a/tests/qemu-iotests/105 b/tests/qemu-iotests/105
index 4d55a2d3ef..d804685110 100755
--- a/tests/qemu-iotests/105
+++ b/tests/qemu-iotests/105
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Create, read, write big image
 #
diff --git a/tests/qemu-iotests/106 b/tests/qemu-iotests/106
index b5d1ec4078..9e833a105c 100755
--- a/tests/qemu-iotests/106
+++ b/tests/qemu-iotests/106
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test preallocated resize of raw images
 #
diff --git a/tests/qemu-iotests/107 b/tests/qemu-iotests/107
index 268ba27688..86dc27343e 100755
--- a/tests/qemu-iotests/107
+++ b/tests/qemu-iotests/107
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Tests updates of the qcow2 L1 table
 #
diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
index 5f7076fba4..6b1ddbb5b6 100755
--- a/tests/qemu-iotests/108
+++ b/tests/qemu-iotests/108
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for repairing qcow2 images which cannot be repaired using
 # the on-disk refcount structures
diff --git a/tests/qemu-iotests/109 b/tests/qemu-iotests/109
index a51dd84b3d..cbdaab88dd 100755
--- a/tests/qemu-iotests/109
+++ b/tests/qemu-iotests/109
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test writing image headers of other formats into raw images
 #
diff --git a/tests/qemu-iotests/110 b/tests/qemu-iotests/110
index 139c02c2cf..4e2a3ce04d 100755
--- a/tests/qemu-iotests/110
+++ b/tests/qemu-iotests/110
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test case for relative backing file names in complex BDS trees
 #
diff --git a/tests/qemu-iotests/111 b/tests/qemu-iotests/111
index 3b43d1bd83..1a3d1ee741 100755
--- a/tests/qemu-iotests/111
+++ b/tests/qemu-iotests/111
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for non-existing backing file when creating a qcow2 image
 # and not specifying the size
diff --git a/tests/qemu-iotests/112 b/tests/qemu-iotests/112
index 20ff5c224a..7a5b859c81 100755
--- a/tests/qemu-iotests/112
+++ b/tests/qemu-iotests/112
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test cases for different refcount_bits values
 #
diff --git a/tests/qemu-iotests/113 b/tests/qemu-iotests/113
index f2703a2c50..5dc92b49ca 100755
--- a/tests/qemu-iotests/113
+++ b/tests/qemu-iotests/113
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for accessing creation options on image formats and
 # protocols not supporting image creation
diff --git a/tests/qemu-iotests/114 b/tests/qemu-iotests/114
index 26104fff6c..a3a0e2c807 100755
--- a/tests/qemu-iotests/114
+++ b/tests/qemu-iotests/114
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test invalid backing file format in qcow2 images
 #
diff --git a/tests/qemu-iotests/115 b/tests/qemu-iotests/115
index d254b18342..5c3f60bc1b 100755
--- a/tests/qemu-iotests/115
+++ b/tests/qemu-iotests/115
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test case for non-self-referential qcow2 refcount blocks
 #
diff --git a/tests/qemu-iotests/116 b/tests/qemu-iotests/116
index 941b07a1a9..4f40fcb3d2 100755
--- a/tests/qemu-iotests/116
+++ b/tests/qemu-iotests/116
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test error code paths for invalid QED images
 #
diff --git a/tests/qemu-iotests/117 b/tests/qemu-iotests/117
index f37b34f8b1..8210a0f70d 100755
--- a/tests/qemu-iotests/117
+++ b/tests/qemu-iotests/117
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test case for shared BDS between backend trees
 #
diff --git a/tests/qemu-iotests/118 b/tests/qemu-iotests/118
index adc8a848b5..d705a01b78 100755
--- a/tests/qemu-iotests/118
+++ b/tests/qemu-iotests/118
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test case for the QMP 'change' command and all other associated
 # commands
diff --git a/tests/qemu-iotests/119 b/tests/qemu-iotests/119
index ea6770a484..5770b50045 100755
--- a/tests/qemu-iotests/119
+++ b/tests/qemu-iotests/119
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # NBD test case for overriding BDRV_O_PROTOCOL by explicitly specifying
 # a driver
diff --git a/tests/qemu-iotests/120 b/tests/qemu-iotests/120
index 2931a7550f..03d5a3ba33 100755
--- a/tests/qemu-iotests/120
+++ b/tests/qemu-iotests/120
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Non-NBD test cases for overriding BDRV_O_PROTOCOL by explicitly
 # specifying a driver
diff --git a/tests/qemu-iotests/121 b/tests/qemu-iotests/121
index 90ea0db737..0abe27f9f7 100755
--- a/tests/qemu-iotests/121
+++ b/tests/qemu-iotests/121
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test cases for qcow2 refcount table growth
 #
diff --git a/tests/qemu-iotests/122 b/tests/qemu-iotests/122
index f7a3ae684a..5faf9ab034 100755
--- a/tests/qemu-iotests/122
+++ b/tests/qemu-iotests/122
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test some qemu-img convert cases
 #
diff --git a/tests/qemu-iotests/123 b/tests/qemu-iotests/123
index 01b771c76e..e19111f70d 100755
--- a/tests/qemu-iotests/123
+++ b/tests/qemu-iotests/123
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for qemu-img convert to NBD
 #
diff --git a/tests/qemu-iotests/124 b/tests/qemu-iotests/124
index 3705cbb6b3..3b21bc497f 100755
--- a/tests/qemu-iotests/124
+++ b/tests/qemu-iotests/124
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw backing
 #
 # Tests for incremental drive-backup
 #
diff --git a/tests/qemu-iotests/125 b/tests/qemu-iotests/125
index d510984045..55e45657a6 100755
--- a/tests/qemu-iotests/125
+++ b/tests/qemu-iotests/125
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test preallocated growth of qcow2 images
 #
diff --git a/tests/qemu-iotests/126 b/tests/qemu-iotests/126
index b7fce1e59d..7e4d1b3345 100755
--- a/tests/qemu-iotests/126
+++ b/tests/qemu-iotests/126
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing
 #
 # Tests handling of colons in filenames (which may be confused with protoc=
ol
 # prefixes)
diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
index a4fc866038..b30a49579f 100755
--- a/tests/qemu-iotests/127
+++ b/tests/qemu-iotests/127
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Test case for mirroring with dataplane
 #
diff --git a/tests/qemu-iotests/128 b/tests/qemu-iotests/128
index 3606c41760..d0e00d24b1 100755
--- a/tests/qemu-iotests/128
+++ b/tests/qemu-iotests/128
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test that opening O_DIRECT succeeds when image file I/O produces EIO
 #
diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index b0da4a5541..0873b4800d 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests that "bdrv_drain_all" doesn't drain block jobs
 #
diff --git a/tests/qemu-iotests/130 b/tests/qemu-iotests/130
index 77ad2aa13a..9d50960d66 100755
--- a/tests/qemu-iotests/130
+++ b/tests/qemu-iotests/130
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test that temporary backing file overrides (on the command line or in
 # blockdev-add) don't replace the original path stored in the image during
diff --git a/tests/qemu-iotests/131 b/tests/qemu-iotests/131
index 27870231cf..d7456cae5b 100755
--- a/tests/qemu-iotests/131
+++ b/tests/qemu-iotests/131
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # parallels format validation tests (created by QEMU)
 #
diff --git a/tests/qemu-iotests/132 b/tests/qemu-iotests/132
index 39ea43067e..367ea08036 100755
--- a/tests/qemu-iotests/132
+++ b/tests/qemu-iotests/132
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test mirror with unmap
 #
diff --git a/tests/qemu-iotests/133 b/tests/qemu-iotests/133
index 6f7cacc091..602c4b7a96 100755
--- a/tests/qemu-iotests/133
+++ b/tests/qemu-iotests/133
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto quick
 #
 # Test for reopen
 #
diff --git a/tests/qemu-iotests/134 b/tests/qemu-iotests/134
index 5f0fb86211..30cc53088e 100755
--- a/tests/qemu-iotests/134
+++ b/tests/qemu-iotests/134
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test encrypted read/write using plain bdrv_read/bdrv_write
 #
diff --git a/tests/qemu-iotests/135 b/tests/qemu-iotests/135
index 3b3d1dc2a5..299075b4c9 100755
--- a/tests/qemu-iotests/135
+++ b/tests/qemu-iotests/135
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test VPC open of image with large Max Table Entries value.
 #
diff --git a/tests/qemu-iotests/136 b/tests/qemu-iotests/136
index d59400c9fc..8fce88bd67 100755
--- a/tests/qemu-iotests/136
+++ b/tests/qemu-iotests/136
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Tests for block device statistics
 #
diff --git a/tests/qemu-iotests/137 b/tests/qemu-iotests/137
index 7ae86892f7..1cb2fe1653 100755
--- a/tests/qemu-iotests/137
+++ b/tests/qemu-iotests/137
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test qcow2 reopen
 #
diff --git a/tests/qemu-iotests/138 b/tests/qemu-iotests/138
index 54b01046ad..b99a9bddf6 100755
--- a/tests/qemu-iotests/138
+++ b/tests/qemu-iotests/138
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # General test case for qcow2's image check
 #
diff --git a/tests/qemu-iotests/139 b/tests/qemu-iotests/139
index 7120d3142b..401e8a915d 100755
--- a/tests/qemu-iotests/139
+++ b/tests/qemu-iotests/139
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test cases for the QMP 'blockdev-del' command
 #
diff --git a/tests/qemu-iotests/140 b/tests/qemu-iotests/140
index 8d2ce5d9e3..13bc4ca2d7 100755
--- a/tests/qemu-iotests/140
+++ b/tests/qemu-iotests/140
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for ejecting a BlockBackend with an NBD server attached to it
 #
diff --git a/tests/qemu-iotests/141 b/tests/qemu-iotests/141
index 5192d256e3..38736e16f2 100755
--- a/tests/qemu-iotests/141
+++ b/tests/qemu-iotests/141
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for ejecting BDSs with block jobs still running on them
 #
diff --git a/tests/qemu-iotests/143 b/tests/qemu-iotests/143
index f649b36195..8e2009df26 100755
--- a/tests/qemu-iotests/143
+++ b/tests/qemu-iotests/143
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto quick
 #
 # Test case for connecting to a non-existing NBD export name
 #
diff --git a/tests/qemu-iotests/144 b/tests/qemu-iotests/144
index 4569ac0b4b..60e9ddd75f 100755
--- a/tests/qemu-iotests/144
+++ b/tests/qemu-iotests/144
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 # Check live snapshot, followed by active commit, and another snapshot.
 #
 # This test is to catch the error case of BZ #1300209:
diff --git a/tests/qemu-iotests/145 b/tests/qemu-iotests/145
index 9427549651..a2ce92516d 100755
--- a/tests/qemu-iotests/145
+++ b/tests/qemu-iotests/145
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test the combination of -incoming and snapshot=3Don
 #
diff --git a/tests/qemu-iotests/146 b/tests/qemu-iotests/146
index 2e43abddfc..8bc9bbefa3 100755
--- a/tests/qemu-iotests/146
+++ b/tests/qemu-iotests/146
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test VHD image format creator detection and override
 #
diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index d7a9f31089..47dfa62e6b 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: img
 #
 # Test case for NBD's blockdev-add interface
 #
diff --git a/tests/qemu-iotests/148 b/tests/qemu-iotests/148
index 90931948e3..35f3861dfc 100755
--- a/tests/qemu-iotests/148
+++ b/tests/qemu-iotests/148
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test the rate limit of QMP events
 #
diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
index b4a21bf7b7..e84f0f8e1f 100755
--- a/tests/qemu-iotests/149
+++ b/tests/qemu-iotests/149
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw sudo
 #
 # Copyright (C) 2016 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/150 b/tests/qemu-iotests/150
index 3b1f32197a..ac6930ae20 100755
--- a/tests/qemu-iotests/150
+++ b/tests/qemu-iotests/150
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test that qemu-img convert -S 0 fully allocates the target image
 #
diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index f2df72c29c..182f6b5321 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Tests for active mirroring
 #
diff --git a/tests/qemu-iotests/152 b/tests/qemu-iotests/152
index cc2ea09654..4e179c340f 100755
--- a/tests/qemu-iotests/152
+++ b/tests/qemu-iotests/152
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests for drive-mirror with source size unaligned to granularity
 #
diff --git a/tests/qemu-iotests/153 b/tests/qemu-iotests/153
index 2b13111768..ef6a3cfd18 100755
--- a/tests/qemu-iotests/153
+++ b/tests/qemu-iotests/153
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test image locking
 #
diff --git a/tests/qemu-iotests/154 b/tests/qemu-iotests/154
index d68f66b9e0..83900cc072 100755
--- a/tests/qemu-iotests/154
+++ b/tests/qemu-iotests/154
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # qcow2 specific bdrv_pwrite_zeroes tests with backing files (complements =
034)
 #
diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index 571bce9de4..4ac3f86a8b 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test whether the backing BDSs are correct after completion of a
 # mirror block job; in "existing" modes (drive-mirror with
diff --git a/tests/qemu-iotests/156 b/tests/qemu-iotests/156
index 5559df63a5..4019ada313 100755
--- a/tests/qemu-iotests/156
+++ b/tests/qemu-iotests/156
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Tests oVirt-like storage migration:
 #  - Create snapshot
diff --git a/tests/qemu-iotests/157 b/tests/qemu-iotests/157
index 7cbac38099..0dc9ba68d2 100755
--- a/tests/qemu-iotests/157
+++ b/tests/qemu-iotests/157
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test command line configuration of block devices with qdev
 #
diff --git a/tests/qemu-iotests/158 b/tests/qemu-iotests/158
index ba4db6116a..6dcd14aeb2 100755
--- a/tests/qemu-iotests/158
+++ b/tests/qemu-iotests/158
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test encrypted read/write using backing files
 #
diff --git a/tests/qemu-iotests/159 b/tests/qemu-iotests/159
index f9690053a2..4eb476d3a8 100755
--- a/tests/qemu-iotests/159
+++ b/tests/qemu-iotests/159
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # qemu-img dd test with different block sizes
 #
diff --git a/tests/qemu-iotests/160 b/tests/qemu-iotests/160
index 0572b5ae9a..7984a9c6f7 100755
--- a/tests/qemu-iotests/160
+++ b/tests/qemu-iotests/160
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # qemu-img dd test for the skip option
 #
diff --git a/tests/qemu-iotests/161 b/tests/qemu-iotests/161
index f572a19af2..e161fb4679 100755
--- a/tests/qemu-iotests/161
+++ b/tests/qemu-iotests/161
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test reopening a backing image after block-stream and block-commit
 #
diff --git a/tests/qemu-iotests/162 b/tests/qemu-iotests/162
index c0053ed975..cf17f494d8 100755
--- a/tests/qemu-iotests/162
+++ b/tests/qemu-iotests/162
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test case for specifying runtime options of the wrong type to some
 # block drivers
diff --git a/tests/qemu-iotests/163 b/tests/qemu-iotests/163
index 5a3cc840a5..dedce8ef43 100755
--- a/tests/qemu-iotests/163
+++ b/tests/qemu-iotests/163
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Tests for shrinking images
 #
diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index fb56a769b4..abc4ffadd5 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests for persistent dirty bitmaps.
 #
diff --git a/tests/qemu-iotests/169 b/tests/qemu-iotests/169
index 2c5a132aa3..2d41e1cc03 100755
--- a/tests/qemu-iotests/169
+++ b/tests/qemu-iotests/169
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick migration
 #
 # Tests for dirty bitmaps migration.
 #
diff --git a/tests/qemu-iotests/170 b/tests/qemu-iotests/170
index 6c8f0e8085..41387e4d66 100755
--- a/tests/qemu-iotests/170
+++ b/tests/qemu-iotests/170
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # qemu-img dd test
 #
diff --git a/tests/qemu-iotests/171 b/tests/qemu-iotests/171
index 341064a1c6..babfe98753 100755
--- a/tests/qemu-iotests/171
+++ b/tests/qemu-iotests/171
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test 'offset' and 'size' options of the raw driver. Make sure we can't
 # (or can) read and write outside of the image size.
diff --git a/tests/qemu-iotests/172 b/tests/qemu-iotests/172
index 7195fb895a..4548e3aab9 100755
--- a/tests/qemu-iotests/172
+++ b/tests/qemu-iotests/172
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto
 #
 # Test floppy configuration
 #
diff --git a/tests/qemu-iotests/173 b/tests/qemu-iotests/173
index ec6d1705e5..9594f3c5ea 100755
--- a/tests/qemu-iotests/173
+++ b/tests/qemu-iotests/173
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test QAPI commands looking up protocol based images with relative
 # filename backing strings
diff --git a/tests/qemu-iotests/174 b/tests/qemu-iotests/174
index e2f14a38c6..1a141fbc0f 100755
--- a/tests/qemu-iotests/174
+++ b/tests/qemu-iotests/174
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto
 #
 # Test that qemu-io fail with non-zero exit code
 #
diff --git a/tests/qemu-iotests/175 b/tests/qemu-iotests/175
index 020ed8e61f..9bb7ea6936 100755
--- a/tests/qemu-iotests/175
+++ b/tests/qemu-iotests/175
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test creating raw image preallocation mode
 #
diff --git a/tests/qemu-iotests/176 b/tests/qemu-iotests/176
index 117c8b6954..e5be07d6a6 100755
--- a/tests/qemu-iotests/176
+++ b/tests/qemu-iotests/176
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing
 #
 # Commit changes into backing chains and empty the top image if the
 # backing image is not explicitly specified.
diff --git a/tests/qemu-iotests/177 b/tests/qemu-iotests/177
index 752d29f8ad..b609e0fdfb 100755
--- a/tests/qemu-iotests/177
+++ b/tests/qemu-iotests/177
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test corner cases with unusual block geometries
 #
diff --git a/tests/qemu-iotests/178 b/tests/qemu-iotests/178
index 7cf0e27154..b911b79915 100755
--- a/tests/qemu-iotests/178
+++ b/tests/qemu-iotests/178
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: img
 #
 # qemu-img measure sub-command tests
 #
diff --git a/tests/qemu-iotests/179 b/tests/qemu-iotests/179
index 9372dc30ef..ebd48e6ad2 100755
--- a/tests/qemu-iotests/179
+++ b/tests/qemu-iotests/179
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test case for write zeroes with unmap
 #
diff --git a/tests/qemu-iotests/181 b/tests/qemu-iotests/181
index 438c2dcd80..dadf3bf88e 100755
--- a/tests/qemu-iotests/181
+++ b/tests/qemu-iotests/181
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto migration
 #
 # Test postcopy live migration with shared storage
 #
diff --git a/tests/qemu-iotests/182 b/tests/qemu-iotests/182
index 56a2dd58e6..55a0384c08 100755
--- a/tests/qemu-iotests/182
+++ b/tests/qemu-iotests/182
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test image locking for POSIX locks
 #
diff --git a/tests/qemu-iotests/183 b/tests/qemu-iotests/183
index acdbefa310..16390fe93d 100755
--- a/tests/qemu-iotests/183
+++ b/tests/qemu-iotests/183
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw migration
 #
 # Test old-style block migration (migrate -b)
 #
diff --git a/tests/qemu-iotests/184 b/tests/qemu-iotests/184
index 33dd8d2a4f..1d923f509d 100755
--- a/tests/qemu-iotests/184
+++ b/tests/qemu-iotests/184
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test I/O throttle block filter driver interface
 #
diff --git a/tests/qemu-iotests/185 b/tests/qemu-iotests/185
index fd5e6ebe11..7bc8fe5767 100755
--- a/tests/qemu-iotests/185
+++ b/tests/qemu-iotests/185
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test exiting qemu while jobs are still running
 #
diff --git a/tests/qemu-iotests/186 b/tests/qemu-iotests/186
index 3ea0442d44..66f2418182 100755
--- a/tests/qemu-iotests/186
+++ b/tests/qemu-iotests/186
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test 'info block' with all kinds of configurations
 #
diff --git a/tests/qemu-iotests/187 b/tests/qemu-iotests/187
index c6e1dc57a0..46fd5678c7 100755
--- a/tests/qemu-iotests/187
+++ b/tests/qemu-iotests/187
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test switching between read-only and read-write
 #
diff --git a/tests/qemu-iotests/188 b/tests/qemu-iotests/188
index afca44df54..87e902352d 100755
--- a/tests/qemu-iotests/188
+++ b/tests/qemu-iotests/188
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test encrypted read/write using plain bdrv_read/bdrv_write
 #
diff --git a/tests/qemu-iotests/189 b/tests/qemu-iotests/189
index c9ce9d3bed..2f6f8a9309 100755
--- a/tests/qemu-iotests/189
+++ b/tests/qemu-iotests/189
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test encrypted read/write using backing files
 #
diff --git a/tests/qemu-iotests/190 b/tests/qemu-iotests/190
index 6d41650438..6011be0861 100755
--- a/tests/qemu-iotests/190
+++ b/tests/qemu-iotests/190
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # qemu-img measure sub-command tests on huge qcow2 files
 #
diff --git a/tests/qemu-iotests/191 b/tests/qemu-iotests/191
index b05db68141..bce1d8445e 100755
--- a/tests/qemu-iotests/191
+++ b/tests/qemu-iotests/191
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test commit block job where top has two parents
 #
diff --git a/tests/qemu-iotests/192 b/tests/qemu-iotests/192
index d2ba55dd90..d809187fca 100755
--- a/tests/qemu-iotests/192
+++ b/tests/qemu-iotests/192
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test NBD export with -incoming (non-shared storage migration use case fr=
om
 # libvirt)
diff --git a/tests/qemu-iotests/194 b/tests/qemu-iotests/194
index 9dc1bd3510..b668120ebb 100755
--- a/tests/qemu-iotests/194
+++ b/tests/qemu-iotests/194
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw migration quick
 #
 # Copyright (C) 2017 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/195 b/tests/qemu-iotests/195
index 48984b7ac1..dab6e0fe9c 100755
--- a/tests/qemu-iotests/195
+++ b/tests/qemu-iotests/195
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test change-backing-file command
 #
diff --git a/tests/qemu-iotests/196 b/tests/qemu-iotests/196
index e8fcf37273..2451515094 100755
--- a/tests/qemu-iotests/196
+++ b/tests/qemu-iotests/196
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick migration
 #
 # Test clearing unknown autoclear_features flag by qcow2 after
 # migration. This test mimics migration to older qemu.
diff --git a/tests/qemu-iotests/197 b/tests/qemu-iotests/197
index 95f05b0e34..74e751d06f 100755
--- a/tests/qemu-iotests/197
+++ b/tests/qemu-iotests/197
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for copy-on-read into qcow2
 #
diff --git a/tests/qemu-iotests/198 b/tests/qemu-iotests/198
index fb0d5a29d3..b4c498015f 100755
--- a/tests/qemu-iotests/198
+++ b/tests/qemu-iotests/198
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test commit of encrypted qcow2 files
 #
diff --git a/tests/qemu-iotests/199 b/tests/qemu-iotests/199
index 40774eed74..9cb8c55956 100755
--- a/tests/qemu-iotests/199
+++ b/tests/qemu-iotests/199
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw migration
 #
 # Tests for dirty bitmaps postcopy migration.
 #
diff --git a/tests/qemu-iotests/200 b/tests/qemu-iotests/200
index 59f7854b9f..c72cd72e56 100755
--- a/tests/qemu-iotests/200
+++ b/tests/qemu-iotests/200
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Block job co-routine race condition test.
 #
diff --git a/tests/qemu-iotests/201 b/tests/qemu-iotests/201
index 483eb189c5..412a6f1834 100755
--- a/tests/qemu-iotests/201
+++ b/tests/qemu-iotests/201
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw migration
 #
 # Test savevm and loadvm after live migration with postcopy flag
 #
diff --git a/tests/qemu-iotests/202 b/tests/qemu-iotests/202
index 920a8683ef..5f8afc85bd 100755
--- a/tests/qemu-iotests/202
+++ b/tests/qemu-iotests/202
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Copyright (C) 2017 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/203 b/tests/qemu-iotests/203
index 49eff5d405..3e2e35ad6b 100755
--- a/tests/qemu-iotests/203
+++ b/tests/qemu-iotests/203
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw auto migration
 #
 # Copyright (C) 2017 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/204 b/tests/qemu-iotests/204
index abb73dc381..e528b796f6 100755
--- a/tests/qemu-iotests/204
+++ b/tests/qemu-iotests/204
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test corner cases with unusual block geometries
 #
diff --git a/tests/qemu-iotests/205 b/tests/qemu-iotests/205
index 43432cb599..c0e107328f 100755
--- a/tests/qemu-iotests/205
+++ b/tests/qemu-iotests/205
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests for qmp command nbd-server-remove.
 #
diff --git a/tests/qemu-iotests/206 b/tests/qemu-iotests/206
index e2b50ae24d..4cf41eca7f 100755
--- a/tests/qemu-iotests/206
+++ b/tests/qemu-iotests/206
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test qcow2 and file image creation
 #
diff --git a/tests/qemu-iotests/207 b/tests/qemu-iotests/207
index 3d9c1208ca..813cfe7a27 100755
--- a/tests/qemu-iotests/207
+++ b/tests/qemu-iotests/207
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test ssh image creation
 #
diff --git a/tests/qemu-iotests/208 b/tests/qemu-iotests/208
index 1c3fc8c7fd..5ef7bc3caa 100755
--- a/tests/qemu-iotests/208
+++ b/tests/qemu-iotests/208
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Copyright (C) 2018 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/209 b/tests/qemu-iotests/209
index 65c1a1e70a..2dd0bbb905 100755
--- a/tests/qemu-iotests/209
+++ b/tests/qemu-iotests/209
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests for NBD BLOCK_STATUS extension
 #
diff --git a/tests/qemu-iotests/210 b/tests/qemu-iotests/210
index e49896e23d..f03c13c186 100755
--- a/tests/qemu-iotests/210
+++ b/tests/qemu-iotests/210
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test luks and file image creation
 #
diff --git a/tests/qemu-iotests/211 b/tests/qemu-iotests/211
index 163994d559..e66737970f 100755
--- a/tests/qemu-iotests/211
+++ b/tests/qemu-iotests/211
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test VDI and file image creation
 #
diff --git a/tests/qemu-iotests/212 b/tests/qemu-iotests/212
index 800f92dd84..b7a53949f8 100755
--- a/tests/qemu-iotests/212
+++ b/tests/qemu-iotests/212
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test parallels and file image creation
 #
diff --git a/tests/qemu-iotests/213 b/tests/qemu-iotests/213
index 1eee45276a..c7b5c0e7e2 100755
--- a/tests/qemu-iotests/213
+++ b/tests/qemu-iotests/213
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test vhdx and file image creation
 #
diff --git a/tests/qemu-iotests/214 b/tests/qemu-iotests/214
index af677d90b8..4c0e8f2b48 100755
--- a/tests/qemu-iotests/214
+++ b/tests/qemu-iotests/214
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # Test qcow2 image compression
 #
diff --git a/tests/qemu-iotests/215 b/tests/qemu-iotests/215
index f99bae78c7..d464596f14 100755
--- a/tests/qemu-iotests/215
+++ b/tests/qemu-iotests/215
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for copy-on-read into qcow2, using the COR filter driver
 #
diff --git a/tests/qemu-iotests/216 b/tests/qemu-iotests/216
index 372f042d3e..7374bede19 100755
--- a/tests/qemu-iotests/216
+++ b/tests/qemu-iotests/216
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Copy-on-read tests using a COR filter node
 #
diff --git a/tests/qemu-iotests/217 b/tests/qemu-iotests/217
index d89116ccad..df370549f8 100755
--- a/tests/qemu-iotests/217
+++ b/tests/qemu-iotests/217
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # I/O errors when working with internal qcow2 snapshots, and repairing
 # the result
diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
index 1325ba9eaa..c8cca23161 100755
--- a/tests/qemu-iotests/218
+++ b/tests/qemu-iotests/218
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # This test covers what happens when a mirror block job is cancelled
 # in various phases of its existence.
diff --git a/tests/qemu-iotests/219 b/tests/qemu-iotests/219
index b8774770c4..9523627451 100755
--- a/tests/qemu-iotests/219
+++ b/tests/qemu-iotests/219
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Copyright (C) 2018 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/220 b/tests/qemu-iotests/220
index a9259b7127..126749c707 100755
--- a/tests/qemu-iotests/220
+++ b/tests/qemu-iotests/220
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto
 #
 # max limits on compression in huge qcow2 files
 #
diff --git a/tests/qemu-iotests/221 b/tests/qemu-iotests/221
index 0e9096fec7..2db84a3962 100755
--- a/tests/qemu-iotests/221
+++ b/tests/qemu-iotests/221
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qemu-img vs. unaligned images
 # (See also 253, which is the O_DIRECT version)
diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/222
index bf1718e179..f1ee316abb 100755
--- a/tests/qemu-iotests/222
+++ b/tests/qemu-iotests/222
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # This test covers the basic fleecing workflow, which provides a
 # point-in-time snapshot of a node that can be queried over NBD.
diff --git a/tests/qemu-iotests/223 b/tests/qemu-iotests/223
index 56fbc5fb09..18ff35ac3a 100755
--- a/tests/qemu-iotests/223
+++ b/tests/qemu-iotests/223
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test reading dirty bitmap over NBD
 #
diff --git a/tests/qemu-iotests/224 b/tests/qemu-iotests/224
index e91fb26fd8..40e6beaa07 100755
--- a/tests/qemu-iotests/224
+++ b/tests/qemu-iotests/224
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test json:{} filenames with qemu-internal BDSs
 # (the one of commit, to be precise)
diff --git a/tests/qemu-iotests/225 b/tests/qemu-iotests/225
index c9a334c7e9..c25ac26949 100755
--- a/tests/qemu-iotests/225
+++ b/tests/qemu-iotests/225
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test vmdk backing file correlation
 #
diff --git a/tests/qemu-iotests/226 b/tests/qemu-iotests/226
index c1e1fb2b1c..6a9adb4a0b 100755
--- a/tests/qemu-iotests/226
+++ b/tests/qemu-iotests/226
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto quick
 #
 # This test covers expected filetypes for the file, host_cdrom and
 # host_device drivers.
diff --git a/tests/qemu-iotests/227 b/tests/qemu-iotests/227
index 637d7c3726..7e45a47ac6 100755
--- a/tests/qemu-iotests/227
+++ b/tests/qemu-iotests/227
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test query-blockstats with different ways to create a BB
 #
diff --git a/tests/qemu-iotests/228 b/tests/qemu-iotests/228
index 64bc82ee23..5e723d342c 100755
--- a/tests/qemu-iotests/228
+++ b/tests/qemu-iotests/228
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test for when a backing file is considered overridden (thus, a
 # json:{} filename is generated for the overlay) and when it is not
diff --git a/tests/qemu-iotests/229 b/tests/qemu-iotests/229
index 866168b236..9b8ecee2a7 100755
--- a/tests/qemu-iotests/229
+++ b/tests/qemu-iotests/229
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: auto quick
 #
 # Test for force canceling a running blockjob that is paused in
 # an error state.
diff --git a/tests/qemu-iotests/231 b/tests/qemu-iotests/231
index c0b053ac30..0f66d0ca36 100755
--- a/tests/qemu-iotests/231
+++ b/tests/qemu-iotests/231
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test legacy and modern option parsing for rbd/ceph.  This will not
 # actually connect to a ceph server, but rather looks for the appropriate
diff --git a/tests/qemu-iotests/232 b/tests/qemu-iotests/232
index 685356ac3b..b30faaa218 100755
--- a/tests/qemu-iotests/232
+++ b/tests/qemu-iotests/232
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test for auto-read-only
 #
diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
index a5c17c3963..7ce5764903 100755
--- a/tests/qemu-iotests/233
+++ b/tests/qemu-iotests/233
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test NBD TLS certificate / authorization integration
 #
diff --git a/tests/qemu-iotests/234 b/tests/qemu-iotests/234
index 324c1549fd..e443fc59cc 100755
--- a/tests/qemu-iotests/234
+++ b/tests/qemu-iotests/234
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: quick migration
 #
 # Copyright (C) 2018 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235
index 760826128e..7517f78626 100755
--- a/tests/qemu-iotests/235
+++ b/tests/qemu-iotests/235
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: quick
 #
 # Simple mirror test
 #
diff --git a/tests/qemu-iotests/236 b/tests/qemu-iotests/236
index 8ce927a16c..75b63ad4cf 100755
--- a/tests/qemu-iotests/236
+++ b/tests/qemu-iotests/236
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: quick
 #
 # Test bitmap merges.
 #
diff --git a/tests/qemu-iotests/237 b/tests/qemu-iotests/237
index 50ba364a3e..4068298f8c 100755
--- a/tests/qemu-iotests/237
+++ b/tests/qemu-iotests/237
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test vmdk and file image creation
 #
diff --git a/tests/qemu-iotests/238 b/tests/qemu-iotests/238
index d4e060228c..662ba94131 100755
--- a/tests/qemu-iotests/238
+++ b/tests/qemu-iotests/238
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: quick
 #
 # Regression test for throttle group member unregister segfault with iothr=
ead
 #
diff --git a/tests/qemu-iotests/239 b/tests/qemu-iotests/239
index b0991ffe59..4f0037148d 100755
--- a/tests/qemu-iotests/239
+++ b/tests/qemu-iotests/239
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test case for dmg
 #
diff --git a/tests/qemu-iotests/240 b/tests/qemu-iotests/240
index 8b4337b58d..d9428e50bc 100755
--- a/tests/qemu-iotests/240
+++ b/tests/qemu-iotests/240
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # Test hot plugging and unplugging with iothreads
 #
diff --git a/tests/qemu-iotests/241 b/tests/qemu-iotests/241
index 8dae8d39e4..c962c8b607 100755
--- a/tests/qemu-iotests/241
+++ b/tests/qemu-iotests/241
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qemu-nbd vs. unaligned images
 #
diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
index 97617876bc..757ac569bc 100755
--- a/tests/qemu-iotests/242
+++ b/tests/qemu-iotests/242
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test for qcow2 bitmap printed information
 #
diff --git a/tests/qemu-iotests/243 b/tests/qemu-iotests/243
index a61852f6d9..160ea02538 100755
--- a/tests/qemu-iotests/243
+++ b/tests/qemu-iotests/243
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qcow2 preallocation
 #
diff --git a/tests/qemu-iotests/244 b/tests/qemu-iotests/244
index 2ec1815e6f..037a961422 100755
--- a/tests/qemu-iotests/244
+++ b/tests/qemu-iotests/244
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qcow2 with external data files
 #
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 1001275a44..9fc1e3e0c8 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test cases for the QMP 'x-blockdev-reopen' command
 #
diff --git a/tests/qemu-iotests/246 b/tests/qemu-iotests/246
index 59a216a839..71a17a024d 100755
--- a/tests/qemu-iotests/246
+++ b/tests/qemu-iotests/246
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test persistent bitmap resizing.
 #
diff --git a/tests/qemu-iotests/247 b/tests/qemu-iotests/247
index 87e37b39e2..70b9a42a33 100755
--- a/tests/qemu-iotests/247
+++ b/tests/qemu-iotests/247
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test for auto-read-only with commit block job
 #
diff --git a/tests/qemu-iotests/248 b/tests/qemu-iotests/248
index 68c374692e..a4af7b99df 100755
--- a/tests/qemu-iotests/248
+++ b/tests/qemu-iotests/248
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test resume mirror after auto pause on ENOSPC
 #
diff --git a/tests/qemu-iotests/249 b/tests/qemu-iotests/249
index 2b99c9789e..623acdb97c 100755
--- a/tests/qemu-iotests/249
+++ b/tests/qemu-iotests/249
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test that a backing image is put back in read-only mode after
 # block-commit (both when it fails and when it succeeds).
diff --git a/tests/qemu-iotests/250 b/tests/qemu-iotests/250
index 9bb6b94d74..b9ee43214a 100755
--- a/tests/qemu-iotests/250
+++ b/tests/qemu-iotests/250
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test big discard in qcow2 shrink
 #
diff --git a/tests/qemu-iotests/251 b/tests/qemu-iotests/251
index 7918ba3559..b0900898fa 100755
--- a/tests/qemu-iotests/251
+++ b/tests/qemu-iotests/251
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test qemu-img convert --salvage
 #
diff --git a/tests/qemu-iotests/252 b/tests/qemu-iotests/252
index 83280c1715..a6df22ff3f 100755
--- a/tests/qemu-iotests/252
+++ b/tests/qemu-iotests/252
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto backing quick
 #
 # Tests for rebasing COW images that require zero cluster support
 #
diff --git a/tests/qemu-iotests/253 b/tests/qemu-iotests/253
index d88d5afa45..35039d20a8 100755
--- a/tests/qemu-iotests/253
+++ b/tests/qemu-iotests/253
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qemu-img vs. unaligned images; O_DIRECT version
 # (Originates from 221)
diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
index ee66c986db..f4965d343b 100755
--- a/tests/qemu-iotests/254
+++ b/tests/qemu-iotests/254
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw backing quick
 #
 # Test external snapshot with bitmap copying and moving.
 #
diff --git a/tests/qemu-iotests/255 b/tests/qemu-iotests/255
index 4a4818bafb..2cb2a98f7c 100755
--- a/tests/qemu-iotests/255
+++ b/tests/qemu-iotests/255
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test commit job graph modifications while requests are active
 #
diff --git a/tests/qemu-iotests/256 b/tests/qemu-iotests/256
index e34074c83e..a34f7f7785 100755
--- a/tests/qemu-iotests/256
+++ b/tests/qemu-iotests/256
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw auto quick
 #
 # Test incremental/backup across iothread contexts
 #
diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
index 004a433b8b..ce1918fa37 100755
--- a/tests/qemu-iotests/257
+++ b/tests/qemu-iotests/257
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test bitmap-sync backups (incremental, differential, and partials)
 #
diff --git a/tests/qemu-iotests/258 b/tests/qemu-iotests/258
index 091755a45c..d09174912b 100755
--- a/tests/qemu-iotests/258
+++ b/tests/qemu-iotests/258
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Very specific tests for adjacent commit/stream block jobs
 #
diff --git a/tests/qemu-iotests/259 b/tests/qemu-iotests/259
index 62e29af05f..76cde429c4 100755
--- a/tests/qemu-iotests/259
+++ b/tests/qemu-iotests/259
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test generic image creation fallback (by using NBD)
 #
diff --git a/tests/qemu-iotests/260 b/tests/qemu-iotests/260
index 30c0de380d..f2de0dbf87 100755
--- a/tests/qemu-iotests/260
+++ b/tests/qemu-iotests/260
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Tests for temporary external snapshot when we have bitmaps.
 #
diff --git a/tests/qemu-iotests/261 b/tests/qemu-iotests/261
index ddcb04f285..e8e61f8d6e 100755
--- a/tests/qemu-iotests/261
+++ b/tests/qemu-iotests/261
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test case for qcow2's handling of extra data in snapshot table entries
 # (and more generally, how certain cases of broken snapshot tables are
diff --git a/tests/qemu-iotests/262 b/tests/qemu-iotests/262
index 8835dce7be..6a9925bcac 100755
--- a/tests/qemu-iotests/262
+++ b/tests/qemu-iotests/262
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick migration
 #
 # Copyright (C) 2019 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/263 b/tests/qemu-iotests/263
index d2c030fae9..54d009ce24 100755
--- a/tests/qemu-iotests/263
+++ b/tests/qemu-iotests/263
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test encrypted write that crosses cluster boundary of two unallocated cl=
usters
 # Based on 188
diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 879123a343..9ef7fe31de 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw
 #
 # Test nbd reconnect
 #
diff --git a/tests/qemu-iotests/265 b/tests/qemu-iotests/265
index 00f2ec769e..f796361903 100755
--- a/tests/qemu-iotests/265
+++ b/tests/qemu-iotests/265
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test reverse-ordered qcow2 writes on a sub-cluster level
 #
diff --git a/tests/qemu-iotests/266 b/tests/qemu-iotests/266
index 91bdf8729e..71ce81d0df 100755
--- a/tests/qemu-iotests/266
+++ b/tests/qemu-iotests/266
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test VPC and file image creation
 #
diff --git a/tests/qemu-iotests/267 b/tests/qemu-iotests/267
index 3146273eef..4fd18fefdb 100755
--- a/tests/qemu-iotests/267
+++ b/tests/qemu-iotests/267
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick snapshot
 #
 # Test which nodes are involved in internal snapshots
 #
diff --git a/tests/qemu-iotests/268 b/tests/qemu-iotests/268
index 78c3f4db3a..4fce2ef75f 100755
--- a/tests/qemu-iotests/268
+++ b/tests/qemu-iotests/268
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw auto quick
 #
 # Test write request with required alignment larger than the cluster size
 #
diff --git a/tests/qemu-iotests/270 b/tests/qemu-iotests/270
index b9a12b908c..f49894149f 100755
--- a/tests/qemu-iotests/270
+++ b/tests/qemu-iotests/270
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing quick
 #
 # Test large write to a qcow2 image
 #
diff --git a/tests/qemu-iotests/272 b/tests/qemu-iotests/272
index c2f782d47b..015347a0c9 100755
--- a/tests/qemu-iotests/272
+++ b/tests/qemu-iotests/272
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test compressed write to a qcow2 image at an offset above 4 GB
 #
diff --git a/tests/qemu-iotests/273 b/tests/qemu-iotests/273
index 00ff79bcf8..e537c0be62 100755
--- a/tests/qemu-iotests/273
+++ b/tests/qemu-iotests/273
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: backing quick
 #
 # Test multiple blockdev-snapshot calls with 'backing': null
 #
diff --git a/tests/qemu-iotests/277 b/tests/qemu-iotests/277
index 04aa15a3d5..5b5dbd9283 100755
--- a/tests/qemu-iotests/277
+++ b/tests/qemu-iotests/277
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test NBD client reconnection
 #
diff --git a/tests/qemu-iotests/279 b/tests/qemu-iotests/279
index 30d29b1cb2..14378d99c0 100755
--- a/tests/qemu-iotests/279
+++ b/tests/qemu-iotests/279
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw backing quick
 #
 # Test qemu-img --backing-chain --image-opts
 #
diff --git a/tests/qemu-iotests/280 b/tests/qemu-iotests/280
index 69288fdd0e..5a3fca906e 100755
--- a/tests/qemu-iotests/280
+++ b/tests/qemu-iotests/280
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw migration quick
 #
 # Copyright (C) 2019 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/281 b/tests/qemu-iotests/281
index 0bf973bca6..956698083f 100755
--- a/tests/qemu-iotests/281
+++ b/tests/qemu-iotests/281
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: rw quick
 #
 # Test cases for blockdev + IOThread interactions
 #
diff --git a/tests/qemu-iotests/282 b/tests/qemu-iotests/282
index 081eb12080..dfc61a65a8 100755
--- a/tests/qemu-iotests/282
+++ b/tests/qemu-iotests/282
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw img quick
 #
 # Test qemu-img file cleanup for LUKS when using a non-UTF8 secret
 #
diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
index 55b7cff953..e0eefa685c 100644
--- a/tests/qemu-iotests/283
+++ b/tests/qemu-iotests/283
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# group: auto quick
 #
 # Test for backup-top filter permission activation failure
 #
diff --git a/tests/qemu-iotests/284 b/tests/qemu-iotests/284
index 071e89b33e..d0e46d064e 100755
--- a/tests/qemu-iotests/284
+++ b/tests/qemu-iotests/284
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw
 #
 # Test ref count checks on encrypted images
 #
diff --git a/tests/qemu-iotests/286 b/tests/qemu-iotests/286
index f14445ba4a..1fd24d5f74 100755
--- a/tests/qemu-iotests/286
+++ b/tests/qemu-iotests/286
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: rw quick
 #
 # Test qemu-img snapshot -l
 #
diff --git a/tests/qemu-iotests/288 b/tests/qemu-iotests/288
index 6c62065aef..47aca6592a 100755
--- a/tests/qemu-iotests/288
+++ b/tests/qemu-iotests/288
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# group: quick
 #
 # qemu-img measure tests for LUKS images
 #
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index f7a2d3d6c3..bbdf22f2a1 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -155,6 +155,14 @@ export VALGRIND_QEMU=3D
 export IMGKEYSECRET=3D
 export IMGOPTSSYNTAX=3Dfalse
=20
+all_tests() {
+    ls ??? | grep '^[0-9]\{3\}'
+}
+
+find_tests() {
+    all_tests | xargs grep -l "^# group: .*$1"
+}
+
 # Save current tty settings, since an aborting qemu call may leave things
 # screwed up
 STTY_RESTORE=3D
@@ -168,9 +176,7 @@ do
     if $group
     then
         # arg after -g
-        group_list=3D$(sed -n <"$source_iotests/group" -e 's/$/ /' -e "/^[=
0-9][0-9][0-9].* $r /"'{
-s/ .*//p
-}')
+        group_list=3D$(find_tests "$r")
         if [ -z "$group_list" ]
         then
             echo "Group \"$r\" is empty or not defined?"
@@ -193,10 +199,8 @@ s/ .*//p
     then
         # arg after -x
         # Populate $tmp.list with all tests
-        awk '/^[0-9]{3,}/ {print $1}' "${source_iotests}/group" > $tmp.lis=
t 2>/dev/null
-        group_list=3D$(sed -n <"$source_iotests/group" -e 's/$/ /' -e "/^[=
0-9][0-9][0-9].* $r /"'{
-s/ .*//p
-}')
+        all_tests > $tmp.list 2>/dev/null
+        group_list=3D$(find_tests "$r")
         if [ -z "$group_list" ]
         then
             echo "Group \"$r\" is empty or not defined?"
@@ -504,7 +508,7 @@ testlist options
 BEGIN        { for (t=3D'$start'; t<=3D'$end'; t++) printf "%03d\n",t }' \
         | while read id
         do
-            if grep -s "^$id\( \|\$\)" "$source_iotests/group" >/dev/null
+            if test -f "$id";
             then
                 # in group file ... OK
                 echo $id >>$tmp.list
@@ -566,7 +570,7 @@ else
         touch $tmp.list
     else
         # no test numbers, do everything from group file
-        sed -n -e '/^[0-9][0-9][0-9]*/s/^\([0-9]*\).*/\1/p' <"$source_iote=
sts/group" >$tmp.list
+        all_tests > $tmp.list
     fi
 fi
=20
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
deleted file mode 100644
index ec2b2302e5..0000000000
--- a/tests/qemu-iotests/group
+++ /dev/null
@@ -1,297 +0,0 @@
-#
-# QA groups control file
-# Defines test groups
-#
-# Some notes about the groups:
-#
-# - do not start group names with a digit
-#
-# - quick : Tests in this group should finish within some few seconds.
-#
-# - img : Tests in this group can be used to excercise the qemu-img tool.
-#
-# - auto : Tests in this group are used during "make check" and should be
-#   runnable in any case. That means they should run with every QEMU binar=
y
-#   (also non-x86), with every QEMU configuration (i.e. must not fail if
-#   an optional feature is not compiled in - but reporting a "skip" is ok)=
,
-#   work at least with the qcow2 file format, work with all kind of host
-#   filesystems and users (e.g. "nobody" or "root") and must not take too
-#   much memory and disk space (since CI pipelines tend to fail otherwise)=
.
-#
-
-#
-# test-group association ... one line per test
-#
-001 rw auto quick
-002 rw auto quick
-003 rw auto
-004 rw auto quick
-005 img auto quick
-# 006 was removed, do not reuse
-007 snapshot auto
-008 rw auto quick
-009 rw auto quick
-010 rw auto quick
-011 rw auto quick
-012 auto quick
-013 rw auto
-014 rw
-015 rw snapshot
-# 016 was removed, do not reuse
-017 rw backing auto quick
-018 rw backing auto quick
-019 rw backing auto quick
-020 rw backing auto quick
-021 io auto quick
-022 rw snapshot auto
-023 rw
-024 rw backing auto quick
-025 rw auto quick
-026 rw blkdbg
-027 rw auto quick
-028 rw backing quick
-029 rw auto quick
-030 rw auto backing
-031 rw auto quick
-032 rw auto quick
-033 rw auto quick
-034 rw auto backing quick
-035 rw auto quick
-036 rw auto quick
-037 rw auto backing quick
-038 rw auto backing quick
-039 rw auto quick
-040 rw auto
-041 rw auto backing
-042 rw auto quick
-043 rw auto backing
-044 rw
-045 rw quick
-046 rw auto aio quick
-047 rw auto quick
-048 img auto quick
-049 rw auto
-050 rw auto backing quick
-051 rw
-052 rw auto backing quick
-053 rw auto quick
-054 rw auto quick
-055 rw
-056 rw backing
-057 rw
-058 rw quick
-059 rw quick
-060 rw auto quick
-061 rw auto
-062 rw auto quick
-063 rw auto quick
-064 rw quick
-065 rw quick
-066 rw auto quick
-067 rw quick
-068 rw quick
-069 rw auto quick
-070 rw quick
-071 rw auto quick
-072 rw auto quick
-073 rw auto quick
-074 rw auto quick
-075 rw quick
-076 io
-077 rw quick
-078 rw quick
-079 rw auto
-080 rw auto
-081 rw quick
-082 rw quick
-083 rw
-084 img quick
-085 rw
-086 rw auto quick
-087 rw quick
-088 rw quick
-089 rw auto quick
-090 rw auto quick
-091 rw migration
-092 rw quick
-093 throttle
-094 rw quick
-095 rw quick
-096 rw quick
-097 rw auto backing
-098 rw auto backing quick
-099 rw auto quick
-# 100 was removed, do not reuse
-101 rw quick
-102 rw quick
-103 rw auto quick
-104 rw auto
-105 rw auto quick
-106 rw quick
-107 rw auto quick
-108 rw auto quick
-109 rw
-110 rw auto backing quick
-111 rw auto quick
-112 rw
-113 rw quick
-114 rw auto quick
-115 rw
-116 rw quick
-117 rw auto
-118 rw
-119 rw quick
-120 rw auto quick
-121 rw
-122 rw
-123 rw quick
-124 rw backing
-125 rw
-126 rw auto backing
-127 rw auto backing quick
-128 rw quick
-129 rw quick
-130 rw quick
-131 rw quick
-132 rw quick
-133 auto quick
-134 rw auto quick
-135 rw
-136 rw
-137 rw auto
-138 rw auto quick
-139 rw quick
-140 rw auto quick
-141 rw auto quick
-142
-143 auto quick
-144 rw quick
-145 quick
-146 quick
-147 img
-148 rw quick
-149 rw sudo
-150 rw auto quick
-151 rw
-152 rw quick
-153 rw quick
-154 rw auto backing quick
-155 rw
-156 rw auto quick
-157 quick
-158 rw auto quick
-159 rw auto quick
-160 rw quick
-161 rw auto quick
-162 quick
-163 rw
-165 rw quick
-169 rw quick migration
-170 rw auto quick
-171 rw quick
-172 auto
-173 rw
-174 auto
-175 quick
-176 rw auto backing
-177 rw auto quick
-178 img
-179 rw auto quick
-181 rw auto migration
-182 rw quick
-183 rw migration
-184 rw auto quick
-185 rw
-186 rw auto
-187 rw auto
-188 rw quick
-189 rw
-190 rw auto quick
-191 rw auto
-192 rw auto quick
-194 rw migration quick
-195 rw auto quick
-196 rw quick migration
-197 rw quick
-198 rw
-199 rw migration
-200 rw
-201 rw migration
-202 rw quick
-203 rw auto migration
-204 rw quick
-205 rw quick
-206 rw
-207 rw
-208 rw quick
-209 rw quick
-210 rw
-211 rw quick
-212 rw quick
-213 rw quick
-214 rw auto
-215 rw quick
-216 rw quick
-217 rw auto quick
-218 rw quick
-219 rw
-220 rw auto
-221 rw quick
-222 rw quick
-223 rw quick
-224 rw quick
-225 rw quick
-226 auto quick
-227 quick
-228 rw quick
-229 auto quick
-231 quick
-232 quick
-233 quick
-234 quick migration
-235 quick
-236 quick
-237 rw quick
-238 quick
-239 rw quick
-240 quick
-241 rw quick
-242 rw quick
-243 rw quick
-244 rw auto quick
-245 rw
-246 rw quick
-247 rw quick
-248 rw quick
-249 rw auto quick
-250 rw quick
-251 rw auto quick
-252 rw auto backing quick
-253 rw quick
-254 rw backing quick
-255 rw quick
-256 rw auto quick
-257 rw
-258 rw quick
-259 rw auto quick
-260 rw quick
-261 rw
-262 rw quick migration
-263 rw quick
-264 rw
-265 rw auto quick
-266 rw quick
-267 rw auto quick snapshot
-268 rw auto quick
-270 rw backing quick
-272 rw
-273 backing quick
-277 rw quick
-279 rw backing quick
-280 rw migration quick
-281 rw quick
-282 rw img quick
-283 auto quick
-284 rw
-286 rw quick
-288 quick
--=20
2.21.0


