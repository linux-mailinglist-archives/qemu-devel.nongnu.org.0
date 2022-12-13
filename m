Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B4164BAC1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 18:16:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58rR-0002VH-BR; Tue, 13 Dec 2022 12:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p58rP-0002UZ-9U; Tue, 13 Dec 2022 12:14:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p58rN-0000sr-FA; Tue, 13 Dec 2022 12:14:30 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDGVIXn006671; Tue, 13 Dec 2022 17:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=tDHX2nrOtkOBQMYJoPDNlTJGmTZXS0G8gMumK8Crtv0=;
 b=cS7x+MXxOU/Wbo2S5PX2d6tF1kFbV9tOB/buHfyAImSVztFKbuDWtxqaoE0Z6k8eH30q
 z3T7+HOyaXGImjxepk7eQANj2ShqfhcNmYZnzPmQC4vl1VYKyHalNgRRtIjhqsO0B6RC
 bctRZrB4ALjEOUHRmrMYTjJuvXFGagPY61NGOA5APlLU9akOtcJdbGofiKp+tXgPQtDa
 sXcV0Zy8b5MYp+KrYgsFxt1LIBN7Ev0fRuCwcEhxobfGznBfmBxtDbOdxei0p75HP4bf
 CERdeHyp8Gx6N+3qqT7DtWF5p/oUo7AJCOY0tZz1HP3dohYWZ73cP2Hg4j8NKDEDAwco vw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mew04s8ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 17:14:26 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BD7GtbY015497;
 Tue, 13 Dec 2022 17:14:24 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3mchr638ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 17:14:23 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BDHELAj45023700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Dec 2022 17:14:21 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F6BF20040;
 Tue, 13 Dec 2022 17:14:21 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 399F42004D;
 Tue, 13 Dec 2022 17:14:21 +0000 (GMT)
Received: from heavy (unknown [9.179.23.216])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Dec 2022 17:14:21 +0000 (GMT)
Date: Tue, 13 Dec 2022 18:14:16 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 14/27] target/s390x: Assert masking of psw.addr in
 cpu_get_tb_cpu_state
Message-ID: <20221213171416.2eh6xz3azce52gbf@heavy>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
 <20221211152802.923900-15-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221211152802.923900-15-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FxlkmvHZcLzzcaumnb9JWkXKUVeepGmj
X-Proofpoint-ORIG-GUID: FxlkmvHZcLzzcaumnb9JWkXKUVeepGmj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=620 priorityscore=1501 lowpriorityscore=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130151
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

On Sun, Dec 11, 2022 at 09:27:49AM -0600, Richard Henderson wrote:
> When changing modes via SAM, we raise a specification exception if the
> new PC is out of range.  The masking in s390x_tr_init_disas_context
> was too late to be correct, but may be removed.  Add a debugging
> assert in cpu_get_tb_cpu_state.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/cpu.h           | 20 ++++++++++++++------
>  target/s390x/tcg/translate.c |  6 +-----
>  2 files changed, 15 insertions(+), 11 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

