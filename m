Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934FE613162
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 08:54:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opPba-0002Vn-Fk; Mon, 31 Oct 2022 03:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1opPbY-0002Ts-8J
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 03:53:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1opPbW-0003Pj-EG
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 03:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667202784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mDBJNDctqDtXOkS8lJdC/VmA1ta+O/W6/ZLEGeRLU8U=;
 b=YBeN/t82nwoWmQuSl95SmhuaPCtUZ734indbz/mz8o9/+Cpztbwb5a9gXc9a4JWUVuZCL0
 27O+Jt3AcnojrKNTSDiKbydFJzQ2UJJ9bPIF6WwRloN/ApAcEB0YnnNwSkFXTtm55BhfTV
 RQaznUzJsrWokGoHrWXdny29yHlhWrQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-Zd63osGNMROuSod_8vWMrA-1; Mon, 31 Oct 2022 03:53:03 -0400
X-MC-Unique: Zd63osGNMROuSod_8vWMrA-1
Received: by mail-qv1-f69.google.com with SMTP id
 nn2-20020a056214358200b004bb7bc3dfdcso5451930qvb.23
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 00:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mDBJNDctqDtXOkS8lJdC/VmA1ta+O/W6/ZLEGeRLU8U=;
 b=uYWKcok5kCwluSsKFlE63emA3Fi7QZr7+Y5hKvpTtLBe1sf0znZAC63TNyJ+QSSt9f
 7o/fs1dSY92ZZvEPE28SrpkFOYnj+hud9Ydd1/bDCMdrxNefjy0ZP4Ualwr8XQzn7pRG
 gyINtnmTeU72SFo5Q9n75kZ7wXg/u8ii4+H1rq0cIGt3VlVKMzSNBrSih86QCwICbuHQ
 VRSAXGGtiqRWHIflC1j5luW7zSGJn/CDvnp9gIXPC7PAwp758uUe8iO7L+PVi0pG24fR
 P2zhaGOrl9FueC4NOIhktS/9Kn3A6JTsh4es4zIZGEwYH4XkOKvQyL7TwdjNVBQZymOS
 NsZw==
X-Gm-Message-State: ACrzQf3/YtXyILVog3rVB8GmDP4cZaffqzG2ccT/Gnd4SAkCz/rpfFVF
 selwM5izM50gOdg152UZY49Xf2pXxXe/XMIfITGJrBTTQcRp3nqR0Mjj05+3//iZ7P3TH1ybULo
 hTLQMqWWRwvRYqcU=
X-Received: by 2002:a05:622a:4d44:b0:3a5:2c05:9e12 with SMTP id
 fe4-20020a05622a4d4400b003a52c059e12mr491928qtb.481.1667202782707; 
 Mon, 31 Oct 2022 00:53:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7kt9XHVgbgmaugzeEu4vN5tbsid2frA8qTc8OhcEBcJpwJZixn4D4qb/7jnSQfZk7BHbMz1w==
X-Received: by 2002:a05:622a:4d44:b0:3a5:2c05:9e12 with SMTP id
 fe4-20020a05622a4d4400b003a52c059e12mr491924qtb.481.1667202782467; 
 Mon, 31 Oct 2022 00:53:02 -0700 (PDT)
Received: from [192.168.8.104] (tmo-097-47.customers.d1-online.com.
 [80.187.97.47]) by smtp.gmail.com with ESMTPSA id
 dt9-20020a05620a478900b006cf3592cc20sm4268697qkb.55.2022.10.31.00.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 00:53:01 -0700 (PDT)
Message-ID: <280c2059-1b1f-85db-eca0-71e5e5800b21@redhat.com>
Date: Mon, 31 Oct 2022 08:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] Add new build target 'check-spelling'
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20221031074317.377366-1-sw@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221031074317.377366-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/2022 08.43, Stefan Weil wrote:
> `make check-spelling` can now be used to get a list of spelling errors.
> It uses the latest version of codespell, a spell checker implemented in Python.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> This RFC can already be used for manual tests, but still reports false
> positives, mostly because some variable names are interpreted as words.
> These words can either be ignored in the check, or in some cases the code
> might be changed to use different variable names.
> 
> The check currently only skips a few directories and files, so for example
> checked out submodules are also checked.
> 
> The rule can be extended to allow user provided ignore and skip lists,
> for example by introducing Makefile variables CODESPELL_SKIP=userfile
> or CODESPELL_IGNORE=userfile. A limited check could be implemented by
> providing a base directory CODESPELL_START=basedirectory, for example
> CODESPELL_START=docs.
> 
> Regards,
> Stefan
> 
>   tests/Makefile.include       | 10 ++++++++++
>   tests/codespell/README.rst   | 18 ++++++++++++++++++
>   tests/codespell/exclude-file |  3 +++
>   tests/codespell/ignore-words | 19 +++++++++++++++++++
>   tests/requirements.txt       |  1 +
>   5 files changed, 51 insertions(+)
>   create mode 100644 tests/codespell/README.rst
>   create mode 100644 tests/codespell/exclude-file
>   create mode 100644 tests/codespell/ignore-words
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 9422ddaece..b9daeda932 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -155,6 +155,16 @@ check-acceptance-deprecated-warning:
>   
>   check-acceptance: check-acceptance-deprecated-warning | check-avocado
>   
> +.PHONY: check-spelling
> +CODESPELL_DIR=tests/codespell
> +check-spelling: check-venv
> +	source $(TESTS_VENV_DIR)/bin/activate && \
> +	cd "$(SRC_PATH)" && \
> +	codespell -s . \
> +	  --exclude-file=$(CODESPELL_DIR)/exclude-file \
> +	  --ignore-words=$(CODESPELL_DIR)/ignore-words \
> +	  --skip="./.git,./bin,./build,./linux-headers,*.patch,nohup.out"

I like the idea, but I think it's unlikely that we can make this work for 
the whole source tree any time soon. So maybe it makes more sense to start 
with some few directories first (e.g. docs/ ) and then the maintainers can 
opt-in by cleaning up their directories first and then by adding their 
directories to this target here?

  Thomas


