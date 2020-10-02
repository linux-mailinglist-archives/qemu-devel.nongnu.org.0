Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE339281564
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 16:39:04 +0200 (CEST)
Received: from localhost ([::1]:45836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOMD9-000626-Sh
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 10:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kOMA1-0002nh-C4; Fri, 02 Oct 2020 10:35:51 -0400
Received: from mail-bn7nam10on2121.outbound.protection.outlook.com
 ([40.107.92.121]:34016 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kOM9x-0003Ww-M0; Fri, 02 Oct 2020 10:35:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjsnzhOyHDNnMRQk1UX5xclNp95wmKhJix+/Wvw8Pz9O0a0ceU1w8eQNk+osVRKvFtA6eMBTtRNj2KTHJ8F5XqWoX6kkQ6mgub3QAdrzmf92E3HgsmieFSbzyMRVIcxNCeZR5GXQAQ2Jgwjc7wZ4mRAEAAMy3Kq7cGH8KHXKuhm3TjNsQGlMLHp9SU8jPF+6veIEWdNZ9Fb+6scXM73Py88fOOEl1ArITiVHFtelf6SOWakJS844G4+1mEGKEiJEWkZwS3fFyvJfUHMq4S1R7ljZNXKFODdORhy2qJCIfknHJFN/wlEXpnRIg969zhu1wtwmDRx4LkoI7JMX4dtVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHuDi4su2swqCyRlKNLtfbFKp13UlvHOEax6/lq+jus=;
 b=ELR0z0MMaqnio9CKXzUXC9//oJSvD4E+/FKwx4fjsRkSgqZAZ8kRnpDI7zeDdPgA11JiQouDac7PXtHBEuEPbE5LVtD9EowafZvjvd4XtP7i2nz+TmVMlm/py/D2LutCEypHY9WOsFmovvSqE1pweWjdgYsnDUWx+yiaBkfhcBgRwmYW4W5J7vKLtrooxrXnvlY4oMvVEcqIrb7RxjMuPyTDkXs+dnoqfeOxR7IlDyswmwrc93SK5zOnfGul2lln4rgVdG9WMVgjmCaB82hFYY7ECL8r+3eouuhpVj+UPJC7MLPGohIkRMU+H2zRnzG2Q6/ggOMW2QQjaX73NPhO2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHuDi4su2swqCyRlKNLtfbFKp13UlvHOEax6/lq+jus=;
 b=DAbKDybLEFc5AFD5KVcI5SqG+fxuHU+aXzN3eWMv5yYIGwRzddEoG7AZwpQG7UsRpAaPePI1LOYfQNOudjrLq3VdJ7EcroxJMtXvREA8wH8QJZrZlGRDBWoMfwAU3dDSmxUV4V36X5wzKP1Nebcvs69HQeLdI3k99nlatp2pUTo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3997.namprd03.prod.outlook.com (2603:10b6:805:c6::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 14:35:39 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::61ae:93a8:b26c:77b8]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::61ae:93a8:b26c:77b8%4]) with mapi id 15.20.3433.032; Fri, 2 Oct 2020
 14:35:39 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci.yml: Only run one test-case per fuzzer
Date: Fri,  2 Oct 2020 10:35:24 -0400
Message-Id: <20201002143524.56930-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [72.93.72.163]
X-ClientProxiedBy: MN2PR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:208:fc::48) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.93.72.163) by
 MN2PR02CA0035.namprd02.prod.outlook.com (2603:10b6:208:fc::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.36 via Frontend Transport; Fri, 2 Oct 2020 14:35:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5491d1fc-7f10-4e4e-cd58-08d866e06e8e
X-MS-TrafficTypeDiagnostic: SN6PR03MB3997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3997B51F584FD24B09FA1C7ABA310@SN6PR03MB3997.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Mn1Q0uYgNDdaiUFjvBUSAWcJVPd33GA2vNqvhMzSkgFDQ0DtDZ2OC9AypcCviY38h7HqQy4x6ZAvTtSbEXQf/CtKq/MaoW7nmmZTCIpijtbMUNGRvj6FuWAOVCSp6UqJhzVLNab0O65fef01FZyHU/2mKOocLl5rCgkvZ3xzceXsA58REMCMC0t2PnnseV0a/PuHfVXAMsNT4usUiierghoO7744dGTfkMdcyoBiBtSmtNWNc3B2DHdiyI4L3k4FWWO+a6hQfmb10oGEmFHFm77iw22KrRMjZqe9x144ny7DmrKaB+Q0A39H5DtdImS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(16526019)(186003)(86362001)(6666004)(52116002)(66556008)(6506007)(4744005)(66476007)(83380400001)(6512007)(478600001)(66946007)(75432002)(36756003)(5660300002)(8676002)(2906002)(2616005)(4326008)(786003)(956004)(316002)(54906003)(1076003)(6916009)(6486002)(26005)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 3X6bDRd21+nkjCx1d6rAo56VahALt5m2OAoOJl/U6yFtBUdLq6qjLPmfe6hvCu99hoZz8XsWWGLh/ElQ6lASqCMbiJLZ9Jqt214wmBeJDgOP8nd5kv7zUz4UkYc+EMCWPOgiH8CcP6y2/plOTx2DAWj6LyVbsUYvzi55PlP/b8VFysYp8paapY9IbQjtSKPsD+OBVWYewca8i6aNDwONv4N6VbS7Pfg7P91Y4WqJtvWBigMx7RC5rmwr2ZvnFO8EmkzAHPDU9riGRFKxyRnlSpH0SFg3+Ma2KuwYuiwwcCs9CVLSTXkNgBKLhgBX71+oAe/VFTiyBASynL34MmVkZeKW/m8f6zOmAbyiISYcnNkROam1oX3HjbpE0BerIjckP5zU/U1g6xx6zk4IEEptDuXvf3Tktg/UyTvy3anDhbrDP0Zty4dbdp3ielUAIu2RU71VCPrSLse9ynJj2dZO8sxqrJcbkPt4JMsYn/yqKksHwkHVJ8FqMrqE4T/7olUdHIIVjYPPNh2aSfvaUO2k5Q6Q76Cr+LuR2vPdZq2i1PXijTt5pKyZQQV1+3J3YexYweaPe8/3wmvVA+Z09I7zux+4gyLNld5EsW7moNomTLZ022iGS/ABxpi9bFOucam0SiMLkc11QE6xIOs77EEZJw==
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5491d1fc-7f10-4e4e-cd58-08d866e06e8e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 14:35:38.9713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lyfl1LHPLzhKCfRGUuYD4/A1iGSb6NLaOFY8zj6WaGPJGwgTbZqEgypCjEMNVPd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3997
Received-SPF: pass client-ip=40.107.92.121; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 10:35:39
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.821,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With 1000 runs, there is a non-negligible chance that the fuzzer can
trigger a crash. With this CI job, we care about catching build/runtime
issues in the core fuzzing code. Actual device fuzzing takes place on
oss-fuzz. For these purposes, only running one input should be
sufficient.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a51c89554f..075c15d45c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -303,7 +303,7 @@ build-oss-fuzz:
                       | grep -v slirp); do
         grep "LLVMFuzzerTestOneInput" ${fuzzer} > /dev/null 2>&1 || continue ;
         echo Testing ${fuzzer} ... ;
-        "${fuzzer}" -runs=1000 -seed=1 || exit 1 ;
+        "${fuzzer}" -runs=1 -seed=1 || exit 1 ;
       done
     # Unrelated to fuzzer: run some tests with -fsanitize=address
     - cd build-oss-fuzz && make check-qtest-i386 check-unit
-- 
2.28.0


