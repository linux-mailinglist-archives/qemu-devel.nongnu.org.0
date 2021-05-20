Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59BD38B435
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 18:29:00 +0200 (CEST)
Received: from localhost ([::1]:33848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljlXf-0004r5-5e
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 12:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljlWV-00047C-LF
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:27:47 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33]:46002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljlWU-0003rB-3g
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:27:47 -0400
Received: by mail-vk1-xa33.google.com with SMTP id f10so2716602vkm.12
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 09:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9EAG7x7hpmpoFqM/Ju6HtnJo88lHJJ/OgfnFw2bOge4=;
 b=KkvSrKsp23UG8iSAOv6M5G6hW02CIB5sNuCXUS7+BaKO1zs3Ti1CNMX3HtsgsW7Qzl
 ZyAMz5QP/29mVIyeBbVLRZZCUknZP2CBNB+kDSujoMBKY4ohF3RChMQzyKP3pQPNdbDK
 75nW6R1nYAFwQOry4oOZmFSFSTf13RhkJubGmmPK5bCagga5UGP3Iyr5hFTPgQk60RHP
 8kzk7A4JAQK488Hzs2FQWEaIsacpzSZ3RTojx0agqTJCY5qAMu2Pye1WbOfTfhYJqsjR
 vxECxobh65dYlmZpsJW31prIZ4sEJPUIlZVZdMkSgjRbBMOsgy6s63S/yBy4SC8hEc4s
 C8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9EAG7x7hpmpoFqM/Ju6HtnJo88lHJJ/OgfnFw2bOge4=;
 b=TwBkukvQBsVxR5G/G0iEtLsaIV9MjSuPq/si0pB3r8iaSrKfvh8j0QoZiaOG5DIzqf
 p2EjloUzC6NvABkFlMUYGEEDMeC6wcFaEiXkw1m7VHRCuCp7+eTdslxpV+DwYfxWWumK
 SiiFQoi18VdGjja9hTrC6gc7bXCcaOP2ygqMWNZtIp+o65jAg9iPgcZ0XSJmQK+3X7ds
 q+WXYFzaINr0lKjLfHWuNLhdj5XD8Dki+a3J3dX+p0vYdQduZf31PLZBa8JCYdCqgazt
 JF5mARypen/LyUyImGBxaeYVitwh3GGbLMRDWLnBkiJJmBrXUpkaHZZKCbc69V4herHk
 tnZQ==
X-Gm-Message-State: AOAM5303zjJpZNSNooa+OXNHGWqrj/z3g3fJ6Y90jEL4Irtail0iAw/B
 1xT2K0VKOnXJPYi6o0euLXlW2A==
X-Google-Smtp-Source: ABdhPJxFd7XVgIx64xbPHPsk0xVKAJgDt/DiJqgEneWhW8t769U/VnpZRjNC5TBzh3ZQF8IXqyCCmw==
X-Received: by 2002:a1f:f84a:: with SMTP id w71mr5313767vkh.4.1621528064986;
 Thu, 20 May 2021 09:27:44 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id v8sm540568vkv.51.2021.05.20.09.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 09:27:44 -0700 (PDT)
Subject: Re: [RFC PATCH 17/25] hw/virtio: Use correct type sizes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210518183655.1711377-1-philmd@redhat.com>
 <20210518183655.1711377-18-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3be2267a-6874-ddb1-ad5b-817e367c0be9@linaro.org>
Date: Thu, 20 May 2021 11:27:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518183655.1711377-18-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 1:36 PM, Philippe Mathieu-Daudé wrote:
> -static inline int virtio_lduw_p(VirtIODevice *vdev, const void *ptr)
> +static inline uint16_t virtio_lduw_p(VirtIODevice *vdev, const void *ptr)

While this one looks obviously correct,

> -static inline int virtio_ldl_p(VirtIODevice *vdev, const void *ptr)
> +static inline uint32_t virtio_ldl_p(VirtIODevice *vdev, const void *ptr)
>   {
>       if (virtio_access_is_big_endian(vdev)) {
>           return ldl_be_p(ptr);

this one isn't so obvious.

Are all of the users unsigned?  If so, should we rename it ldul?


r~


