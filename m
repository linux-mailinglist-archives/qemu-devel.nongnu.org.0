Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5D0525D57
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:29:37 +0200 (CEST)
Received: from localhost ([::1]:57176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQg4-0005ax-83
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQdA-0003UL-7e; Fri, 13 May 2022 04:26:36 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQd8-0001EU-Jc; Fri, 13 May 2022 04:26:35 -0400
Received: by mail-ej1-x62a.google.com with SMTP id kq17so14798543ejb.4;
 Fri, 13 May 2022 01:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1j7UtctPeT6txetHVG/ZXtXcL3l2uV4CWeJI43WkHy8=;
 b=T0vug4RCdzGR79bFeTRU47UFQE2B1Bj1gjHx90UXlF/hVQ9dz6hGPL/AuSVE2Y+URP
 qhO9vnaPFi0pUfGUqF+MdUwsa9n0nBN2xCErHWZ/tuaMcQGfUGd2F/v4nGPoIQggtzgp
 EeXKkp8n8l0OtWy9oQkBDRQu04O3v18A0W2H4xUAgjqdfdDnFXqWztXn2So39DI8mYmT
 GT1mgAh1GcDnCdzj0WP73M1Mmtl73+7Q/eYDsk5bTHEUNI4h9tXu7ivECr5t7HSejKpq
 YikDQVVAilhyG4Pu0aLarVUMcqFHfNrU/XGkrWwA7FxX3H7Ppob/XII+svbUGCAk/++S
 RTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1j7UtctPeT6txetHVG/ZXtXcL3l2uV4CWeJI43WkHy8=;
 b=tZ+XE/pcSSXCpaARuBSJcM3tHx23z4EImCccuqVjlXnpIXh5GvvEdU3V1woFibG5DH
 GuC9uV6rU4XFMSuyOM5PiCGlqkhUlS/pvj04nyuKkSOGbtXonFuSC5oHr21c63Y/BWfu
 jNsrQNWFN6JZNN/+bhwqK9WDjvcUb96up6Nkm2/DtJuADjgsjwBC8ScA9+4nuIvAqdQT
 fOvPCOljuYV119o0/6phVP+150EtYl63qbBnX6QaXrcVlc577jU2SMkSVzGWJHfjr+No
 5hYBhy1mEdBCuScyqN/juDhHupsOUpDfvkYpa3lbh0pUwygpyp+kAMUPunR1BhChTSDc
 KetA==
X-Gm-Message-State: AOAM530TPcG7S/aqDJBWYzf5trShZZuWPP0rm8IOKY6t1SmxS4OPdVJI
 8NY2YqGn3WsMs76DC4C/rlg=
X-Google-Smtp-Source: ABdhPJwM2+hD6laN9H/En4PG9TJOxBqNEhtLR4BtsbUPo52KfnP5EiK8gjgmATKPd5G0qw9kC0jHSA==
X-Received: by 2002:a17:906:99c4:b0:6f4:56d2:4bbd with SMTP id
 s4-20020a17090699c400b006f456d24bbdmr3305462ejn.754.1652430392901; 
 Fri, 13 May 2022 01:26:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 l17-20020aa7c3d1000000b0042a41ad4688sm641143edr.65.2022.05.13.01.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:26:32 -0700 (PDT)
Message-ID: <e4cf4ded-6b04-ac69-e883-f6aa87a8f8fb@redhat.com>
Date: Fri, 13 May 2022 10:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 3/9] tests: install "qemu" namespace package into venv
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-4-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220513000609.197906-4-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/22 02:06, John Snow wrote:
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index a21b59b4439..0ba561b6bdf 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -1,5 +1,6 @@
>   # Add Python module requirements, one per line, to be installed
>   # in the tests/venv Python virtual environment. For more info,
>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
> +# Note that qemu.git/python/ is always implicitly installed.
>   avocado-framework==88.1
>   pycdlib==1.11.0

Any reason not to put ./python here?  But anyway,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

