Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B48E4D52DB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 21:07:57 +0100 (CET)
Received: from localhost ([::1]:45432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSP4l-00050c-Su
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 15:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nSP3L-0003d1-01; Thu, 10 Mar 2022 15:06:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nSP3I-0004es-VM; Thu, 10 Mar 2022 15:06:26 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AJehsK018858; 
 Thu, 10 Mar 2022 20:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=ZjG5Xr/MSEX8OVIagVMdPsyT4VOfMO97pod9v0G/6Yc=;
 b=UuRsvJB6BJshFJxSN+C1juEhDcTHFhB/V5b5WKoEY4qtul1OMJIgeI9LOuBfPa1JD25b
 NQp53hsMp8R1Vq1G0Mq4Gpmr+qx1gbT4MctbMcD7UboQ+MxlDPPv3oRYVtzPU2S+bUpM
 kG7WP2zkTdizKzm1AqtP2dYPIg4CMOGGtCdZm/LgDd8YpH+sDQeFIFE9Aj3m2An0TSwZ
 VFYSMalxo6/f1REZG9OJcuy7oi2Jh4OdKcSl8dwVslTDcvDTH6dmuvbsA3kfPQ94PF3F
 r1PknhLX4BnCeV81ECCYCfFE8PSmBHDCbOEM5Qs0MzkXPTdcOuE6yZOKaEdITzqXqYli 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqf3ncyd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 20:06:21 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AJhFVM030370;
 Thu, 10 Mar 2022 20:06:21 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqf3ncycw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 20:06:21 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AK3CKW010151;
 Thu, 10 Mar 2022 20:06:20 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 3epb9cu5fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 20:06:20 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AK6JDL26542532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 20:06:19 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 446DAAC068;
 Thu, 10 Mar 2022 20:06:19 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3E6AAC06C;
 Thu, 10 Mar 2022 20:06:18 +0000 (GMT)
Received: from localhost (unknown [9.65.240.15])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 10 Mar 2022 20:06:18 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block-qdict: Fix -Werror=maybe-uninitialized build failure
Date: Thu, 10 Mar 2022 17:05:11 -0300
Message-Id: <20220310200511.44746-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vnDjImpY2AiGpNkv6hrTO3w8W2dxI5Sq
X-Proofpoint-GUID: wK6AtwLC_UT-mcEbLEiHxzQU8EfA_bVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_09,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1011 spamscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100102
Received-SPF: pass client-ip=148.163.156.1; envelope-from=muriloo@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, mopsfelder@gmail.com,
 muriloo@linux.ibm.com, Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Building QEMU on Fedora 37 (Rawhide Prerelease) ppc64le failed with the
following error:

    $ ../configure --prefix=/usr/local/qemu-disabletcg --target-list=ppc-softmmu,ppc64-softmmu --disable-tcg --disable-linux-user
    ...
    $ make -j$(nproc)
    ...
    FAILED: libqemuutil.a.p/qobject_block-qdict.c.o
    cc -m64 -mlittle-endian -Ilibqemuutil.a.p -I. -I.. -Isubprojects/libvhost-user -I../subprojects/libvhost-user -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4 -I/usr/include/lib
    mount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/include/p11-kit-1 -I/usr/include/pixman-1 -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem /root/qemu/linux-headers -isystem linux-headers -iquote
     . -iquote /root/qemu -iquote /root/qemu/include -iquote /root/qemu/disas/libvixl -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite
    -strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-label
    s -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -MD -MQ libqemuutil.a.p/qobject_block-qdict.c.o -MF libqemuutil.a.p/qobject_block-qdict.c.o.d -
    o libqemuutil.a.p/qobject_block-qdict.c.o -c ../qobject/block-qdict.c
    In file included from /root/qemu/include/qapi/qmp/qdict.h:16,
                     from /root/qemu/include/block/qdict.h:13,
                     from ../qobject/block-qdict.c:11:
    /root/qemu/include/qapi/qmp/qobject.h: In function ‘qdict_array_split’:
    /root/qemu/include/qapi/qmp/qobject.h:49:17: error: ‘subqdict’ may be used uninitialized [-Werror=maybe-uninitialized]
       49 |     typeof(obj) _obj = (obj);                                   \
          |                 ^~~~
    ../qobject/block-qdict.c:227:16: note: ‘subqdict’ declared here
      227 |         QDict *subqdict;
          |                ^~~~~~~~
    cc1: all warnings being treated as errors

Fix build failure by initializing the QDict variable with NULL.

Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
---
 qobject/block-qdict.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
index 1487cc5dd8..b26524429c 100644
--- a/qobject/block-qdict.c
+++ b/qobject/block-qdict.c
@@ -224,7 +224,7 @@ void qdict_array_split(QDict *src, QList **dst)
     for (i = 0; i < UINT_MAX; i++) {
         QObject *subqobj;
         bool is_subqdict;
-        QDict *subqdict;
+        QDict *subqdict = NULL;
         char indexstr[32], prefix[32];
         size_t snprintf_ret;
 
-- 
2.35.1


