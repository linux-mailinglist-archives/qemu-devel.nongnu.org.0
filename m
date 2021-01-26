Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF23042ED
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:50:06 +0100 (CET)
Received: from localhost ([::1]:35852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4QbV-0002oT-Aa
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4QaW-0002Jv-FQ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:49:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4QaU-0002Z1-FZ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611676141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wl8Uncx9KizL5XnoS6L2UFlJWhZHJYNQh4doKf09Dxg=;
 b=BkXnHZNu9ZLbBMQ626SOcCiUOnc7pthbyINpBQ75hEafJcKWQkhFJfgkBNfkfTAHWCfPH9
 VZUMF++0XMRkkN/ZO9L/1cTARYTs5CHnYt1H9v+iKi8GKeM0ll9dwZa3ZdknwD+9EG0Nyb
 xI4rHH2msXqedibTaowGYJfzZpYUZds=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-uXw0SCNkPYC1EpOYijTnTg-1; Tue, 26 Jan 2021 10:49:00 -0500
X-MC-Unique: uXw0SCNkPYC1EpOYijTnTg-1
Received: by mail-ej1-f72.google.com with SMTP id j14so5083497eja.15
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wl8Uncx9KizL5XnoS6L2UFlJWhZHJYNQh4doKf09Dxg=;
 b=AlF47p+5uOU11c9yflrvY8IgrrqJSKAb4i5v48LYE1+WAeolRbWdBw4rdoyRVzsMzI
 BroJ6DbPWmkSF6yGezLrqcAN6dOKUKxJ61sMepP+4kiftRgoL2OQO9O59brIwI/HJw7H
 28BHMnS8QRwtwl6Rz55kXx74e9RQgyatFoPfx0pcpoQVvig8o7WhkIEKeLv3ILDZdXgV
 pZmH9LSH8mFo+uJitTO2IpBEvOQxJegUqNghGj/xMFjCCQfZpCsqWuB2UI5T6mIDm4zI
 nLLEyRmHyNQXmN4WI+s/Acq2injzBItMN7SaF748nWncKvDE78cEiNEkduZBbCcGZKGO
 aKog==
X-Gm-Message-State: AOAM532qZBuFJ56qOiOQdR1Q+fpSuyY1VsssCCGQ19snGm0cgTeEorYS
 Ps0WZAbde3lkyGOZavmvDqmbhpzbYFlaa7nD+Dl8ZD4A4AFi+I9CthdnsNivrtWA3FInzNzJFGs
 lNUDjpmLceubcz30=
X-Received: by 2002:aa7:d5d5:: with SMTP id d21mr5153439eds.252.1611676138560; 
 Tue, 26 Jan 2021 07:48:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyd7UIu89fuHsNS5qdcVXVBrrXom2DrRuJ2PeDm+4hR+j+8lqg4UxToejD4wyLgj9H3XM4Lw==
X-Received: by 2002:aa7:d5d5:: with SMTP id d21mr5153429eds.252.1611676138425; 
 Tue, 26 Jan 2021 07:48:58 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q2sm12687707edn.91.2021.01.26.07.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 07:48:57 -0800 (PST)
Subject: Re: [PATCH v1 2/2] tests/Makefile.include: don't use TARGET_DIRS for
 check-tcg
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210126145356.7860-1-alex.bennee@linaro.org>
 <20210126145356.7860-3-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <df6781f3-ac61-daab-1161-4a0bd2e1069d@redhat.com>
Date: Tue, 26 Jan 2021 16:48:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126145356.7860-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/21 15:53, Alex Bennée wrote:
> TARGET_DIRS reflects what we wanted to configure which in the normal
> case is all our targets. However once meson has pared-down our target
> list due to missing features we need to check the final list of
> ninja-targets. This prevents check-tcg barfing on a --disable-tcg
> build.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   Makefile               | 3 +++
>   tests/Makefile.include | 7 +++----
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a380bbfa12..a25b2a5431 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -174,6 +174,9 @@ ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
>   endif
>   endif
>   
> +# Build up our target list from the filtered list of ninja targets
> +TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))

I wouldn't mind having this directly in tests/Makefile.include, if you 
don't expect any other uses.

Apart from this nit, series

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

>   # Force configure to re-run if the API symbols are updated
>   ifeq ($(CONFIG_PLUGIN),y)
>   config-host.mak: $(SRC_PATH)/plugins/qemu-plugins.symbols
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 3ce8b03f34..ee438f8d6d 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -41,10 +41,9 @@ SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
>   SPEED = quick
>   
>   # Per guest TCG tests
> -
> -BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGET_DIRS))
> -CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGET_DIRS))
> -RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGET_DIRS))
> +BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGETS))
> +CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGETS))
> +RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGETS))
>   
>   # Probe for the Docker Builds needed for each build
>   $(foreach PROBE_TARGET,$(TARGET_DIRS), 				\
> 


