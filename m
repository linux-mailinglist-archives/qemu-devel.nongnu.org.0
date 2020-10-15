Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9255928F84A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 20:19:09 +0200 (CEST)
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT7qG-0003si-Kr
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 14:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kT7dI-00085h-6w
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 14:05:44 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:41480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kT7dC-0002Iv-FR
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 14:05:43 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FI5RS2038277;
 Thu, 15 Oct 2020 18:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=gmKz9TSnACfgtBz5SZDgL7MgVf0N4P9ATy65oIVPXto=;
 b=SOshMtvRLL7i7dz5ignd5KpxPODTsKghmd8e8jd89UigqSOY0mvKkOhtv4qNFmfrMSNU
 8kIzNnZaXsvfeDczM29kXaVN+bnL9Z7xpr2Kx+BF1H3O5pKNK65GLPMjYu6NbtGoXR0l
 oTJAV7GbB4sppT4XOqB++//FT1+WRGXsWwYNaSvq/HHkf8OKXe5VH+HRqHhlPCt3d5kp
 DRM9Lcn4SSzuzJ5oop6kgPqRYTGBk5vKdF73pAYV7mnXsPB6vbVra44pkmv1boCZ3NYa
 kNH3cGIR9nBnQ5hSCRxkYc9NsKMwWAEHH0JN9bAce/HxV+4ww7aPRV+LYEYhy78Q4uh2 ZA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 3434wkx73w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 15 Oct 2020 18:05:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FI5NeW133375;
 Thu, 15 Oct 2020 18:05:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 343pv2624c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Oct 2020 18:05:26 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09FI5OAW001948;
 Thu, 15 Oct 2020 18:05:24 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 15 Oct 2020 11:05:24 -0700
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 02/19] multi-process: Add config option for multi-process
 QEMU
Date: Thu, 15 Oct 2020 14:04:55 -0400
Message-Id: <acf32d0e54e0aec669723f2f1b64f87788b2c8b4.1602784930.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1602784930.git.jag.raman@oracle.com>
References: <cover.1602784930.git.jag.raman@oracle.com>
In-Reply-To: <cover.1602784930.git.jag.raman@oracle.com>
References: <cover.1602784930.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9775
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=1 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9775
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=1 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150121
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 14:05:33
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a configuration option to separate multi-process code

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 configure   | 10 ++++++++++
 meson.build |  1 +
 2 files changed, 11 insertions(+)

diff --git a/configure b/configure
index f839c2a..2025e89 100755
--- a/configure
+++ b/configure
@@ -447,6 +447,7 @@ meson=""
 ninja=""
 skip_meson=no
 gettext=""
+mpqemu="no"
 
 bogus_os="no"
 malloc_trim="auto"
@@ -1520,6 +1521,10 @@ for opt do
   ;;
   --disable-libdaxctl) libdaxctl=no
   ;;
+  --enable-mpqemu) mpqemu=yes
+  ;;
+  --disable-mpqemu) mpqemu=no
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1838,6 +1843,8 @@ disabled with --disable-FEATURE, default is enabled if available:
   xkbcommon       xkbcommon support
   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
   libdaxctl       libdaxctl support
+  mpqemu          multi-process QEMU support
+
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -6737,6 +6744,9 @@ fi
 if test "$have_mlockall" = "yes" ; then
   echo "HAVE_MLOCKALL=y" >> $config_host_mak
 fi
+if test "$mpqemu" = "yes" ; then
+  echo "CONFIG_MPQEMU=y" >> $config_host_mak
+fi
 if test "$fuzzing" = "yes" ; then
   # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
   # needed CFLAGS have already been provided
diff --git a/meson.build b/meson.build
index 1a4a482..bbcf524 100644
--- a/meson.build
+++ b/meson.build
@@ -2091,6 +2091,7 @@ endif
 summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
+summary_info += {'Multi-Process QEMU': config_host.has_key('CONFIG_MPQEMU')}
 summary(summary_info, bool_yn: true)
 
 if not supported_cpus.contains(cpu)
-- 
1.8.3.1


