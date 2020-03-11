Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DFC181DD7
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 17:29:50 +0100 (CET)
Received: from localhost ([::1]:55408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC4Ev-0001HL-Vt
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 12:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39699)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1jC4Cp-00069F-6t
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1jC4Co-0004wt-56
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:27:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41614
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1jC4Co-0004wf-0C
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:27:38 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02BGK8Xp170473
 for <qemu-devel@nongnu.org>; Wed, 11 Mar 2020 12:27:37 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yq2k7hx7m-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 11 Mar 2020 12:27:36 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Wed, 11 Mar 2020 16:27:34 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Mar 2020 16:27:30 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02BGRTHL44105986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 16:27:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87D6852050;
 Wed, 11 Mar 2020 16:27:29 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 48AAE5204F;
 Wed, 11 Mar 2020 16:27:29 +0000 (GMT)
Received: from bahia.ibmuc.com (sig-9-145-41-106.uk.ibm.com [9.145.41.106])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 991C22200CC;
 Wed, 11 Mar 2020 17:27:28 +0100 (CET)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/1] 9p/proxy: Fix export_flags
Date: Wed, 11 Mar 2020 17:27:22 +0100
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200311162722.1846432-1-groug@kaod.org>
References: <20200311162722.1846432-1-groug@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20031116-0016-0000-0000-000002EF7F34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031116-0017-0000-0000-00003352E93A
Message-Id: <20200311162722.1846432-2-groug@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_07:2020-03-11,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=993 impostorscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110099
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@ubuntu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The common fsdev options are set by qemu_fsdev_add() before it calls
the backend specific option parsing code. In the case of "proxy" this
means "writeout" or "readonly" were simply ignored. This has been
broken from the beginning.

Reported-by: St=C3=A9phane Graber <stgraber@ubuntu.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <158349633705.1237488.8895481990204796135.stgit@bahia.lan>
---
 hw/9pfs/9p-proxy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index 8136e1342d78..6f598a0f111c 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -1139,10 +1139,10 @@ static int proxy_parse_opts(QemuOpts *opts, FsDri=
verEntry *fs, Error **errp)
     }
     if (socket) {
         fs->path =3D g_strdup(socket);
-        fs->export_flags =3D V9FS_PROXY_SOCK_NAME;
+        fs->export_flags |=3D V9FS_PROXY_SOCK_NAME;
     } else {
         fs->path =3D g_strdup(sock_fd);
-        fs->export_flags =3D V9FS_PROXY_SOCK_FD;
+        fs->export_flags |=3D V9FS_PROXY_SOCK_FD;
     }
     return 0;
 }
--=20
2.21.1


