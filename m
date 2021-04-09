Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CC5359C2B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 12:33:33 +0200 (CEST)
Received: from localhost ([::1]:35212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUoSA-0000nG-Tf
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 06:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lUoQy-0008Jv-No; Fri, 09 Apr 2021 06:32:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55224
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lUoQv-0003HM-UN; Fri, 09 Apr 2021 06:32:15 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139A3ci0079470; Fri, 9 Apr 2021 06:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=K+Z4De6ggxEE546qiHDrBTcJv/JjuFQ2taf71dBxcGs=;
 b=pH1eYb6DHFyrwqS/BDub1u4CTPgchCbcc4PmUxf2xeTmxn9W20faSiMl3mQ4kbfWxO4d
 5SOW3fnZBLbP59dCVPQ+mr9592fRKpFl4tWYAALa07hAcTU1fILaOVHqYdHtu7LsE8Pr
 x9R0bjEvFGwBCl6mtRb+tKJB683PaQ9V+OUHuoCg2KrXwAfpBMmU/J7MXp+fUVr0vEl4
 enQ05FMFzop+FAUes+m5qAEJIlURcVvEuuGarfi31t7AdY7NiqgpAH3fAG759ApbqFMK
 SBcnreU4To+3Yfiv6AcAlydfwwWh12o1n2gD6E0kZy2ENXBimlTEg1jH2/rPI3phwlMZ lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37rwf2a3m4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 06:32:12 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 139A5H3O085012;
 Fri, 9 Apr 2021 06:32:11 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37rwf2a3kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 06:32:11 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 139ARo3v018449;
 Fri, 9 Apr 2021 10:32:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 37rvc1h94q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 10:32:09 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 139AVjhA23134658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Apr 2021 10:31:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAD4811C05C;
 Fri,  9 Apr 2021 10:32:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EB5711C054;
 Fri,  9 Apr 2021 10:32:06 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.28.63])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  9 Apr 2021 10:32:06 +0000 (GMT)
Subject: Re: [PATCH v2 1/1] s390x: css: report errors from
 ccw_dstream_read/write
To: Cornelia Huck <cohuck@redhat.com>
References: <1617899529-9329-1-git-send-email-pmorel@linux.ibm.com>
 <1617899529-9329-2-git-send-email-pmorel@linux.ibm.com>
 <20210409122757.5e0e182d.cohuck@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <4f46c807-0be9-831e-f54d-6606ac131916@linux.ibm.com>
Date: Fri, 9 Apr 2021 12:32:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210409122757.5e0e182d.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RidGzJsg-4L17JL-c_XKIluZRlQx5L4U
X-Proofpoint-ORIG-GUID: GUHv7T-of_SxVOF7sTHr7AnhJRQ5j9xU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090072
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
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/9/21 12:27 PM, Cornelia Huck wrote:
> On Thu,  8 Apr 2021 18:32:09 +0200
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
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/char/terminal3270.c | 11 +++++--
>>   hw/s390x/3270-ccw.c    |  5 +++-
>>   hw/s390x/css.c         | 14 +++++----
>>   hw/s390x/virtio-ccw.c  | 66 ++++++++++++++++++++++++++++++------------
>>   4 files changed, 69 insertions(+), 27 deletions(-)
> 
> Thanks, queued to s390-fixes (with cc:stable added.)
> 

Thanks,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

