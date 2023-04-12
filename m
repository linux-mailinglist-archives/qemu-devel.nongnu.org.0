Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DA66DF75A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:37:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmadj-00016w-Kh; Wed, 12 Apr 2023 09:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmadh-000168-IV
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:35:57 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmadf-00042B-PX
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:35:57 -0400
Received: by mail-wm1-x334.google.com with SMTP id q5so6536827wmo.4
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681306552; x=1683898552;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pp/vZNTH1CdYoakxWMjsbyXkrBnC6lsoL8fgM36jhHA=;
 b=UdnscHMEvQz45UkLik37L0hEIoYpItpzh0YlKZDl85OiVjf15e/Kusv7Q22Nt/B7Sg
 8U4bUJwS+rxvIUcFzhv6pw/xeOvQlhS/4KG0r+++aLXVNeR8BBGBM8ffToibmc7lxJPM
 vT0qxlkgOwxmtM0U68ttNyjdRl7SBaon2terdXX7UoK/9dJDyAHYxzcqjNVtP3HhnvRR
 0Zxw5ugxQcXH7EkWUIh3vkXLSiyyr7m1tYeC8hg2QKx1AMlF0AJ6xwx9E3D0r3f+oiO3
 Eb5vACUdhbCOiTSA+KErKHtsDc3JfFPxWP9+qCDfbkz7QMp1qcfNJE1TtE3BAOnAVms1
 MaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681306552; x=1683898552;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pp/vZNTH1CdYoakxWMjsbyXkrBnC6lsoL8fgM36jhHA=;
 b=sosBn/B1rCyXl4HrFMczeVkwkXgC7mK4mpZ5txxU0IJ2+7Mzqgm2VkQgV7HG7ZKrC+
 y/ODTpEh4pL5AxqlxM2YJ1F+s+Cad9a7QvmcokCYjZU8H+Ay4cxJ0ZPUzVpQvmI+LBFd
 RFHjIsG/HP089HJ0ghzo4wzfmuSiXe+ZInAsNt3hISiFtr1YriLeORSfft9oRVVpeexs
 Xjunho0+cYIhvjjS+oHndJsssyJNc9CmIwku8Cye+zRD+CQpeSpAl+XhVihicdBBLFOK
 OdwvVkuIkR3+aO5w+mGOqNPGo+6ZLenHHtAM0BKzONOH9gKmC6qP+WneeJd7/tAgN5ut
 pPjA==
X-Gm-Message-State: AAQBX9dBjXpNEgvIlGyUgS3a4agxFPHPASrjybMFT/S5gJ2SCdywOOWS
 7/n5kzBTXJMgOLzaP6ZJmH28jg==
X-Google-Smtp-Source: AKy350ZMvSEee+J206l5ykzqOZYJksxor/SX5VB6FJI2pHRVAyrysQrLIuP9OKazZ7dvbgMZlvebZw==
X-Received: by 2002:a1c:ed18:0:b0:3ed:5eed:5581 with SMTP id
 l24-20020a1ced18000000b003ed5eed5581mr2256488wmh.2.1681306552665; 
 Wed, 12 Apr 2023 06:35:52 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a1c7404000000b003ee44b2effasm2413602wmc.12.2023.04.12.06.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 06:35:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E78071FFB7;
 Wed, 12 Apr 2023 14:35:51 +0100 (BST)
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
 <20230411224746.16152-11-vikram.garhwal@amd.com> <87fs95ck61.fsf@suse.de>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: xen-devel@lists.xenproject.org, vikram.garhwal@amd.com,
 stefano.stabellini@amd.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [QEMU][PATCH v6 10/10] meson.build: enable xenpv machine build
 for ARM
Date: Wed, 12 Apr 2023 14:32:03 +0100
In-reply-to: <87fs95ck61.fsf@suse.de>
Message-ID: <87pm89nryg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Fabiano Rosas <farosas@suse.de> writes:

> Vikram Garhwal <vikram.garhwal@amd.com> writes:
>
>> Add CONFIG_XEN for aarch64 device to support build for ARM targets.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  meson.build | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 52c3995c9d..eb5bb305ae 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -135,7 +135,7 @@ endif
>>  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>>    # i386 emulator provides xenpv machine type for multiple architectures
>>    accelerator_targets +=3D {
>> -    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
>> +    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu',
>> 'aarch64-softmmu'],
>
> I'm not familiar with Xen, so pardon my ignorance, but would it (ever)
> make sense to do a 1:1 map of host architecture and qemu target? So we
> don't have to deal with having a build on x86 pulling aarch64-softmmu
> and vice-versa.
>
> Do we expect both x86_64-softmmu and aarch64-softmmu binaries to be used
> in the same host?

Xen is different from the other accelerators as it isn't really guest
CPU aware. It is merely io device emulation backend albeit one that
supports a non-paravirtualised guest on x86. But you are right that
using qemu-system-i386 as a backend on aarch64 hosts does cause some
cognitive dissonance for users. For aarch64 hosts we would only support
the VirtIO guests.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

