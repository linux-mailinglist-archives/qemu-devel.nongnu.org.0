Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00243673D05
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:05:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWSP-00008S-1d; Thu, 19 Jan 2023 10:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWRu-0008Q8-VN
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:03:31 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWRs-0004ls-Rq
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:03:30 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so3753208wml.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 07:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lBDoFI8FYwlkYYzSU7mZ2RY/A3qWfANqmeVuCfFW4L8=;
 b=uUxdk2SWMI4mTZKBTR8sGPpkm4hNfsq+49jYz0ZxNHB2FnNfDjg7/I1tT7GTm+Irm8
 nVHsktsdAA7pceAjhvuU+iQ9hlAVyi0w4hLiXs6yGu/Wj9bv07uXxtiBZSB6wNE0VuFw
 Ta4BShbO06Qyw6fDmcsYbLhZnzfqn88H5ili7rFfRvxmAKPjuiQCfE26665lc8QYyXbP
 LAq2FDa3llFFI2b6Y0wxrUWsDv3MPiwja3WrEKbUxmrKpkCyBdsgPkZLIIDaBiPjtIh0
 femIsTqeps8J5KizezDKe51kTRwoZxn/mcRvC7qRmIjDceSWo5+ESOxhuriQRP81Nuw8
 ZtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lBDoFI8FYwlkYYzSU7mZ2RY/A3qWfANqmeVuCfFW4L8=;
 b=OB8qcx1GU16ApqQZJDSyq8RP0LA3yW9YLB65anHYBwJUUbRNS/2EkARxHHEN/EhdCO
 BdfLoP/5XJjpeH16KnDliHl/0RfuzyHe5oGoBV3RMOLUGNef7evAVombS69rPUSHyEHg
 /faNk0YcUAoDURJVSvuiXpBOQLK1x/rOG3eKJAZnm4YKRT58Bv3bUWAdawN6IzU/yci8
 3QXxITghsfrqeyT//SwujZSSuqD37SL/lKIjKc/xriPoDZpo8eeCSAieXce0TdfhIuJt
 aSVsyZS8R8ZV9YqIIH7iToska0A8qNSuEtI0oKuquM8CO7nDDzs1OODy88mSXxdVtrXT
 84yQ==
X-Gm-Message-State: AFqh2komHZGRVKRrCITIwwHPilaJUzsxhdhjGIj34CQppbqfbjbqZFPi
 66KchDazE0q06uxKg3C9nBv6FQ==
X-Google-Smtp-Source: AMrXdXsAwQG/iziQmFz5jk/zJWOvXZlYwOplhy5FeV5bhAYoj7fsJ+znIRcaswG/pdYVpeHgBmfNoQ==
X-Received: by 2002:a05:600c:4d98:b0:3d3:5c7d:a5f3 with SMTP id
 v24-20020a05600c4d9800b003d35c7da5f3mr19120968wmp.37.1674140605624; 
 Thu, 19 Jan 2023 07:03:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003daf6e3bc2fsm7021628wmq.1.2023.01.19.07.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 07:03:25 -0800 (PST)
Message-ID: <5760dc61-4ab1-eec8-4f54-d0bf750c66b7@linaro.org>
Date: Thu, 19 Jan 2023 16:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] travis.yml: Use the libfdt from the distro instead of the
 submodule
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230119135512.2040062-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119135512.2040062-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 19/1/23 14:55, Thomas Huth wrote:
> No need to compile-test third party submodules over and over again if
> we can simply use the pre-build library from the distribution instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .travis.yml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/.travis.yml b/.travis.yml
> index fb3baabca9..e24c99fdb9 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -128,6 +128,7 @@ jobs:
>             - libbrlapi-dev
>             - libcacard-dev
>             - libcap-ng-dev
> +          - libfdt-dev
>             - libgcrypt20-dev
>             - libgnutls28-dev
>             - libgtk-3-dev

Could we remove cloning the submodule in the 'enabled' case now?
See ./configure:

1518  case "$fdt" in
1519    auto | enabled | internal)
1520       # Simpler to always update submodule, even if not needed.
1521       git_submodules="${git_submodules} dtc"
1522       ;;
1523  esac

