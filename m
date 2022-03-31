Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30544ED5AD
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:33:38 +0200 (CEST)
Received: from localhost ([::1]:44856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqFN-0007fH-7m
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:33:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nZq7R-0001WQ-Ci; Thu, 31 Mar 2022 04:25:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62974
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nZq7O-0004QS-6y; Thu, 31 Mar 2022 04:25:24 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22V7ed4X016083; 
 Thu, 31 Mar 2022 08:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qh+7FLIIfLCv+Th4qKAZs/JsG0hZVB+jSaXtfhw6FXA=;
 b=CsjBfWBOid5RdBFBa8aVMtpNSr5Q0lVB8S4PI//hpWRFWZ/o/GpSpXO64IiNadtreqoc
 B+SdgEJlgtM5V7KNKA0DkOqLMJ6e3OUz2SvF2v952/ecqwc1NpqHQx9AcdCKavA6H7tR
 NSBZc4hHq/qP4fua/bTJ6Bx9mdO0UuFr5xecCk/pLFCyHDBYNtXYkuPd1jUdKOhsiXEq
 ffMhttTgoqOnAGFhTlLEGUMV9HAJBau5EkLpxP5X2+vROyROR82Vo31zrqqOD3ytkpXA
 cnP4yF4LeWuUzNoZEl3TytysFwLMAYsupfsZmPIFqpSZS9qjyn6BZXmPlKm5SD2lYygQ cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f50aeh3b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 08:25:20 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22V8PK9K031912;
 Thu, 31 Mar 2022 08:25:20 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f50aeh3ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 08:25:19 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22V8JJqN013047;
 Thu, 31 Mar 2022 08:25:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3f1tf90r50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 08:25:17 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22V8PLUJ40370448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Mar 2022 08:25:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9815FA405C;
 Thu, 31 Mar 2022 08:25:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10FF6A4054;
 Thu, 31 Mar 2022 08:25:15 +0000 (GMT)
Received: from [9.171.83.180] (unknown [9.171.83.180])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 31 Mar 2022 08:25:14 +0000 (GMT)
Message-ID: <2592efbf-ec8f-d6ef-2708-37958b514a02@linux.ibm.com>
Date: Thu, 31 Mar 2022 10:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: qemu iotest 161 and make check
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu block <qemu-block@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <36201311-39e2-0b94-1b06-74a2df988553@linux.ibm.com>
 <45589fd7-bf18-8950-34f5-86a90b99c8c1@virtuozzo.com>
 <586f035a-91b7-4743-9285-09996aa32b4f@linux.ibm.com>
 <a4955275-6cdd-f54d-81b1-8380aad0461f@redhat.com>
 <6d73af8a-4620-f702-5367-6bed666b61a8@virtuozzo.com>
 <54616427-1784-d12b-1a54-131796b56c07@linux.ibm.com>
 <d6d24f79-24bd-46ac-6332-a066410e0217@linux.ibm.com>
In-Reply-To: <d6d24f79-24bd-46ac-6332-a066410e0217@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QPRpOP-L6L7-UYmAtejLH_msiVkHnJ2A
X-Proofpoint-GUID: o7UFRMh0aYGon26azQNr5NIw5QQ3vW-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_03,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203310044
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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



Am 31.03.22 um 09:44 schrieb Christian Borntraeger:
> 
> 
> Am 21.02.22 um 11:27 schrieb Christian Borntraeger:
>>
>> Am 10.02.22 um 18:44 schrieb Vladimir Sementsov-Ogievskiy:
>>> 10.02.2022 20:13, Thomas Huth wrote:
>>>> On 10/02/2022 15.51, Christian Borntraeger wrote:
>>>>>
>>>>>
>>>>> Am 10.02.22 um 15:47 schrieb Vladimir Sementsov-Ogievskiy:
>>>>>> 10.02.2022 10:57, Christian Borntraeger wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> I do see spurious failures of 161 in our CI, but only when I use
>>>>>>> make check with parallelism (-j).
>>>>>>> I have not yet figured out which other testcase could interfere
>>>>>>>
>>>>>>> @@ -34,6 +34,8 @@
>>>>>>>   *** Commit and then change an option on the backing file
>>>>>>>
>>>>>>>   Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=1048576
>>>>>>> +qemu-img: TEST_DIR/t.IMGFMT.base: Failed to get "write" lock
> 
> FWIW, qemu_lock_fd_test returns -11 (EAGAIN)
> and raw_check_lock_bytes spits this error.


And its coming from here (ret is 0)

int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
{
     int ret;
     struct flock fl = {
         .l_whence = SEEK_SET,
         .l_start  = start,
         .l_len    = len,
         .l_type   = exclusive ? F_WRLCK : F_RDLCK,
     };
     qemu_probe_lock_ops();
     ret = fcntl(fd, fcntl_op_getlk, &fl);
     if (ret == -1) {
         return -errno;
     } else {
----->        return fl.l_type == F_UNLCK ? 0 : -EAGAIN;
     }
}

> 
> 
> Is this just some overload situation that we do not recover because we do not handle EAGAIN any special.

