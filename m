Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6604BD917
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 11:29:48 +0100 (CET)
Received: from localhost ([::1]:45262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5wv-00035Q-3C
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 05:29:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nM5v7-0002DI-Tg; Mon, 21 Feb 2022 05:27:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:61788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nM5v4-0002Da-Qz; Mon, 21 Feb 2022 05:27:53 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LA2KsL015897; 
 Mon, 21 Feb 2022 10:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=mhUFza4EckkwyBBcA28dmbX6JZIBTVlLfbPgZcafMmo=;
 b=OOPeBTWP/AWTQOXjr4UQLjCcZujU7a62Ly/L6fQbXAnFRYL8fEvVolLk4Uh7XWnMEdo9
 xMwFK9u7aLt4HjDdh/jGUmdGeTxn1bCjLQr02avaryuBl0cq1XBUZV4P4WGJFMuKrdfL
 +rT6VTjoZI/7a+HjC1r7fvA7MhC/QTV0K+vM/FUl3xAUXt64RNeZ5+7RYjoSiW8iCoEK
 uGWZ7Wb72JDANra2c0xF1TsmZQ4PY9G+R2SEQzwt4RGIlr40L3gIt6JEo+bINOy1RPkF
 48irq10W1lQ+TNnNIi5VbVXyZ7Dd+2UukKobnIAGI3mIpRjtG8Dn4b4vY74arxl0Jdmj VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ec5q0cj5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 10:27:45 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21LARjqs015872;
 Mon, 21 Feb 2022 10:27:45 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ec5q0cj5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 10:27:45 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21LACmF0007654;
 Mon, 21 Feb 2022 10:27:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3ear68sjjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 10:27:42 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21LAReHh57672118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 10:27:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3800CA406A;
 Mon, 21 Feb 2022 10:27:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6B98A405C;
 Mon, 21 Feb 2022 10:27:39 +0000 (GMT)
Received: from [9.171.10.246] (unknown [9.171.10.246])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Feb 2022 10:27:39 +0000 (GMT)
Message-ID: <54616427-1784-d12b-1a54-131796b56c07@linux.ibm.com>
Date: Mon, 21 Feb 2022 11:27:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: qemu iotest 161 and make check
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu block <qemu-block@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <36201311-39e2-0b94-1b06-74a2df988553@linux.ibm.com>
 <45589fd7-bf18-8950-34f5-86a90b99c8c1@virtuozzo.com>
 <586f035a-91b7-4743-9285-09996aa32b4f@linux.ibm.com>
 <a4955275-6cdd-f54d-81b1-8380aad0461f@redhat.com>
 <6d73af8a-4620-f702-5367-6bed666b61a8@virtuozzo.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <6d73af8a-4620-f702-5367-6bed666b61a8@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OZmEKWu8R06FTMHyYzXUlt4LpQgQ8DCs
X-Proofpoint-GUID: 31Vd3Ff2IkG2JniSIzgVL81H-WwToPy7
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202210060
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Am 10.02.22 um 18:44 schrieb Vladimir Sementsov-Ogievskiy:
> 10.02.2022 20:13, Thomas Huth wrote:
>> On 10/02/2022 15.51, Christian Borntraeger wrote:
>>>
>>>
>>> Am 10.02.22 um 15:47 schrieb Vladimir Sementsov-Ogievskiy:
>>>> 10.02.2022 10:57, Christian Borntraeger wrote:
>>>>> Hello,
>>>>>
>>>>> I do see spurious failures of 161 in our CI, but only when I use
>>>>> make check with parallelism (-j).
>>>>> I have not yet figured out which other testcase could interfere
>>>>>
>>>>> @@ -34,6 +34,8 @@
>>>>>   *** Commit and then change an option on the backing file
>>>>>
>>>>>   Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=1048576
>>>>> +qemu-img: TEST_DIR/t.IMGFMT.base: Failed to get "write" lock
>>>>> +Is another process using the image [TEST_DIR/t.IMGFMT.base]?
>>>>>   Formatting 'TEST_DIR/t.IMGFMT.int', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
>>>>>   Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.IMGFMT.int backing_fmt=IMGFMT
>>>>>   { 'execute': 'qmp_capabilities' }
>>>>>
>>>>>
>>>>> any ideas?
>>>>>
>>>>
>>>> Hmm, interesting.. Is it always 161 and always exactly this diff?
>>>
>>> Its always 161 and only 161. I would need to check if its always the same error.
>>>
>>>>
>>>> First, this place in 161 is usual: we just create and image, like in many other tests.
>>>>
>>>> Second, why _make_test_img trigger "Failed to get write lock"? It should just create an image. Hmm. And probably starts QSD if protocol is fuse. So, that start of QSD may probably fail.. Is that the case? What is image format and protocol used in test run?
>>>>
>>>> But anyway, tests running in parallel should not break each other as each test has own TEST_DIR and SOCK_DIR..
>>
>> Unless you run into the issue that Hanna described here:
>>
>>   https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01735.html
>>
> 
> Yes, we can't execute same test several times (for different formats) in parallel.. But that's about any test, not only 161.
> 
> And I don't think that it's currently possible that we run same test in parallel several times somewhere, do we? In tests/check-block.sh we have a sequential loop through $format_list ..

FWIW, I was able to bisect this and it came in with

bcda7b178fde7797f476e3b066fe5fc76bfa1c43 is the first bad commit
commit bcda7b178fde7797f476e3b066fe5fc76bfa1c43
Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Date:   Thu Dec 23 19:39:33 2021 +0100

     check-block.sh: passthrough -jN flag of make to -j N flag of check
     
     This improves performance of running iotests during "make -jN check".
     
     Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
     Message-Id: <20211223183933.1497037-1-vsementsov@virtuozzo.com>
     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

  tests/check-block.sh | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)



With

make check-block -j 100

it reproduced pretty quickly for me.

