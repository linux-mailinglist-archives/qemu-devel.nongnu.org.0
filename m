Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C4E356B7B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 13:45:11 +0200 (CEST)
Received: from localhost ([::1]:34848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU6cQ-0003mk-9U
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 07:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lU6ZY-0002Yt-16; Wed, 07 Apr 2021 07:42:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lU6ZT-0000Jy-RJ; Wed, 07 Apr 2021 07:42:11 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137BXZ7N189952; Wed, 7 Apr 2021 07:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=u7IEVDolCgXvkFNMFwwOte7n1U9K7/MmQIqWNo/Z5vw=;
 b=osIJYLwGoS4H8oyF8rprbYY5uYbLwrPtsvJwxE4eMYklzXeGWu7+KINi22s8CF+hjaQ5
 BMyTe9E9PIeDH1yjsCPCwD7kEdPw4VWh7fSFr0z2o7YtT1FTtMJZfumABUy5UkJ/RTLm
 Ks4eMqrzZGqOeMQGudn9u/iTdBb09D2OP97bAUvX2D9epw2rLar0styKNNmUwPwrKoFI
 Qx/tRJ5OASCrvSu9Unvh1GQ9VeKF5mRcImiJS/C5/kTAXD9CCyj6TZyUIleZJEJVRXd/
 GbWmO4Xhms4pSW8DJ2lIOaaRw6FdvOeIK9Cn4CkFGSdEDpd0kfotN4NRwbH5t1EHA5Wt Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvpg73hx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 07:42:03 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 137BXoC1191374;
 Wed, 7 Apr 2021 07:42:03 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvpg73he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 07:42:03 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137Bb66s019174;
 Wed, 7 Apr 2021 11:42:01 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 37rvbqgnvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 11:42:01 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137BfwFe55705864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 11:41:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47F93AE051;
 Wed,  7 Apr 2021 11:41:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C807EAE045;
 Wed,  7 Apr 2021 11:41:57 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.144.161])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Apr 2021 11:41:57 +0000 (GMT)
Subject: Re: [PATCH v1 1/1] s390x: css: report errors from
 ccw_dstream_read/write
To: Cornelia Huck <cohuck@redhat.com>
References: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
 <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
 <20210406170306.1be374c2.cohuck@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <c541aacd-34cb-3ed5-0016-cca1064c67e6@linux.ibm.com>
Date: Wed, 7 Apr 2021 13:41:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210406170306.1be374c2.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qh3ReOpiUH6DSt7cZ8XlTqe-SJYA9-Px
X-Proofpoint-GUID: Af3K6cMhoScGdxUFjQj5Uhk8eIfJO0RQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-07_07:2021-04-06,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070080
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/6/21 5:03 PM, Cornelia Huck wrote:
> On Tue,  6 Apr 2021 09:44:13 +0200
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
>> ccw_dstream_read/write functions returned values are sometime
>> not taking into account and reported back to the upper level
>> of interpretation of CCW instructions.
>>
>> It follows that accessing an invalid address does not trigger
>> a subchannel status program check to the guest as it should.
>>
>> Let's test the return values of ccw_dstream_write[_buf] and
>> ccw_dstream_read[_buf] and report it to the caller.
> 
> Yes, checking/propagating the return code is something that was missing
> in several places.
> 
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/char/terminal3270.c | 11 +++++--
>>   hw/s390x/3270-ccw.c    |  3 ++
>>   hw/s390x/css.c         | 16 +++++-----
>>   hw/s390x/virtio-ccw.c  | 66 ++++++++++++++++++++++++++++++------------
>>   4 files changed, 69 insertions(+), 27 deletions(-)
>>
>> diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
>> index a9a46c8ed3..82e85fac2e 100644
>> --- a/hw/char/terminal3270.c
>> +++ b/hw/char/terminal3270.c
>> @@ -200,9 +200,13 @@ static int read_payload_3270(EmulatedCcw3270Device *dev)
>>   {
>>       Terminal3270 *t = TERMINAL_3270(dev);
>>       int len;
>> +    int ret;
>>   
>>       len = MIN(ccw_dstream_avail(get_cds(t)), t->in_len);
>> -    ccw_dstream_write_buf(get_cds(t), t->inv, len);
>> +    ret = ccw_dstream_write_buf(get_cds(t), t->inv, len);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
> 
> This looks correct: together with the change below, you end up
> propagating a negative error value to the ccw callback handling.
> 
>>       t->in_len -= len;
>>   
>>       return len;
>> @@ -260,7 +264,10 @@ static int write_payload_3270(EmulatedCcw3270Device *dev, uint8_t cmd)
>>   
>>       t->outv[out_len++] = cmd;
>>       do {
>> -        ccw_dstream_read_buf(get_cds(t), &t->outv[out_len], len);
>> +        retval = ccw_dstream_read_buf(get_cds(t), &t->outv[out_len], len);
>> +        if (retval < 0) {
>> +            return retval;
> 
> Here, however, I'm not sure. Returning a negative error here is fine,
> but handle_payload_3270_write (not changed in this patch) seems to
> match everything to -EIO. Shouldn't it just be propagated, and maybe 0
> mapped to -EIO only? If I'm not confused, we'll end up mapping every
> error to intervention required.

I know very little about the 3270 but in my opinion accessing memory is 
not the problem of the device but of the subchannel.
So we should certainly propagate the error instead of returning -EIO for 
any error.

---> what about

diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
index cc1371f01c..f3e7342b1e 100644
--- a/hw/s390x/3270-ccw.c
+++ b/hw/s390x/3270-ccw.c
@@ -53,7 +53,7 @@ static int 
handle_payload_3270_write(EmulatedCcw3270Device *dev, CCW1 *ccw)
      len = ck->write_payload_3270(dev, ccw->cmd_code);

      if (len <= 0) {
-        return -EIO;
+        return len ? len : -EIO;
      }

      ccw_dev->sch->curr_status.scsw.count = ccw->count - len;

-----------------

> 
>> +        }
>>           count = ccw_dstream_avail(get_cds(t));
>>           out_len += len;
>>   
>> diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
>> index 821319eee6..cc1371f01c 100644
>> --- a/hw/s390x/3270-ccw.c
>> +++ b/hw/s390x/3270-ccw.c
>> @@ -31,6 +31,9 @@ static int handle_payload_3270_read(EmulatedCcw3270Device *dev, CCW1 *ccw)
>>       }
>>   
>>       len = ck->read_payload_3270(dev);
>> +    if (len < 0) {
>> +        return len;
>> +    }
>>       ccw_dev->sch->curr_status.scsw.count = ccw->count - len;
>>   
>>       return 0;
>> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
>> index fe47751df4..99e476f193 100644
>> --- a/hw/s390x/css.c
>> +++ b/hw/s390x/css.c
>> @@ -1055,10 +1055,11 @@ static int css_interpret_ccw(SubchDev *sch, hwaddr ccw_addr,
>>               }
>>           }
>>           len = MIN(ccw.count, sizeof(sch->sense_data));
>> -        ccw_dstream_write_buf(&sch->cds, sch->sense_data, len);
>> -        sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);
>> -        memset(sch->sense_data, 0, sizeof(sch->sense_data));
>> -        ret = 0;
>> +        ret = ccw_dstream_write_buf(&sch->cds, sch->sense_data, len);
>> +        if (!ret) {
>> +            sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);
> 
> I'm wondering about the residual count here. Table 16-7 "Contents of
> Count Field in SCSW" in the PoP looks a bit more complicated for some
> error conditions, especially if IDALs are involved. Not sure if we
> should attempt to write something to count in those conditions; but on
> the other hand, I don't think our error conditions are as complex
> anyway, and we can make this simplification.

I think you are right.
ccw_dstream_residual_count() should know what to do return there and we 
should not ignore it.

On the other hand erasing should only be done if all went OK because a 
following sense, with the right parameters, may succeed.
What do you think?


> 
>> +            memset(sch->sense_data, 0, sizeof(sch->sense_data));
>> +        }
>>           break;
>>       case CCW_CMD_SENSE_ID:
>>       {
>> @@ -1083,9 +1084,10 @@ static int css_interpret_ccw(SubchDev *sch, hwaddr ccw_addr,
>>           } else {
>>               sense_id[0] = 0;
>>           }
>> -        ccw_dstream_write_buf(&sch->cds, sense_id, len);
>> -        sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);
>> -        ret = 0;
>> +        ret = ccw_dstream_write_buf(&sch->cds, sense_id, len);
>> +        if (!ret) {
>> +            sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);
>> +        }
>>           break;
>>       }
>>       case CCW_CMD_TIC:
> 
> (...)
> 
> Otherwise, looks good.
> 

Thanks,
Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

