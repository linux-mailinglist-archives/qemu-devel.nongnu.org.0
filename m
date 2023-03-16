Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D1C6BCF06
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:08:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmPA-0007h5-Ai; Thu, 16 Mar 2023 08:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcmP8-0007fy-0m
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:08:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcmP5-0003Gq-QQ
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678968498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1MyRpqu/xXm6Eb84sakJXzvy8GcchjfmR1Y4ZbgH668=;
 b=Yxloj5Ko3Ye6q3NtWjyTZBAU+btR1vv9CVUQwwnqPrDFDSc/IeOTfmBJ06Afr15K3aO8Uq
 CufOv/1rlW/YsuiQySfNGD/XRyjWQf3srcym8kF2uJ+M5JiMAqV/HBNJAh4UFUmw76kMp5
 uoCyiMQSgUmQ/IsGE/kamh4YZ4wXR50=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-mO9g0Zx8PJuS49ooc2c81A-1; Thu, 16 Mar 2023 08:08:17 -0400
X-MC-Unique: mO9g0Zx8PJuS49ooc2c81A-1
Received: by mail-ed1-f69.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so2736177edb.21
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 05:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678968496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1MyRpqu/xXm6Eb84sakJXzvy8GcchjfmR1Y4ZbgH668=;
 b=MgSDN8Ub5b8hU/KQ4CGpS9FPCFk99PRXrWbu1EeEynxCJEz40+Qrd9N0XBDYd+8jeK
 llOwtDc4bRqOY3RxgCcCUvOn+7TEq9tdrpliNPqrdp11J3NY5CIF5KveTFkc9uzhXCG5
 tXaZRqiHTpxru7rfccMZN4g6azWRAW7ouH7cU585d/rjmRryYy6O4YTQ6jNGDyZ5dosi
 HUeNG0gb/PUuj7ZeZzEexG/UrZdnGS8qiZugqPrbwQXQ2/NtkpXr4Eynq/V97/wqxe12
 l1Y2Bv9e9oHODOyXcbbS6Ni9j9kB+okxFEt+D1XTcX8L1X125LB9cqOvBEiYy1bAaE8B
 1j/w==
X-Gm-Message-State: AO0yUKU7tTPWadAsj2UhiYIi89v+lCly0cHN5so3ntJtYhU8nqxQfeI0
 Z9lMMZwNy4zBHSTMBM7hLajJJ5S1FzAaKyZubO0jHbMVDpLkQzaB9oB6oAzfMtbmWyibeT+6vha
 kXtlYcXEA7PAzu/w=
X-Received: by 2002:a17:906:6b98:b0:8f6:ad32:cd51 with SMTP id
 l24-20020a1709066b9800b008f6ad32cd51mr10667115ejr.62.1678968496532; 
 Thu, 16 Mar 2023 05:08:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set8rivAyBncG81DkhUr356SITBvf3CcUgrvRpo5jn4ly107zTtwB0Gb4putQEoGDMjrHy9jlEw==
X-Received: by 2002:a17:906:6b98:b0:8f6:ad32:cd51 with SMTP id
 l24-20020a1709066b9800b008f6ad32cd51mr10667076ejr.62.1678968496198; 
 Thu, 16 Mar 2023 05:08:16 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-151.web.vodafone.de.
 [109.43.176.151]) by smtp.gmail.com with ESMTPSA id
 oy12-20020a170907104c00b00931024e96c5sm217748ejb.99.2023.03.16.05.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 05:08:15 -0700 (PDT)
Message-ID: <d755da2b-edd9-8337-1975-548c961fbe88@redhat.com>
Date: Thu, 16 Mar 2023 13:08:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] docs/sphinx/kerneldoc.py: Honour --enable-werror
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230314114431.1096972-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230314114431.1096972-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 14/03/2023 12.44, Peter Maydell wrote:
> Currently, the kerneldoc Sphinx plugin doesn't honour the
> --enable-werror configure option, so its warnings are never fatal.
> This is because although we do pass sphinx-build the -W switch, the
> warnings from kerneldoc are produced by the scripts/kernel-doc script
> directly and don't go through Sphinx's "emit a warning" function.
> 
> When --enable-werror is in effect, pass sphinx-build an extra
> argument -Dkerneldoc_werror=1.  The kerneldoc plugin can then use
> this to determine whether it should be passing the kernel-doc script
> -Werror.
> 
> We do this because there is no documented mechanism for
> a Sphinx plugin to determine whether sphinx-build was
> passed -W or not; if one is provided then we can switch to
> that at a later date:
> https://github.com/sphinx-doc/sphinx/issues/11239
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB: we need to land the fix for the current outstanding
> warning before this one can go in...
> https://lore.kernel.org/qemu-devel/20230310103123.2118519-11-alex.bennee@linaro.org/
> ---
>   docs/meson.build         | 2 +-
>   docs/sphinx/kerneldoc.py | 5 +++++
>   2 files changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


