Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8063B58D158
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 02:27:47 +0200 (CEST)
Received: from localhost ([::1]:60690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLD62-0001N2-37
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 20:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oLD3j-0005Zu-Re; Mon, 08 Aug 2022 20:25:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oLD3c-00079W-NC; Mon, 08 Aug 2022 20:25:21 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27901H2n010284;
 Tue, 9 Aug 2022 00:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZeEY3FrpsfuCeMIPAPzPbPWgHIkCse9wi1eYbsgfSIc=;
 b=IipJopqIf3cMiFMBAuL0+bXtxqcoPjtQAWbYwoZyTqQYdyJWdrH7IypuiWgENobKhg9o
 C4ZlAZTGqAstC4cVJI3lTPfeXfqvxd5KBNaBlbgVHJDr1D/nrnw0afin3szLOJDzifWU
 5ZNhfRTXclE2OUK2UnNpaNwqbP+c7x8nxQsKevNmVl/mNWDZxsLovBUtLKo68DK5QrfS
 b78FRVi2lBzENyGzqsR9WAM1OlaxSLDlig9R3fqXFe0fIR7ofJokODvtnJGF2cB0FRpd
 Q2NOdf7rnpYvAqvikfvne0WYQH76iJ26SSEVF39Wdw1hz5nNTol5GmSHgEignZaq4J1S nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu9w7mr8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 00:25:15 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27902jLb016108;
 Tue, 9 Aug 2022 00:25:15 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu9w7mr81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 00:25:15 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2790LU7e031334;
 Tue, 9 Aug 2022 00:25:14 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3hu3wnu905-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 00:25:14 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2790PDP38454784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Aug 2022 00:25:13 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CC02AC059;
 Tue,  9 Aug 2022 00:25:13 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 898AEAC05B;
 Tue,  9 Aug 2022 00:25:12 +0000 (GMT)
Received: from localhost (unknown [9.77.141.99])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  9 Aug 2022 00:25:12 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com,
 mopsfelder@gmail.com
Subject: [PATCH 1/2] tests/migration: add sysprof-capture-4 as dependency for
 stress binary
Date: Mon,  8 Aug 2022 21:24:50 -0300
Message-Id: <20220809002451.91541-2-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809002451.91541-1-muriloo@linux.ibm.com>
References: <20220809002451.91541-1-muriloo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oM9DxApqdzuNcLDj5JFlbc8fE5J4Nqef
X-Proofpoint-ORIG-GUID: jQoUSwEOYHHsvLEt1XLwthw5vVZMsEkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_14,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208080105
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

`make tests/migration/stress` fails with:

    FAILED: tests/migration/stress
    cc -m64 -mlittle-endian  -o tests/migration/stress tests/migration/stress.p/stress.c.o -Wl,--as-needed -Wl,--no-undefined -pie -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -fstack-protector-strong -static -pthread -Wl,--start-group -lgthread-2.0 -lglib-2.0 -Wl,--end-group
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gutils.c.o): in function `.annobin_gutils.c':
    (.text+0x3b4): warning: Using 'getpwuid' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
    /usr/bin/ld: (.text+0x178): warning: Using 'getpwnam_r' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
    /usr/bin/ld: (.text+0x1bc): warning: Using 'getpwuid_r' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gthread.c.o):(.toc+0x0): undefined reference to `sysprof_clock'
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gtrace.c.o): in function `.annobin_gtrace.c':
    (.text+0x24): undefined reference to `sysprof_collector_mark_vprintf'
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gtrace.c.o): in function `g_trace_define_int64_counter':
    (.text+0x8c): undefined reference to `sysprof_collector_request_counters'
    /usr/bin/ld: (.text+0x108): undefined reference to `sysprof_collector_define_counters'
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gtrace.c.o): in function `g_trace_set_int64_counter':
    (.text+0x23c): undefined reference to `sysprof_collector_set_counters'
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gspawn.c.o):(.toc+0x0): undefined reference to `sysprof_clock'
    /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gmain.c.o):(.toc+0x0): undefined reference to `sysprof_clock'
    collect2: error: ld returned 1 exit status
    ninja: build stopped: subcommand failed.
    make: *** [Makefile:162: run-ninja] Error 1

Add sysprof-capture-4 as dependency for stress binary.

Tested on:
  - CentOS Stream 9 ppc64le
  - Fedora 36 x86_64

Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
---
 tests/migration/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/migration/meson.build b/tests/migration/meson.build
index f215ee7d3a..3fd87f7849 100644
--- a/tests/migration/meson.build
+++ b/tests/migration/meson.build
@@ -1,7 +1,9 @@
+sysprof = dependency('sysprof-capture-4')
+
 stress = executable(
   'stress',
   files('stress.c'),
-  dependencies: [glib],
+  dependencies: [glib, sysprof],
   link_args: ['-static'],
   build_by_default: false,
 )
-- 
2.37.1


