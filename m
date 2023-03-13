Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E7C6B814D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 20:00:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbnNu-0001bc-VJ; Mon, 13 Mar 2023 14:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pbnNs-0001bE-7H
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:59:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pbnNq-0003UB-6B
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:58:59 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DGYDrm001987; Mon, 13 Mar 2023 18:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=zU9WntxpZz720ZjenKVYF7WmRMiB2OYaj9Qitijx5Pc=;
 b=OwETlV8CCTqf1P3MefZd1RxmvwM8c4Z8pROrFUpgB7GEJOivuW5uNhKmRruxrV1h00Bh
 CzrOpjlg5WpnmUX3CqapRHqjLWrkRIS3LS+1uRyJRExndVI8WilIga52XiNf1aJRcDPw
 QcWe+35LDdERH/mHrY8xwlIocKIelFRJaJytRhyzKyBWDOdbdHZ3wX+HWxyWhiL8fGwy
 nSUihV6UCIpLNJnNIK9IN7hGDpVhHEziccfu9mRDSL8ASTQGvFVbQ8zVcF0nIPiiJWW6
 X/EO2rUT0H0CCPZdPMCGMT0yVgMfZtBe8Db20Um1cLUKFOJdm7SYxJAjMQunWNdMaZoJ og== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p8fbne6tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 18:58:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32DIwjEV009554
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 18:58:45 GMT
Received: from NASANPPMTA02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 13 Mar 2023 11:58:42 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <quintela@redhat.com>, <bcain@quicinc.com>, <dgilbert@redhat.com>,
 <ling1.xu@intel.com>, <zhou.zhao@intel.com>, <jun.i.jin@intel.com>
Subject: [PATCH RESEND v2 0/2] migration/xbzrle: fix two avx512 runtime issues
Date: Mon, 13 Mar 2023 15:58:18 -0300
Message-ID: <cover.1678733663.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: JBavoLR7Oz9-4IGQzgg8d_W1zQf-T5Ja
X-Proofpoint-GUID: JBavoLR7Oz9-4IGQzgg8d_W1zQf-T5Ja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_09,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxlogscore=799 clxscore=1015
 priorityscore=1501 mlxscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130148
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset strives to fix two bugs at xvzrle when --enable-avx512 is
used: an out-of-bounds write and an invalid argument to __builtin_ctz().

Those two errors can be seen in the test suite running:

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
  
  ../migration/xbzrle.c:265: runtime error: passing zero to ctz(), which is not a valid argument

v1: https://lore.kernel.org/qemu-devel/cover.1678199971.git.quic_mathbern@quicinc.com/
(No changes since v1, only rebased on current master)

Matheus Tavares Bernardino (2):
  migration/xbzrle: use ctz64 to avoid undefined result
  migration/xbzrle: fix out-of-bounds write with axv512

 migration/xbzrle.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.39.1


