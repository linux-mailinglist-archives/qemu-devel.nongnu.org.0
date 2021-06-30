Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B973A3B80F9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 12:51:01 +0200 (CEST)
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyXo4-0002LO-Pb
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 06:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lyXmi-0001LR-GM; Wed, 30 Jun 2021 06:49:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lyXmg-0004K6-Pi; Wed, 30 Jun 2021 06:49:36 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UAYRSs195388; Wed, 30 Jun 2021 06:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=62Yj9PpfBDPPTJDAbxOSqWBUPo9em9HrG/+0gm3l/8A=;
 b=ntphFH9Gw9qVF3MnbYylt/YXsasN+BSkXEHUYnbvWhnH6NSMhTbeyHoYrSJAn4QliB8h
 L/8FSZ9a4B7dS+LHtgAYYW+nqKdjKJht044GvggIUZJyymqfTONaXaIgymrkCRutQvFI
 yiAk6NPwvR5sC126470FO4gXx+te6AnDI/C4aUykKjRE0oeDII9LLLTwTdqYHPzZp+uW
 YZvds3aNwGEy5N/SYUY+c6PB+29+AlK3wVIhC2137KccKID5Ts9LzISgZKtBMZhdav7a
 ctjddxTtK83+71uhFDrasxjRnZFpWoy3tgaQuB16YX9OpmTZRDPNeYQwvOchtAh/zhIm vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gfa0v8j6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 06:49:32 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UAZ0jK004038;
 Wed, 30 Jun 2021 06:49:32 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gfa0v8h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 06:49:31 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UAkevD024887;
 Wed, 30 Jun 2021 10:49:29 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 39duv8gwby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 10:49:29 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UAnRAQ29950356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 10:49:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EE544205C;
 Wed, 30 Jun 2021 10:49:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25D8742059;
 Wed, 30 Jun 2021 10:49:27 +0000 (GMT)
Received: from oc3748833570.ibm.com (unknown [9.145.93.31])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 10:49:27 +0000 (GMT)
Received: by oc3748833570.ibm.com (Postfix, from userid 1000)
 id A83F0D80308; Wed, 30 Jun 2021 12:49:26 +0200 (CEST)
Date: Wed, 30 Jun 2021 12:49:26 +0200
From: Ulrich Weigand <uweigand@de.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
Message-ID: <20210630104926.GB29019@oc3748833570.ibm.com>
References: <20210628163520.GA15209@oc3748833570.ibm.com>
 <0ec4b69c-02cb-0b1c-e980-9b462ab3a615@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ec4b69c-02cb-0b1c-e980-9b462ab3a615@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0PrxZgAeb-EX2k0LvBCluIK3kfBY7fs8
X-Proofpoint-GUID: AM4P-GBNrGiCRVc1TxijlzYNHpZpWM8M
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_02:2021-06-29,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 bulkscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300069
Received-SPF: pass client-ip=148.163.156.1; envelope-from=uweigand@de.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 11:45:27AM -0700, Richard Henderson wrote:
> On 6/28/21 9:35 AM, Ulrich Weigand wrote:
> >@@ -506,6 +534,7 @@ uint64_t HELPER(cgeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
> >  {
> >      int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
> >      int64_t ret = float32_to_int64(v2, &env->fpu_status);
> >+    env->cc_op = set_cc_conv_f32(v2, &env->fpu_status);
> >      s390_restore_bfp_rounding_mode(env, old_mode);
> >      handle_exceptions(env, xxc_from_m34(m34), GETPC());
> 
> Don't you need to wait until after handle_exceptions, and the
> handling of suppressing exceptions, to write back to cc_op?

Good point.  I'll post an updated v3 with this change.

> I'm thinking that should be able to remove TCGv_i32 cc_op in the
> translator and manually write back to the slot instead.  We already
> do a good job of caching the value within DisasContext -- I imagine
> that the final code wouldn't even change too much.

I see.  If this works out, I'll update my patch accordingly
-- please let me know.

Thanks,
Ulrich

-- 
  Dr. Ulrich Weigand
  GNU/Linux compilers and toolchain
  Ulrich.Weigand@de.ibm.com

