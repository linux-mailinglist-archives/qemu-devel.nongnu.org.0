Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3743D3951
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 13:19:22 +0200 (CEST)
Received: from localhost ([::1]:33616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6tD7-0006Dn-DB
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 07:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6tCO-0005X9-I4
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:18:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6tCM-0001OU-Ta
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627039113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zu6ikkRENVNYNXln5E2SGz1QUX9P3CBrOWH1oJ+s4Gw=;
 b=V68fJ7ivwud7hVAGIXX1fcnnkCoYgqqFW3ZTSt26Mr8qxhLXhseVfcBoM8QJA5CFQhdVU1
 gp0uEKCDRqBRFsvAg42zYyUHzyod99fMKLJ7TpE/RiL+ntnVIycfln0zIXblWJOo/rvzhX
 zE+aqCi+kS3f/bKWpdmg78kPWbmHcJo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-1f-tgeSFNgafgLXaDxP_YQ-1; Fri, 23 Jul 2021 07:18:32 -0400
X-MC-Unique: 1f-tgeSFNgafgLXaDxP_YQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p12-20020a5d68cc0000b02901426384855aso865112wrw.11
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 04:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zu6ikkRENVNYNXln5E2SGz1QUX9P3CBrOWH1oJ+s4Gw=;
 b=H10RkvyKKP4CbrNeSRVnDpxaeWnplIhOgA27trdZeKTPBpKgOuiPe30wgIr0YWZGEg
 VcvJh7zd2kE7KEtmZ/URy67WaloD/1/SDZvGsAK1jeThpq6cjJyCOSDbFXGfP9vMx22/
 Zy+VAyufWeud1GgTG0gELl54CNQvL1bGHv8b2GU94fzjV4TR8JiRxzi1ra2h2HqC0MFT
 K1Wk2rHi1RT0Wxf7mkLoRYnZVd/WaQx9GNuWxvfpI5vqI46ydv4o8c5oZQbX2LelKGON
 JFdeiYHo88kgoM2rDFeSQMZzEMz7yQKi0JCJrF6sJ5EKOWqxQE2f2cgvKiMlCVF7wytK
 DCjQ==
X-Gm-Message-State: AOAM532SM9hJsAgDrqvfUO107kTTbrR3UW48OcOG07NGRXIrWKVHbLDr
 O01QtbjayXTaURqJFgu3C4+5J8axq4CaIsLT3rewf8/AdEV8BDDDArJte3TRDHjUxCp6+KM46ki
 ZTH2285qk2wMQDV0=
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr4660583wrn.226.1627039111528; 
 Fri, 23 Jul 2021 04:18:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcKgatoU47RBCgCmzyTsoQ5Fy9i9jlkIKwtlf+vuho2Wxr73Y5FmQDjUIGxL7Au5RjDB1yPQ==
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr4660560wrn.226.1627039111344; 
 Fri, 23 Jul 2021 04:18:31 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id o19sm18733826wmr.18.2021.07.23.04.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 04:18:30 -0700 (PDT)
Subject: Re: [PATCH for-6.1] i386: do not call cpudef-only models functions
 for max, host, base
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210722083851.24068-1-cfontana@suse.de>
 <101ca50d-5bec-d4cc-7874-a296bf43421f@redhat.com>
 <ed9132b0-6b10-ad8b-3344-6cf0e3ed25b5@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f0f997a3-43da-51ac-fc82-c5d3e00624e0@redhat.com>
Date: Fri, 23 Jul 2021 13:18:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ed9132b0-6b10-ad8b-3344-6cf0e3ed25b5@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 10:19 AM, Claudio Fontana wrote:
> On 7/22/21 6:13 PM, Philippe Mathieu-Daudé wrote:
>> On 7/22/21 10:38 AM, Claudio Fontana wrote:
>>
>> It seems the subject got dropped and the first line
>> used as subject... But I'm not sure you want to
>> start the description with it.
> 
> hmm the subject got dropped from where? I see it in the mail subject..
>>
>>> properties set by function x86_cpu_apply_props, including
>>> kvm_default_props, tcg_default_props,
>>> and the "vendor" property for KVM and HVF,
>>>
>>
>> This newline is what confuses me.
> 
> hmm maybe better:
> 
> "
> Some cpu properties have to be set only for cpu models in builtin_x86_defs,
> registered with x86_register_cpu_model_type, and not for
> cpu models "base", "max", and the subclass "host".
> 
> These properties are the ones set by function x86_cpu_apply_props,
> (also including kvm_default_props, tcg_default_props),
> and the "vendor" property for the KVM and HVF accelerators.
> 
> After recent refactoring of cpu, which also affected these properties,
> they were instead set unconditionally for all x86 cpus.
> 
>>> This has been detected as a bug with Nested on AMD with cpu "host",
>>> as svm was not turned on by default, due to the wrongful setting of
>>> kvm_default_props via x86_cpu_apply_props.
> 
> .. which set svm to "off".
> 
>>> Rectify the bug introduced in commit "i386: split cpu accelerators"
>>> and document the functions that are builtin_x86_defs-only.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> Tested-by: Alexander Bulekov <alxndr@bu.edu>
>>> Fixes: f5cc5a5c ("i386: split cpu accelerators from cpu.c,"...)
>>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/477
>>
>> If you want to have gitlab closes the issue once merged, you'd
>> need to use Resolves:/Fixes: tag instead, see
>> https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#default-closing-pattern
> 
> I'll try Resolves: to avoid collision with Fixes: used to mark the commit that introduced the regression.
> 
> Wdyt about the new text?

Clearer, thanks!


