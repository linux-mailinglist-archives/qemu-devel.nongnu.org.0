Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D8F3F156B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 10:44:06 +0200 (CEST)
Received: from localhost ([::1]:43474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGdee-0001Fl-MZ
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 04:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mGddt-0000Zq-MC
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 04:43:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mGddr-00067M-I4
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 04:43:17 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17J8XXhq093339; Thu, 19 Aug 2021 04:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Lvqzy9AzUDYbCKdVJeykII7KussAA7yJkWwdbVJyXfM=;
 b=DrwFHTc1UhGANIXIQ0KCYNvZKyG3CVpnpyst65BNz3NEQT8+W70Zww1i86Xf7vYQy5hk
 Fdo7r4lC7pzGrUFPL7T77oOe14H1+hTWVtvrtqVcsODcwjHPnWsBxgoZPY9WIht9ORJg
 zq99UB1coWkufM7Jc/LRgkx7AXXnVp46fY31WNRs4cg1acBv82Q3iPg4gP2waxMQcS1d
 vvtLX2Rjpd/Dj/gnO7A6BgZvyaEgYjFNPzoeZjzPc4YflCpLJ65WB0PIYpsztLtMbVWr
 moU+4MfCyydigXEayfN4oXI7WEc12lEc/5VxFaHKzrrOpSSLzG38Bz1cxGE4jsAUxZom 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agkvngw8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 04:43:11 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17J8Xil8094323;
 Thu, 19 Aug 2021 04:43:10 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agkvngw7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 04:43:10 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17J8bG7x009130;
 Thu, 19 Aug 2021 08:43:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3ae53hyydy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 08:43:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17J8h5Mr47120728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 08:43:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 109334C04E;
 Thu, 19 Aug 2021 08:43:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7A3A4C062;
 Thu, 19 Aug 2021 08:43:04 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 19 Aug 2021 08:43:04 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 25651)
 id 29E48E02FA; Thu, 19 Aug 2021 10:43:04 +0200 (CEST)
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: pbonzini@redhat.com
Subject: Re: [PULL 6/7] meson: fix meson 0.58 warning with libvhost-user
 subproject
Date: Thu, 19 Aug 2021 10:43:03 +0200
Message-Id: <20210819084303.320682-1-borntraeger@de.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729124713.208422-7-pbonzini@redhat.com>
References: <20210729124713.208422-7-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: M-0MJ9y6aYAKTl46qxIg2ZyfeAKTJ4eq
X-Proofpoint-GUID: kJOcgx35ZaUSdgfgMOyAsGE3iVA30e45
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_03:2021-08-17,
 2021-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=893 clxscore=1011
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108190045
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Interestingly enough this breaks my rpmbuild (both rpmbuild and mock).
(mostly with a modified f35 spec file):

cc -Isubprojects/libvhost-user/libvhost-user.a.p -Isubprojects/libvhost-use=
r -I../subprojects/libvhost-user -fdiagnostics-color=3Dauto -pipe -Wall -Wi=
nvalid-pch -std=3Dgnu11 -O2 -g -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -m64=
 -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredunda=
nt-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing =
-fno-common -fwrapv -O2 -fexceptions -g -grecord-gcc-switches -Wall -Werror=
=3Dformat-security -Wp,-D_FORTIFY_SOURCE=3D2 -Wp,-D_GLIBCXX_ASSERTIONS -spe=
cs=3D/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -spec=
s=3D/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -march=3DzEC12 -mtune=3Dz13=
 -fasynchronous-unwind-tables -fstack-clash-protection -Wold-style-declarat=
ion -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Wi=
nit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels =
-Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs=
 -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -DSTAP_SDT_V=
2 -fPIE -pthread -D_GNU_SOURCE -MD -MQ subprojects/libvhost-user/libvhost-u=
ser.a.p/libvhost-user.c.o -MF subprojects/libvhost-user/libvhost-user.a.p/l=
ibvhost-user.c.o.d -o subprojects/libvhost-user/libvhost-user.a.p/libvhost-=
user.c.o -c ../subprojects/libvhost-user/libvhost-user.c
../subprojects/libvhost-user/libvhost-user.c:43:10: fatal error: include/at=
omic.h: No such file or directory
   43 | #include "include/atomic.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.

and

DEBUG: FAILED: subprojects/libvhost-user/libvhost-user-glib.a.p/libvhost-us=
er-glib.c.o
DEBUG: cc -Isubprojects/libvhost-user/libvhost-user-glib.a.p -Isubprojects/=
libvhost-user -I../subprojects/libvhost-user -I/usr/include/glib-2.0 -I/usr=
/lib64/glib-2.0/include -I/usr/include/sysprof-4 -fdiagnostics-color=3Dauto=
 -Wall -Winvalid-pch -std=3Dgnu11 -O2 -g -U_FORTIFY_SOURCE -D_FORTIFY_SOURC=
E=3D2 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstr=
ict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototyp=
es -fno-strict-aliasing -fno-common -fwrapv -O2 -fexceptions -g -grecord-gc=
c-switches -pipe -Wall -Werror=3Dformat-security -Wp,-D_FORTIFY_SOURCE=3D2 =
-Wp,-D_GLIBCXX_ASSERTIONS -specs=3D/usr/lib/rpm/redhat/redhat-hardened-cc1 =
-fstack-protector-strong -specs=3D/usr/lib/rpm/redhat/redhat-annobin-cc1 -m=
64 -march=3DzEC12 -mtune=3Dz13 -fasynchronous-unwind-tables -fstack-clash-p=
rotection -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wfo=
rmat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -W=
nested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=
=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack=
-protector-strong -DSTAP_SDT_V2 -fPIE -pthread -MD -MQ subprojects/libvhost=
-user/libvhost-user-glib.a.p/libvhost-user-glib.c.o -MF subprojects/libvhos=
t-user/libvhost-user-glib.a.p/libvhost-user-glib.c.o.d -o subprojects/libvh=
ost-user/libvhost-user-glib.a.p/libvhost-user-glib.c.o -c ../subprojects/li=
bvhost-user/libvhost-user-glib.c
DEBUG: In file included from ../subprojects/libvhost-user/libvhost-user-gli=
b.h:19,
DEBUG:                  from ../subprojects/libvhost-user/libvhost-user-gli=
b.c:15:
DEBUG: ../subprojects/libvhost-user/libvhost-user.h:23:10: fatal error: sta=
ndard-headers/linux/virtio_ring.h: No such file or directory
DEBUG:    23 | #include "standard-headers/linux/virtio_ring.h"
DEBUG:       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DEBUG: compilation terminated.
DEBUG: [12/10271] /usr/bin/meson --internal exe --capture qemu-version.h --=
 /builddir/build/BUILD/qemu-6.0.94/scripts/qemu-version.sh /builddir/build/=
BUILD/qemu-6.0.94 qemu-6.0.94-20210819.0.2e47441a94ba.fc34 6.0.94
DEBUG: [13/10271] /usr/bin/meson --internal exe --capture qemu-img-cmds.h -=
- /builddir/build/BUILD/qemu-6.0.94/scripts/hxtool -h ../qemu-img-cmds.hx
DEBUG: [14/10271] /usr/bin/meson --internal exe --capture hmp-commands-info=
.h -- /builddir/build/BUILD/qemu-6.0.94/scripts/hxtool -h ../hmp-commands-i=
nfo.hx
DEBUG: [15/10271] /usr/bin/meson --internal exe --capture hmp-commands.h --=
 /builddir/build/BUILD/qemu-6.0.94/scripts/hxtool -h ../hmp-commands.hx
DEBUG: [16/10271] /usr/bin/meson --internal exe --capture qemu-options.def =
-- /builddir/build/BUILD/qemu-6.0.94/scripts/hxtool -h ../qemu-options.hx
DEBUG: ninja: build stopped: subcommand failed.
DEBUG: make: *** [Makefile:156: run-ninja] Error 1
DEBUG: error: Bad exit status from /var/tmp/rpm-tmp.fgqi3Y (%build)
DEBUG: RPM build errors:
DEBUG:     Bad exit status from /var/tmp/rpm-tmp.fgqi3Y (%build)
DEBUG: Child return code was: 1


