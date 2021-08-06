Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5A63E27AF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:46:52 +0200 (CEST)
Received: from localhost ([::1]:38076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBwRH-00078j-Dx
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1mBwLA-0001wI-Nl; Fri, 06 Aug 2021 05:40:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1mBwL8-0004ZK-Pk; Fri, 06 Aug 2021 05:40:32 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1769XH71180638; Fri, 6 Aug 2021 05:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=nw5NM3nxXukaG8ywrjXV+SV6knx+tEggROselZd7FiI=;
 b=j5n3T+PuxHUHC42XIXPXHzcn/NxWtdfmrRnyyTFBoRu1NhueOwGpuHs4+jEQlqx7BXbP
 ZmYfaqcuSF5nJAFZ+pND5CdX9g4JMOuj/K9fbUBXu5sHl7yyjX/8RPFLH8F5MFLtaWEe
 AQqXEnPmXHMogJ4iaRknHq8npXIH/J/UcPVqlkvD4VR2k6WWPIADZMbYWkfXIZqYxodu
 mKjp0foXVIMltFf1pRfrtOrlxC8PtZlfmbcYWzjaMnJGTrLM14HvqHKHseuTt3Ws/rOj
 CUAoM5b+3ofre+u+s20YaZdUCLVYnmz/C1/Gq3tKVrP4KT0r2VF0CpEcuaufht52J/QD mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a8ye9ntnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 05:40:25 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1769XJuA180727;
 Fri, 6 Aug 2021 05:40:25 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a8ye9ntmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 05:40:25 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1769bodk013272;
 Fri, 6 Aug 2021 09:40:23 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3a4wshvynn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 09:40:22 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1769bInA14877014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Aug 2021 09:37:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AC6BAE057;
 Fri,  6 Aug 2021 09:40:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABCCDAE061;
 Fri,  6 Aug 2021 09:40:17 +0000 (GMT)
Received: from sig-9-145-77-113.uk.ibm.com (unknown [9.145.77.113])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Aug 2021 09:40:17 +0000 (GMT)
Message-ID: <41b7d3647f3dd6febba3db45b7c5a259caefbb89.camel@linux.ibm.com>
Subject: Re: [PATCH v8] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Date: Fri, 06 Aug 2021 11:40:17 +0200
In-Reply-To: <24e2f339-da2f-3317-070d-7e8761c47271@redhat.com>
References: <20210804225146.154513-1-iii@linux.ibm.com>
 <24e2f339-da2f-3317-070d-7e8761c47271@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HND4e9S3HxMf3n-gOvTb17KVFAHCToke
X-Proofpoint-GUID: VI45aW0M15oiFSGOVKkIWZq7I4hbZcfL
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_02:2021-08-05,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108060067
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-08-06 at 07:25 +0200, Thomas Huth wrote:
> On 05/08/2021 00.51, Ilya Leoshkevich wrote:
> > Verify that s390x-specific uc_mcontext.psw.addr is reported
> > correctly
> > and that signal handling interacts properly with debugging.
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> > 
> > v7:
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00463.html
> > v7 -> v8: Another rebase needed due to the conflict with Jonathan's
> >            50e36dd61652.
> 
> Thanks for respinning this patch! I now gave it a try, and it seems
> to work, 
> but the output looks a little funny:
> 
>    SKIPPED signals on s390x because BROKEN awaiting sigframe clean-
> ups and 
> vdso support
>    TEST    test-mmap (default) on s390x
>    TEST    testthread on s390x
>    TEST    threadcount on s390x
>    TEST    hello-s390x on s390x
>    TEST    csst on s390x
>    TEST    ipm on s390x
>    TEST    exrl-trt on s390x
>    TEST    exrl-trtr on s390x
>    TEST    pack on s390x
>    TEST    mvo on s390x
>    TEST    mvc on s390x
>    TEST    trap on s390x
>    TEST    signals-s390x on s390x
> 
> i.e. it first says "SKIPPED signals", but later still executes the
> test. 
> Could that be fixed somehow?

These are two different tests actually. signals is a multiarch
test that is valid on other machines as well. The new signals-s390x
tests only s390x-specific aspects of signal handling.

Best regards,
Ilya


