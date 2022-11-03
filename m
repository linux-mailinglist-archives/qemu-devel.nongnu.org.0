Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886BC617E3D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:44:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqaUg-0001ZZ-TL; Thu, 03 Nov 2022 09:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqaUL-0001R3-0I; Thu, 03 Nov 2022 09:42:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqaUF-0002Bk-AE; Thu, 03 Nov 2022 09:42:30 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A3DHaPK031119;
 Thu, 3 Nov 2022 13:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=xdPYx3LjER40f19ccoGM+Ji5HeyTgMigtJVK/5VQXZU=;
 b=S9y9how7v/w9sl4r8xcfRxRDO6DUO0OdmAPizP76zCIAI02c15WQqaROHePobz8KtKXM
 rFQhXyhe1tAMd4BY53q4Kz8+GBILAvStyWHnnwkEhhALVPEWTosINE6kbNNvlqv27iMm
 6t/qUTAwBGVreXbsnbacbP36uu01mjDBt8Ft7IyUZuoVxs6hfHj1bJyKzvErNn+rro2G
 AxLeIZq4HSyCZene3RFxrbUzVKzRL28vCFYT3eJ30tNnbw4bm5LAaYk9b0v5RT6JjAGD
 Y0VYSGvIMCcxWpMcMqPe/rAWu8JpKXO3eOwLyfXGdFo/yh4QF5p3gPi+pxlRnuFIiS/L 8g== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmdwr9qkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 13:42:19 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3DZuUj009676;
 Thu, 3 Nov 2022 13:42:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3kgut8xm6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 13:42:17 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A3DgEmC66584916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 13:42:14 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3E67AE04D;
 Thu,  3 Nov 2022 13:42:14 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ADDDAE045;
 Thu,  3 Nov 2022 13:42:14 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Nov 2022 13:42:14 +0000 (GMT)
Date: Thu, 3 Nov 2022 14:42:13 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 12/26] target/s390x: Move masking of psw.addr to
 cpu_get_tb_cpu_state
Message-ID: <20221103134213.6h2lcmwcs6hykirt@heavy>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-13-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006034421.1179141-13-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oC2ZiaXfDh5JUVE-SEIW0Los50YS5mxE
X-Proofpoint-GUID: oC2ZiaXfDh5JUVE-SEIW0Los50YS5mxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 mlxlogscore=814 mlxscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211030093
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 05, 2022 at 08:44:07PM -0700, Richard Henderson wrote:
> Masking after the fact in s390x_tr_init_disas_context
> provides incorrect information to tb_lookup.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/cpu.h           | 13 +++++++------
>  target/s390x/tcg/translate.c |  6 ------
>  2 files changed, 7 insertions(+), 12 deletions(-)

How can we end up in a situation where this matters? E.g. if we are in
64-bit mode and execute

    0xa12345678: sam31

we will get a specification exception, and cpu_get_tb_cpu_state() will
not run. And for valid 31-bit addresses masking should be a no-op.

