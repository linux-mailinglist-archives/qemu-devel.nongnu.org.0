Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CAB37B4CA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 06:06:14 +0200 (CEST)
Received: from localhost ([::1]:51262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgg8T-0001wT-Vd
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 00:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lgg5S-0006VF-I9
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:03:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lgg5P-0007qw-5Z
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:03:06 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14C3XfMP161503; Wed, 12 May 2021 00:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ad6BTCzQppU9ibCkg2phnv+by9Ufg5a1X6zGILRwD2I=;
 b=DKaNu2g3jrIh5hC8hq8BmqoF3qfoNxSlkCO+HfcsjBMkU9wUsA3xABBIrOckBGhtSt51
 S3+oXHN1+R0zvXHF8g/AQWOjC7eg/7WuNt5wsr+51/tSRCCGEYuek9cxMN1kSr2hKf5/
 RYMNSia2W+dP6lsxtOrCFnweEPWR2RpFFhMsDmXoVYxUm3PNiLTZUkhP0Ti9X7jKmE+1
 38GV6yWD4g+7WmQ39yT2w67koXgJk98oWp4Xp8ht7rOusgSz+K3UEIzqDUmRB6jkQ97u
 1aqTRm708wFzR11jheiyrO6q9LY3MpNMuNuruoUUQdbjoVsZ8MVk6CPlQXp/15EMIG1L Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38g6gd1bx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 00:03:00 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14C3Xpav162432;
 Wed, 12 May 2021 00:03:00 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38g6gd1bw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 00:02:59 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14C3v68d008404;
 Wed, 12 May 2021 04:02:57 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 38dhwh12j8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 04:02:57 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14C42seW29229370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 May 2021 04:02:54 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 856BE52052;
 Wed, 12 May 2021 04:02:54 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1834752054;
 Wed, 12 May 2021 04:02:54 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 1/2] target/i386: Make sure that vsyscall's tb->size != 0
Date: Wed, 12 May 2021 06:02:49 +0200
Message-Id: <20210512040250.203953-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210512040250.203953-1-iii@linux.ibm.com>
References: <20210512040250.203953-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s91yypgJhrYVG9zRB5QVzr6-lu0vlU0r
X-Proofpoint-GUID: qHA_SZhd-baVH2BAn1V-NUBJO8RTY8wq
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-12_01:2021-05-11,
 2021-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105120025
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tb_gen_code() assumes that tb->size must never be zero, otherwise it
may produce spurious exceptions. For x86_64 this may happen when
creating a translation block for the vsyscall page.

Fix by pretending that vsyscall translation blocks have at least one
instruction.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/i386/tcg/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 880bc45561..b5a2b981e2 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8572,6 +8572,7 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
      */
     if ((dc->base.pc_next & TARGET_PAGE_MASK) == TARGET_VSYSCALL_PAGE) {
         gen_exception(dc, EXCP_VSYSCALL, dc->base.pc_next);
+        dc->base.pc_next = dc->pc + 1;
         return;
     }
 #endif
-- 
2.29.2


