Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DDE6B3FF7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:10:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pacVL-0008DF-Ck; Fri, 10 Mar 2023 08:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pacV8-0008Cp-9M
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:09:39 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pacV6-0002WS-HI
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:09:38 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so5957278wmb.5
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 05:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678453775;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FuZVdGsGcns0o6QpTlj5CrVEEfXsx1TVOJZ3OhMGIe8=;
 b=kpU7tvtfGwQaH6dopSqqQ1FPnOid5JIt96DbKcOeLtfemHF3vBGVvaXcY+61SXUSf3
 LAQ7alz8QD8ZXbdDSFrjrG803W0Q5naJ17Sf+067C8dyIMKU7HD+nJ/CJWzWluU+CmkC
 iMIyHly+B1i3hSw1Gq4cZs3HPP3PTAqt3VwfNqKEEN5daW6dElKS5lI+gAthEClACJEk
 5DuAaK9aLHmq37UUcZacr9g/vafHdScu5oXnjmKsiolZFtBKvzO5lXG2eTM8PWU/nzBJ
 xRiBXeC+ET8akHk1ecQGPdESmSF6oFrHFUS2a0P0d1LCGs3Ro2MoFHQqEHIy15fPiqDB
 K/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678453775;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FuZVdGsGcns0o6QpTlj5CrVEEfXsx1TVOJZ3OhMGIe8=;
 b=L8RKWP03ona5H9ctOVZZZiVA8G9mGAkStfQDpnpLoIAQWCMhB6TuoYRRfj/BljkhNx
 wDZShfIcP8N5mNUoIp4DbL6HdOX+KH5N+SqBxw8QMSouxys+aEk5L0wqDFidJDPGJPWG
 remUjer3zrhJmvzEZCAeqJAf3Ym1mao6Wjtuc7v3qPhj8JodpvOdNecHrvHg0ICjOmZJ
 3z7CCPvoxYxojpeHoAuYw1CzVUEVtWS+CNkGc6le5ToNgtAUDVGyK3dTw3epx6aBwPE/
 bqxBa0uKykadWEosVKJtlv6HCnK/4xaBPAfeKJLm5eFbrSfhUfAP4l8c14dgOEgXA3t5
 O6vw==
X-Gm-Message-State: AO0yUKWmlxnfmZ03EOXkaHT13B54vZ6KUZFj/SucwEXhx/Hs+1QBUXmg
 0Dayzw6kpIbceesmAgrF4rNkpg==
X-Google-Smtp-Source: AK7set84VHvLAFX8thewen1F8uJbNV/SlN5jy8EHE6yVxTbJBqnFgFF5LOAiw4nRtVchqgil9GD9ow==
X-Received: by 2002:a05:600c:46c6:b0:3eb:13d2:c32c with SMTP id
 q6-20020a05600c46c600b003eb13d2c32cmr2487046wmo.40.1678453774922; 
 Fri, 10 Mar 2023 05:09:34 -0800 (PST)
Received: from [192.168.1.115] (169.red-88-28-29.dynamicip.rima-tde.net.
 [88.28.29.169]) by smtp.gmail.com with ESMTPSA id
 hn29-20020a05600ca39d00b003e9ded91c27sm3111816wmb.4.2023.03.10.05.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 05:09:34 -0800 (PST)
Message-ID: <c187e196-126e-2f49-9a33-7065dd04ad5e@linaro.org>
Date: Fri, 10 Mar 2023 14:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 0/3] Edk2 stable202302 20230309 patches
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20230309115714.906369-1-kraxel@redhat.com>
 <CAFEAcA_KwKQjgsx+4C_3an6ujhN=ETYFbaOjgU7Bg4OYt10OgA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_KwKQjgsx+4C_3an6ujhN=ETYFbaOjgU7Bg4OYt10OgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/3/23 12:30, Peter Maydell wrote:
> On Thu, 9 Mar 2023 at 11:58, Gerd Hoffmann <kraxel@redhat.com> wrote:

>> Gerd Hoffmann (3):
>>    edk2: update submodule to edk2-stable202302
>>    edk2: replace build scripts
>>    edk2: update firmware binaries
> 
> The docker-edk2 CI job fails:
> https://gitlab.com/qemu-project/qemu/-/jobs/3910666498
> 
> Step 1/3 : FROM ubuntu:18.04
> 18.04: Pulling from library/ubuntu
> mediaType in manifest should be
> 'application/vnd.docker.distribution.manifest.v2+json' not
> 'application/vnd.oci.image.manifest.v1+json'
> 
> This may be fixable with an equivalent of:
> https://lore.kernel.org/qemu-devel/20230224212543.20462-2-palmer@rivosinc.com/
> for .gitlab-ci.d/edk2.yml
> 
> What I still do not understand is why we have both:
> (1) binaries of edk2 committed to git
> (2) a gitlab CI job that is building edk2

Originally we wanted to have reproducible images by:
- pushing code change to gitlab (commit #1),
- building the FW images on gitlab,
- downloading & testing them,
- committing the images (commit #2).

Since we never used that, we can probably remove the
docker-edk2 CI job which already bitrotted...

