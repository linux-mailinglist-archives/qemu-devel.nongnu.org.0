Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6463B49F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 23:09:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozmI8-0007f6-2h; Mon, 28 Nov 2022 17:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ozmI6-0007ey-5L
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 17:07:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ozmI4-0002tG-5V
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 17:07:53 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ASM479B001615; Mon, 28 Nov 2022 22:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=GRRXmtz9wKoX96j39u6Fhu69s72tHcshBPjfjP7MuPs=;
 b=N7dq5qRu+RyFG4Ai9RtLLPLRW+wAZnIuShPqPcM6GGam/qz7DeTb8fPFD5suoO1UA/j8
 0p+mStg6XFDt3a4PFYTMbEZ18Lj/OQOh2vryXf4JFTBqbNwoZr9aScd3M4rnZKvsRtoz
 Vd6SNrK0DepmB4kgb2HqjZzKDiCQnuMNJXYLnHDuVUjHwWyeU6gyVm++lL6HlKaHbzaE
 AmdhC+otAYXo4NrEaIX9O2N/XT1vOwu9zYsgOaOq5zxF2tD0ncczGS+L16tNSnwkokk/
 vauGX9UPgWl4Kwi/yfrEpZOM5RGEb2iXDUjXmhkM1zxK8qtVQckhVarWr4oGH2wtSJM4 Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5303bsr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 22:07:48 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ASLv5Ra016549;
 Mon, 28 Nov 2022 22:07:48 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5303bspy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 22:07:47 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ASM5VkY009032;
 Mon, 28 Nov 2022 22:07:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3m3ae92937-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 22:07:45 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2ASM7hJT983786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Nov 2022 22:07:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DB9652050;
 Mon, 28 Nov 2022 22:07:43 +0000 (GMT)
Received: from heavy (unknown [9.171.30.50])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id D651B5204E;
 Mon, 28 Nov 2022 22:07:42 +0000 (GMT)
Date: Mon, 28 Nov 2022 23:07:41 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: david@redhat.com
Subject: Re: [PATCH for-8.0 v2 11/13] target/s390x: Use Int128 for passing
 float128
Message-ID: <20221128220741.dd4cyucli4obabby@heavy>
References: <20221111080820.2132412-1-richard.henderson@linaro.org>
 <20221111080820.2132412-12-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111080820.2132412-12-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xr0lcr1qukQtAttvhWfrHFiuBn0mR80m
X-Proofpoint-GUID: tjmRk8COLD3kSDM_msn42TLr2kFB7RNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_17,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=702 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280159
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

On Fri, Nov 11, 2022 at 06:08:18PM +1000, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix SPEC_in1_x1.
> ---
>  target/s390x/helper.h            | 32 ++++++------
>  target/s390x/tcg/fpu_helper.c    | 88 ++++++++++++++------------------
>  target/s390x/tcg/translate.c     | 76 ++++++++++++++++++---------
>  target/s390x/tcg/insn-data.h.inc | 30 +++++------
>  4 files changed, 121 insertions(+), 105 deletions(-)

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

