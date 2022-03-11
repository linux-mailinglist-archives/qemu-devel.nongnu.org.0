Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675554D69F5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 23:19:28 +0100 (CET)
Received: from localhost ([::1]:45048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSnba-0003Ro-W9
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 17:19:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nSnZf-0001Eo-HW; Fri, 11 Mar 2022 17:17:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nSnZd-0003hF-Hg; Fri, 11 Mar 2022 17:17:27 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22BLQPfC003586; 
 Fri, 11 Mar 2022 22:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=4waD0CvQkKa8n5JO3PD5TZ2BjydofGt1wDptrRpavdA=;
 b=ckQIjNFvEBycgQVdbAENUtR1pu50kTeDLu1rpfhUWBmT2tI2ttaulPSlLTCFnNYeFhbw
 A03gfpjtiE1TQlC98J460uAjsWNAzMGw6elK7/aO728/fFfzdZicnIIF5l+fCkUhhr9S
 kSmhCr3/uYfua7QPHKXUm66SyVZF2HRz+mlP8i1zGXOa4GB0qopWSjR3tAxm/2yd820w
 X5Y9eMrQYE9zqriZcFQOnqsjW71XwOtcMnyDuJ9YxZSZyZqRjvX3iinQ5gLLirVkd2Ry
 CHvLRUbHauhz+fIcqo9PBBuJICMWbuO7BumwyqXiyYb8AtvDROxjvY2id+9vZEQffDca 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqw49vjdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 22:17:22 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22BM4Prm022808;
 Fri, 11 Mar 2022 22:17:22 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqw49vjdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 22:17:22 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22BMDJQq001979;
 Fri, 11 Mar 2022 22:17:21 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3ekyg9wcxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 22:17:21 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22BMHLgq19988796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 22:17:21 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41F37AE064;
 Fri, 11 Mar 2022 22:17:21 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDB08AE063;
 Fri, 11 Mar 2022 22:17:20 +0000 (GMT)
Received: from localhost (unknown [9.160.104.172])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 11 Mar 2022 22:17:20 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] block-qdict: Fix -Werror=maybe-uninitialized build failure
Date: Fri, 11 Mar 2022 19:16:34 -0300
Message-Id: <20220311221634.58288-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: suQ2sRL0IoxYfoBtGFmnxvtZr3UXJsXX
X-Proofpoint-ORIG-GUID: PWst2ym5C639GPLRtPiyvYtbe9jrspBO
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_09,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203110112
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Fix build failure by expanding the ternary operation.
Tested with `make check-unit` (the check-block-qdict test passed).

Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
---
v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03224.html

 qobject/block-qdict.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
index 1487cc5dd8..4a83bda2c3 100644
--- a/qobject/block-qdict.c
+++ b/qobject/block-qdict.c
@@ -251,12 +251,12 @@ void qdict_array_split(QDict *src, QList **dst)
         if (is_subqdict) {
             qdict_extract_subqdict(src, &subqdict, prefix);
             assert(qdict_size(subqdict) > 0);
+            qlist_append_obj(*dst, QOBJECT(subqdict));
         } else {
             qobject_ref(subqobj);
             qdict_del(src, indexstr);
+            qlist_append_obj(*dst, subqobj);
         }
-
-        qlist_append_obj(*dst, subqobj ?: QOBJECT(subqdict));
     }
 }
 
-- 
2.35.1


