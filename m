Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC516AE439
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:15:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZ1a-0002YN-3m; Tue, 07 Mar 2023 10:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZZ1X-0002X1-8d
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:14:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZZ1V-0008Le-He
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678202078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THHWHbOSSU+X6oUaQmIHY6uOAP6kggZVNFl6RTuqrPQ=;
 b=cZ3B00gLC+xWUUFzwjE3KZQsa35gIOWbSM1e3tOD/W+gJ+tuG4algs60DAulFPg6r9D8Rn
 47XyY4xoC6W896441mAvmv+rfWTVr8WNmNjL9VIy70+zJz1ZnNsfdM4wiGczdQMDQExyzA
 nRLyGSi5nRUzs95LjE6oZ+EUVFKmMQY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-wMa609MaM1ebJ0CzjC2Esg-1; Tue, 07 Mar 2023 10:14:24 -0500
X-MC-Unique: wMa609MaM1ebJ0CzjC2Esg-1
Received: by mail-ed1-f69.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so19581566edb.21
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 07:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678202048;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=THHWHbOSSU+X6oUaQmIHY6uOAP6kggZVNFl6RTuqrPQ=;
 b=gP9dlcu7C3T6cy4JCKBrpYRtxhW43xQbDQLsfQFEN5/wo7utEJZ6VzX9zh6dkvbubf
 zIPXdPfVdX2LHMfqTn65utJquQaCol/fnH7xmaqVetyROqqHvMAiAdDhS01EVeyqxOub
 DMAyif3s5hYiEt9ot4NWopIcAajPdmKDpDKTcQr66K/ztVxBAf7zdpIe+CG4FNwHfjaB
 9AuNFUbde0i2HcoH/zEMHTKIbbZYXN9AwQ2+QjW+xR27Nn9ZGr8jgE442ZSDTZQFHQj3
 h6sOltGG5sdMzj4aUDSA4JJjWbXrKcSJvg5Uhne3WNWK3YG+la07/sdidxqkX3NH82kR
 5mDQ==
X-Gm-Message-State: AO0yUKX+gejMEiVwgxOvwnp+hdlefwW/lTnBIZKfBdzeiOCrKjY/XYXv
 lwBwKe8uBsM/uotCmwGN64l8hGhZT/vmLbw6keyOTyJSrtOkuZRKQgeCxDBd51w1RDi0fPzIdhE
 VtsTWhFBFJJ0E+sM=
X-Received: by 2002:a17:907:a602:b0:8ae:e82a:3230 with SMTP id
 vt2-20020a170907a60200b008aee82a3230mr15047234ejc.70.1678202048398; 
 Tue, 07 Mar 2023 07:14:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9M4FLh/6Kf5NEe8KgMBbpLT6WX0YRPLzAiylzXL4TzhSCK5J3mVyKLNjALdc9vvUUms06cHA==
X-Received: by 2002:a17:907:a602:b0:8ae:e82a:3230 with SMTP id
 vt2-20020a170907a60200b008aee82a3230mr15047210ejc.70.1678202048064; 
 Tue, 07 Mar 2023 07:14:08 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 bo19-20020a170906d05300b008cae50b0115sm6183570ejb.87.2023.03.07.07.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:14:07 -0800 (PST)
Message-ID: <357c8c40-8b16-d53c-c453-b8cebe4a312f@redhat.com>
Date: Tue, 7 Mar 2023 16:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
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
 <e0a958ec-fa18-0d13-48db-10feea159491@redhat.com>
 <68f3c8a7-c990-00c0-4872-68acee86c28c@eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <68f3c8a7-c990-00c0-4872-68acee86c28c@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 3/7/23 13:54, BALATON Zoltan wrote:
>> evt 3 1 write 1      // enable timer
>> evt 0 2 read
>> evt 0 2 write 1      // just writes again the same value, clearing sts
>>
>> I am quite confident that the second guess is correct, because "write 
>> the same value that was read" only makes sense for evt_sts and not for 
>> evt_en.
> 
> It could also make sense if the guest is trying to flip a bit that's 
> already set or cleared.

No, I checked what the guest actually does and it's read followed 
immediately by a write, with no other ALU values in the middle.

> AFAIU the device is little endian (VT8231 is a PCI device and primarily 
> a PC part so it's expected to be little endian) but the guest also knows 
> this and writes byte swaped values to it. But since the memory region is 
> set to LITTLE_ENDIAN and we're on a big endian CPU QEMU will byte swap 
> it again which it should not do as the guest already did that.

It's the opposite.

The CPU first swaps the value that was in the register, when it executes 
sthbrx instructions.  With DEVICE_LITTLE_ENDIAN, QEMU does the second 
swap and restores the value that was in the register.  With 
DEVICE_NATIVE_ENDIAN it happens to fix the cases that matter for your 
testcase, but it breaks others.

>> This means that the first write is almost certainly to evt_en.  On a 
>> little-endian machine the write would set bit 8 of evt.en (power 
>> button), but what about a big-endian machine like yours?  Should it 
>> set bit 0 or bit 8? If it's bit 0 (which resides at offset 2 according 
>> to the device), who flips the low bit of the address?  Why is bit 0 
>> flipped but not bit 1?
> 
> I think the guest already writes byte swapped value so it should work 
> the same as on little endian machine but the QEMU memory layer gets in 
> the way.

The write in question is "evt addr=3 size=1 value=1" so it's a one-byte 
write.  There's no byte swapping involved here, rather the question is 
how the addresses are interpreted.

>> - get a real machine, and figure out whether the write to offset 3 
>> corresponds to the PM timer or the power button.
> 
> I don't have real machine but know somebody who does but I'm not sure 
> what to ast to test on it. Can you describe it what you want to see or 
> maybe write a sctipt for the fimrware to test it (if you're familiar 
> enough with Forth for that). I can try to find some more info on this 
> but so far I was concentrating on other bigger issues. This is a minor 
> annoyance but would be nice to fix eventually.

I didn't even have an idea that Forth was involved, honestly, or how to 
write Forth code for this machine that I barely know exists. :)

>> - continue the trace up to the point the OS runs, and see if you get 
>> some clues similar to the one above that placed evt_sts at offset 2.

I'll try this once the machine is back in shape.

Paolo


