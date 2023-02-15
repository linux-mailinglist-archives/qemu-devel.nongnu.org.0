Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD66980DD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:30:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKe0-0006P8-Im; Wed, 15 Feb 2023 11:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pSKdy-0006Oy-Gc
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:28:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pSKdw-0007FV-TR
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676478508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cPCSYaSbJjLC5gSJWcc5x030uT/+CzFPd2JODcweirw=;
 b=SCZwRN0krLTYz54Sl+ovHD1xkQWGnknYw3D1PM1cVT4TSy64tY05DGfoRoDBt/7oUHRYWj
 BfATNsPpUKfaIDS8qk9Bi4JxYp3T+j/lMgmeH3ev9bEYA9ln3vop7XRGyuWHqLXqMBI5fx
 iv7/EW5okTsi0T0R899HCBlMkXryww0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-295-X5lpEMOlOQeALw5pIclbkQ-1; Wed, 15 Feb 2023 11:28:26 -0500
X-MC-Unique: X5lpEMOlOQeALw5pIclbkQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 j29-20020a05620a001d00b00724fd33cb3eso11805645qki.14
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cPCSYaSbJjLC5gSJWcc5x030uT/+CzFPd2JODcweirw=;
 b=W3wmdgtrabQVYbsQHsbVDOnn2SZWjGbfx5dz8eqlAKHrXhFGpZ4UQI5dPQrd/vzULj
 /fk+p49NQMddBSMipHTZ5GBypMi8T0Mjy00LjSlz0gUVRALMzZetosa7RYHYz70K7ks5
 y5TAtpFRM+vx/tQhZ3w42kccp7bigjXlvk7juyPJ0GYl7GgSCmiOboGB6sEbfrSnhWrt
 nNy/T4X06knj5eqXgM40FfaiCRdbabBfMdZUJEVC1VaH2vc+ezqPToP4+i0jcqQT6LmI
 a3qU2xYkn6SHIJK7cfv77+BdF+sHzFhA1Q5B3jqU1W7mdbljq3sC0ssQSz51fUPOf2YB
 4ipw==
X-Gm-Message-State: AO0yUKViS3/bDd/JETMJOZDjAVscwRZqyPmepVZPj9E9Ph6GQDJ83oGo
 HkSALKg3od/jyafdqDK9xv6xZZi3DIRI54yisxhrUDuqyzNAXxIC0wifBqudsTuVLpboKulo7p6
 CeXi5W9yz7PfvU9o=
X-Received: by 2002:a05:6214:19c5:b0:56e:b2ad:e2e0 with SMTP id
 j5-20020a05621419c500b0056eb2ade2e0mr5424764qvc.30.1676478502673; 
 Wed, 15 Feb 2023 08:28:22 -0800 (PST)
X-Google-Smtp-Source: AK7set86VvmSpQUwWaT1mjOlNldr3cWD0OVol4wNIEO/6sx2ui6hPPLEEndXct5QGrajBdLDI7rT3g==
X-Received: by 2002:a05:6214:19c5:b0:56e:b2ad:e2e0 with SMTP id
 j5-20020a05621419c500b0056eb2ade2e0mr5424727qvc.30.1676478502398; 
 Wed, 15 Feb 2023 08:28:22 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a05622a149600b003b323387c1asm13573461qtx.18.2023.02.15.08.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 08:28:21 -0800 (PST)
Message-ID: <12623898-7b7d-eb78-968a-13168dac3045@redhat.com>
Date: Wed, 15 Feb 2023 17:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PULL 13/25] hcd-ohci: Fix inconsistency when resetting ohci root
 hubs
Content-Language: en-US
To: Qiang Liu <cyruscyliu@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
 <20220926095509.3759409-14-kraxel@redhat.com>
 <CAJSP0QVoLf_v2xP6GwDzbFg_RDnP5ppM3UZwTN3XAWPcv6cFCQ@mail.gmail.com>
 <CAAKa2j=2cdYxBFZO1pTJLFcPVb-6R4gnB9zad3rdptfuuo0ixw@mail.gmail.com>
 <CAAKa2jmkjPuTouvk3qRvuFiS7RtTSQ8vC=m_eDYLyV7tUxAkiA@mail.gmail.com>
 <CAJSP0QV=UrYyASRddqTX7KbSw_dLPhVgbdORvYx_N+tQa6Nu+A@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CAJSP0QV=UrYyASRddqTX7KbSw_dLPhVgbdORvYx_N+tQa6Nu+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/15/23 15:34, Stefan Hajnoczi wrote:
> On Wed, 15 Feb 2023 at 08:45, Qiang Liu <cyruscyliu@gmail.com> wrote:
>>
>> Hi,
>>>>
>>>> This commit breaks boot-serial-test on ppc64-softmmu.
>>>>
>>>>    $ ./configure --enable-tcg-interpreter
>>>> '--target-list=aarch64-softmmu alpha-softmmu arm-softmmu hppa-softmmu
>>>> m68k-softmmu microblaze-softmmu ppc64-softmmu s390x-softmmu
>>>> x86_64-softmmu'
>>>>    $ make && cd build && QTEST_QEMU_BINARY=./qemu-system-ppc64
>>>> ./tests/qtest/boot-serial-test; cd -
>>>>
>>>> (Yes, the full --target-list is needed because boot-serial-test isn't
>>>> built when only ppc64-softmmu is selected.)
>>>>
>>>> Here is the CI failure:
>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3087540972#L22
>>
>>   I reproduced this failure and got "Out of malloc memory" error message in the [openbios-ppc](https://github.com/openbios/openbios/blob/4a0041107b8ef77e0e8337bfcb5f8078887261a7/libopenbios/ofmem_common.c#L134). However, I'm not sure how to debug this. Have you run into this issue before?
> 
> I don't. Maybe Gerd has an idea?
> 
> The memory allocation may be because there is either a request leak or
> additional USB activity as a result of this patch.

It looks like a bug in openbios ohci, perhaps Zoltan can help?

Thanks,
Laurent


