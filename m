Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0481E5BEA0C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 17:23:04 +0200 (CEST)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaf5S-0007jK-An
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 11:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oacen-0003IF-Dq
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:47:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:15750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oaceg-0004p0-0j
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:47:16 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KCbFcp032296;
 Tue, 20 Sep 2022 12:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=/k0k2L5GGxaU4myI8OACWSyd0K1PwqOyiqKkB2CAC+Q=;
 b=cQD+ziB4Uxda+QtBl3410YKTKM2oWqWYXJGLDDXGke6gW7q1EBbtQFPklsgXtYUikRwc
 nX+gdLWoWe90f+z1ds6bdOROGUcRgL00TfYDSJgpq7QJQ6aP07BjZNEP8BY8NkiA9OSA
 i/uJDr1Kt76fLXNRyqHzYUzOJ6L+p5uSVmY5cL3LPFtv6qsynPs+NqV97TRkPmtSmW+D
 E/YYyczOm1TWhPPpzpIHhZc0HQknw5Pwv55I7+1sVG5kikwubZkN3RPqS6ymKl6k/t7j
 d48MlJof/8fgqqVYhSnpHYR7DMJc6JvduXyATdbTxhFN2zAQAYASMXgd8O5ha9MMt+aY gQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jq7321mbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 12:47:08 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28KCl7f9027106; 
 Tue, 20 Sep 2022 12:47:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3jnqpvh5y7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 12:47:07 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KCl7Ld027099;
 Tue, 20 Sep 2022 12:47:07 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 28KCl6Jd027095
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 12:47:07 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id D51CA4DB5; Tue, 20 Sep 2022 09:47:06 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: bcain@quicinc.com, alex.bennee@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org
Subject: [PATCH v3 1/3] configure: make sure tcg tests can see HAVE_GDB_BIN
Date: Tue, 20 Sep 2022 09:47:01 -0300
Message-Id: <99b9352e18fe3cc584a66e740e49a77cdc57494d.1663677789.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1663677789.git.quic_mathbern@quicinc.com>
References: <cover.1663677789.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: _1bkagb2LTZ6JFnYWpDJTkGqG9662DN_
X-Proofpoint-GUID: _1bkagb2LTZ6JFnYWpDJTkGqG9662DN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_04,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=781 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209200074
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HAVE_GDB_BIN is only used by tests/tcg/* makefiles, but it is currently
written at <build_dir>/config-host.mak, which those makefiles don't have
access to. Let's instead write it to
<build_dir>/tests/tcg/config-host.mak, which is included by the
makefiles.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 configure   | 13 ++++++-------
 meson.build |  6 +++---
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index 575dde1c1f..e9dc766467 100755
--- a/configure
+++ b/configure
@@ -2474,13 +2474,6 @@ if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
 fi
 
-if test -n "$gdb_bin"; then
-    gdb_version=$($gdb_bin --version | head -n 1)
-    if version_ge ${gdb_version##* } 9.1; then
-        echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
-    fi
-fi
-
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
@@ -2561,6 +2554,12 @@ config_host_mak=tests/tcg/config-host.mak
 echo "# Automatically generated by configure - do not modify" > $config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "HOST_CC=$host_cc" >> $config_host_mak
+if test -n "$gdb_bin"; then
+    gdb_version=$($gdb_bin --version | head -n 1)
+    if version_ge ${gdb_version##* } 9.1; then
+        echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+    fi
+fi
 
 tcg_tests_targets=
 for target in $target_list; do
diff --git a/meson.build b/meson.build
index c2adb7caf4..1a4ac4bc60 100644
--- a/meson.build
+++ b/meson.build
@@ -3710,9 +3710,6 @@ summary_info += {'git':               config_host['GIT']}
 summary_info += {'make':              config_host['MAKE']}
 summary_info += {'python':            '@0@ (version: @1@)'.format(python.full_path(), python.language_version())}
 summary_info += {'sphinx-build':      sphinx_build}
-if config_host.has_key('HAVE_GDB_BIN')
-  summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
-endif
 summary_info += {'iasl':              iasl}
 summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 if targetos == 'windows' and have_ga
@@ -3822,6 +3819,9 @@ foreach target: target_dirs
       summary_info += {config_cross_tcg['TARGET_NAME']: config_cross_tcg['CC']}
       have_cross = true
     endif
+    if config_cross_tcg.has_key('HAVE_GDB_BIN')
+      summary_info += {'gdb':             config_cross_tcg['HAVE_GDB_BIN']}
+    endif
   endif
 endforeach
 if have_cross
-- 
2.37.2


