Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959064FAD1A
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 11:48:57 +0200 (CEST)
Received: from localhost ([::1]:36184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndUBk-0001NB-7z
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 05:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ndU8X-0000Yd-8Z
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 05:45:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ndU8Q-0000mc-F3
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 05:45:32 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23A78qA1015683; 
 Sun, 10 Apr 2022 09:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=resjcE5PPsmodwrzeCmP2nvMy6MHgnWtkLQI068h/UY=;
 b=XowqVqtyGtYxJ0Rl8FdzxQ48QKj6L2Chx47px/XCU6f4XV3Fl7174wY9RAdMqUfT1Lju
 X6htcKAAgSh+6YCE09oKhy7d2vgVo+rXkiDrXKOAed/gNoQQpC5aBFBdhdElErbSGB9e
 07Dn/8d6aeIh/uJOQR1aOQ49eahGrcbTVtPrDTqCiy+UP8QRZqFx0+KkIfEhm6IF80/8
 JVHysdY6i4pi03LnJNh4P1R4xaEtfYWRvEOldmHOklUIOGho8UanWjYWDdJC8nZnpydt
 UUgPsY5etN9hk7FkhROUGr7IO1+v5KypjagaNYiEz6C5qVTXtOc7lHX08GtYUEtN7LPf 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fbkqpx2fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 Apr 2022 09:45:24 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23A9irXu002909;
 Sun, 10 Apr 2022 09:45:24 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fbkqpx2fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 Apr 2022 09:45:24 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23A9hWac018648;
 Sun, 10 Apr 2022 09:45:23 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3fb1s9a320-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 Apr 2022 09:45:23 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23A9jL2l23069152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 10 Apr 2022 09:45:21 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8C8ABE058;
 Sun, 10 Apr 2022 09:45:21 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9D2ABE056;
 Sun, 10 Apr 2022 09:45:18 +0000 (GMT)
Received: from [9.160.177.197] (unknown [9.160.177.197])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 10 Apr 2022 09:45:18 +0000 (GMT)
Message-ID: <2103654f-b638-a08c-7ea8-cdafb7018609@linux.ibm.com>
Date: Sun, 10 Apr 2022 12:45:16 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] qapi, target/i386/sev: Add cpu0-id to
 query-sev-capabilities
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Cole Robinson <crobinso@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220228093014.882288-1-dovmurik@linux.ibm.com>
 <YhyWg1UaOPMIkODz@redhat.com>
 <982bd5bf-a3a8-f75c-73bd-2722f72cc476@linux.ibm.com>
 <9878f830-d581-1069-5b06-54b8486b7b8b@redhat.com>
 <87v8vljv2q.fsf@pond.sub.org>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <87v8vljv2q.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fn0NTVsjLD1sx_JSYoYVmj4AKzsBoNwo
X-Proofpoint-ORIG-GUID: KrEXOe73a4T9IdHMaNhFiWTzKs56iXh0
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-10_03,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204100063
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/04/2022 8:55, Markus Armbruster wrote:
> Cole Robinson <crobinso@redhat.com> writes:
> 
>> On 2/28/22 4:39 AM, Dov Murik wrote:
>>>
>>>
>>> On 28/02/2022 11:31, Daniel P. Berrangé wrote:
>>>> On Mon, Feb 28, 2022 at 09:30:14AM +0000, Dov Murik wrote:
>>>>> Add a new field 'cpu0-id' to the response of query-sev-capabilities QMP
>>>>> command.  The value of the field is the base64-encoded unique ID of CPU0
>>>>> (socket 0), which can be used to retrieve the signed CEK of the CPU from
>>>>> AMD's Key Distribution Service (KDS).
>>>>>
>>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>>
>>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>>>
>>>
>>> Thanks Daniel for reviewing.
>>>
>>
>> Hmm I don't see this in qemu.git. Who should pick this up?
> 
> I'd say
> 
>     $ scripts/get_maintainer.pl -f target/i386/sev.c 
>     Paolo Bonzini <pbonzini@redhat.com> (supporter:X86 KVM CPUs)
>     Marcelo Tosatti <mtosatti@redhat.com> (supporter:X86 KVM CPUs)
>     kvm@vger.kernel.org (open list:X86 KVM CPUs)
>     qemu-devel@nongnu.org (open list:All patches CC here)
> 

I see this in Paolo's tree in branch for-upstream:

https://gitlab.com/bonzini/qemu/-/commit/811b4ec7f8eb3fb1fe9851848ab8e3cd926b9627

-Dov

