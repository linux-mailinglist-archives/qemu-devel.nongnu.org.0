Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFC83B66D5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:34:15 +0200 (CEST)
Received: from localhost ([::1]:41310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuD8-0004Uv-7q
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lxuBt-0003k7-GY; Mon, 28 Jun 2021 12:32:57 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lxuBr-0008GS-3G; Mon, 28 Jun 2021 12:32:57 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SGWqHC178415; Mon, 28 Jun 2021 12:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=ZoTvDEH6SS8ifKQLmKQMSpQJSf2AsHskvjxt2iKHfTA=;
 b=e9RVsGS+mUaE1fnsn74FF7avwXhbz/+gvoaK+ltG9O/zG5QXfAY51v8jtYvbMUBIJLmd
 Mwrw2ccKNS1w1bkrjpG9a4wOiN0fIjHmckxvqHFD1Y7EH9OAsMdgNE3I9LTXFMq+NHNZ
 QAH/nW5r60xc5UGrQlFNDx3sA3SWoNBxhp6Q9OeGqi7gc9DSFAo0nV9GAN1pqtZHDNbr
 6eHx6jK0HzHN6y7dfnVALaGLFloB57tmXW5eyJIOZ8zPT0811keoSaVp9oobaBjvmaKH
 mSJxiUQIFyoIVjpSFhihbsSQIfPcGCQZAiXGY1LbV9Mdnb206sYevKVo/B3a+RIbDbCl hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fegy7uvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 12:32:51 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15SGWpHT178327;
 Mon, 28 Jun 2021 12:32:51 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fegy7us5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 12:32:50 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15SGWecS015082;
 Mon, 28 Jun 2021 16:32:40 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 39duv8gfeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 16:32:40 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15SGV3sb28508444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 16:31:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FF7D11CE4C;
 Mon, 28 Jun 2021 16:32:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CBEA11CE46;
 Mon, 28 Jun 2021 16:32:38 +0000 (GMT)
Received: from oc3748833570.ibm.com (unknown [9.145.91.112])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 28 Jun 2021 16:32:38 +0000 (GMT)
Received: by oc3748833570.ibm.com (Postfix, from userid 1000)
 id B9337D802EF; Mon, 28 Jun 2021 18:32:36 +0200 (CEST)
Date: Mon, 28 Jun 2021 18:32:36 +0200
From: Ulrich Weigand <uweigand@de.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
Message-ID: <20210628163236.GA14822@oc3748833570.ibm.com>
References: <20210623145020.GA30585@oc3748833570.ibm.com>
 <b24537e5-07f9-8a43-5820-ecc82ee84bdb@linaro.org>
 <20210628125803.GA29264@oc3748833570.ibm.com>
 <5c9a00df-aa43-d721-912c-eeb9eda839a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c9a00df-aa43-d721-912c-eeb9eda839a4@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iv192EurOBrgZFm7ANEZXqiLFsPETbAe
X-Proofpoint-ORIG-GUID: -U7JT4Nx9bJNpyfMBh9i9G10XkolfnPt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_12:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106280109
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

On Mon, Jun 28, 2021 at 06:26:52AM -0700, Richard Henderson wrote:
> On 6/28/21 5:58 AM, Ulrich Weigand wrote:
> >>>helper.h:DEF_HELPER_FLAGS_3(clgdb, TCG_CALL_NO_WG, i64, env, i64, i32)
> >>
> >>This won't work reliably.  You're writing to a tcg global inside of
> >>a function that says that it won't.
> >
> >I missed that, sorry.  That problem can be fixed by changing the above
> >line to something like:
> >DEF_HELPER_3(clgdb, i64, env, i64, i32)
> >right?
> 
> Yes.

OK, I'll send a v2 including that change shortly; maybe that is an
acceptable fix for the immediate bug, at least for now.

> >In any case, the current implementation already has two helpers, and
> >I initially tried to keep that, by using a different second part to
> >correctly compute CC.  But this ran into the problem that I didn't
> >see any way to detect the fact that the conversion operation had run
> >into one of the special cases in the second helper, without re-doing
> >the whole conversion a second time.  Is there any way to pass
> >information between the two helpers (without running again into the
> >same qemu global state updating problem)?
> 
> Don't clear out env->fpu_status.float_exception_flags in
> handle_exceptions.  Wait until we're actually done with the data.

I don't really know much about qemu internals, but this is really
confusing me, sorry.  Aren't env->fpu_status and env->cc_op two
elements of the same global state?  Why it is OK to use one of
these fields to pass information to the next helper, but not the
other?  I guess I must be missing something here ...

Bye,
Ulrich

-- 
  Dr. Ulrich Weigand
  GNU/Linux compilers and toolchain
  Ulrich.Weigand@de.ibm.com

