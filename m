Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE153679A9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 08:06:36 +0200 (CEST)
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZSTz-0003hN-7n
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 02:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lZSSZ-0002oJ-TS; Thu, 22 Apr 2021 02:05:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61954
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lZSST-00037y-N5; Thu, 22 Apr 2021 02:05:07 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13M63KUp137566; Thu, 22 Apr 2021 02:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=N2/UEHPTsXfriWyQQF0kcAu3LmkrJX2H1J0oQ2Qgmsw=;
 b=RceHr7bJxG0om1fkRu2+wMYsn2TfxVaa/ExRJzV2mVvxrxOhZ3lHz4FNP0ERjCOAacDC
 C3c9L8oGN/g71hNBpk06c4HI7joJ9LOY8L5HrhSpFYkPN/MVDCOjz3fWrLibGxz4mVoK
 wy3ZgqIDBZLXbeIAzJMa8AdS+WIcduyccxO9OWOSlugAfRftbmOORfKdJirgpl+durF8
 GuogA7uA5AToAWDDMoGJsrnxaoo78qtn2rdUKUfRcu1JTc/WJtctv1y8M7zSn/UmY5Sr
 MimVI8e91MgNsALtkmuWfG0E4YXtfZYTDKfTf4N+ZYeeTAI1Gj8JnODUF0ZD1QuC3KJK +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3832xn104m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 02:04:59 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13M63Mud137786;
 Thu, 22 Apr 2021 02:04:59 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3832xn103r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 02:04:58 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13M635rd024447;
 Thu, 22 Apr 2021 06:04:57 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 37yqa89ffn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 06:04:56 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13M64s0u18022720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 06:04:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E745C4C063;
 Thu, 22 Apr 2021 06:04:53 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1087E4C040;
 Thu, 22 Apr 2021 06:04:53 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.31.146])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Apr 2021 06:04:52 +0000 (GMT)
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>
References: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
 <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <0e84f164-9255-b63a-ec53-888ffa889688@de.ibm.com>
Date: Thu, 22 Apr 2021 08:04:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BVtwM6CkL9a-qQX0q_JAszcWggXY9GxH
X-Proofpoint-GUID: PF5Gu1zI-hY0gezCQV-epqVnYTAfcUGm
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_01:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220051
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 22.04.21 06:47, Thomas Huth wrote:
> On 22/04/2021 06.18, Philippe Mathieu-Daudé wrote:
>> Hi Thomas, Daniel, Stefano,
>>
>> Regarding the following warning (GCC 11 on Fedora 34):
>>
>> In file included from pc-bios/s390-ccw/main.c:11:
>>
>> In function ‘memset’,
>>
>>      inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,
>>
>>      inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:
>>
>> pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of
>> size 0 [-Wstringop-overflow=]
>>
>>     28 |         p[i] = c;
>>
>>        |         ~~~~~^~~
>>
>> Daniel were right on IRC:
>>
>> danpb: it is from a call  memset((char *)S390EP, 0, 6)     where  S390EP
>> is just a constant address 0x10008
>> danpb: the compiler doesn't now how big that is, so it seems to assume
>> it is zero length
>>
>> This is a known GCC issue:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
>> "gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing a
>> pointer from integer literal"
> 
> Hi Philippe,
> 
> thanks for following up with the gcc bugzilla!
> 
> ... so the problem is that GCC thinks we're in fact dereferencing a NULL pointer at offset 0x10008 here? Wow, that's ... crazy.
> 
> Not sure what to do now - wait for the bug to get resolved? Compile the s390-ccw bios with -Wno-stringop-overread ? Add "volatiles" here and there to hope that these silence the compiler warnings? ... I tend to wait for the bug ticket to see whether the GCC folks change the behavior of the compiler again, but I'm open for other suggestions.

I tend to follow the Linux kernel. If the compiler tends to produce stupid errors,
silence them with Wno-*.
I think it makes no sense to have warnings with a high tendency of false positives in a
project with Werror.

