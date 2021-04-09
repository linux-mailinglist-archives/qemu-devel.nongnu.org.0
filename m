Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069CC359A3D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:57:02 +0200 (CEST)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnsr-0000ES-52
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lUns5-00087W-CI; Fri, 09 Apr 2021 05:56:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54648
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lUnrx-0005Uk-Ui; Fri, 09 Apr 2021 05:56:11 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1399XXvb053576; Fri, 9 Apr 2021 05:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NmVs2GOmrMZd7aobl/PidxMaTguohQzTqZSi52v0iIo=;
 b=kMoYvgl7NZ4kVuhI06nJvpymvm51s42gNj1EgO1VVrGid33P3NaIEbIy+EpKizkB0X4a
 URl81oaseKdVwcurm9ZhGu+mw4buMm2ao5GCW7Go0WAL5y6kJr3FkaCW9tKu2+LsWTS7
 R8r58C+Nb7V3NozXel+U9ONNg2rEBvDEkkH/hUmsXaOcNmHviVP6gheiOfBFyGvWKqDv
 O+rZAHGEBRss62FosS9KY/F4Jpi/Z2ybU9jzATcK7jGUU3sWYwmI28XkO7QIRX63j2Oy
 ey4c2idG81Ej/ld9I18VfO1YOplv8fNoqUmIlyv5E0MpeLXQucazYXVd0/BE6K7lCJ0b zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37tk4tjwjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 05:56:02 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1399Xhbt054557;
 Fri, 9 Apr 2021 05:56:02 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37tk4tjwhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 05:56:02 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1399pmXw027650;
 Fri, 9 Apr 2021 09:56:00 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 37rvbw18pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 09:56:00 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1399tZUo33554920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Apr 2021 09:55:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE02D11C052;
 Fri,  9 Apr 2021 09:55:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6183911C04A;
 Fri,  9 Apr 2021 09:55:56 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.28.63])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  9 Apr 2021 09:55:56 +0000 (GMT)
Subject: Re: [PATCH v2 1/1] s390x: css: report errors from
 ccw_dstream_read/write
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
References: <1617899529-9329-1-git-send-email-pmorel@linux.ibm.com>
 <1617899529-9329-2-git-send-email-pmorel@linux.ibm.com>
 <20210409103837.135e994e.pasic@linux.ibm.com>
 <20210409104938.465b81de.cohuck@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <7fe88dbf-7d0e-41bd-94f7-0f14bdae92b9@linux.ibm.com>
Date: Fri, 9 Apr 2021 11:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210409104938.465b81de.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YUKysLSFzLCO8T0hfvaYO8r8yFK_JzZt
X-Proofpoint-ORIG-GUID: a2tJP3g9duOdhHYjoVE92sPne7SgAXXt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090068
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/9/21 10:49 AM, Cornelia Huck wrote:
> On Fri, 9 Apr 2021 10:38:37 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
>> On Thu,  8 Apr 2021 18:32:09 +0200
>> Pierre Morel <pmorel@linux.ibm.com> wrote:
>>
>>> ccw_dstream_read/write functions returned values are sometime
>>> not taking into account and reported back to the upper level
>>> of interpretation of CCW instructions.
>>>
>>> It follows that accessing an invalid address does not trigger
>>> a subchannel status program check to the guest as it should.
>>>
>>> Let's test the return values of ccw_dstream_write[_buf] and
>>> ccw_dstream_read[_buf] and report it to the caller.
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>
>> Acked-by: Halil Pasic <pasic@linux.ibm.com>
>>
>> I did not look into the whole scsw.count stuff or into wether
>> your changes to 3270 (look form <mark></mark> in the diff part) affect
>> more than just ccw_dstream_*.
>>
>> I would have preferred this patch split up based on the intended effect
>> and thus also subsystem (css, virtio-ccw, 3270), but I've alluded to
>> that before, and since we are in a hurry I can live with it as is.
>>
>> Regards,
>> Halil
>>
>>> ---
>>>   hw/char/terminal3270.c | 11 +++++--
>>>   hw/s390x/3270-ccw.c    |  5 +++-
>>>   hw/s390x/css.c         | 14 +++++----
>>>   hw/s390x/virtio-ccw.c  | 66 ++++++++++++++++++++++++++++++------------
>>>   4 files changed, 69 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
>>> index a9a46c8ed3..82e85fac2e 100644
>>> --- a/hw/char/terminal3270.c
>>> +++ b/hw/char/terminal3270.c
>>> @@ -200,9 +200,13 @@ static int read_payload_3270(EmulatedCcw3270Device *dev)
>>>   {
>>>       Terminal3270 *t = TERMINAL_3270(dev);
>>>       int len;
>>> +    int ret;
>>>   
>>>       len = MIN(ccw_dstream_avail(get_cds(t)), t->in_len);
>>> -    ccw_dstream_write_buf(get_cds(t), t->inv, len);
>>> +    ret = ccw_dstream_write_buf(get_cds(t), t->inv, len);
>>> +    if (ret < 0) {
>>> +        return ret;
>>> +    }
>>>       t->in_len -= len;
>>>   
>>>       return len;
>>> @@ -260,7 +264,10 @@ static int write_payload_3270(EmulatedCcw3270Device *dev, uint8_t cmd)
>>>   
>>>       t->outv[out_len++] = cmd;
>>>       do {
>>> -        ccw_dstream_read_buf(get_cds(t), &t->outv[out_len], len);
>>> +        retval = ccw_dstream_read_buf(get_cds(t), &t->outv[out_len], len);
>>> +        if (retval < 0) {
>>> +            return retval;
>>> +        }
>>>           count = ccw_dstream_avail(get_cds(t));
>>>           out_len += len;
>>>   
>>> diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
>>> index 821319eee6..f3e7342b1e 100644
>>> --- a/hw/s390x/3270-ccw.c
>>> +++ b/hw/s390x/3270-ccw.c
>>> @@ -31,6 +31,9 @@ static int handle_payload_3270_read(EmulatedCcw3270Device *dev, CCW1 *ccw)
>>>       }
>>>   
>>>       len = ck->read_payload_3270(dev);
>>
>> <mark>
>>
>>> +    if (len < 0) {
>>> +        return len;
>>> +    }
>>>       ccw_dev->sch->curr_status.scsw.count = ccw->count - len;
>>>     
>>
>> </mark>
>>
>> Do we eventually update scsw.count?
> 
> I think we can consider the contents of scsw.count 'unpredictable', no?

I think so, the (len < 0) here will trigger a program check and the POP 
specifies the count as "not meaningful" in case of a program check.


> 
>>
>>>       return 0;
>>> @@ -50,7 +53,7 @@ static int handle_payload_3270_write(EmulatedCcw3270Device *dev, CCW1 *ccw)
>>>       len = ck->write_payload_3270(dev, ccw->cmd_code);
>>>   
>>>       if (len <= 0) {
>>
>> <mark>
>>> -        return -EIO;
>>> +        return len ? len : -EIO;
>>
>> </mark>

Here we do not change the previous behavior.
This problem, if it is one, is not related to not checking the dstream 
read/write functions.

>>
>>>       }
>>>   
>>>       ccw_dev->sch->curr_status.scsw.count = ccw->count - len;
>>> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
>>> index fe47751df4..4149b8e5a7 100644
>>
> 

-- 
Pierre Morel
IBM Lab Boeblingen

