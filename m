Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDCF2D2FA3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 17:27:52 +0100 (CET)
Received: from localhost ([::1]:33732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmfqB-0004Jr-3g
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 11:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kmfic-0000Hc-Oj
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:20:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kmfiX-0006kH-De
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607444394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tm3svIiKhiy9sUNe7fS2SQFCugNHTswbofN2rAnhX+A=;
 b=ISdpIeOVs8HdNZK1PKEe21R7XRP5emxUgpHsRaR8ozv/gZSNaG2Pp5AykUzpFalMNPz7m4
 1ZQho4Zz2M88PG+pS1sCEucUNHEEArmUrwy1HMtVnCeK5QMC7zok5YmBWfaUAY2M/+51tW
 oQnhnBpSCh5TlEItW3qjAQkBIcbBcIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-ln11OJgQO3i6yE07JDMyhA-1; Tue, 08 Dec 2020 11:19:51 -0500
X-MC-Unique: ln11OJgQO3i6yE07JDMyhA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A6BDBBEE5;
 Tue,  8 Dec 2020 16:19:50 +0000 (UTC)
Received: from [10.36.113.236] (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F341819C78;
 Tue,  8 Dec 2020 16:19:48 +0000 (UTC)
Subject: Re: [PATCH] s390x: pv: Fence additional unavailable SCLP facilities
 for PV guests
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20201204083655.27946-1-frankja@linux.ibm.com>
 <1c42abcc-b28e-4b6a-d363-ff6daf7b7883@de.ibm.com>
 <e2f69754-6b31-4854-b52a-e0e1c2676d67@redhat.com>
 <66975842-fcf3-013d-9bba-fed5c2c69a67@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <e22f4e78-c996-ed3d-0680-7c33bd480d83@redhat.com>
Date: Tue, 8 Dec 2020 17:19:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <66975842-fcf3-013d-9bba-fed5c2c69a67@de.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.12.20 17:11, Christian Borntraeger wrote:
> 
> 
> On 08.12.20 15:55, David Hildenbrand wrote:
>> On 08.12.20 14:29, Christian Borntraeger wrote:
>>>
>>>
>>> On 04.12.20 09:36, Janosch Frank wrote:
>>>> There's no VSIE support for a protected guest, so let's better not
>>>> advertise it and its support facilities.
>>>>
>>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>>
>>> Looks sane. Assuming that all features that depend on SIE are named S390_FEAT_SIE_*
>>> this should take care of everything. (i compared to gen-facilities.c)
>>
>> We could add dependency checks to
>> target/s390x/cpu_models.c:check_consistency()
> 
> That could be an additional patch, right?

Yeah sure.

> 
>>
>> What about
>>
>> DEF_FEAT(ESOP, "esop", SCLP_CONF_CHAR, 46,
>> "Enhanced-suppression-on-protection facility")
> 
> ESOP does make sense independent from SIE see chapter 3-15 in the POP
> in "Suppression on Protection"
> 

Rings a bell :)

> 
>> DEF_FEAT(HPMA2, "hpma2", SCLP_CONF_CHAR, 90, "Host page management
>> assist 2 Facility")
> 
> Right. We should also fence of hpma2.

I was also wondering about CMM, but as the guest senses it by executing
the instruction, protected guests will never see it I assume.

-- 
Thanks,

David / dhildenb


