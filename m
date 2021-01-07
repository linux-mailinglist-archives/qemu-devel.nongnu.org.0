Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086012ED4CA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:52:45 +0100 (CET)
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxYWi-0004IW-4F
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kxYVg-0003jm-Qa; Thu, 07 Jan 2021 11:51:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kxYVb-0000V8-Rg; Thu, 07 Jan 2021 11:51:39 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 107GXJmX181760; Thu, 7 Jan 2021 11:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RYipqw5C0QPvX5j7VRi0Na6QxIh7SheiRN7MDEqj0aw=;
 b=pTtxzGm0O7HeeMbwHwhqFXvtTfemy3wCt7vHYgZHkZquQerAT0jiLm1Jn5Q+S0g6Wqyb
 mVgB8cOVLTbQE9Yg+9LrRqTABzklwQyx8Uw//x9jBDUX5Y/ZdRI3PcheUSgcfgo8JXAV
 lsa9b+iwzMCgDYjBjzBqaUkvZ8SU659LZJjSlv/0ZluDR2EJs+EnvvexUletcsokmrPD
 8a5jAxm0LUU5fbHJZukzRrQBB9TPAVzffohQqySmfgYHmcMYxA/w2XFZPyCUdKYpioqU
 ElcYJ7fxsLPyRuhaQxioxYKnGt3hhO3yVDF7B6LN3yMV0ZvSakBcSuS6qptfWoRnGSCQ /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35x5kc97bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 11:51:31 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 107GXSel182600;
 Thu, 7 Jan 2021 11:51:31 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35x5kc97b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 11:51:31 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 107Gc9VC024890;
 Thu, 7 Jan 2021 16:51:30 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 35tgf9nvcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 16:51:30 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 107GpTxO35586530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Jan 2021 16:51:29 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21822BE051;
 Thu,  7 Jan 2021 16:51:29 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49AFEBE04F;
 Thu,  7 Jan 2021 16:51:28 +0000 (GMT)
Received: from [9.211.91.107] (unknown [9.211.91.107])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  7 Jan 2021 16:51:28 +0000 (GMT)
Subject: Re: [PATCH v3 1/3] update-linux-headers: Include const.h
To: Peter Xu <peterx@redhat.com>
References: <20210104202057.48048-1-farman@linux.ibm.com>
 <20210104202057.48048-2-farman@linux.ibm.com> <20210106190345.GJ149908@xz-x1>
From: Eric Farman <farman@linux.ibm.com>
Message-ID: <9fcc99ca-aa60-2249-dfc5-bf0018b3ddb0@linux.ibm.com>
Date: Thu, 7 Jan 2021 11:51:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210106190345.GJ149908@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-07_07:2021-01-07,
 2021-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070098
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.267,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/6/21 2:03 PM, Peter Xu wrote:
> On Mon, Jan 04, 2021 at 09:20:55PM +0100, Eric Farman wrote:
>> Kernel commit a85cbe6159ff ("uapi: move constants from
>> <linux/kernel.h> to <linux/const.h>") breaks our script
>> because of the unrecognized include. Let's add that to
>> our processing.
>>
>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>> ---
>>   scripts/update-linux-headers.sh | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
>> index 9efbaf2f84..fa6f2b6272 100755
>> --- a/scripts/update-linux-headers.sh
>> +++ b/scripts/update-linux-headers.sh
>> @@ -41,6 +41,7 @@ cp_portable() {
>>                                        -e 'pvrdma_verbs' \
>>                                        -e 'drm.h' \
>>                                        -e 'limits' \
>> +                                     -e 'linux/const' \
>>                                        -e 'linux/kernel' \
>>                                        -e 'linux/sysinfo' \
>>                                        -e 'asm-generic/kvm_para' \
>> @@ -190,7 +191,9 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
>>            "$tmpdir/include/linux/input.h" \
>>            "$tmpdir/include/linux/input-event-codes.h" \
>>            "$tmpdir/include/linux/pci_regs.h" \
>> -         "$tmpdir/include/linux/ethtool.h" "$tmpdir/include/linux/kernel.h" \
>> +         "$tmpdir/include/linux/ethtool.h" \
>> +         "$tmpdir/include/linux/const.h" \
>> +         "$tmpdir/include/linux/kernel.h" \
>>            "$tmpdir/include/linux/vhost_types.h" \
>>            "$tmpdir/include/linux/sysinfo.h"; do
>>       cp_portable "$i" "$output/include/standard-headers/linux"
>> -- 
>> 2.17.1
> 
> So I think I came to the same change when trying to update the headers. :)
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>

Thank you!  :)

> 
> Could I ask why the const.h is installed into include/standard-headers/linux
> rather than linux-headers/linux?  When I was working on my version I failed to
> figure out the difference.

Considering the main difference is whether the header file is copied 
directly or edited with a bunch of substitutions, and const.h doesn't 
get modified by those substitutions, I suppose it could go in 
linux-headers itself. But I opted to just keep it near its friends 
(ethtool.h and kernel.h both include const.h, and end up including 
if_ether.h, sysinfo.h, and types.h) in include/standard-headers.

> 
> One answer is ethtool.h is there which included const.h, but I guess that's not
> the real one.
> 
> Thanks,
> 

