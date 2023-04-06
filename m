Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0530F6D9810
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 15:22:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkPZ2-0000cH-2L; Thu, 06 Apr 2023 09:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.de_schampheleire@nokia.com>)
 id 1pkKdb-00008s-Uk
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:06:31 -0400
Received: from mail-am7eur03on2121.outbound.protection.outlook.com
 ([40.107.105.121] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.de_schampheleire@nokia.com>)
 id 1pkKdZ-0003S9-Ph
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:06:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBN8J8r1iDag6nDfonJUd/1SW/FMqoUK1X4gxBYIL96q9u73fCRrrq/ZmREokLG1Ak/59qmC40Bgp/rlLni+UiFRRZRRa2kdt747UVOCtnlik30Zm8rxtypeqaAJyj9YeeTiH/GGDgfAVVbOyEmAPuQIg0dR0Dljp8hynukRlsgA3AeaFDRUCYIT83xIi6ZV4YY+o0aMk5x5lhE+sg/J8YvD0+nqaBQti0kWfIPgne5Gfn7PmG0K1MtxTfCsZOCSaB0Z2wPdr1fSrXDkpDfpIDihFY/22PqS4TEBztAdt3vLf+C5/6XLv5lT8Kj3NYS8X/eQVGbjy2KQGRKnq6gmuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga/1jfshazGodK69eCCwnBlyiQgrK8CYKOUVlPmTV+A=;
 b=XzkOsct6SRVvgZ6fo6/M3IllG5TnC3Zp2r2wiQQmdzJik6zNH5DCHWxkGgYygmcNppXli/HEW5GJ0RxySGRK5ELu1zr309vIUGussuY7f3GDEzUTtEixVwUzfX9jAtWymT4vm6NdpcGjv/8c+Vre+6DLHOnfMSit736eRJ5UE/d/RhEqU8j0vtkU6DESYglMvJj7D2QuLsKYjLOK2nOD/2/75YXkEOfkkPn7ekdIgRGE2HMZRq2gPCgYcI+c/Fh8gzubcGEYfxvEILTcAKZ15ujBUFYEV58cnxnGf8FTUjAWesed3NHCKp9ODAvuEREDO9FmUM/y81BYGq8icQdP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga/1jfshazGodK69eCCwnBlyiQgrK8CYKOUVlPmTV+A=;
 b=OTtYf9DT+TwD4FV5Q36q+Liw/fYu7203J4SzLB/jhl8M50KGNc5WO5UyS0GdV9T/Ugt7X0N1iudv9llPKily/Vvz3h+WXfYFaKkIav6J/VSqppnLf+FEUdbfIIAUczMC8lHochcqnp0lMLWyJFIU83+OVxD49bDVi7jgsh1CIvUFwKQL8k/zrni3f7l0oIU6m86fG7CylxVSuQxYUnbRLN7AlnrF6E9Tel5kVZK0GQpZWqvl0X/HyLMrS2mgHmLcEutM14AHxrvJnUYkQT81A3s1nvC0imYWmus7isbg4MedYUkFP7xQoegtlu0LedXQa74A10/nEwl8FxLygki64g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM0PR0702MB3700.eurprd07.prod.outlook.com
 (2603:10a6:208:23::27) by DBBPR07MB7609.eurprd07.prod.outlook.com
 (2603:10a6:10:1e1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 08:01:23 +0000
Received: from AM0PR0702MB3700.eurprd07.prod.outlook.com
 ([fe80::447d:928b:ac32:587e]) by AM0PR0702MB3700.eurprd07.prod.outlook.com
 ([fe80::447d:928b:ac32:587e%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 08:01:23 +0000
From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Subject: [PATCH] tracetool: use relative paths for '#line' preprocessor
 directives
Date: Thu,  6 Apr 2023 10:00:45 +0200
Message-Id: <20230406080045.21696-1-thomas.de_schampheleire@nokia.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0501CA0034.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::44) To AM0PR0702MB3700.eurprd07.prod.outlook.com
 (2603:10a6:208:23::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3700:EE_|DBBPR07MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 272576ef-509d-482a-01e6-08db36751d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: slmUxtVQLsjddoiYAK9aeIXMHQSCesP6BiUkj//2tWO9T8acOPLS+XvZ1jmDMQW+tFi7u1um0Wgl2gEi7QGuy8sP+qE8D2hdt73rUtcUMmz//8wl7xt1xXmZfc2Rv2gZrjNcN5bk/aBQg0gaTLqocGMO9jJX6lvNtkgXvOSLb6kjaNeDVzWgchZtJnw9Ps79aRjfC46Ekn6sHD9ao91Ceg8wAWzVsBZO34QiQ/85rS454ugH4N/JAY4GiHk+edR4gk/ej+faHDg8VhiqmS+lTxrZu4yjFcO4s4z0qFXLsQu35h7JPYgjW9h9Xu+V+iGun/C+/40DKfbyVBgg7SLqMR8FgKHcNxjSRya39MAhcurFfSay9aSffCDnshD8eDwc2+YNW136yWIoO5tDJeWmM50gFpHBuYts/A9HTxmc1CboA3OgNerw6DUxRud4ziPaL12hI3zJhhKJuhoF2f9mQSxkxMIsIhTp9hoJG2RKoTtB/pSPqk0dtwng3CrfPSCjaX69/FFigSz1xmJkO3WTiO1w4ztKUXNmLUMSGdpRwP/KmvFOk/9N8fry34tM+cnvk1QAiNy+mzVzHj3W7PhrJwaCLM+KHS4r+LU50Cy5Fwg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0702MB3700.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(6916009)(4326008)(41300700001)(66476007)(66556008)(8676002)(66946007)(478600001)(5660300002)(8936002)(54906003)(6506007)(316002)(6512007)(6486002)(1076003)(6666004)(107886003)(2906002)(2616005)(186003)(83380400001)(86362001)(82960400001)(38100700002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q1OBJofTUVveuKPZAZ90h163L5YfiASsRtxB/1JEaCbYT9IyFiYgF+73p7zN?=
 =?us-ascii?Q?vGCNfK+vILexG1xhAFg8fNbjTUZk8qou3QhDs3ZLUug1BcOQmog5Mu1OlEpg?=
 =?us-ascii?Q?vHiHQP+Q/sKKRGoHg5VdEZQwmEVTt0qpY/UkxSLvV08oFKsAK35neP0Vuoxo?=
 =?us-ascii?Q?or5M/8OV5oH8xN6Az/FQXpydW4uF6S+Dljmba7TPBzvCknGEn1PZHwzs2e/c?=
 =?us-ascii?Q?BerulryqvvjNLx91e6qMZyEmaoDq8VWFwx+YsrzG7pyt3ygwPDlkiL3SoWtc?=
 =?us-ascii?Q?+zzmU44qwzLaWptefs1A2+/9OtpVu5HWsehi53fKH4goSla6/WzvUb/mpe8Q?=
 =?us-ascii?Q?lB7Pen2r6A6h59tiEJUiQaOkwjp6sjWzB3OJDTunmKYsUip+zZjqXUSwF/vR?=
 =?us-ascii?Q?vxDsT71oqnKzWR9My88cXRvOAkBKuiodKrzouZUVYHSgewQKvq5nFDNfisL2?=
 =?us-ascii?Q?cRGJup4kb+iDa2XOfcqvp07Yj6k9ORhGu8oTVO8XNr5Q88Br/IuZr7HDcgWh?=
 =?us-ascii?Q?3pSAqz3e2GEpmjTS93rRZnzicbRN8jJW6azVXjYxGtElqhzULOtAcjtR1Y/h?=
 =?us-ascii?Q?UsZbHTCA9lBtnH706E9u0CS8wDzHI/0w1W1cfrh5w8LICG/2yY94Da9rs8aH?=
 =?us-ascii?Q?TgN5SwqF6fhDtZKNQv2qbU5ocg2tswPjHnVq1US+aOBJO9OIJj+VM9Yr8R2C?=
 =?us-ascii?Q?+wmvJDSp6yuUVjK6l/jgywhJqVkr3h8kK5Nv1ayON+xZuhY8VHlC0BEcjOLB?=
 =?us-ascii?Q?Lv7XLQqJo9/iVYbtSGgJVRU3rmL+a+ykOrEa4jxOfhJ12H6vhxSxLQAmzQV9?=
 =?us-ascii?Q?13NPNNsS27vUJhnVGkx9EXSGiVfg4EBB4rL80heFKCWr93gLnlZGaXsOThrr?=
 =?us-ascii?Q?c5ebhIaYeMfnu6J39MY1ZGZMivHCMxmZmQtT2pPv5mo5avLdnbrLxw25HYBD?=
 =?us-ascii?Q?J+CP7y3WLfikFqP0bTZg7BZbGZxmluKqtEKaZ6/AQpO2ooln1367445XktKx?=
 =?us-ascii?Q?XdmsJIMnOomogZ2hsvZTJaulhxhlVkumJ5d6BbcJDrBQTuefI7Y0W22j4Oxe?=
 =?us-ascii?Q?EfuXWm4G7mIZg8rEjeNAl1t1qNIyyb4yVJPjcQkYO+/qTitw2MyxVPJmPLx5?=
 =?us-ascii?Q?5F3a3tIOMO2iQM+ZfL5nYW/RcP7epDZfD6K5WgN0t25qE0PDOfjNEKwWo7ue?=
 =?us-ascii?Q?exIYWNK+YiEbxavPctnm/w0F+Vd4MBUVMDNdcoaKKh76Jgl+Bk41W0qs/+lp?=
 =?us-ascii?Q?nxNQI475ha0vSVTIIyihRFEVLyDoAUGAwRGTvWU2fQmsXHy4/T/LRXHsGAzf?=
 =?us-ascii?Q?35tU4J/+oRllpk6862ruxmxO4LNN7rSCGYSfY8NWBRuf2YleGysZYzXmE5Pz?=
 =?us-ascii?Q?3pVkUd05oh46bD23FmSp7qeG/0kqE1bxjKJgJxvydMm6fLA4adoqLjsW3+o+?=
 =?us-ascii?Q?Whq/FfnQxMehmtJsOuJchOBYNTvkxDTcS/Hrr2Zhf8Grp1b7zOTCsdtGNIt7?=
 =?us-ascii?Q?CCejvyIvc8aEn03CCf4CUFmPRFH3urOxpM1BgwzfVNAPpRoRT2MNbwtnGBM9?=
 =?us-ascii?Q?qXFA/LKwb9NTT9jOPBY82hjX9M8hmAzdZ06SyF+ytusa7xCb7DCoiTeKqsWq?=
 =?us-ascii?Q?t9aVylEQwlu02gBNVpjAMPG5YPYIvQHXK6c+crUiNQCQeUbgEHD3yRgYXwX/?=
 =?us-ascii?Q?ha7xxneNdy/Wp+seIwxYqEpTyHY=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272576ef-509d-482a-01e6-08db36751d02
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3700.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 08:01:23.5835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RgUs4asPKpyVlam6Uk1eljnsT3HwdbrwFqSUK7aCxQUswT4eiedsynYgqzoyk5fcgTIR8g6eTKQbETtWNy9IzBh4ljToz7reUWEY6wUOGp0H4EwO+RaMPCqhEgXyr1j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7609
Received-SPF: pass client-ip=40.107.105.121;
 envelope-from=thomas.de_schampheleire@nokia.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Apr 2023 09:22:02 -0400
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

The event filename is an absolute path. Convert it to a relative path when
writing '#line' directives, to preserve reproducibility of the generated
output when different base paths are used.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 scripts/tracetool/backend/ftrace.py | 4 +++-
 scripts/tracetool/backend/log.py    | 4 +++-
 scripts/tracetool/backend/syslog.py | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/tracetool/backend/ftrace.py b/scripts/tracetool/backend/ftrace.py
index 5fa30ccc08..baed2ae61c 100644
--- a/scripts/tracetool/backend/ftrace.py
+++ b/scripts/tracetool/backend/ftrace.py
@@ -12,6 +12,8 @@
 __email__      = "stefanha@redhat.com"
 
 
+import os.path
+
 from tracetool import out
 
 
@@ -45,7 +47,7 @@ def generate_h(event, group):
         args=event.args,
         event_id="TRACE_" + event.name.upper(),
         event_lineno=event.lineno,
-        event_filename=event.filename,
+        event_filename=os.path.relpath(event.filename),
         fmt=event.fmt.rstrip("\n"),
         argnames=argnames)
 
diff --git a/scripts/tracetool/backend/log.py b/scripts/tracetool/backend/log.py
index 17ba1cd90e..de27b7e62e 100644
--- a/scripts/tracetool/backend/log.py
+++ b/scripts/tracetool/backend/log.py
@@ -12,6 +12,8 @@
 __email__      = "stefanha@redhat.com"
 
 
+import os.path
+
 from tracetool import out
 
 
@@ -53,7 +55,7 @@ def generate_h(event, group):
         '    }',
         cond=cond,
         event_lineno=event.lineno,
-        event_filename=event.filename,
+        event_filename=os.path.relpath(event.filename),
         name=event.name,
         fmt=event.fmt.rstrip("\n"),
         argnames=argnames)
diff --git a/scripts/tracetool/backend/syslog.py b/scripts/tracetool/backend/syslog.py
index 5a3a00fe31..012970f6cc 100644
--- a/scripts/tracetool/backend/syslog.py
+++ b/scripts/tracetool/backend/syslog.py
@@ -12,6 +12,8 @@
 __email__      = "stefanha@redhat.com"
 
 
+import os.path
+
 from tracetool import out
 
 
@@ -41,7 +43,7 @@ def generate_h(event, group):
         '    }',
         cond=cond,
         event_lineno=event.lineno,
-        event_filename=event.filename,
+        event_filename=os.path.relpath(event.filename),
         name=event.name,
         fmt=event.fmt.rstrip("\n"),
         argnames=argnames)
-- 
2.39.2


