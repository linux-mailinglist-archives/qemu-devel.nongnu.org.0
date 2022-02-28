Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FAE4C7760
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:15:01 +0100 (CET)
Received: from localhost ([::1]:57016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkY0-0006GY-Nq
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:15:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nOkVe-0002Ep-ED
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:12:34 -0500
Received: from [2a00:1450:4864:20::434] (port=39706
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nOkVc-0006fH-Ss
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:12:34 -0500
Received: by mail-wr1-x434.google.com with SMTP id s13so16794843wrb.6
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+C5v6tp5V5SgginZhJ1aZK2ldHW/um1hEvXeCzMJvlk=;
 b=qBCNWDLebp/+zYR0ktv8rZFsS9f2RP75Y5jHIDZ5SSWrAhVjdVW03qdSreleNO4t+s
 C+T3pJ2iwMU0OyjJ6FAGWd6zbgrXlnsJzw6dhuLGCp8wyMn6Ts2gsRYJ4JTskbj+zrWW
 vCgi7WGUtKdtpFkET3COIzEpBoKXoj+yVsNuLA2VuRL4ZjXflYwWWYsLqVxI4yZJKO77
 xk+PHvRwut23tuXs7kKh9gOr8SZp848NoUW6D2uyGDKzPxJ/sPG9ekVttjL9Elg2Vw7W
 KM7Gf7MHYsZm8fiLi/umlR673My8GLlmKh1aR3bzkstuQ2fIRAVGVIkbVWPlKwyOEQfS
 b2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+C5v6tp5V5SgginZhJ1aZK2ldHW/um1hEvXeCzMJvlk=;
 b=6YpeoR3APc2kU1667/axxdoJMt038orJl9AB05l0oagWbg4/8F/5kvvhiK0RVuVx0W
 18E+dJ0jh3/6j/+zNTwNGld296ATYjQ80f/9iXo/68o+awkQACuC6VSfQDqH/FmuVdNv
 FzBXTTgp4v4eQULrlxET8htFrEIKO/e/Na/UoAdtPtXzfcp8XmPgFqbQe9oCyyU+5lw+
 7Eydj+3eF8SjTMCMV+5t//elu9sP3yeHy7NInbDWp0dwZsZ6icE0vNDvNyum/Fa6gElK
 kxBid13YmwLLeIEIAFL4whOHgQaa2rHsDBifSyrFB9izmZEQTWUd1EhCGgZ0ycjZYW53
 mHNA==
X-Gm-Message-State: AOAM533qZkBgg77TMIrC0+KCaQDYvmid2VoEGgO5ynNpx7/RHTuBqPs5
 iXGxx9PwLnZZqc1+Dzok+YU=
X-Google-Smtp-Source: ABdhPJye6mC63JUMRX+Sm4Twiqa3jg5t3U0rECUZW6Vl3bP2BEnrw2CJreHv1i5ouZOmNSwu0XbvGg==
X-Received: by 2002:a5d:6885:0:b0:1ed:c0bc:c205 with SMTP id
 h5-20020a5d6885000000b001edc0bcc205mr16870283wru.683.1646071950348; 
 Mon, 28 Feb 2022 10:12:30 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 m10-20020adfe94a000000b001ef57f562ccsm11420221wrn.51.2022.02.28.10.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 10:12:29 -0800 (PST)
Message-ID: <6802128b-f66b-91a4-aae2-d0f38ceea423@redhat.com>
Date: Mon, 28 Feb 2022 19:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Content-Language: en-US
To: Jag Raman <jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
 <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
 <496E5796-7071-4C9E-B2AB-3C59CB3D50B5@oracle.com>
 <fa4739f2-d6ab-9d01-6a4a-ab511bf0f89c@redhat.com>
 <43467806-DBE0-4EAB-A7D0-46F46BE45958@oracle.com>
 <054f4b14-b523-35fc-acdc-024bbb2c13fd@redhat.com>
 <FB3E0606-9B09-44B2-BAE0-771BB8E3B3AA@oracle.com>
 <e5e88bcb-6573-709f-5c17-229cde3a0a5f@redhat.com>
 <1399787E-BB5C-48A3-A848-44520EA52A1C@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <1399787E-BB5C-48A3-A848-44520EA52A1C@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 John Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Eric Blake <eblake@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 05:03, Jag Raman wrote:
> 
> 
>> On Feb 24, 2022, at 12:52 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 2/22/22 20:05, Jag Raman wrote:
>>>> -            defaults[prefix + 'COMPILER'] = exe_list
>>>> +            defaults[f'{prefix}COMPILER'] = [exe_list[0]]
>>>> +            for i in range(1, len(exe_list)):
>>>> +                defaults[f'{prefix}COMPILER_ARG{i}'] = [exe_list[i]]
>>>> +
>>>>              if comp_obj.get_id() == 'clang-cl':
>>>>                  defaults['CMAKE_LINKER'] = comp_obj.get_linker_exelist()
>>> This fix works at my end.
>>
>> Would you please check that -m64 and -mcx16 are passed indeed to the compiler?
> 
> Hi Paolo,
> 
> Yes, I’m able to see that -m64 and -mcx16 are passed to the compiler.
> 
> # cat ./subprojects/libvfio-user/__CMake_build/CMakeMesonToolchainFile.cmake
> …
> set(CMAKE_C_COMPILER "/opt/rh/devtoolset-9/root/usr/bin/cc")
> set(CMAKE_C_COMPILER_ARG1 "-m64")
> set(CMAKE_C_COMPILER_ARG2 "-mcx16")
> …

I reproduced this with CMake 3.17.x and it's fixed by 3.19.x.  I'll send 
the fix to Meson, but for now I recommend requiring a newer CMake and 
just dropping this patch.

Paolo

