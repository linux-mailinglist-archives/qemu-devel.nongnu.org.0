Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562A86ADD39
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:26:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVSo-0005W1-86; Tue, 07 Mar 2023 06:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVSl-0005R7-T5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:26:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVSk-0005ON-5w
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678188392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/jsi+K6Km3f+Jz9erisZlXapXhglaAzpexY0p7NvyUk=;
 b=hme9Ob9B/53XZV8X5Z5i1UNvMAk4X6NLEMeJv5kySxMaQ7SwDeRNoYYSrpkXs5RZP+DkdH
 t3afphb8QS+v1U6qsp3RCwALr+sUbqFWpBBgeK9tiR8fMsHAVmbxPM/nJAcV2QlXmhIQ0K
 RhoD2Ru/Vj6feBqrIIPNvvoK2AtP7Yg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-QIKWhzOoMVmRfmVAxpemRQ-1; Tue, 07 Mar 2023 06:26:31 -0500
X-MC-Unique: QIKWhzOoMVmRfmVAxpemRQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 k12-20020a50c8cc000000b004accf30f6d3so18493042edh.14
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678188389;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/jsi+K6Km3f+Jz9erisZlXapXhglaAzpexY0p7NvyUk=;
 b=YvkryKFjRrLgc9GASvTJVSk+nzvBiaJxCUGAXV+Fd/n3yPF2CyGQvSFYQel8jSzk6D
 HMBcRsCjnqqyrIVTYJFn/i6e8MxN482OBXpEbKBFQWA1mwk8NBXqHiIu0lrtJUriuz4b
 c0cf5wjgofsYVqTNgwfczACqUWjvGPM29mavGwWCQFGpG7GZllJAJgR9Ea2kAIluhm2J
 PFkhWRELKaweoiPGv7BtGKonajkD8qJl/nA/Bax3Ni0LQL/u+3NdWZtAjTaNXW+lSwPy
 5i+eRVHItKRn1X8u6SKeMOT18JltPINDobvKmjwxP4w1rQn7ceaWsP4ZuVM8EwwMN9/v
 t2jA==
X-Gm-Message-State: AO0yUKUZ4vswu9o6gwLWWIca8WkpFD0zZhTkM29QJ9JP4JS+KZ4E8+fX
 Pggc1/6442NtlZbC+DzwUyfttjXokOlj4ExHJUmO60ypFHK7pluTyM/2Wm3k1O+ucrjsNUiZh6k
 pdNe4G258lw7n+jXMmzwRlJw=
X-Received: by 2002:a17:906:135a:b0:8b1:3038:e81f with SMTP id
 x26-20020a170906135a00b008b13038e81fmr14722704ejb.50.1678188389514; 
 Tue, 07 Mar 2023 03:26:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9EY1CvcQaNyVmgLvMavYBUvnSXmlGTrd4PS3qfqM0kRmvQm1pWAqKPy7nK9MmP2MPbA+SCsw==
X-Received: by 2002:a17:906:135a:b0:8b1:3038:e81f with SMTP id
 x26-20020a170906135a00b008b13038e81fmr14722689ejb.50.1678188389220; 
 Tue, 07 Mar 2023 03:26:29 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 a7-20020a170906274700b008b2aba5fb22sm5896759ejd.206.2023.03.07.03.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 03:26:28 -0800 (PST)
Message-ID: <e0a958ec-fa18-0d13-48db-10feea159491@redhat.com>
Date: Tue, 7 Mar 2023 12:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
 <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
 <04f178bb-2407-232f-e843-386bf04b3024@eik.bme.hu>
 <4714e0f2-ccfb-1e9a-149e-aceefef62a9d@redhat.com>
 <e101b894-c722-8def-f591-20fada45795c@redhat.com>
 <48cdc7ae-8e7c-6b6d-76d1-96228ac597c2@eik.bme.hu>
 <CABgObfZLuVgG8pPcF1o517z0wSZTk5SmV8Enn=PC8QmOEVou8w@mail.gmail.com>
 <c2b19806-db0f-54b8-ed41-2e74c19d029e@eik.bme.hu>
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c2b19806-db0f-54b8-ed41-2e74c19d029e@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/7/23 11:01, BALATON Zoltan wrote:
>>
>>> I'm not sure I follow what you mean so I'd need a patch to see then I 
>>> can
>>> test it with the clients I run on pegasos2.
>>
>> Do you have a spec, or pointer to the morphos kernel sources, to 
>> figure out how the hardware works?
> 
> No, that's closed source and only available as a demo iso but it's known 
> to work on real hardware and freely downloadable so is a good test. 
> (AFAIK those who developed MorphOS had close connection to those who 
> wrote the firmware for Pegasos II.) Maybe the VT8231 datasheet or 
> similar parts (we only emulate VT82C686B and VT8231 in QEMU) has some 
> info on this.

I agree it's a good test, but it's not clear what it means to do 
sub-word writes to the register.

For example, in the dump I posted you have:

evt 3 1 write 1      // enable timer
evt 0 2 read
evt 0 2 write 1      // just writes again the same value, clearing sts

It's important to note that the comments are just my guess.

Before even looking at the effect of the write, the trace tells us that 
your patch is incomplete.  With both current QEMU and your patch it 
would do nothing because addr is not 0 or 2; but since the firmware of 
your machine does use addr == 3, you need to handle it.  In other words, 
before looking at this trace, I was wary of accepting your patch because 
it made no sense to me; but I couldn't exclude that I was missing 
something.  Now, instead, I am certain it shouldn't be accepted.

I am quite confident that the second guess is correct, because "write 
the same value that was read" only makes sense for evt_sts and not for 
evt_en.  We learnt something: no matter what bus this device sits on, it 
does not flip bit 1 of the address for subword writes.  As I mentioned 
yesterday, we also observe that the load and store use lhbrx and sthbrx. 
  Assuming this is not a harmless bug in the firmware, this means the 
device is indeed little endian.

This means that the first write is almost certainly to evt_en.  On a 
little-endian machine the write would set bit 8 of evt.en (power 
button), but what about a big-endian machine like yours?  Should it set 
bit 0 or bit 8?  If it's bit 0 (which resides at offset 2 according to 
the device), who flips the low bit of the address?  Why is bit 0 flipped 
but not bit 1?

You simply cannot fix the emulation of this machine until you can answer 
the above questions.  If there is no source and no spec, the two ways to 
do it are:

- get a real machine, and figure out whether the write to offset 3 
corresponds to the PM timer or the power button.

- continue the trace up to the point the OS runs, and see if you get 
some clues similar to the one above that placed evt_sts at offset 2.

Paolo


