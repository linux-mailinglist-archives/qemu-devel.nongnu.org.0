Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4310A3AE899
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:01:24 +0200 (CEST)
Received: from localhost ([::1]:45640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvIcB-0007EW-7K
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvIa7-00067g-1p; Mon, 21 Jun 2021 07:59:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvIa4-0008O0-6t; Mon, 21 Jun 2021 07:59:10 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LBY7Tc030914; Mon, 21 Jun 2021 07:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=gHIvQH34q4meY9J/e0C3C4qjNS8SMeJtYqlqDEbqDU4=;
 b=YatqUkbOzzGq+he5ddPIoa6T1tl483X6OO+wC1lARu0vSYfvn+kwSsOX9DVqtmu3mLBd
 wrPqxtqyM3rY0lhMiLnWbVIasuiRGgaMZASqQ/gRd/OoHNNsVvgh17O05oS2D00WjkZc
 Z54lh4xIdGLz/3h72IWcX3qRM/lgdyFJJOvgEAtRyc89JYxN2GNQsO6A5YwH/OotmXS4
 0Ynq2Fk/3S73FUw5WzdJabpxcgMk5eHxdI6dTk2Zc33NbTf+WQIqZDKsFIBkM6nSk19k
 GwBFUYWw1yNw+LqM9hDSgr5eZYVpq5MXw7xAnmieyX1QRsVr3xkf/r9s30H8qOzNcwn2 og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39as26tnce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 07:59:02 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LBYq7F037864;
 Mon, 21 Jun 2021 07:59:01 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39as26tnb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 07:59:01 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LBwxrn014799;
 Mon, 21 Jun 2021 11:58:59 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3998788fgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 11:58:59 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15LBvb9I32178604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 11:57:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C169752059;
 Mon, 21 Jun 2021 11:58:55 +0000 (GMT)
Received: from sig-9-145-39-144.uk.ibm.com (unknown [9.145.39.144])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5516552052;
 Mon, 21 Jun 2021 11:58:55 +0000 (GMT)
Message-ID: <8ad1dd217e5894176403e1e5a3a1b2df0920adc2.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/2] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
Date: Mon, 21 Jun 2021 13:58:55 +0200
In-Reply-To: <4fe4d6f25ec6c13d70645acd01284cc9@imap.linux.ibm.com>
References: <20210602002210.3144559-1-iii@linux.ibm.com>
 <20210602002210.3144559-3-iii@linux.ibm.com>
 <4fe4d6f25ec6c13d70645acd01284cc9@imap.linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: F4Yqzkc3qILOU2gNJR95HlZ52AbtFQlp
X-Proofpoint-GUID: uoTJQSan_mrKLOWSlNtHAWpm7CsnLCNm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_05:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210068
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Qemu-devel <qemu-devel-bounces+qemu-devel=archiver.kernel.org@nongnu.org>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-06-18 at 09:47 -0400, jonathan.albrecht wrote:
> On 2021-06-01 8:22 pm, Ilya Leoshkevich wrote:
> > Verify that s390x-specific uc_mcontext.psw.addr is reported
> > correctly.
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >  tests/tcg/s390x/Makefile.target |   1 +
> >  tests/tcg/s390x/signal.c        | 163
> > ++++++++++++++++++++++++++++++++
> >  2 files changed, 164 insertions(+)
> >  create mode 100644 tests/tcg/s390x/signal.c
> > 

[...]

> > +static void handle_signal(int sig, siginfo_t *info, void
> > *ucontext)
> > +{
> > +    void *page;
> > +    int err;
> > +
> > +    if (sig != expected.sig) {
> > +        safe_puts("[  FAILED  ] wrong signal");
> > +        _exit(1);
> > +    }
> > +
> > +    if (info->si_addr != expected.addr) {
> > +        safe_puts("[  FAILED  ] wrong si_addr");
> > +        _exit(1);
> > +    }
> > +
> > +    if (((ucontext_t *)ucontext)->uc_mcontext.psw.addr != 
> > expected.psw_addr) {
> > +        safe_puts("[  FAILED  ] wrong psw.addr");
> > +        _exit(1);
> > +    }
> > +
> > +    switch (expected.exception) {
> 
> When I try to run 'make test-tcg' gcc 9.3.0 is complaining about a 
> missing case:
> /home/jalbrecht/src/qemu/tests/tcg/s390x/signal.c: In function 
> 'handle_signal':
> /home/jalbrecht/src/qemu/tests/tcg/s390x/signal.c:70:5: error: 
> enumeration value 'exception_operation' not handled in switch 
> [-Werror=switch]
>     70 |     switch (expected.exception) {
>        |     ^~~~~~
> cc1: all warnings being treated as errors

I wonder how I didn't catch this, since I'm testing on Ubuntu 20.04
as well. Thank you, I will fix this.

Best regards,
Ilya


