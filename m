Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B5F2D79FD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:54:42 +0100 (CET)
Received: from localhost ([::1]:58880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkkg-0002Gd-B9
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knkct-0001kB-Ck
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:46:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knkcn-0004wB-Pc
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607701588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l32a6m8oH9dvShcW9o01ItQFgY/01R67nj4V4WCIg3Y=;
 b=huJxk3OSppvd66NZ6RuP1R9eRxRCXLRuYGk13ALIuwwLHJrHo4dd5RorA16dfHnIQp0aCq
 8QW25VULTStXytphYuV56IfhzU1IAGniaSH3KU2nJwoH02wvI9GODqfWqZdcm2c0f4C8xS
 QCf2E5rPb9quDdBCGa6Sl/sW8IVINiE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-FhvhVRKeM0G1LyNRgOx2gQ-1; Fri, 11 Dec 2020 10:46:24 -0500
X-MC-Unique: FhvhVRKeM0G1LyNRgOx2gQ-1
Received: by mail-wr1-f72.google.com with SMTP id w8so3459290wrv.18
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l32a6m8oH9dvShcW9o01ItQFgY/01R67nj4V4WCIg3Y=;
 b=nwzVWuajGui1+UPZ2J80+suY5DZQD46KZltrAPOemFZNzghV5t7vYlJLDKrXmV8HLU
 cEN7/xr9sB/O+WetZmOaJ9GQnNRHBl2AI77Sn7O2Ji5pViEJVx/Zj5bl/jncw2IZ3cXx
 Oi51AUx6yqqmaFxeI4kIhF1dHPjPYfnvkVlJysw6GA9/g2JPCK6glUCLD2ASS5tfweRK
 6CVCQmGFRaS/Q9fNaBM46AMkHZ3XWqtzsvhHQWgOhQrGK1/fEfnzWQKImUkRVrhfaJQD
 1hxNXtS4WaYkdyMkuIhYMDExUmwGVh56UbxNzEIQ5wdwHjRjpojy4hCliXrzz/hI2SI/
 BEHA==
X-Gm-Message-State: AOAM531qXr2X008zCXh2KOgOmTP8/V9sXz1R7EOWVY+7PyX7mYr1z9Iv
 RDlOSJzcmC+ewOVcig1d8JjQRFnVJw4eBGFM1RjlJHtEsf4zoom5rOg4uUHEx2snHql+p7HAF9b
 YYHf1Wa463NgRvBY=
X-Received: by 2002:a05:600c:2246:: with SMTP id
 a6mr14236432wmm.80.1607701583465; 
 Fri, 11 Dec 2020 07:46:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7nDorQCjH7KY1OKg/9Wabo4TO3gD0b5fclhHfJVTvX+63uzRBXPu2RBNAMnw5oase1xJoCg==
X-Received: by 2002:a05:600c:2246:: with SMTP id
 a6mr14236416wmm.80.1607701583255; 
 Fri, 11 Dec 2020 07:46:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v64sm14815458wme.25.2020.12.11.07.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 07:46:22 -0800 (PST)
Subject: Re: [PATCH v3 0/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
To: David Gibson <david@gibson.dropbear.id.au>
References: <20201210145517.1532269-1-danielhb413@gmail.com>
 <6d8cac99-68e1-61bf-e270-b0287b8d48fa@redhat.com>
 <20201211002105.GA4874@yekko.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1bfb9cd9-d229-31ce-ffe8-b896c5968db8@redhat.com>
Date: Fri, 11 Dec 2020 16:46:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201211002105.GA4874@yekko.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 01:21, David Gibson wrote:
> On Thu, Dec 10, 2020 at 05:51:41PM +0100, Paolo Bonzini wrote:
>> On 10/12/20 15:55, Daniel Henrique Barboza wrote:
>>> changes from v2, all proposed by Greg:
>>> * Handle 'NULL' value as default mode fallback in spapr_kvm_type()
>>> * Do not allow for 'AUTO' to be a valid mode in spapr_kvm_type()
>>> * Initialize 'spapr->kvm_type' in spapr_instance_init() like Paolo
>>>     proposed. This will spare us from changing spapr_get_kvm_type()
>>>     altogether.
>>> v2 link: https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg02623.html
>>>
>>>
>>> This patch addresses an issue that happens with the pseries machine after
>>> testing Paolo's patch [1]:
>>>
>>> $ sudo ./ppc64-softmmu/qemu-system-ppc64 -nographic -nodefaults -machine pseries --enable-kvm
>>> qemu-system-ppc64: Unknown kvm-type specified ''
>>>
>>> The reason lies on how qemu_opt_get() and object_property_get_str() works
>>> when there is no 'kvm-type' specified. We were conting on receiving NULL
>>> for kvm-type, but the latter will use a blank string "". Instead on relying
>>> on NULL, let's expose the already existing 'auto' kvm-type mode to the users
>>> and use that as default.
>>>
>>> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg00471.html
>>>
>>> Daniel Henrique Barboza (1):
>>>     spapr.c: set a 'kvm-type' default value instead of relying on NULL
>>>
>>>    hw/ppc/spapr.c | 21 +++++++++++++++++----
>>>    1 file changed, 17 insertions(+), 4 deletions(-)
>>>
>>
>> Will queue, thanks!
> 
> I've also put it into my ppc-for-6.0 tree, which I plan to send a PR
> for shortly.  I guess it should be an easy conflict to resolve, so I
> don't think that will be a problem.

Yup, my own queue is still a week away, so go ahead.  Thanks!

Paolo


