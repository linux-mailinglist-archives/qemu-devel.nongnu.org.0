Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216D6573B20
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 18:25:13 +0200 (CEST)
Received: from localhost ([::1]:46946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBfAm-0003Ul-8P
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 12:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBf0u-0007VS-Nj; Wed, 13 Jul 2022 12:15:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30112
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBf0s-0007XS-B0; Wed, 13 Jul 2022 12:15:00 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DG1HNu027499;
 Wed, 13 Jul 2022 16:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=AerugIpz4KveWv+mU/0v5h6YxwL8MT5bK9hdEpomPrw=;
 b=lJQOCasrQedsGvBmpHAiPitu4DXocnpPMQ/5QFmGMni1lzx/ojH+ouxCND+/ypiuUYhL
 48qcaMJjWDSVogfSsCMm4CZC0unUR6qxzg1261eqJ2VOarB6Ojn6nxEEyF0HqrPkPhCw
 PPymk3fLwG/ZTkZdVY+b2Jbnxy8Wmm+H6pFKvBm4Eaub0t/8zMoQEZvGA6lkwtGltPkx
 zxbfnYtcmfEmH5GVWnHtmMjtxyPurzgijQXsadB3NR0obsfTMfkAyFIVCQF/oVkQ+boY
 0lamxXSvHaspXT/MTmg3jhVwioOX/ZTAPtDHduAlNS1v2vsFfeBKSBoRoyv7h8hrXE5C 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha16w8gen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 16:14:47 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DG1uAx030098;
 Wed, 13 Jul 2022 16:14:47 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha16w8gdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 16:14:46 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DG7Spc014296;
 Wed, 13 Jul 2022 16:14:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3h70xhwwun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 16:14:44 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26DGEg6R20251120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 16:14:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4410A4051;
 Wed, 13 Jul 2022 16:14:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A157A4040;
 Wed, 13 Jul 2022 16:14:42 +0000 (GMT)
Received: from [9.171.74.220] (unknown [9.171.74.220])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 16:14:42 +0000 (GMT)
Message-ID: <9ce0270d042b1d4cc011757dafa6ea6a882c49c7.camel@linux.ibm.com>
Subject: Re: [PATCH 3/3] tests/tcg/s390x: test signed vfmin/vfmax
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, Peter Maydell
 <peter.maydell@linaro.org>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>
Date: Wed, 13 Jul 2022 18:14:41 +0200
In-Reply-To: <3c321cef-b574-1396-237a-d1ac1cf19e01@linaro.org>
References: <20220712015717.3602602-1-iii@linux.ibm.com>
 <20220712015717.3602602-4-iii@linux.ibm.com>
 <c7897b91-dbfd-3a32-68c8-d7afa40495ba@linaro.org>
 <c7a32437850ddc70438173ff7f0f0966e5f48384.camel@linux.ibm.com>
 <3c321cef-b574-1396-237a-d1ac1cf19e01@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NoKwa43IJNXtUvL25jz77O3MZxVgrxAN
X-Proofpoint-GUID: iJwne6P3zyX075oBh-CjhZxhIsQOOYd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_05,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=817
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130066
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

On Wed, 2022-07-13 at 21:14 +0530, Richard Henderson wrote:
> On 7/12/22 18:02, Ilya Leoshkevich wrote:
> > > This works, of course.  It could be simpler using EXECUTE, to
> > > store
> > > just the one
> > > instruction and not worry about an executable mapped page, but I
> > > guess it doesn't matter.
> > 
> > I thought about this too, but EX/EXRL operate only on the second
> > byte,
> > and I need to modify bytes 3-5 here.
> 
> I didn't mean modify the instruction via EX, but something like
> 
>    static char minmax[6] __attribute__((aligned(2)))
>      = { xx, yy, zz, 0, 0, 0 };
> 
>    minmax[3] = m6 ...
>    minmax[4] = ...
>    minmax[5] = op;
> 
>    asm("vl %%v25,0(%1)\n"
>        "vl %%v26,0(%2)\n"
>        "ex 0,0(%3)\n"
>        "vst %%v24,0(%0)"
>        : : "a"(v1), "a"(v2), "a"(v3), "a"(minmax)
>        : "memory", "v24", "v25", "v26);
> 
> 
> r~

Nice trick!

This works in qemu, but not natively: EX target must be executable.
I'd still like to try to find a way to establish an rwx section, and
send a v2 with this improvement.

I guess we'll need to fix the access check discrepancy some day.

