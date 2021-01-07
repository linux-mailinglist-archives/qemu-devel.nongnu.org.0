Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F742ED618
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:54:20 +0100 (CET)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZUI-0000jx-J8
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kxZS6-0007vl-IM; Thu, 07 Jan 2021 12:52:05 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kxZS3-0000Uq-HO; Thu, 07 Jan 2021 12:52:02 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 107HW68i058942; Thu, 7 Jan 2021 12:51:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rnbCyZsv0aviQQOER+okk+KsptTRPTdRqfr9QxsL6cw=;
 b=Ow4C55pNC02t6+RJstnqK3A6UMZ+SGN1HzlPitO1klbHSblilbxpiOjXMlfEt18kUgrw
 +fAvZp26CVipTm8jeqY3bvGMMwmRjVpEEQtHRSeGO3gzq6Rc9Z4wGqyK9MGJfDZPWJny
 Ttf6g4R7mlJ0j8hhJPNsz6SjNSkbtxx6xzK4/Ro2M3TXBbwmSPrVl1M5B+oYA2f/lkQC
 mNyU2UC2KtVaj+lH+Nm57/k42q/Q/SylV1MIcQXAd/492vvxm2i+fRPwCZ90z3QI1+KD
 4+BZ0sxdroI4dYSOAlSsc2LvDe72gaZHG/1nVBrWOCS3PquWLyR/ixYbvHncssYY/CUw Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35x6hs8sk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 12:51:56 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 107HW6SI058956;
 Thu, 7 Jan 2021 12:51:38 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35x6hs8s6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 12:51:38 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 107HlmBd030399;
 Thu, 7 Jan 2021 17:50:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 35tgf9fqsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 17:50:37 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 107HoaIf28967370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Jan 2021 17:50:36 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18BC6BE04F;
 Thu,  7 Jan 2021 17:50:36 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2249DBE059;
 Thu,  7 Jan 2021 17:50:35 +0000 (GMT)
Received: from [9.211.91.107] (unknown [9.211.91.107])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  7 Jan 2021 17:50:34 +0000 (GMT)
Subject: Re: [PATCH v3 1/3] update-linux-headers: Include const.h
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210104202057.48048-1-farman@linux.ibm.com>
 <20210104202057.48048-2-farman@linux.ibm.com> <20210106190345.GJ149908@xz-x1>
 <9fcc99ca-aa60-2249-dfc5-bf0018b3ddb0@linux.ibm.com>
 <CAFEAcA_eeHNBzgUFmYXO3-n8SWeTsM_jJUB=-u-BTu7gqhvDqQ@mail.gmail.com>
From: Eric Farman <farman@linux.ibm.com>
Message-ID: <cfbc49a9-9377-49d6-3c1d-b97c5e3ed2bf@linux.ibm.com>
Date: Thu, 7 Jan 2021 12:50:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_eeHNBzgUFmYXO3-n8SWeTsM_jJUB=-u-BTu7gqhvDqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-07_07:2021-01-07,
 2021-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101070100
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/7/21 12:05 PM, Peter Maydell wrote:
> On Thu, 7 Jan 2021 at 16:52, Eric Farman <farman@linux.ibm.com> wrote:
>> On 1/6/21 2:03 PM, Peter Xu wrote:
>>> Could I ask why the const.h is installed into include/standard-headers/linux
>>> rather than linux-headers/linux?  When I was working on my version I failed to
>>> figure out the difference.
>>
>> Considering the main difference is whether the header file is copied
>> directly or edited with a bunch of substitutions, and const.h doesn't
>> get modified by those substitutions, I suppose it could go in
>> linux-headers itself.
> 
> No, it can't, because linux-headers/ only goes on the include
> path when on a Linux host and on a CPU architecture with KVM support,
> whereas include/standard-headers/ headers are available and
> used on all host OSes/architectures.
> 
> Because include/standard-headers/linux/ethtool.h will end up
> with a line
>   #include "standard-headers/linux/const.h"
> we need to provide a const.h in that location so that the #include
> pulls in the file correctly.

Ah, today I learned.  Thanks, Peter.

  - Eric

> 
> thanks
> -- PMM
> 

