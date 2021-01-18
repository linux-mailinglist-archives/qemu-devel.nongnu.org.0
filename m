Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B3B2FA79E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:34:41 +0100 (CET)
Received: from localhost ([::1]:45890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YQK-0008KJ-KA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l1Xzw-0001BG-7N; Mon, 18 Jan 2021 12:07:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l1Xzj-0008JE-EW; Mon, 18 Jan 2021 12:07:23 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10IGXlHk140751; Mon, 18 Jan 2021 12:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nOiJLIo106Cpat4KWMS7JpogysP/9MwXiVEDgdX4HvE=;
 b=jLdnSVU9/R6Zwv2S4yrQxbl/P8BU8MlTSvcE1NEPrRWxbYQQEM/h22tyyyCZAbYCjvrb
 3VaA1CVcOcU1yeD2PpHP69TgxOop/E9CokRw/ZAbOv6WjdhoAqTKNimvluuwtf1fhg+w
 V6778qg5QcJJg8IJrLKEt4cDfkcU7ykCeXGTsecIvHXcU4npKL8q+EEImeYm5xB3Yuvk
 8Z2Qa2pT+UjiNE1CDRwTWLbZe+RfDI7pSItSFF99xQIG6FbJJj9Vei0DNYnLOR1E/yoe
 erBx8oEd4dm7DmLu00IL0StiWmZASxp37ZFms/Vv34inYjtVnO8ero5Kbq0Sb7bCw2q2 og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365d8ta45n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 12:06:54 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10IGaC54154470;
 Mon, 18 Jan 2021 12:06:54 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365d8ta44w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 12:06:53 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10IH2gsY001195;
 Mon, 18 Jan 2021 17:06:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 363qs895nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 17:06:51 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10IH6gwG31457734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 17:06:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BCB94C040;
 Mon, 18 Jan 2021 17:06:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E9DC4C046;
 Mon, 18 Jan 2021 17:06:47 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.2.167])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Jan 2021 17:06:47 +0000 (GMT)
Subject: Re: [PATCH v7 13/13] s390: Recognize confidential-guest-support option
To: Cornelia Huck <cohuck@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-14-david@gibson.dropbear.id.au>
 <20210115173647.28f4cc9e.cohuck@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <2aab901d-4f32-46bd-dcb0-425a31cb5e1f@de.ibm.com>
Date: Mon, 18 Jan 2021 18:06:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115173647.28f4cc9e.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-18_13:2021-01-18,
 2021-01-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101180098
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.194,
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, mst@redhat.com, mdroth@linux.vnet.ibm.com,
 pasic@linux.ibm.com, pragyansri.pathi@intel.com, andi.kleen@intel.com,
 thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 berrange@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15.01.21 17:36, Cornelia Huck wrote:
> On Thu, 14 Jan 2021 10:58:11 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
>> At least some s390 cpu models support "Protected Virtualization" (PV),
>> a mechanism to protect guests from eavesdropping by a compromised
>> hypervisor.
>>
>> This is similar in function to other mechanisms like AMD's SEV and
>> POWER's PEF, which are controlled by the "confidential-guest-support"
>> machine option.  s390 is a slightly special case, because we already
>> supported PV, simply by using a CPU model with the required feature
>> (S390_FEAT_UNPACK).
>>
>> To integrate this with the option used by other platforms, we
>> implement the following compromise:
>>
>>  - When the confidential-guest-support option is set, s390 will
>>    recognize it, verify that the CPU can support PV (failing if not)
>>    and set virtio default options necessary for encrypted or protected
>>    guests, as on other platforms.  i.e. if confidential-guest-support
>>    is set, we will either create a guest capable of entering PV mode,
>>    or fail outright.
>>
>>  - If confidential-guest-support is not set, guests might still be
>>    able to enter PV mode, if the CPU has the right model.  This may be
>>    a little surprising, but shouldn't actually be harmful.
>>
>> To start a guest supporting Protected Virtualization using the new
>> option use the command line arguments:
>>     -object s390-pv-guest,id=pv0 -machine confidential-guest-support=pv0
>>
>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>> ---
>>  docs/confidential-guest-support.txt |  3 ++
>>  docs/system/s390x/protvirt.rst      | 19 ++++++---
>>  hw/s390x/pv.c                       | 62 +++++++++++++++++++++++++++++
>>  include/hw/s390x/pv.h               |  1 +
>>  target/s390x/kvm.c                  |  3 ++
>>  5 files changed, 82 insertions(+), 6 deletions(-)
>>
> 
> (...)
> 
>> +int s390_pv_init(ConfidentialGuestSupport *cgs, Error **errp)
>> +{
>> +    if (!object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
>> +        return 0;
>> +    }
>> +
>> +    if (!s390_has_feat(S390_FEAT_UNPACK)) {
>> +        error_setg(errp,
>> +                   "CPU model does not support Protected Virtualization");
>> +        return -1;
>> +    }
>> +
>> +    cgs->ready = true;
>> +
>> +    return 0;
>> +}
> 
> Do we want to add a migration blocker here? If we keep the one that is
> added when the guest transitions, we'll end up with two of them, but
> that might be easier than trying to unify it.

that whould be fine with me. We still need to move things around to
make sure that the cpu model is already in place, though. 

