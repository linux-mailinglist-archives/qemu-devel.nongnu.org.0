Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1273BC867
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:17:04 +0200 (CEST)
Received: from localhost ([::1]:35848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hCR-000277-S2
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1m0hBK-0001Qq-Nu; Tue, 06 Jul 2021 05:15:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1m0hBI-0003tl-0L; Tue, 06 Jul 2021 05:15:54 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166950Wa036373; Tue, 6 Jul 2021 05:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=F1NmVosHsc6nYYIYMl6Lu1PJ0G/dqUEftI8XEV49Drg=;
 b=RhxY8U4D83QzAgnHNPBl0BquYcDogEQ7foN2F7BtCJuniMjjT4d/vjKwa+nx49uerRhF
 JZ7aPlKM0oOhlvke6CwWoekWdGyPIbGjCQWBXDD3//rSoAALm1ZDhWlrvIpV3ahDYrv3
 WprE2FQKkV45/XkyUeMbhoc2so/cj/XoSCzlfsVhQq55Jmj9RtjPhkkb/ryuvPQSxiJz
 vD7WqzKhE++0MkCj/y6CWW+l8zWSKEujFBqsK+K7BX1aOXQmV6FyIHm8y6kMrZe6EgGF
 pEVzxpmxaGZNewgGoxjQNM1YAY8gmzqnV5MdNuKZkMSOeYOBR8rOf2CZF7zAsHOos2fP LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m5q1kh0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 05:15:45 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16694x61036312;
 Tue, 6 Jul 2021 05:15:45 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m5q1kgxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 05:15:45 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1669Cfpu015362;
 Tue, 6 Jul 2021 09:15:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 39jf5hgmdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 09:15:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1669FcuQ34996598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Jul 2021 09:15:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74878AE06A;
 Tue,  6 Jul 2021 09:15:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AE63AE05D;
 Tue,  6 Jul 2021 09:15:38 +0000 (GMT)
Received: from oc3748833570.ibm.com (unknown [9.145.30.45])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Jul 2021 09:15:38 +0000 (GMT)
Received: by oc3748833570.ibm.com (Postfix, from userid 1000)
 id D5AE0D8031E; Tue,  6 Jul 2021 11:15:37 +0200 (CEST)
Date: Tue, 6 Jul 2021 11:15:37 +0200
From: Ulrich Weigand <uweigand@de.ibm.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v5 1/2] target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr
 reporting
Message-ID: <20210706091537.GA25294@oc3748833570.ibm.com>
References: <20210623023250.3667563-1-iii@linux.ibm.com>
 <20210623023250.3667563-2-iii@linux.ibm.com>
 <ce59213b-4642-63b4-32b1-4566415c3b7f@redhat.com>
 <3694d1e29d7b1d00b60235360a54abf4b9ca4dea.camel@linux.ibm.com>
 <59f3bbfe-c92c-6940-c008-9fc697e5a464@redhat.com>
 <cb16b059dbcf2202ded95044d3aed32b9510ef97.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb16b059dbcf2202ded95044d3aed32b9510ef97.camel@linux.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: j8TzCtQ5zTIsGGoiOmn2Gu0VHwsBRurE
X-Proofpoint-GUID: kTAFUt75cWx4NqRQSx1r42mBEavlCqHy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-06_04:2021-07-02,
 2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060044
Received-SPF: pass client-ip=148.163.156.1; envelope-from=uweigand@de.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 05, 2021 at 10:19:56PM +0200, Ilya Leoshkevich wrote:
> On Mon, 2021-07-05 at 21:18 +0200, David Hildenbrand wrote:
> > 
> > Looks better to me, but I'm not an expert on signals, so I cannot tell 
> > what si_addr is supposed to contain in that case.
> > 
> 
> Thanks, I'll send a v6 then. I used rt_sigaction(2) man here:
> 
>     When SIGTRAP is delivered in response to a ptrace(2) event
>     (PTRACE_EVENT_foo), si_addr is not populated
> 
> I think EXCP_DEBUG corresponds only to this case - there doesn't
> seem to be a way to generate it without attaching gdb.

The s390x Linux kernel does in fact set si_addr to the address of
the instruction triggering the signal for SIGTRAP, just like for
SIGILL or SIGFPE.  On the other hand, GDB does not rely on that
(since this is not the case on other platforms, like the man page
above indicates), so this looks OK to me.

Bye,
Ulrich

-- 
  Dr. Ulrich Weigand
  GNU/Linux compilers and toolchain
  Ulrich.Weigand@de.ibm.com

