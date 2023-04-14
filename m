Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B846E2680
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:10:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnL3w-0003nJ-Ht; Fri, 14 Apr 2023 11:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnL3q-0003mx-GG
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:10:02 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnL3o-0003vA-KN
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:10:01 -0400
Received: by mail-wm1-x330.google.com with SMTP id q5so10520379wmo.4
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681484998; x=1684076998;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GHSeTOEctIME3nc7oYkB74kDBk5G6JGnpPhpIjgKqtk=;
 b=ZdT7xidQeh0kgYoJ2BXqLeVGs/2YVR7B/LhZ1vT3jzdRsobJyGHKvkBIZL9y48oWUU
 nNbDrJZoImMcA4yUI2ry3880Fxtz6WfHhM4nvwb39sdu4d8ypbdpeFJp7ebrIbxFo4Kn
 6Nth5JKeTiL8DLI5NM4f4vgB9kEZhP5193YS2a4G0xCZJ4a7Fbg0w5nfnSb2Qg5B6fzh
 AISFy5gHSF3Ny4/tVIxDmoB1z7RD6N6LUrjAKFk50D9s/oM5HH9JTvQMYCnYXPnLc0mW
 msn2h8uhCZN8VIbBAn2qryddjayVlZUEgB7E1Lbg3d9zS3WD16ofaoRTm+e38vfnrcHG
 vhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681484998; x=1684076998;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GHSeTOEctIME3nc7oYkB74kDBk5G6JGnpPhpIjgKqtk=;
 b=RH3zJFhRpib4rDNfs9VftykugdvLDIv1blAX0bXgkVMasT3+ZYgWcIfHmATrJojvQP
 YH4ql0GyjOWSeOANQBxbKjynsf+MkhGy1Hzj4bNyn+kT4BhiMUN3OUi6PPzH6zqk2k5W
 rNs2ra/+SJ4/Q8lkQulw9O+XRZj3PyCFNm62s1hkxo8vC0ZORFOC/Lmx79qoBvhG8SEh
 Bs1oZsfpedrs/Ux3CUHXfoqk/XHIovh32smgIGMR1S2oOBuQMaKeqJ66Hvjn7lC2YQ0x
 UyY4k2HtXag8TADoa7vjNSiuC6HV6CWvFuZ358rFiSzdiVMyYHiJhlK9mfGVfNTbjtWI
 OH2g==
X-Gm-Message-State: AAQBX9eBGMc2tR/o0Tq+yUkPqwglTIGZbICCbYt6PntERz7IUuPeVPpI
 bO3MpB/PJz0KzJY/N0ZsK46khQ==
X-Google-Smtp-Source: AKy350bmjQ6Zs0SV62Vf5uqRCvW+wcgnudR27NYoaYgxh1b8OXSm+8SOw5leIp0ns1TaMDn1p6pN0g==
X-Received: by 2002:a7b:ca57:0:b0:3ed:4685:4618 with SMTP id
 m23-20020a7bca57000000b003ed46854618mr4778489wml.34.1681484998513; 
 Fri, 14 Apr 2023 08:09:58 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a056000120b00b002e45f6ffe63sm3745728wrx.26.2023.04.14.08.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:09:58 -0700 (PDT)
Message-ID: <7557f2d4-655a-7712-a7d3-ee661d50e838@linaro.org>
Date: Fri, 14 Apr 2023 17:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 24/40] igb: Fix igb_mac_reg_init alignment
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-25-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414113737.62803-25-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 14/4/23 13:37, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/igb_core.c | 96 +++++++++++++++++++++++------------------------
>   1 file changed, 48 insertions(+), 48 deletions(-)

"Fix igb_mac_reg_init() coding style alignment" to clarify
this isn't about data alignment.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


