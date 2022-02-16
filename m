Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E528E4B844A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:31:11 +0100 (CET)
Received: from localhost ([::1]:60436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGeU-0006Qs-VF
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:31:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nKGc4-0003Tw-O0; Wed, 16 Feb 2022 04:28:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nKGc2-0001H2-G1; Wed, 16 Feb 2022 04:28:40 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G7dNWA010249; 
 Wed, 16 Feb 2022 09:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1Q7qaCyc3SnSBV7/Ru8iODnsSpaxXbclUEoVHaHpdgQ=;
 b=tpkU+niN2oVLByAjCeyAlb54101HmpFes1X1oLLhnyXH9xM6cqQNGJmsdHbj0HYVRAhq
 +Oi0DN7O6kgdi5to9j7VpUGVrkI4m9IM5RIyoSNpUbLPE0l2mRryHnWFR9/1UXnchhci
 w26uk88Thedp+5m70gU7NJVZ8rf2szXpK0ErJJx9ubHNu76Ooy1K0t3mydrSwL/oON0I
 HGR21fGTfUh39LfhF7UHmg6SrWQ/t5Q6JWNgmw/hTaTimcDZbIIiNMc4HC3bQ4LumFft
 BNzzx/qm5FXYfpUFdDlCMw2jWOWwmAB9ePpAar1zenhb/dIXK0tkYOmm1d5nEyZKlZcJ sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8thyd64p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:28:35 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21G9Kmoa031824;
 Wed, 16 Feb 2022 09:28:34 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8thyd647-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:28:34 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G9HorN031033;
 Wed, 16 Feb 2022 09:28:32 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3e64ha51ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:28:32 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21G9SNxn47055298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 09:28:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 372734C044;
 Wed, 16 Feb 2022 09:28:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF30A4C058;
 Wed, 16 Feb 2022 09:28:22 +0000 (GMT)
Received: from [9.171.60.98] (unknown [9.171.60.98])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 09:28:22 +0000 (GMT)
Message-ID: <30804e5d-74bd-b7be-7615-5d7c3690a902@linux.ibm.com>
Date: Wed, 16 Feb 2022 10:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] s390x/tcg/tests: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, David Miller <dmiller423@gmail.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org, thuth@redhat.com
References: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
 <65402899-e2ad-0a59-e77a-07f2f8ca4ff2@redhat.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <65402899-e2ad-0a59-e77a-07f2f8ca4ff2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7i7RufYTqhcDSPq5XzhL1Bouu0zJpRxs
X-Proofpoint-ORIG-GUID: CY5HojWxzpInApd12AI4imfRNnoKNf_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160051
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Cc: pasic@linux.ibm.com, farman@linux.ibm.com, cohuck@redhat.com,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 16.02.22 um 10:17 schrieb David Hildenbrand:
> On 15.02.22 21:27, David Miller wrote:
>> tests/tcg/s390x/mie3-compl.c: [N]*K instructions
>> tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
>> tests/tcg/s390x/mie3-sel.c:  SELECT instruction
>>
>> Signed-off-by: David Miller <dmiller423@gmail.com>
>> ---
>>    tests/tcg/s390x/Makefile.target |  2 +-
>>    tests/tcg/s390x/mie3-compl.c    | 56 +++++++++++++++++++++++++++++++++
>>    tests/tcg/s390x/mie3-mvcrl.c    | 31 ++++++++++++++++++
>>    tests/tcg/s390x/mie3-sel.c      | 42 +++++++++++++++++++++++++
>>    4 files changed, 130 insertions(+), 1 deletion(-)
>>    create mode 100644 tests/tcg/s390x/mie3-compl.c
>>    create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
>>    create mode 100644 tests/tcg/s390x/mie3-sel.c
>>
>> diff --git a/tests/tcg/s390x/Makefile.target
>> b/tests/tcg/s390x/Makefile.target
>> index 1a7238b4eb..16b9d45307 100644
>> --- a/tests/tcg/s390x/Makefile.target
>> +++ b/tests/tcg/s390x/Makefile.target
>> @@ -1,6 +1,6 @@
>>    S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>>    VPATH+=$(S390X_SRC)
>> -CFLAGS+=-march=zEC12 -m64
>> +CFLAGS+=-march=z15 -m64
> 
> Unfortunately, this makes our docker builds unhappy -- fail. I assume the
> compiler in the container is outdated.
> 
> $ make run-tcg-tests-s390x-linux-user
> changing dir to build for make "run-tcg-tests-s390x-linux-user"...
> make[1]: Entering directory '/home/dhildenb/git/qemu/build'
>    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp
>    BUILD   debian10
>    BUILD   debian-s390x-cross
>    BUILD   TCG tests for s390x-linux-user
>    CHECK   debian10
>    CHECK   debian-s390x-cross
>    BUILD   s390x-linux-user guest-tests with docker qemu/debian-s390x-cross
> s390x-linux-gnu-gcc: error: unrecognized argument in option '-march=z15'
> s390x-linux-gnu-gcc: note: valid arguments to '-march=' are: arch10 arch11 arch12 arch3 arch5 arch6 arch7 arch8 arch9 g5 g6 native z10 z13 z14 z196 z9-109 z9-ec z900 z990 zEC12; did you mean 'z10'?
> 
> Maybe debian11 could, work.
> 
> @Thomas do you have any idea if we could get this to work with
> '-march=z15' or should we work around that by manually encoding
> the relevant instructions instead?

Yes, the problem is that binutils reject new mnemomics for older -march settings.
The Linux kernel handles this by using
.insn instead of the mnemonic. This will also allow to compile the testcase with older compilers/binutils.

So something like
"ncrk  0, 3, 2" -> ".insn rrf,0xb9f50000,0,3,2,0"

