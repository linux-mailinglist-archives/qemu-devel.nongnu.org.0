Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8486AE33D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:49:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYcI-0008Fr-R6; Tue, 07 Mar 2023 09:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pZYcF-00088b-QW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:48:36 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pZYcC-0002dl-9z
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:48:35 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327B49OS027144; Tue, 7 Mar 2023 14:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=IGZ8SmwZmjNfDmHY8dPAxPsivs4xiKqYe+7+ZUu8DAo=;
 b=STZE4WEG22NlsnW4dcic8g52bZk+O4yr1yl4RD5pHgdTC1gyr5gqiH5yNLkoCnLkkZz3
 Vwvbk4VfXsurYKCdiC9IYxv26XpZzhVyahhHhi9TfhUvrf4gz0l2s46IvwE5GFC/Kxgd
 nRX3vjVPgRCKi1V9GH4F4Iz+46g8qT+cIa7a6P88w7ITjphcGwqLXZdx0nN6HXmOHGAb
 8XmMVU+uWJuhzkfJhhQbOYtjhtux2P1+ncem94JChWPdPpLLTqUCSqTlM4y8Hva/tFF1
 NDAtXURDMiA0vPhg0LykgZA1jPOIJQpCIPsK4yohCiptVQmyvl8oRZqB960TN5KORP4Y 4g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p4g3my43k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 14:48:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 327EmR6E017770
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Mar 2023 14:48:28 GMT
Received: from NASANPPMTA02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 7 Mar 2023 06:48:25 -0800
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <quintela@redhat.com>, <bcain@quicinc.com>, <dgilbert@redhat.com>,
 <ling1.xu@intel.com>, <zhou.zhao@intel.com>, <jun.i.jin@intel.com>
Subject: [PATCH 2/2] migration/xbzrle: fix out-of-bounds write with axv512
Date: Tue, 7 Mar 2023 11:48:09 -0300
Message-ID: <f39b6a7f46cda2d1ca196d0b4d59c2f2b59af21e.1678199971.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1678199971.git.quic_mathbern@quicinc.com>
References: <cover.1678199971.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jRB3hrhC0MN-u_fEHx5QC91qFa8JAzGu
X-Proofpoint-GUID: jRB3hrhC0MN-u_fEHx5QC91qFa8JAzGu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_08,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=857 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303070132
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

xbzrle_encode_buffer_avx512() checks for overflows too scarcely in its
outer loop, causing out-of-bounds writes:

$ ../configure --target-list=aarch64-softmmu --enable-sanitizers --enable-avx512bw
$ make tests/unit/test-xbzrle && ./tests/unit/test-xbzrle

==5518==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x62100000b100 at pc 0x561109a7714d bp 0x7ffed712a440 sp 0x7ffed712a430
WRITE of size 1 at 0x62100000b100 thread T0
    #0 0x561109a7714c in uleb128_encode_small ../util/cutils.c:831
    #1 0x561109b67f6a in xbzrle_encode_buffer_avx512 ../migration/xbzrle.c:275
    #2 0x5611099a7428 in test_encode_decode_overflow ../tests/unit/test-xbzrle.c:153
    #3 0x7fb2fb65a58d  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a58d)
    #4 0x7fb2fb65a333  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a333)
    #5 0x7fb2fb65aa79 in g_test_run_suite (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7aa79)
    #6 0x7fb2fb65aa94 in g_test_run (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7aa94)
    #7 0x5611099a3a23 in main ../tests/unit/test-xbzrle.c:218
    #8 0x7fb2fa78c082 in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x24082)
    #9 0x5611099a608d in _start (/qemu/build/tests/unit/test-xbzrle+0x28408d)

0x62100000b100 is located 0 bytes to the right of 4096-byte region [0x62100000a100,0x62100000b100)
allocated by thread T0 here:
    #0 0x7fb2fb823a06 in __interceptor_calloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cc:153
    #1 0x7fb2fb637ef0 in g_malloc0 (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57ef0)

Fix that by performing the overflow check in the inner loop, instead.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 migration/xbzrle.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/migration/xbzrle.c b/migration/xbzrle.c
index 21b92d4eae..c6f8b20917 100644
--- a/migration/xbzrle.c
+++ b/migration/xbzrle.c
@@ -197,10 +197,6 @@ int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
     __m512i r = _mm512_set1_epi32(0);
 
     while (count512s) {
-        if (d + 2 > dlen) {
-            return -1;
-        }
-
         int bytes_to_check = 64;
         uint64_t mask = 0xffffffffffffffff;
         if (count512s == 1) {
@@ -216,6 +212,9 @@ int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
 
         bool is_same = (comp & 0x1);
         while (bytes_to_check) {
+            if (d + 2 > dlen) {
+                return -1;
+            }
             if (is_same) {
                 if (nzrun_len) {
                     d += uleb128_encode_small(dst + d, nzrun_len);
-- 
2.39.1


