Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348442F2E66
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:51:31 +0100 (CET)
Received: from localhost ([::1]:58722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzICw-0003wA-8i
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kzIAG-0002An-6G; Tue, 12 Jan 2021 06:48:44 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48514
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kzIAD-0008Ij-9m; Tue, 12 Jan 2021 06:48:43 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10CBVxv4010508; Tue, 12 Jan 2021 06:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tpHUZBvUlo4Om7vgRFSOQn4qv9R0IfPhVpeqWCVacGc=;
 b=cUdPKWHdFG26ws6XH11l1FsoJ+qJ+bbaZMcvsB4AN1kxCcZSKOT6u1fyQfUyiogXcRXK
 hvkka37q3X8obYeW+8fxTS38XbDadREbL1IMIhCQ/CnJjxlc17b/mFEqA/bYwOfwnS0T
 M7y9mHN/9CObF7ZV9JPzgABeVlYOKV7qkconI2e6kIOgahTqrjgHF0z5pXLLlW9E/koX
 /v0fYTc0NC/ZRwISXX8nrAUPUWukzt3G8y8HTKcC9yLfiJPv45+CHZUadiZd9GCh0fq7
 MDaVSiroMr1+k3m6sbqwFj8NVKcXx1+K7UgsQqRZ8im084IfJDQM1Bn6fS6dKSYrWOsl Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36195vksr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 06:48:25 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10CBWOKP014869;
 Tue, 12 Jan 2021 06:48:24 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36195vkspw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 06:48:24 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10CBm3Dk030299;
 Tue, 12 Jan 2021 11:48:22 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 35ydrdb5sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 11:48:22 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10CBmJWj48038210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jan 2021 11:48:19 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B13842041;
 Tue, 12 Jan 2021 11:48:19 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94FFA42045;
 Tue, 12 Jan 2021 11:48:18 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.50.44])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Jan 2021 11:48:18 +0000 (GMT)
Subject: Re: [PATCH v6 13/13] s390: Recognize confidential-guest-support option
To: Cornelia Huck <cohuck@redhat.com>
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
 <20210112044508.427338-14-david@gibson.dropbear.id.au>
 <fcafba03-3701-93af-8eb7-17bd0d14d167@de.ibm.com>
 <20210112123607.39597e3d.cohuck@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <3af9c974-d4ab-06e6-74b8-e0d47be5ab98@de.ibm.com>
Date: Tue, 12 Jan 2021 12:48:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210112123607.39597e3d.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_06:2021-01-12,
 2021-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120061
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 david@redhat.com, qemu-devel@nongnu.org, frankja@linux.ibm.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, pragyansri.pathi@intel.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 richard.henderson@linaro.org, dgilbert@redhat.com, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12.01.21 12:36, Cornelia Huck wrote:
> On Tue, 12 Jan 2021 09:15:26 +0100
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> 
>> On 12.01.21 05:45, David Gibson wrote:
>>> At least some s390 cpu models support "Protected Virtualization" (PV),
>>> a mechanism to protect guests from eavesdropping by a compromised
>>> hypervisor.
>>>
>>> This is similar in function to other mechanisms like AMD's SEV and
>>> POWER's PEF, which are controlled by the "confidential-guest-support"
>>> machine option.  s390 is a slightly special case, because we already
>>> supported PV, simply by using a CPU model with the required feature
>>> (S390_FEAT_UNPACK).
>>>
>>> To integrate this with the option used by other platforms, we
>>> implement the following compromise:
>>>
>>>  - When the confidential-guest-support option is set, s390 will
>>>    recognize it, verify that the CPU can support PV (failing if not)
>>>    and set virtio default options necessary for encrypted or protected
>>>    guests, as on other platforms.  i.e. if confidential-guest-support
>>>    is set, we will either create a guest capable of entering PV mode,
>>>    or fail outright.
>>>
>>>  - If confidential-guest-support is not set, guests might still be
>>>    able to enter PV mode, if the CPU has the right model.  This may be
>>>    a little surprising, but shouldn't actually be harmful.
>>>
>>> To start a guest supporting Protected Virtualization using the new
>>> option use the command line arguments:
>>>     -object s390-pv-guest,id=pv0 -machine confidential-guest-support=pv0  
>>
>>
>> This results in
>>
>> [cborntra@t35lp61 qemu]$ qemu-system-s390x -enable-kvm -nographic -m 2G -kernel ~/full.normal 
>> **
>> ERROR:../qom/object.c:317:type_initialize: assertion failed: (parent->instance_size <= ti->instance_size)
>> Bail out! ERROR:../qom/object.c:317:type_initialize: assertion failed: (parent->instance_size <= ti->instance_size)
>> Aborted (core dumped)
>>
> 
>>> +static const TypeInfo s390_pv_guest_info = {
>>> +    .parent = TYPE_CONFIDENTIAL_GUEST_SUPPORT,
>>> +    .name = TYPE_S390_PV_GUEST,
>>> +    .instance_size = sizeof(S390PVGuestState),
>>> +    .interfaces = (InterfaceInfo[]) {
>>> +        { TYPE_USER_CREATABLE },
>>> +        { }
>>> +    }
>>> +};
> 
> I think this needs TYPE_OBJECT in .parent and
> TYPE_CONFIDENTIAL_GUEST_SUPPORT as an interface to fix the crash.

It fixes the crash but it does not work:
qemu-system-s390x -enable-kvm -nographic -m 2G -kernel ~/image   -object s390-pv-guest,id=pv0 -machine confidential-guest-support=pv0
qemu-system-s390x: Invalid parameter type for 'confidential-guest-support', expected: confidential-guest-support




