Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0B26AE738
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:49:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaUn-0006pW-1z; Tue, 07 Mar 2023 11:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZaUf-0006p9-AG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:48:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZaUX-0007Yi-Vt
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678207718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rEHNkxJ4Ze/3tdXJsxsmBbdzPCkiHKhjsZyX4zOIKrc=;
 b=iids8lN/uiCrjUKGDZcuTXXHZFA7qDsnSUm6vilkern3rUcH2cDU7h9rugeBMPPSWgHYzY
 PffWGd5+UoLtjZtvrOZd4y2AK2NTJYZZ+LXqSMYPHidlVINDw/UNmqMx4BDAqlut4z4Bmk
 VTNj/1s8KpZHhPznksPkUo0D1cMrJT0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-dfGBKJIRMpCckXMEV8q_Zw-1; Tue, 07 Mar 2023 11:48:36 -0500
X-MC-Unique: dfGBKJIRMpCckXMEV8q_Zw-1
Received: by mail-ed1-f70.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso19773253edb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678207715;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rEHNkxJ4Ze/3tdXJsxsmBbdzPCkiHKhjsZyX4zOIKrc=;
 b=0wltuBWXTV3rpt9eHGcSf207RhOkVIjzc1FxZdr+6E05MUKsJZ+pYEyX/CVLAscpSH
 a8fZ34GBAB9rVbnVZtSJ71/zosjeYEkiNWlq2t442QjSbJc31vbalU67m/tgfzWM6ufF
 on/w65HL4zrww5cOci0u05wWV+RjhW4a6HFjEnbCAAciwHrnvAaYbNDZsLQmoHRo7dEP
 Fow/tOKLhkqupQ+KLCkaO5re/QMJ0lE5M/DOjFYHmngOCyhoEXVEBHk+T9etRSF7pcpZ
 RqL9qkOZcWauC9NTP13om2u4+KoSt+v+5X7hbrOQBomMKQZimjVf/40a8wmMgeOjrSDt
 /toA==
X-Gm-Message-State: AO0yUKVX0EyqL/HhJ2424AhngDgs5VQ9NnGgGke6FC+ANAvAEF1x2h7W
 RU/lVoTF1pZKmiaik71OJiOOC0usiiVFo713YBdJJyjLMcmpHKN4umqreKnjcz4g25JnjERUgcx
 vstkRJ7dU5le0O3Q=
X-Received: by 2002:a05:6402:5154:b0:4bd:6b93:1289 with SMTP id
 n20-20020a056402515400b004bd6b931289mr13515804edd.15.1678207715243; 
 Tue, 07 Mar 2023 08:48:35 -0800 (PST)
X-Google-Smtp-Source: AK7set++nQXJeA3+qBPHNUYV8SLJozCEmCvi5VznINHW6NOSKNirsVTiHDmYdafwgdg7oGwvvU17aQ==
X-Received: by 2002:a05:6402:5154:b0:4bd:6b93:1289 with SMTP id
 n20-20020a056402515400b004bd6b931289mr13515797edd.15.1678207714971; 
 Tue, 07 Mar 2023 08:48:34 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 s30-20020a508d1e000000b004c5d1a15bd5sm2990295eds.69.2023.03.07.08.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:48:34 -0800 (PST)
Message-ID: <9c807279-c9ee-c8c3-b065-cdbc3461ecca@redhat.com>
Date: Tue, 7 Mar 2023 17:48:33 +0100
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
 <357c8c40-8b16-d53c-c453-b8cebe4a312f@redhat.com>
 <f16d495e-3f7b-d253-601f-c2566c49e521@eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <f16d495e-3f7b-d253-601f-c2566c49e521@eik.bme.hu>
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

On 3/7/23 16:21, BALATON Zoltan wrote:
>> I didn't even have an idea that Forth was involved, honestly, or how 
>> to write Forth code for this machine that I barely know exists. 😄
> 
> It's supposed to be CHRP compatible which mandates OpenFirmware so it 
> should work about the same as similar IBM and Apple machines but those 
> are also kind of obscure. If you can describe what you want tested I can 
> try to make that a script and ask somebody to run it on real machine but 
> I'm not sure what to test.

For example:

- read the PMTIMER, check that it increases when read as little endian

- read individual bytes of the PMTIMER and check which increase faster


Also, since we've probably identified the EN and STS registers:

- write 0 to the supposed 16-bit EN register

- write 1 to the supposed 16-bit EN register

- check that it reads back as 1 (the STS register would not)

- read individual bytes of the 16-bit EN register and check which is the 
low and which is the high one

- write 0x100 to the supposed 16-bit EN register

- check that it reads back as 0x100

- read individual bytes of the 16-bit EN register and confirm that the 
one you identified as "low" now reads 0 and the one you identified as 
"high" now reads 1


Or:

- read the (supposed) 16-bit STS register

- wait for the STS register to be non-zero

- write the read value to the STS register

- read again and check that it's zero

- wait for the STS register to be non-zero

- read the individual bytes of the 16-bit STS register and check which 
is the low and which is the high one

- wait for the STS register to be non-zero

- for each individual byte of the STS register, write it back, and check 
that it now reads to zero

Part of this should already work in QEMU.

Paolo


