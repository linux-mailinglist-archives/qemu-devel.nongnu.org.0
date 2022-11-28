Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9C963B616
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 00:42:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oznkJ-0002PF-W7; Mon, 28 Nov 2022 18:41:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oznkD-0002Oe-Oj
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 18:41:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oznkB-0000v4-SO
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 18:41:01 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ASMRI1n028554; Mon, 28 Nov 2022 23:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=UPBAE10sd/KScZaMYToQA8Txd3aVvTd/k9NfYUUvuFQ=;
 b=HRVhYjIMyJlbtCGRlJJ2FLzlzso73MZMLkfYSyUzr2X0JTHJe/Px1z1RLNqQ2fX45Owo
 jE7GcXj8eSF57pck6l8PqTGoreARHhB04PjOSf9daInirBdMTwqs2+MLqQJanuIjd1D9
 7PUNNjtnr1zk+/kOZR9qHQGrEZAW+hAMEZkbZyjkL8FYMqmUrwrYDHwUvLEs/Q44NjVc
 HkjGd+vrO8P5LMFfJsF4ve3zTjZaUQ/EZ2TECdfOe5DguTzIgen2tMKQ4KXgAQ/jk/ec
 nkzerIGImJ/DX2dGRClaLvxi+A1xQRwWRgjyNo0MaR78E6s8MD72y77uVt8aHpkBw4sn 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m529weqb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 23:40:57 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ASNRIos014963;
 Mon, 28 Nov 2022 23:40:57 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m529weqab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 23:40:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ASNZFrp022000;
 Mon, 28 Nov 2022 23:40:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3m3ae9b7tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 23:40:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2ASNer8F37683828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Nov 2022 23:40:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC13042041;
 Mon, 28 Nov 2022 23:40:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B09B44203F;
 Mon, 28 Nov 2022 23:40:52 +0000 (GMT)
Received: from heavy (unknown [9.171.30.50])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 28 Nov 2022 23:40:52 +0000 (GMT)
Date: Tue, 29 Nov 2022 00:40:51 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: david@redhat.com
Subject: Re: [PATCH for-8.0 v2 12/13] target/s390x: Use
 tcg_gen_atomic_cmpxchg_i128 for CDSG
Message-ID: <20221128234051.7j3tre72owh4eyif@heavy>
References: <20221111080820.2132412-1-richard.henderson@linaro.org>
 <20221111080820.2132412-13-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111080820.2132412-13-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MYY4PjLOYcr5VEg9WJQjFFqoCOQpP08V
X-Proofpoint-ORIG-GUID: Me3tfqEAJ01EMHZa3DVdUUa-K2ypi0K4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_17,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=922 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280169
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Nov 11, 2022 at 06:08:19PM +1000, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/helper.h            |  2 --
>  target/s390x/tcg/mem_helper.c    | 52 ---------------------------
>  target/s390x/tcg/translate.c     | 60 ++++++++++++++++++++------------
>  target/s390x/tcg/insn-data.h.inc |  2 +-
>  4 files changed, 38 insertions(+), 78 deletions(-)

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

I was wondering what assembly this would generate in parallel mode and
wrote a small test. On my x86_64 machine it ended up being
helper_atomic_cmpxchgo_be() -> cpu_atomic_cmpxchgo_be_mmu() ->
lock cmpxchg16b, nothing surprising.

On an s390x host we fall back to cpu_exec_step_atomic(), because in the
configure test:

      int main(void)
      {
        unsigned __int128 x = 0, y = 0;
        __sync_val_compare_and_swap_16(&x, y, x);
        return 0;
      }

x and y are not aligned. I guess that's working as intended as well,
even though it would be nice to eventually make use of cdsg there.

I will post the test shortly.

