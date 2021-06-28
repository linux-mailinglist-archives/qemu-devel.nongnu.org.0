Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F783B5EA5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:02:56 +0200 (CEST)
Received: from localhost ([::1]:54060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqud-0005XT-Ad
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lxqrB-0003Ve-VA; Mon, 28 Jun 2021 08:59:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lxqr9-0003lo-8a; Mon, 28 Jun 2021 08:59:21 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SCc08I124835; Mon, 28 Jun 2021 08:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=yhR1tKU3gmcKeZoxeU8EPf2j8lIH8zUse79qaBR4hIE=;
 b=bSwgvMskCYjnO/RJX+A2mwKkH0vL1wueNgEglIpmpy0rVDbKln4Ih0+RijXZbt9yXR7N
 t9/aYiLDFuPrHz3HnRniiNYVR9QtlFJmXYU8tZwoqcm/1N1rGDt0Oeox4IMWsjp0i1sl
 cA0q5VI9WvWDDAC0Raeg6eAftlS2cWTSrw1B0tglyWHdWsAspvWNfKd7Lkj1AUjJapm9
 NJ2ldDT69IvHUeKbl6Jg6Qo7nX/sShasFY6aD1XzzUtb7KvuTkacuiMjujsGswzSbKma
 R3Vks4p++PyyT+PEECsaL1UksKDS9vXXvbRbih6vchGDw5vzUqLX+0zoEna3MPn2iu4y yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39f9v9h6r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 08:58:11 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15SCtTDj103845;
 Mon, 28 Jun 2021 08:58:09 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39f9v9h6ph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 08:58:09 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15SCr5qV012771;
 Mon, 28 Jun 2021 12:58:06 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 39duv88sy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 12:58:06 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15SCuXTC28967408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 12:56:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D0BBA2660;
 Mon, 28 Jun 2021 12:58:04 +0000 (GMT)
Received: from oc3748833570.ibm.com (unknown [9.145.91.112])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3B86DA2654;
 Mon, 28 Jun 2021 12:58:04 +0000 (GMT)
Received: by oc3748833570.ibm.com (Postfix, from userid 1000)
 id C435BD802ED; Mon, 28 Jun 2021 14:58:03 +0200 (CEST)
Date: Mon, 28 Jun 2021 14:58:03 +0200
From: Ulrich Weigand <uweigand@de.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
Message-ID: <20210628125803.GA29264@oc3748833570.ibm.com>
References: <20210623145020.GA30585@oc3748833570.ibm.com>
 <b24537e5-07f9-8a43-5820-ecc82ee84bdb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b24537e5-07f9-8a43-5820-ecc82ee84bdb@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: roNiddCGB-TzoezGweAX0gBu4mlBqspM
X-Proofpoint-GUID: 4pZlcBdP4NLYSFZf0CYFNkbIId-grQ43
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_09:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280087
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

On Fri, Jun 25, 2021 at 06:19:48PM -0700, Richard Henderson wrote:
> On 6/23/21 7:50 AM, Ulrich Weigand wrote:
> >@@ -506,6 +534,7 @@ uint64_t HELPER(cgeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
> >  {
> >      int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
> >      int64_t ret = float32_to_int64(v2, &env->fpu_status);
> >+    env->cc_op = set_cc_conv_f32(v2, &env->fpu_status);
> ...
> 
> >@@ -1875,7 +1860,7 @@ static DisasJumpType op_cgeb(DisasContext *s, DisasOps *o)
> >     }
> >     gen_helper_cgeb(o->out, cpu_env, o->in2, m34);
> >     tcg_temp_free_i32(m34);
> >-    gen_set_cc_nz_f32(s, o->in2);
> >+    set_cc_static(s);
> >     return DISAS_NEXT;
> 
> ...
> 
> >helper.h:DEF_HELPER_FLAGS_3(clgdb, TCG_CALL_NO_WG, i64, env, i64, i32)
> 
> This won't work reliably.  You're writing to a tcg global inside of
> a function that says that it won't.

I missed that, sorry.  That problem can be fixed by changing the above
line to something like:
DEF_HELPER_3(clgdb, i64, env, i64, i32)
right?

> It's probably time to take care of
> 
> >    /*
> >     * FIXME:
> >     * 1. Right now, all inexact conditions are inidicated as
> >     *    "truncated" (0) and never as "incremented" (1) in the DXC.
> >     * 2. Only traps due to invalid/divbyzero are suppressing. Other traps
> >     *    are completing, meaning the target register has to be written!
> >     *    This, however will mean that we have to write the register before
> >     *    triggering the trap - impossible right now.
> >     */
> 
> point 2, by splitting the fpu helpers.  In the first part, take care
> of the optimization and suppressed traps, and return the register
> value.  In the second part, take care of FPC write-back, completing
> traps, and return any cc value.  Which you can then assign,
> properly, to the cc_op tcg global.

I'm not sure I see how this is related to the CC problem.  Note that
the difference between suppressing and completing traps applies to
both the target register and the CC - if a suppressing trap is
triggered, both target register and CC remain unchanged, otherwise
they are changed (and both changes are visible to the trap handler).

In any case, the current implementation already has two helpers, and
I initially tried to keep that, by using a different second part to
correctly compute CC.  But this ran into the problem that I didn't
see any way to detect the fact that the conversion operation had run
into one of the special cases in the second helper, without re-doing
the whole conversion a second time.  Is there any way to pass
information between the two helpers (without running again into the
same qemu global state updating problem)?

Bye,
Ulrich

-- 
  Dr. Ulrich Weigand
  GNU/Linux compilers and toolchain
  Ulrich.Weigand@de.ibm.com

