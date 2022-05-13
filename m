Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6E8525D5B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:32:22 +0200 (CEST)
Received: from localhost ([::1]:59670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQij-0007I4-67
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQdu-0003o7-Cu; Fri, 13 May 2022 04:27:22 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQds-0001OI-P4; Fri, 13 May 2022 04:27:22 -0400
Received: by mail-ed1-x52d.google.com with SMTP id p18so9067136edr.7;
 Fri, 13 May 2022 01:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uR3cf+t2opMKGYOBqdlrWkD43j+hup8m8E6xlBsh5OI=;
 b=BNCOrr5zX+x1FjLvtmC5ZG5uPawJ1MW5mXIN1l+q+/hkHpED+oO7Y7YI60PIRJPxLS
 kOHjtTYYjXJ8txiYncqeTQuYJ+snhdO2d/n3wNQ5TMCs3y968LjD9xDvdWuHylFL3a7E
 DszWJ+CLwe2j/owf1RmgXNCBSjD2VOffIEHRnyPIkF3ukGOed9bb/zS/NwP9QJAhWArR
 lIzGCxL0jcOXcFrclY5dIci2zdc7S4dDhQZNkaSS8+mO6OTCTM5K6mQq6hgtArOETlpM
 fzpmrcreX92NvrUqzJ8OGU3r5pTK+IPXo0qJUcq6KYqEKbqL2W6Ww1999KJfI7o6ig8U
 yIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uR3cf+t2opMKGYOBqdlrWkD43j+hup8m8E6xlBsh5OI=;
 b=iXpDscF8SA4L0uLMUKmGlvAUp+0mlW+hAHSARPtaOs7uF2ZjQKeIghHnodVKAK6L3b
 gDMa5tjuyb4pjctXCNhAMbLACup81oylI7PmE26o0qE5dUrOXpdTL43EfUNxQcc51FAD
 dq7nJ/lIMUGyixykWB3z7/f1I0Gk1CZEbMmNdLNYbE3XnLa4BaJc8tgBj1rihAcpnfkX
 WN9FiLSelEEhXHBMdFFb3wmQGjhFRAnJy+y0BaLeB3tySc1MthwXDgqSCi2+Inj0K4Dz
 5iGf50DUkyhivn+Np/9vnmJdySieZOH42BpX9Rfn2+59JsZaO/HhKNd/ju6Nb73slgva
 RhBg==
X-Gm-Message-State: AOAM532cDjNxAjCeakWGYD0u6cM5QPLPmzDRWbMW6/6/ps20YZoqseob
 tUWmhE/V7O2KpO66cIaO9EA=
X-Google-Smtp-Source: ABdhPJyAd2IbErQDZnMcrj/h0217kYH7oNMxsLV86AhFyUlZCNT5Qy2mw1j1f5lVbDInHrqC+DYF2Q==
X-Received: by 2002:a05:6402:4256:b0:428:39:c6c7 with SMTP id
 g22-20020a056402425600b004280039c6c7mr38086492edb.374.1652430439044; 
 Fri, 13 May 2022 01:27:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 c25-20020a1709063f1900b006f3ef214e42sm513094ejj.168.2022.05.13.01.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:27:18 -0700 (PDT)
Message-ID: <1cf29802-0962-0b81-63c7-929641f593d4@redhat.com>
Date: Fri, 13 May 2022 10:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 4/9] tests: silence pip upgrade warnings during venv
 creation
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
 <20220513000609.197906-5-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220513000609.197906-5-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index dbbf1ba535b..dfb678d379f 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -109,11 +109,11 @@ $(TESTS_VENV_DIR): $(TESTS_VENV_REQ) $(SRC_PATH)/python/setup.cfg
>              $(PYTHON) -m venv $@, \
>              VENV, $@)
>  	$(call quiet-command, \
> -            $(TESTS_PYTHON) -m pip -q install \
> +            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check install \
>              -e "$(SRC_PATH)/python/", PIP, "$(SRC_PATH)/python/")
>  	$(call quiet-command, \
> -            $(TESTS_PYTHON) -m pip -q install -r $(TESTS_VENV_REQ), \
> -            PIP, $(TESTS_VENV_REQ))
> +            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check install \
> +            -r $(TESTS_VENV_REQ), PIP, $(TESTS_VENV_REQ))
>  	$(call quiet-command, touch $@)

Really nitpicking but I would have placed this change before adding the 
second invocation of pip. :)

Paolo

