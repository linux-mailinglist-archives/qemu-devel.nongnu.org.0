Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112DE294EB4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 16:32:06 +0200 (CEST)
Received: from localhost ([::1]:35804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVF9o-0002zV-Vz
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 10:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kVF7U-0001fk-3t
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 10:29:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kVF7R-0004D9-DN
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 10:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603290575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+gsAGqSoseU+TArV1H7T86jQ+cIsYFTh1nI0e4O5bg=;
 b=SGPYwySIjw+lgoxOpmD/VLkrZG2kE0rNrBiHHDDenv2soVfMyqz0wgwc+RenuxiRaNAQWJ
 hxbBOvyi19zW/JG7vlTNuaigDowUKoAqAQZeBlSbR5ACLp1v22ZKnfSGYBeAhzmvkrk7ww
 JHL/thZAl3rVPu+sx7UhOVNytpfKG1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-9fbDvVVCNI24qvvS2zFALg-1; Wed, 21 Oct 2020 10:29:34 -0400
X-MC-Unique: 9fbDvVVCNI24qvvS2zFALg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47C7218A0767;
 Wed, 21 Oct 2020 14:29:32 +0000 (UTC)
Received: from [10.36.114.138] (ovpn-114-138.ams2.redhat.com [10.36.114.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C3955D9CA;
 Wed, 21 Oct 2020 14:29:30 +0000 (UTC)
Subject: Re: [PATCH 2/2] s390x: pv: Fix diag318 PV fencing
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20201021134345.110173-1-frankja@linux.ibm.com>
 <20201021134345.110173-3-frankja@linux.ibm.com>
 <fa050bc9-db4e-8800-d7d5-a2931bebce78@redhat.com>
 <379abdeb-1400-1e7a-925f-5d3d93c80d69@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <92bfaa74-773d-8a23-1434-9c9a7a549e76@redhat.com>
Date: Wed, 21 Oct 2020 16:29:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <379abdeb-1400-1e7a-925f-5d3d93c80d69@de.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, walling@linux.ibm.com,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, mhartmay@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.20 16:18, Christian Borntraeger wrote:
> 
> 
> On 21.10.20 16:14, David Hildenbrand wrote:
>> On 21.10.20 15:43, Janosch Frank wrote:
>>> Diag318 fencing needs to be determined on the current VM PV state and
>>> not on the state that the VM has when we create the CPU model.
>>>
>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>> Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
>>> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
>>> Fixes: fabdada935 ("s390: guest support for diagnose 0x318")
>>> Tested-by: Marc Hartmayer <mhartmay@linux.ibm.com>
>>> ---
>>>  hw/s390x/sclp.c    | 10 ++++++++++
>>>  target/s390x/kvm.c |  3 +--
>>>  2 files changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
>>> index 0cf2290826..69aba402d3 100644
>>> --- a/hw/s390x/sclp.c
>>> +++ b/hw/s390x/sclp.c
>>> @@ -22,6 +22,7 @@
>>>  #include "hw/s390x/event-facility.h"
>>>  #include "hw/s390x/s390-pci-bus.h"
>>>  #include "hw/s390x/ipl.h"
>>> +#include "hw/s390x/pv.h"
>>>  
>>>  static inline SCLPDevice *get_sclp_device(void)
>>>  {
>>> @@ -142,6 +143,15 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
>>>      if (s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB)) {
>>>          s390_get_feat_block(S390_FEAT_TYPE_SCLP_FAC134,
>>>                              &read_info->fac134);
>>> +        /*
>>> +         * Diag318 is not available in protected mode and will result
>>> +         * in an operation exception. As we can dynamically move in
>>> +         * and out of protected mode, we need to fence the feature
>>> +         * here rather than when creating the CPU model.
>>> +         */
>>> +        if (s390_is_pv()) {
>>> +            read_info->fac134 &= ~0x80;
>>> +        }
>>
>> Hmm, I thought firmware would handle exposing cpu features and similar,
>> so we can't temper with it ....
> 
> Only the stfle bits. 
>>
>> Can we move that into s390_get_feat_block instead and check against the
>> feature bit instead?
> 
> No because we want to have this active for !pv and disabled for pv but we switch
> this multiple times when doing boot/reboot. 

Keeping the s390_is_pv() condition of course.

-- 
Thanks,

David / dhildenb


