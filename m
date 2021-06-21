Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F23AE9D5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:14:43 +0200 (CEST)
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJlC-0002Tk-Fp
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1lvJjS-0001KB-3O; Mon, 21 Jun 2021 09:12:54 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1lvJjK-0000dl-G1; Mon, 21 Jun 2021 09:12:53 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LD3reA082180; Mon, 21 Jun 2021 09:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KVakGlCO8lClA7xAU1UULIbPRkiGTRBC6hsnb/on5E4=;
 b=tLPqQ9IDOgtTwnRycW0uGjY24c6tDBosSLT3kFqboGHUOX8vOiYVSXooWSIC92xPtmX6
 STaXx1DttFZfk5sgTzRNmbebUsdgQ1dIRjke3bz8ZqLGZJMGnX8TuR4DFmDAsMF4CtlN
 z0v9AuqrrPgc3HqoDO7DVtWG+9DanCCFGqxsCn9BrKLKvPT1mcarn2GTnk8SAH87K8fB
 tBge+WAhfghvhWuSQnkYwocDioXxo7LE6fJAObOt71lSDqCQqD1Vxwgu3XLq3ZlsDJyJ
 T/cPT4p/0EHnT8o90s5gZVEiOMtYglyaRI35vRsaF0AeN75qeWprAZWjHIj145YasjzA 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39asqj3t6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 09:12:40 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LD4DbQ084300;
 Mon, 21 Jun 2021 09:12:40 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39asqj3t54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 09:12:40 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LD8f9x014711;
 Mon, 21 Jun 2021 13:12:39 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3998793603-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 13:12:39 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15LDCcMm19464556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 13:12:38 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55433AE05C;
 Mon, 21 Jun 2021 13:12:38 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8C58AE060;
 Mon, 21 Jun 2021 13:12:37 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 13:12:37 +0000 (GMT)
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 21 Jun 2021 09:12:37 -0400
From: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v3 0/2] target/s390x: Fix SIGILL psw.addr reporting
Organization: IBM
In-Reply-To: <095e6342f7f93b6d157f5a3cb99980a96990c290.camel@linux.ibm.com>
References: <20210602002210.3144559-1-iii@linux.ibm.com>
 <972102fd-ac1e-f13c-7aa7-ad6c7a9be67e@redhat.com>
 <095e6342f7f93b6d157f5a3cb99980a96990c290.camel@linux.ibm.com>
Message-ID: <b271e6d8bc790e8d6fa3b3bdfb39150d@imap.linux.ibm.com>
X-Sender: jonathan.albrecht@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EY2CEvUriDovefWXvfYbgeQKyzZx-SYy
X-Proofpoint-GUID: EQx19D8YuD4MEpV24_7wSJgVtvBuK_Vu
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_06:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210078
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x
 <qemu-s390x-bounces+jonathan.albrecht=linux.vnet.ibm.com@nongnu.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-06-21 8:00 am, Ilya Leoshkevich wrote:
> On Thu, 2021-06-10 at 11:49 +0200, David Hildenbrand wrote:
>> On 02.06.21 02:22, Ilya Leoshkevich wrote:
>> > qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr:
>> > it
>> > should be a pointer to the instruction following the illegal
>> > instruction, but at the moment it is a pointer to the illegal
>> > instruction itself. This breaks OpenJDK, which relies on this
>> > value.
>> >
>> > Patch 1 fixes the issue, patch 2 adds a test.
>> >
>> > v1:
>> > https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
>> > v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
>> >            magic in the test and add an explanation (David).
>> >
>> > v2:
>> > https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06649.html
>> > v2 -> v3: Fix SIGSEGV handling (found when trying to run valgrind
>> > under
>> >            qemu-user).
>> >
>> 
>> There might still be something wrong:
>> 
>> https://gitlab.com/qemu-project/qemu/-/issues/319
>> 
>> At least it smells like some more signal (mis)handling.
>> 
>> 
> 
> I've taken another look, and it must be compare-and-trap SIGFPE/SIGILL
> mixup. I think I will just fix it here in v4.

Yes, I've been looking at it too and found it is a compare-and-trap
SIGFPE/SIGILL mixup. I was about to send out a patch if you want
to wait. I should be able to send it out in an hour.

Jon

> 
> Best regards,
> Ilya

