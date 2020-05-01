Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C2B1C1DAB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 21:11:50 +0200 (CEST)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUb4f-00028d-LK
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 15:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1jUb2Y-0007fz-9D
 for qemu-devel@nongnu.org; Fri, 01 May 2020 15:09:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <dbuono@linux.vnet.ibm.com>) id 1jUb2X-0007E7-Qu
 for qemu-devel@nongnu.org; Fri, 01 May 2020 15:09:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1jUb2V-00072c-Bb; Fri, 01 May 2020 15:09:35 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 041J2CrF104257; Fri, 1 May 2020 15:09:27 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30r82t1w1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 May 2020 15:09:27 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 041J0Spg028501;
 Fri, 1 May 2020 19:09:26 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 30mcu77dye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 May 2020 19:09:26 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 041J9OjE26149354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 May 2020 19:09:24 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53A486A054;
 Fri,  1 May 2020 19:09:25 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7AB26A04F;
 Fri,  1 May 2020 19:09:24 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.160.6.38])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  1 May 2020 19:09:24 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] target-ppc: fix rlwimi, rlwinm, rlwnm for Clang-9
Date: Fri,  1 May 2020 15:09:12 -0400
Message-Id: <20200501190913.25008-1-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-01_11:2020-05-01,
 2020-05-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=857 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005010140
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 15:09:32
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: qemu-ppc@nongnu.org, dbuono@us.ibm.com,
 Daniele Buono <dbuono@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Until Clang v8, -Wtype-limits was kept for GCC compatibility but had no
effect. With Clang v9, the flag is now implemented ( see 
https://tinyurl.com/clang8-manual vs https://tinyurl.com/clang9-manual )

Starting with Clang v9, compiling with -Wtype-limits (default for QEMU)
triggers the following errors on the ppc-softmmu and ppc-linux-user
targets:
   
/root/qemu/target/ppc/translate.c:1894:18: error: result of comparison
'target_ulong' (aka 'unsigned int') <= 4294967295 is always true
[-Werror,-Wtautological-type-limit-compare]
        if (mask <= 0xffffffffu) {
            ~~~~ ^  ~~~~~~~~~~~
/root/qemu/target/ppc/translate.c:1941:18: error: result of comparison
'target_ulong' (aka 'unsigned int') <= 4294967295 is always true
[-Werror,-Wtautological-type-limit-compare]
        if (mask <= 0xffffffffu) {
            ~~~~ ^  ~~~~~~~~~~~
/root/qemu/target/ppc/translate.c:1983:14: error: result of comparison
'target_ulong' (aka 'unsigned int') <= 4294967295 is always true
[-Werror,-Wtautological-type-limit-compare]
    if (mask <= 0xffffffffu) {
        ~~~~ ^  ~~~~~~~~~~~

The same error can be triggered with this small repro:
int main() {
    unsigned int x = 1;
    if ( x <= 0xffffffffu) return 1;
    return 0;
}

$ gcc test.c -Wtype-limits
[nothing]
$ clang-9 test.c -Wtype-limits
test.c:3:12: warning: result of comparison 'unsigned int' <= 4294967295 
is always true [-Wtautological-type-limit-compare]
    if ( x <= 0xffffffffu) 
         ~ ^  ~~~~~~~~~~~
1 warning generated.
$ clang-9 test.c -Wtype-limits -Wno-tautological-type-limit-compare
[nothing]

We could get away with the compilation error by adding the flag
"-Wno-tautological-type-limit-compare", but I think we should avoid that
to make sure the checks are applied to the rest of the code and warn us
for logical errors in the future.

Looking at the code, the comparison is only needed for PPC64, since
the else branch in PPC32 only has a "g_assert_not_reached();"
This patch restructures the code so that PPC32 always runs the "true"
branch.

I tried to keep the changes to a minimum, to make sure to not affect the
semantics of the instructions. However, considering the target
architecture, my testing has been limited. check-acceptance seems to be
able to properly start a few linux kernels succesfully, and make check
didn't complain on both ppc-softmmu and ppc64-softmmu.

Daniele Buono (1):
  target-ppc: fix rlwimi, rlwinm, rlwnm for Clang-9

 target/ppc/translate.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

-- 
2.26.2


