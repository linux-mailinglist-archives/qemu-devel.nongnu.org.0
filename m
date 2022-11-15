Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E9C6292F5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 09:08:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouqy6-0003fl-MT; Tue, 15 Nov 2022 03:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ouqxP-0003Y4-A6
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 03:06:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ouqxJ-0005xe-58
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 03:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668499564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Isy5Myqh5AgLinY/uZCX2Drq8vTqmFh1gt/o39KG/L8=;
 b=b+Mc8RUFFIQAkqg/q43+v4l6HiMaV9wh36MKlY4ufgXAZNQsRg/x/BTHm/BQzqdcZqoSFC
 YNmh3tMFFvVlpH0PCK4f/k3LmiYZ7LzIMabYVDqQuzffFWLEIiq/7MlGpFMOkulYix93AJ
 99yZ8Kcxn2PRQOWiv5HWgVTVlZqPy/8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-x_hohh2mNYmsskPxmHJXiQ-1; Tue, 15 Nov 2022 03:06:01 -0500
X-MC-Unique: x_hohh2mNYmsskPxmHJXiQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 x2-20020a05620a448200b006fa7dad5c1cso13047812qkp.10
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 00:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Isy5Myqh5AgLinY/uZCX2Drq8vTqmFh1gt/o39KG/L8=;
 b=Fe3eGGubCb0RO4mtIU064CTtatCLoM7Hs1ohjaptvF6qXGYBWbsc/FSyhvQQQNyNJO
 PN80ODgwExA2GzG3nRO9mMFUyv6dq/GRRO5Q6HLYfUl+PVy9U5skWcoDQZkZ2fVdWcxD
 OabUuTnFFr+ViENOO9E+LfMA9BFQkK0SZ8M0Qn6oQami+NYRmNsWSEnCZJr6lKywsS8D
 V594Qn8FojhHjCikn7mCtydM9jQTSKbtDJSl7KB1IrMeshYzxYPo8hnAM/PoATHI4673
 fXVBVjaftKyBZZR8dBm8MXHXGCio0qXF4wXpHUbRPlfGYt0W0SZCUz/ITkuB/c7mIQ/M
 hFvA==
X-Gm-Message-State: ANoB5plMz1IiTQbQGMCv2EabYRHHg4BrLYcgBQCWcadPPD5ixyu8qlRp
 UgtfJCS4kiSKX62a95B68siYtjxb4qkAWvsIyh/q7zQOb7DzCRcccioA2GNNk3McZUfvGm06QuZ
 qzN9g1QeRyouuSNo=
X-Received: by 2002:ac8:4548:0:b0:3a5:2105:677e with SMTP id
 z8-20020ac84548000000b003a52105677emr15095186qtn.127.1668499561444; 
 Tue, 15 Nov 2022 00:06:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6/ZZ/GsoS7a68gTvgHnGOmMYzxA8WCKsn/W30KBrvzQb7vAsPmTYocdxKYolOJagajBZm4rA==
X-Received: by 2002:ac8:4548:0:b0:3a5:2105:677e with SMTP id
 z8-20020ac84548000000b003a52105677emr15095169qtn.127.1668499561229; 
 Tue, 15 Nov 2022 00:06:01 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-149.web.vodafone.de.
 [109.43.177.149]) by smtp.gmail.com with ESMTPSA id
 w20-20020a05620a0e9400b006eee3a09ff3sm7742880qkm.69.2022.11.15.00.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 00:06:00 -0800 (PST)
Message-ID: <27387844-bdfd-445b-63b7-86e3acdab859@redhat.com>
Date: Tue, 15 Nov 2022 09:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221111141323.246267-1-thuth@redhat.com>
 <875yflbl0u.fsf@pond.sub.org>
 <b8c5f7c4-cf91-1278-1af4-9449b2043e13@redhat.com>
 <87leocwt4x.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] util/qemu-config: Fix "query-command-line-options" to
 provide the right values
In-Reply-To: <87leocwt4x.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/11/2022 08.53, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 11/11/2022 15.53, Markus Armbruster wrote:
>>> Thomas Huth <thuth@redhat.com> writes:
>>>
>>>> The "query-command-line-options" command uses a hand-crafted list
>>>> of options that should be returned for the "machine" parameter.
>>>> This is pretty much out of sync with reality, for example settings
>>>> like "kvm_shadow_mem" or "accel" are not parameters for the machine
>>>> anymore. Also, there is no distinction between the targets here, so
>>>> e.g. the s390x-specific values like "loadparm" in this list also
>>>> show up with the other targets like x86_64.
>>>>
>>>> Let's fix this now by geting rid of the hand-crafted list and by
>>>> querying the properties of the machine classes instead to assemble
>>>> the list.
>>> Do we know what uses this command, and how these users are
>>> inconvenienced by the flaw you're fixing?
>>> I'm asking because the command is pretty much out of sync with reality
>>> by (mis-)design.
>>
>> libvirt apparently queries this data (see the various tests/qemucapabilitiesdata/*.replies files in their repository), but since
>> it's so much out-of-sync with reality, it's not of a big use there yet.
>>
>> See for example here:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg00581.html
>>
>> If we finally fix this problem with "query-command-line-options" in QEMU, it should be much easier to deprecate -no-hpet in QEMU, too.
> 
> For a value of "fix".  While we can fix certain concrete issues with
> q-c-l-o, which may be wortwhile, the overarching issue is (in my
> opinion) unfixable: it can only tell us about QemuOpts.
> 
> QemuOpts is only part of the truth.  Last time I checked, it worked for
> one out of five CLI options.

Well, that's another problem. For this patch here, can we please focus on 
getting rid of that stupid hard-coded and outdated list in our source code? 
Or do you have something better almost ready that will replace this stuff in 
the very near future?

  Thomas


