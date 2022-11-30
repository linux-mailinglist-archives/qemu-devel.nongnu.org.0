Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EC163D40E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 12:12:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KzB-0000Zn-0w; Wed, 30 Nov 2022 06:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0Kz5-0000ZW-61
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:10:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0Kz3-0001pE-Hp
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669806632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZ49uSx3jdZqNDfwTlA7/AiFUNTD/VrSCM0aoizBaFU=;
 b=MFym29cLjqlgN5OfH+n/QEhN2BAr3kPC0xxPGARWHCOCu0IYmsAg74T0RhIsGwFfkPkt4s
 oYHdOztEU11EwKo4Swd2ed39mGyaGSyYBDdnfutZ7cBcx2xdPhWCPI/t8idPyPVC+/iND+
 mscKrEk/I8dYKsjBcyX/A+W6dS39iso=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-546-iJbD1WIsNZimwKB4DS9aAw-1; Wed, 30 Nov 2022 06:10:30 -0500
X-MC-Unique: iJbD1WIsNZimwKB4DS9aAw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c126-20020a1c3584000000b003cfffcf7c1aso862940wma.0
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 03:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KZ49uSx3jdZqNDfwTlA7/AiFUNTD/VrSCM0aoizBaFU=;
 b=2L7Cu7mFzEdeiaYnUrmtPzKLzueQV2CaY6gqunqHrIw8Qm0KlurqjC8QrrIv4BE4yf
 TjZYqgWe4KggEMPj3UbaUkTZugCD8pKBQ3gl6m3pAawFfJiSbWlVr7Bpgmo1c6qox9wR
 dd3V6d5mcuVTUXKXgV6kf9rRq6T+WL6FXfH0ZtCB4ScO0oXg9HyiFbYRztf4wXPWzwc3
 VK7TIkoJ1UiUjGlpnXc+IR7c8D1HK/ZjLJHf3WrCpBnTwxsXv/55qkZoo+Mno4gGEfst
 4IlU9ncvfYDJigxE5F/zMNk03QKpB4SEwC+vjwiWpPFKVAqKxK0yikn2z1FMLsTx6o2S
 vi4A==
X-Gm-Message-State: ANoB5plVTHVkhsCUDRGudXwXsHilgzhykFN1UYYp0EUjCvfgYJPZapuD
 nzgTJWdEeD9umAWU5OPIyAn73NlyURBSueG13fgmtTAQO/uqoE75mBKtvZcFpMuvS1FDk2m2msC
 L3mKLDX0/kiFLFQQ=
X-Received: by 2002:a05:600c:1d12:b0:3cf:8441:4a7c with SMTP id
 l18-20020a05600c1d1200b003cf84414a7cmr48958392wms.0.1669806629594; 
 Wed, 30 Nov 2022 03:10:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ZEmEFEB+n4Lc+Yoxvzh88yRULucp6vjZw8urjjdiuoIcxse5uW+x1bkmpv5nK1ix9P7i+7g==
X-Received: by 2002:a05:600c:1d12:b0:3cf:8441:4a7c with SMTP id
 l18-20020a05600c1d1200b003cf84414a7cmr48958367wms.0.1669806629399; 
 Wed, 30 Nov 2022 03:10:29 -0800 (PST)
Received: from [192.168.8.102] (tmo-073-221.customers.d1-online.com.
 [80.187.73.221]) by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4d10000000b00241c712916fsm1536842wrt.0.2022.11.30.03.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 03:10:28 -0800 (PST)
Message-ID: <9d174693-6a29-2763-b00b-2cdf979db172@redhat.com>
Date: Wed, 30 Nov 2022 12:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth
 <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221128092555.37102-1-thuth@redhat.com>
 <20221128092555.37102-6-thuth@redhat.com>
 <CAJSP0QW29Y55P2ywsEBqJjC77p1tqS3fYX=Q-VHx7b_uOyezqA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 for-8.0 5/5] scripts/make-release: Move roms into
 separate tarball
In-Reply-To: <CAJSP0QW29Y55P2ywsEBqJjC77p1tqS3fYX=Q-VHx7b_uOyezqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28/11/2022 17.51, Stefan Hajnoczi wrote:
> On Mon, 28 Nov 2022 at 04:28, Thomas Huth <thuth@redhat.com> wrote:
>>
>> Our current release tarballs are huge and caused already some trouble
>> with the server traffic in the past. However, the biggest chunk (~80%)
>> of the tarball is caused by the firmware sources - which most users
>> don't need anyway (assuming that they just want to compile QEMU itself
>> on their own). So we can certainly safe a lot of traffic by moving
>> the firmware sources into a separate tarball, so that only people who
>> really want to rebuild the firmware images on their own have to
>> download it.
>>
>> This decreases the size of the main QEMU xz tarball from ca. 116 MiB
>> to only 27 MiB!
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   scripts/make-release | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/scripts/make-release b/scripts/make-release
>> index febeb6cb36..44408c24a2 100755
>> --- a/scripts/make-release
>> +++ b/scripts/make-release
>> @@ -42,6 +42,19 @@ git submodule update --init --single-branch
>>           CryptoPkg/Library/OpensslLib/openssl \
>>           MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
>>
>> +tar --exclude=".git*" -cjf ../qemu-rom-sources-${version}.tar.bz2 roms
>> +rm -r roms/*
>> +
>> +cat > roms/README.rst <<EOF
>> +Please download the qemu-rom-sources-${version}.tar.bz2 tarball
>> +and unpack it in the topmost directory of the QEMU sources in
>> +case you want to recompile the QEMU ROM images.
>> +EOF
>> +cat > roms/Makefile <<EOF
>> +%:
>> +       @cat README.rst
>> +EOF
> 
> Replacing files with different content worries me a little. If someone
> is trying to match a git tree with a release these files will be
> different and require manual inspection.
> 
> How about having no roms/ directory in the main sources tarball and
> including a check for an empty directory in the build scripts?

Not sure where to add such a check - do we have a way to build the roms from 
the main build machinery yet? ... last time I asked, I was told that "make 
-C roms ..." is the way to go...

  Thomas


