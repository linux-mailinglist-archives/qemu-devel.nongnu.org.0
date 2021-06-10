Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB443A28CD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:55:19 +0200 (CEST)
Received: from localhost ([::1]:48902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHPB-0003bH-NA
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lrHNT-00027j-HA; Thu, 10 Jun 2021 05:53:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lrHNP-0003Iy-U1; Thu, 10 Jun 2021 05:53:31 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15A9llXb057833; Thu, 10 Jun 2021 05:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wKUXiqIdMrwKctTV0pNMgK31T/etnQQyTFHKFpQbftU=;
 b=r6CCDmD6QND9OBAcxGqvb1DyxqXB/TaphQsfwInrkRfcFpQ6r+D7ebSG4cD+98sWn5CI
 SJ85ztkQoDtZxNJIkpjOrs9jJ0T5sCGpZsUyL8aT7hmDCR0c0Vbd4mH/OS+GYJMQUVKY
 jc5V/ayjt+EyL4DddxdknSWyXvLkS3wTp6YwKXM8iUJsNW5bj6GofZVKkYTqIQeZTPoh
 S5FfCTML/ofH7hEeUs6/JWc/l9rdXm6uu7RMKFzv7mXk0PA1LibzMAZDNnRlbPXakIfB
 pWC3MK+wzuPT77e43KRz3hEe5wd6Co3VVv4Bkr7oxnes5WH9dmUxnXy32PVBbD2gkXpX Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393gdyg2xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 05:53:24 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15A9nm9P062720;
 Thu, 10 Jun 2021 05:53:24 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393gdyg2ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 05:53:24 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15A9h7hZ014354;
 Thu, 10 Jun 2021 09:53:22 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3900w89h15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 09:53:21 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15A9qQAx32571846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 09:52:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7FBBAE04D;
 Thu, 10 Jun 2021 09:53:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E1D7AE055;
 Thu, 10 Jun 2021 09:53:18 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.13.5])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Jun 2021 09:53:18 +0000 (GMT)
Subject: Re: [PATCH v3 0/2] target/s390x: Fix SIGILL psw.addr reporting
To: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
References: <20210602002210.3144559-1-iii@linux.ibm.com>
 <972102fd-ac1e-f13c-7aa7-ad6c7a9be67e@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <fa54af76-e835-03ec-37dc-8d62756f683a@de.ibm.com>
Date: Thu, 10 Jun 2021 11:53:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <972102fd-ac1e-f13c-7aa7-ad6c7a9be67e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XYUXU1O2yANre62C3FQCwUJdVwkDzNGE
X-Proofpoint-GUID: KUf4956S5YN18SYSGWQFw0nvxEamtOHh
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_05:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100062
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10.06.21 11:49, David Hildenbrand wrote:
> On 02.06.21 02:22, Ilya Leoshkevich wrote:
>> qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr: it
>> should be a pointer to the instruction following the illegal
>> instruction, but at the moment it is a pointer to the illegal
>> instruction itself. This breaks OpenJDK, which relies on this value.
>>
>> Patch 1 fixes the issue, patch 2 adds a test.
>>
>> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
>> v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
>>            magic in the test and add an explanation (David).
>>
>> v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06649.html
>> v2 -> v3: Fix SIGSEGV handling (found when trying to run valgrind under
>>            qemu-user).
>>
> 
> There might still be something wrong:
> 
> https://gitlab.com/qemu-project/qemu/-/issues/319
> 
> At least it smells like some more signal (mis)handling.

Yes there is more. Expect a patch (in a different area of signals)
from the ecosystem team soon.

