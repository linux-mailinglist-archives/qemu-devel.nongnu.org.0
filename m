Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82C72CF753
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 00:12:17 +0100 (CET)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klKFM-0005lg-LL
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 18:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1klK9w-0002Mz-Sr
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 18:06:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63516
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1klK9v-0004Pu-8s
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 18:06:40 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4N2M3n050247
 for <qemu-devel@nongnu.org>; Fri, 4 Dec 2020 18:06:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aGYsLEfjNdTpZB4vkIeKX01BF466+XYE/b0AUNSJroY=;
 b=X84or/39Uzwg4mhdgPivmOiJnMREgtVHO3BhMPNRRJRy414gR+AnOBA1b/pyCRcYEgMo
 TsQOwU/BBCe9+dZnsS63Dil1XG5fJNdoMbyFW1BRHA/Kpk7TVWFYP7h4NOKTawJfpnRx
 esJAl6ZbfvpdZ1X+Xt6A1jmk+dJy3XNEjjhG48GZWOea8OW/xpPWXNrbxr14jiljDjQY
 TK3F3VYoAHe8wQJNEsQQQgJzjixm7RXI3DyLBjn9+eZmCB9CwjxQDbL0wdugOxr/xvbn
 S1iuoZxADHRmcyAOLxKTf4bECpBZrFpNSHL+HXJFccfpgHmNqYkLguaxW8wROgL88BJG xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 357qtgb2tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 18:06:34 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B4N2wM1053057
 for <qemu-devel@nongnu.org>; Fri, 4 Dec 2020 18:06:30 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 357qtgb2t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 18:06:30 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4N1eXI017499;
 Fri, 4 Dec 2020 23:06:30 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 355rf8a09w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 23:06:29 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4N6S1e10093198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 23:06:28 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B3976A051;
 Fri,  4 Dec 2020 23:06:28 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1A816A04D;
 Fri,  4 Dec 2020 23:06:27 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.160.122.174])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 23:06:27 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] configure,meson: add option to enable LTO
Date: Fri,  4 Dec 2020 18:06:11 -0500
Message-Id: <20201204230615.2392-2-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
References: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_12:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 suspectscore=1 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=765
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040128
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch allows to compile QEMU with link-time optimization (LTO).
Compilation with LTO is handled directly by meson. This patch only
adds the option in configure and forwards the request to meson

Tested with all major versions of clang from 6 to 12

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
---
 configure   | 7 +++++++
 meson.build | 1 +
 2 files changed, 8 insertions(+)

diff --git a/configure b/configure
index 18c26e0389..fee118518b 100755
--- a/configure
+++ b/configure
@@ -242,6 +242,7 @@ host_cc="cc"
 audio_win_int=""
 libs_qga=""
 debug_info="yes"
+lto="false"
 stack_protector=""
 safe_stack=""
 use_containers="yes"
@@ -1167,6 +1168,10 @@ for opt do
   ;;
   --disable-werror) werror="no"
   ;;
+  --enable-lto) lto="true"
+  ;;
+  --disable-lto) lto="false"
+  ;;
   --enable-stack-protector) stack_protector="yes"
   ;;
   --disable-stack-protector) stack_protector="no"
@@ -1751,6 +1756,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   module-upgrades try to load modules from alternate paths for upgrades
   debug-tcg       TCG debugging (default is disabled)
   debug-info      debugging information
+  lto             Enable Link-Time Optimization.
   sparse          sparse checker
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
@@ -7014,6 +7020,7 @@ NINJA=$ninja $meson setup \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
+        -Db_lto=$lto \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index e3386196ba..ebd1c690e0 100644
--- a/meson.build
+++ b/meson.build
@@ -2044,6 +2044,7 @@ summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
 summary_info += {'sparse enabled':    sparse.found()}
 summary_info += {'strip binaries':    get_option('strip')}
 summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
+summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 if targetos == 'darwin'
   summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
-- 
2.17.1


