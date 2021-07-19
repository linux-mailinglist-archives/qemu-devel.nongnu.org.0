Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C78E3CEBAB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:07:30 +0200 (CEST)
Received: from localhost ([::1]:43308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZY1-0007M0-Gw
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRj-0006Kh-8r
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:00:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRe-0005hl-43
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:00:59 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJuc5F002487; Mon, 19 Jul 2021 20:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=iCfktZ7AINHjdFcfSuSEq/+qqI6dWDIrfO4IAZ/GUXU=;
 b=d4ipzbzhzUbN1byk8JjckrJdDKF8YM9XsPuS8OcMxaYjcCsP3WvRegsE6YTMUOqSbEZa
 ZAozAKdraCSrgy0nL+7AvJIDl54g+NfGi6n6uTm9nYh78dRQ0NH7yRumrTmB9sE337gR
 Eyc+0RtY4JJpliGCG+rqmeL0ycWxzrjg3ShwIDvosaoYffKtKK2RrJ25y5wlLRygIqp4
 d/uvbBIddKFCB6kkZ/LQtK84BFnO1ztqTNzkqpuSSEg0TQzQeoRXNIh6vCSABBSvJJOJ
 uNefi3Awpa40L39YPUI6TimKZyPQGC+mgxTRp6nMWdZcbnQeFZ05zCU6TUICHmDgydST nQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=iCfktZ7AINHjdFcfSuSEq/+qqI6dWDIrfO4IAZ/GUXU=;
 b=WvaceVhg0hW+NZaLVshtLBct+HIinXXN9kOM5zRMDPRRecR1XQknL8DaKVutRRXWx6nK
 cVtha7JlgvhU1ASCD0u7wrXdBV9/YY8dScAfg731Ody50j3KtWLWYqaTSSMiDOW0DyY8
 RqTXkz6mdcJdJ6ADfZsNEwTvzW26oyc1/39lbHyeX7xBDqC28Q06YroqjR1ttRoDTDgj
 F4sSEmNsA1Kf46RPWayspDkPB1Ud5c6+rp7ZtUuzfzkY/NiEm8JXigf1PJegrqzi0Mjf
 kCsXl1K4IW5QdWAXLD+yydhidifooS+9Xq1vY/uPHSjxF1ce6cVxtBErZ/RF6s34xhCo 3w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vrn5ja0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JK0WYs127596;
 Mon, 19 Jul 2021 20:00:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by userp3020.oracle.com with ESMTP id 39v8ytbghn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhqYjbIuUYGjRdkzoF0XCAZrVkHSGdSWN6VX4MPsc3tkWr7iKqHP1uYZ9cH2txRw/wdh4oTrepSMm+wIOwA49OBcLzXAUoPDJ7+Tz/WFW2Q1GkIS7rSHIz5qAbhsqH5F419TRh0ZeQbY2w+oZACPZkQE0pnb2MWtI9U84xXS5BhmBtFpsOToIqHnWib8BDQQsi0Oq/NVZ9+ncTGIvUdYLwwdGZmFglerZ3SM3Kx5ig8A8XiYj4yZALtvOrdCMd4YIh/2ngRJoHY4prDlfnm91tady2wvWtbIcZCAr1+9D4W+mW2VpHtjznTAIo3PLNfoMJzGvY+G7GypjTz2kgwHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCfktZ7AINHjdFcfSuSEq/+qqI6dWDIrfO4IAZ/GUXU=;
 b=GXDF9SseJmcnhK/2sinK2oeTMGUk+QCxoE1Vy31TKKIRaWlDZt13AylV+RmqWDYPuuPII/lNLEJ6YnPYQvmsIuuHxhyasoQp6P+qW3pRDhJloZX2XYtPvRLq1LPrLysiHP17ehPCiEWRDDBNZKV0SE4gOVftjZyVIO9+43fMbSgvJyBZ1DMUodO89ij+tEVKT1ChuokqZFEJv8bs0QQfSqtnizMLmPhP5sbxxSCSFg3fh0r5FzuJmtPNc8SdoTuEniRMzEjwO473OvNJcsC9zoE/8RJDsGf+l1o4BV7Vp/r+GbD2cO0SpF71cPKL9vn18vzOD1M9vW5A3Mr9d/RWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCfktZ7AINHjdFcfSuSEq/+qqI6dWDIrfO4IAZ/GUXU=;
 b=HdDj9ayJOzN+RrLpyoS+J3iQyfn32i/5yDsK/V5jUz0jreg3xaYVJLrJZR4+3k3fgNxQf7p/xyGyvEYSn8tIRs4egohVSAaa+ZqdtiI+daCriUW1u/qNIYhZFpnFHjwy9QOnKlTItFt0cARcthUQecv0jCF7g7e0NAnLmU7RNX4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4240.namprd10.prod.outlook.com (2603:10b6:208:1d9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 20:00:18 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:00:18 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server 01/11] vfio-user: build library
Date: Mon, 19 Jul 2021 16:00:03 -0400
Message-Id: <5002d6a67cb6c429b2e3d21e106b468176e82a1f.1626722742.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626722742.git.jag.raman@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:806:d0::15) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.44) by
 SA0PR11CA0040.namprd11.prod.outlook.com (2603:10b6:806:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:00:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20106847-7384-41a3-df05-08d94aefd55a
X-MS-TrafficTypeDiagnostic: MN2PR10MB4240:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB4240B8913565FAB9CBA14AE290E19@MN2PR10MB4240.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u70lsgtFQ4T0f4SJ2xtegW8+Yh9Q8+wA80KBvSh7OMwcakf5bcNOmGQOTxpsZ94qLO1ZWB92KvwZ/xCExGVtT87els+T17QE7QHypxfrn1aBcImAtMOXE5fP+6z4alrcbjxxXzuMbaMVt1EFLdwAMh0ex1SrrXTOsomTzi/GI6eifSvz34b1mXI0Y26OvHFOSBdReP374yTpKb6PCYhRgZutRXh9J++9oep798oZElWnt6A4mO+haFK3a554+wxKGt76zgStQa5H9EEVYocYCwswFeFLzaQ6iEVlmHj5rMIhmUzK/rdPQJMOZqcmGoHTgvG+BmWilampDWIXzxyrGemnhTLeZPthoaMz4JdwaH/X+sm+tcZ5EKqt90nE5Do9wSmt88ym3o69Sc/sVcGX0ROlqckGZMzbixualwKtt+MdQcXyGh642cJbYXElCqMjgDZ7sfbuw/xQypbivBineBMnu/8sMw0UL+4KaCLYrgyEQqqELQkUGP6HHvGVQe0mr3aalA7qPUxKq0QFE7HFYi2wyyjdrbqh0dmPFzBX7ZXj5MWxHCFqjIlXd9JwLLJcEsEoV/W8Dzir7JMeVrZV9ST9L0GrQHX3JwNal/15pW8L0m5rCgm+ws7A0GgWsripcgEp9BWcPaJAbLgb1lf64dkS2zJUaZoKRSIAqp6Knw0JTAaFeTbm3wqqm9zbIPyvsIhJI7w+bmC0BgLZ83tQPwuGG4JVpevEQpvG1y7E1bZ2n05KE/+SYkU8Y/BcMf7+1CkUItvOspZFlioRORDGY7+UuzduwXQsf6QEpp31uELF8FNuAlA3eOmf5v+jceuE+8Xq9DWhoaToepkcaq3xaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(346002)(136003)(376002)(66476007)(966005)(66556008)(8936002)(6486002)(66946007)(36756003)(478600001)(52116002)(38350700002)(7696005)(4326008)(38100700002)(316002)(107886003)(6666004)(6916009)(2906002)(5660300002)(186003)(26005)(8676002)(86362001)(956004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dWno1BOs4/lI2wV/669UM1jpUAtwHjZRoCeZndkf1Q5SRxolwwG65ycCYna1ipmCMcsYFQ8r6l6T1gQqhdWpxnXUs8nezGuJB80AxLoYZ0j7tmYbhb12beVacrNOk1lVrcso1/lEJUW5MGS/hmPytLJcSis+JrYGY9o0S20ZpM8iIJx0S6+ZvJBoF8HQFx0bPE5vCbYKZkHwA8X8UQTfCmVB35tZlghAsBQZeMNvvBGAKofy0aPDKKeZsOtFuoqvbC8D/EyNn14PRI6EbQN9uxM0CDAlgmAoO/6ZkSQnwyVL7wj6PMzZVBeWdS3T/6331COGDjO2LQiXHqKf9RCmCRYhPfLQsA8cV3QriBu5uoHxihTBH2/YlK/TkUXG//Ca6qZFN0q3kXSxdeP2AGO5vMHdIMdvKvPBWqvWAD+I5zbf+kL0na7zYH8pORNRRc5E+pTfApD1poZSaAeP5UO3YuJ+qxMRsFgNYaf6N1Bg5O0ckI0hxXh5Imfp1HAcWErBZtmc6DRoMy+jhZyRudRbrd/lGg7SOdiD+KgJF1af6K+nNo+vg+ODCH6Uzyd8BLyniwdJB6qq8YECFMIvVW5Hhmfy1l74SH0GnyWXyXlntloV+B+oKeHAE5+zRc+TPhbhvvJdQwj5iOcSs07P3YsJMrmNJS7V8wjGDmmo0QWe/vE7zPGqcAWqdy5HuUNKbyS6CdySUB7alCngFsrsxA1XmmQj9dzp/JH4ALrFs7c3WDr2otxY8TJjpZCpkPi+Y/mV
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20106847-7384-41a3-df05-08d94aefd55a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:00:18.8546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0bF/x/TsyBJ+kZZcS31BEAK84mQa/eRx5aB+HckhjWV5GsnonIb7EbA6uDdJ37FkN2Uf1Vt98EkAjVADsCzng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4240
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190113
X-Proofpoint-GUID: zHCUygofHV4UmGj48DNk3P0fmPLxs_6G
X-Proofpoint-ORIG-GUID: zHCUygofHV4UmGj48DNk3P0fmPLxs_6G
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add the libvfio-user library as a submodule. build it as part of QEMU

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 configure             | 11 +++++++++++
 meson.build           | 35 +++++++++++++++++++++++++++++++++++
 .gitmodules           |  3 +++
 MAINTAINERS           |  7 +++++++
 hw/remote/meson.build |  2 ++
 libvfio-user          |  1 +
 6 files changed, 59 insertions(+)
 create mode 160000 libvfio-user

diff --git a/configure b/configure
index 49b5481..bc1c961 100755
--- a/configure
+++ b/configure
@@ -4297,6 +4297,17 @@ but not implemented on your system"
 fi
 
 ##########################################
+# check for multiprocess
+
+case "$multiprocess" in
+  auto | enabled )
+    if test "$git_submodules_action" != "ignore"; then
+      git_submodules="${git_submodules} libvfio-user"
+    fi
+    ;;
+esac
+
+##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
 
diff --git a/meson.build b/meson.build
index 6e4d2d8..f2f9f86 100644
--- a/meson.build
+++ b/meson.build
@@ -1894,6 +1894,41 @@ if get_option('cfi') and slirp_opt == 'system'
          + ' Please configure with --enable-slirp=git')
 endif
 
+vfiouser = not_found
+if have_system and multiprocess_allowed
+  have_internal = fs.exists(meson.current_source_dir() / 'libvfio-user/Makefile')
+
+  if not have_internal
+    error('libvfio-user source not found - please pull git submodule')
+  endif
+
+  vfiouser_files = [
+    'libvfio-user/lib/dma.c',
+    'libvfio-user/lib/irq.c',
+    'libvfio-user/lib/libvfio-user.c',
+    'libvfio-user/lib/migration.c',
+    'libvfio-user/lib/pci.c',
+    'libvfio-user/lib/pci_caps.c',
+    'libvfio-user/lib/tran_sock.c',
+  ]
+
+  vfiouser_inc = include_directories('libvfio-user/include', 'libvfio-user/lib')
+
+  json_c = dependency('json-c', required: false)
+  if not json_c.found()
+    json_c = dependency('libjson-c')
+  endif
+
+  libvfiouser = static_library('vfiouser',
+                               build_by_default: false,
+                               sources: vfiouser_files,
+                               dependencies: json_c,
+                               include_directories: vfiouser_inc)
+
+  vfiouser = declare_dependency(link_with: libvfiouser,
+                                include_directories: vfiouser_inc)
+endif
+
 fdt = not_found
 fdt_opt = get_option('fdt')
 if have_system
diff --git a/.gitmodules b/.gitmodules
index 08b1b48..a583a39 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
 	url = https://gitlab.com/qemu-project/vbootrom.git
+[submodule "libvfio-user"]
+	path = libvfio-user
+	url = https://github.com/nutanix/libvfio-user.git
diff --git a/MAINTAINERS b/MAINTAINERS
index aa4df6c..99646e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3350,6 +3350,13 @@ F: semihosting/
 F: include/semihosting/
 F: tests/tcg/multiarch/arm-compat-semi/
 
+libvfio-user Library
+M: Thanos Makatos <thanos.makatos@nutanix.com>
+M: John Levon <john.levon@nutanix.com>
+T: https://github.com/nutanix/libvfio-user.git
+S: Maintained
+F: libvfio-user/*
+
 Multi-process QEMU
 M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
 M: Jagannathan Raman <jag.raman@oracle.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index e6a5574..fb35fb8 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,6 +7,8 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: vfiouser)
+
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
diff --git a/libvfio-user b/libvfio-user
new file mode 160000
index 0000000..2a0a929
--- /dev/null
+++ b/libvfio-user
@@ -0,0 +1 @@
+Subproject commit 2a0a92912d598de871ab47c034432c5fa6546dc4
-- 
1.8.3.1


