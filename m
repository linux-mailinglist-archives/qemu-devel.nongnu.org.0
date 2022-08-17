Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAEB5970AC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 16:11:39 +0200 (CEST)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJli-0006Lp-BT
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 10:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oOJha-0001Uo-CW
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:07:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oOJhV-00089F-PZ
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:07:22 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HDfYN4018512;
 Wed, 17 Aug 2022 14:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=b2j6a1BJ64WZjG4+pCnpzSgTmQx0MRhV7qC5Fcd/Zoo=;
 b=tTKWQ7GWasKPfnsecfC2KuHlFYEgLI3/MfMvCQ3ZriE4VVvNGBJxomdyRpsgMtF4CLUT
 0szE+qwzxVYU+cCjJj5Y7N8Y5yTQhL1zo0UILsQMYp0jW8Fb7wMCgg7+FNHsgjevbRh8
 0LbUSTbCUHyV9h8oEkBsQRi1+CcbbSAegTLCfOEjnBDd1yWTLBnXhjTJ3r3I1jp448l+
 75yZXuIt3qyHUKvyQ7ykoAhr3zVXRvQ+8xcd55oajUsqZsR2RvWVjzUPPVGbYL71UQJ/
 Ttzrhwhp/LPJ2SNyP2pqs3hIDL3CoXheqMi5pEN3kDIxDDx2DGaH4qS2U0hTsm9GUUKt Iw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j11eg116s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 14:07:11 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HE6bqf006096;
 Wed, 17 Aug 2022 14:07:06 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3hx3k8uddk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 14:07:06 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27HE7MT032637198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Aug 2022 14:07:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12D2CA4057;
 Wed, 17 Aug 2022 14:07:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C37D7A4040;
 Wed, 17 Aug 2022 14:07:03 +0000 (GMT)
Received: from [9.171.21.185] (unknown [9.171.21.185])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Aug 2022 14:07:03 +0000 (GMT)
Message-ID: <38090dfe48a64edc49a23dc88e42dfc0572567ae.camel@linux.ibm.com>
Subject: Re: [PATCH for-7.2 14/21] accel/tcg: Hoist get_page_addr_code out
 of tb_lookup
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org
Date: Wed, 17 Aug 2022 16:07:03 +0200
In-Reply-To: <fbccc410-3599-9e31-82e7-a9a20caf8d53@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
 <20220812180806.2128593-15-richard.henderson@linaro.org>
 <15f8efa3aae897569383305155315d03ee5b70e3.camel@linux.ibm.com>
 <a67bc498-5155-cc40-9640-81db22b2b37a@linaro.org>
 <0727c2600d0c16caf43689a9c3abf5ca2017f28f.camel@linux.ibm.com>
 <cc2cab12-2dda-25db-5696-fe13971db467@linaro.org>
 <f8a922e90a624453bd86ea0438b3562cc4b809a6.camel@linux.ibm.com>
 <fbccc410-3599-9e31-82e7-a9a20caf8d53@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xBJT8NL8CbOz_FcsY7fRN9j0A8r7H9Er
X-Proofpoint-ORIG-GUID: xBJT8NL8CbOz_FcsY7fRN9j0A8r7H9Er
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170055
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-08-17 at 08:38 -0500, Richard Henderson wrote:
> On 8/17/22 08:27, Ilya Leoshkevich wrote:
> > On Wed, 2022-08-17 at 08:15 -0500, Richard Henderson wrote:
> > > On 8/17/22 06:08, Ilya Leoshkevich wrote:
> > > > @@ -2243,6 +2250,13 @@ void page_set_flags(target_ulong start,
> > > > target_ulong end, int flags)
> > > >                (flags & PAGE_WRITE) &&
> > > >                p->first_tb) {
> > > >                tb_invalidate_phys_page(addr, 0);
> > > > +        } else {
> > > > +            TranslationBlock *tb;
> > > > +            int n;
> > > > +
> > > > +            PAGE_FOR_EACH_TB(p, tb, n) {
> > > > +                cpu_tb_jmp_cache_remove(tb);
> > > > +            }
> > > >            }
> > > 
> > > Here you would use tb_jmp_cache_clear_page(), which should be
> > > moved
> > > out of cputlb.c.
> > 
> > That was actually the first thing I tried.
> > 
> > Unfortunately tb_jmp_cache_clear_page() relies on
> > tb_jmp_cache_hash_func() returning the same top bits for addresses
> > on
> > the same page.  This is not the case for qemu-user: there this
> > property
> > was traded for better hashing with quite impressive performance
> > improvements (6f1653180f570).
> 
> Oh my.  Well, we could
> 
> (1) revert that patch because the premise is wrong,
> (2) go with your per-tb clearing,
> (3) clear the whole thing with cpu_tb_jmp_cache_clear
> 
> Ideally we'd have some benchmark numbers to inform the choice...

FWIW 6f1653180f570 still looks useful.
Reverting it caused 620.omnetpp_s to take ~4% more time.
I ran the benchmark with reduced values in omnetpp.ini so as not to
wait forever, therefore the real figures might be closer to what the
commit message says. In any case this still shows that the patch has
measurable impact.

