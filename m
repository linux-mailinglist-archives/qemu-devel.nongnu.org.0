Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A143589E0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:38:01 +0200 (CEST)
Received: from localhost ([::1]:37470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXfM-0005IX-Nk
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lUXX1-0006Eu-EQ; Thu, 08 Apr 2021 12:29:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lUXMg-0000gP-T2; Thu, 08 Apr 2021 12:18:44 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138G4146027686; Thu, 8 Apr 2021 12:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tZmkAH3jiUZPP3m1xltLA9mgh39paSWQ0pZw842FOI8=;
 b=goXvSWpnQ7WVtmU7VAIIcFnCqCIcronx8yzeWuN6Cx+mlcD/oiBzdKFS3dC0TVrGne3D
 41lu+7aXR06ErYPXiE+LBcosDlRkmY5RQLNf8kTjPmD7/V8fvA6o8Bjhk68sMzttOuFv
 o4hi20UxDBrrTyReEFaZ/72akaCWE9G1Jzlt3huALQQa3eZTOv5Sna+P4eMejpuUe7Qa
 Ig3O7ssPTVd9opO8ju3sH6LAx6duQ7It7k10GD8ZuRMVlTgfWhfiycbYUAq7bsC86aq4
 Y3vNnQOVrZ8PXvlAJEotuKf/7IQ1BMxy5VZnMYgU4AJdSpYnPcCQcoakCpBMvm/b0PkN 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvm1h81u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 12:18:39 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 138G45EX029594;
 Thu, 8 Apr 2021 12:18:39 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvm1h80y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 12:18:39 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 138G3U3M025754;
 Thu, 8 Apr 2021 16:18:36 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 37rvbsgxgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 16:18:36 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 138GIXeT41091358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 16:18:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9001A5204E;
 Thu,  8 Apr 2021 16:18:33 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.156.198])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 221275204F;
 Thu,  8 Apr 2021 16:18:33 +0000 (GMT)
Subject: Re: [PATCH v1 1/1] s390x: css: report errors from
 ccw_dstream_read/write
To: Cornelia Huck <cohuck@redhat.com>
References: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
 <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
 <20210407194711.459176c3.pasic@linux.ibm.com>
 <20210408110232.2bf02df4.cohuck@redhat.com>
 <6fe2743d-c800-d743-fe01-ea10bed90e9a@linux.ibm.com>
 <20210408152322.70eea267.cohuck@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <6859ae7b-9ed0-17ab-ff8d-366cb566eb04@linux.ibm.com>
Date: Thu, 8 Apr 2021 18:18:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408152322.70eea267.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QJZDZQeQjCyDZ87xQ6-W4_o-8lhWbULP
X-Proofpoint-ORIG-GUID: e0CZfRxPgPVhQS3amHRwxsZdU6HYUqim
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=971 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104080107
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, mst@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/8/21 3:23 PM, Cornelia Huck wrote:
> On Thu, 8 Apr 2021 14:32:11 +0200
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
>> On 4/8/21 11:02 AM, Cornelia Huck wrote:
>>> On Wed, 7 Apr 2021 19:47:11 +0200
>>> Halil Pasic <pasic@linux.ibm.com> wrote:
>>>    
>>>> So this begs the question, do we need this fixed for old releases as well?
>>>>
>>>> My answer is yes we do. Conny what do you think?
>>>
>>> What do you mean with "old releases"? The dstream rework was in 2.11,
>>> and I doubt that anyone is using anything older, or a downstream
>>> release that is based on pre-2.11.
>>>
>>> If you mean "include in stable", then yes, we can do that; if we want
>>> the commit in 6.0, I need the final version soon.
>>>
>>>    
>>
>> OK, are you OK with the two change propositions I sent?
>>
>> 1) let the 3270 decide for internal errors (-EIO) but return the error
>> for CSS errors in handle_payload_3270_write()
>>
>> 2) for senseid, always ask CSS to update the residual count
>> but only erase the senseid if the write succeeded
>>
>>
> 
> I think both make sense.
> 

OK I send a v2
Thanks

Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

