Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B4E534F9B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:49:28 +0200 (CEST)
Received: from localhost ([::1]:44172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCvf-00060P-LA
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCPL-0004q7-3r
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:16:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCPJ-0000v0-Fc
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653567360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRRNfcYPpJ4SxYl3sYEYT8Q9Ta6FJDh7X3HpffVcjAQ=;
 b=PGu5LNko0A42eH+gT+gQNQdjawCOt/+k3bJgTaP274qoMne5KLOV1z0j94gSzlrrUTncqo
 RU+DkrWI20gZT+H7BZ8ciQaSDJk8ZTqaMIb4u8ZtcCmHrtddSiK/I+KvJWkBKKLMZQikZF
 cAM0HwnoKJTT9igKaRNsRR8xQqP+YXg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-OwmK3VRNMhuTkNgYqW4jsg-1; Thu, 26 May 2022 08:15:58 -0400
X-MC-Unique: OwmK3VRNMhuTkNgYqW4jsg-1
Received: by mail-ej1-f70.google.com with SMTP id
 sd17-20020a170906ce3100b006ff12a1b982so737895ejb.13
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PRRNfcYPpJ4SxYl3sYEYT8Q9Ta6FJDh7X3HpffVcjAQ=;
 b=Zs2NuZSNBMChIuWPCFXqRDlPWq0CU0nCVMejSyJOunX8NDLRhoH4/hpHxX+lHsPg0j
 HarsCiAGzd0RpdCELVVv3nEntVZoQCqQ7Q1HZZznuSlIgEdxqMqxrhL/2ody5DwjtRiL
 65S8lIWLnIg3ueoxPKGqqKF8C7N7AMx/v2BeGHgnsoojXRZVxJCEhsMomXeHqUjUnQ8E
 wF60CUU5TUPcO9LtLMEWUK5FUqU7b/9YMDqamVJC31692Yo2FD7z4HsDHHet9qR6Ct3U
 tCiXfREUKUsuJ8elQ8oa1uAcyaGzc9CFHBq1iYzfx1jDyoWLW/Q4Y1/UFH0PGQ8/r7hF
 Oljw==
X-Gm-Message-State: AOAM533H8AY/Boo6AdjH2albyoFl4wGh5yA6i5MzLCFLF/gSoblHwZJ0
 2YnDBYsfKZBdbIwBnLN5EIu/xBVYufngjUSl8aufJdpNA3eY8nZnCYTQRs47xNW4qitJSlxg5xI
 qBdvkU6w8ccddsug=
X-Received: by 2002:a17:907:10ce:b0:6fe:c527:1f83 with SMTP id
 rv14-20020a17090710ce00b006fec5271f83mr20739364ejb.135.1653567357671; 
 Thu, 26 May 2022 05:15:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXbd3r4Md484QYBi8wUzVs3ZjdjYkACzUpRsJziJ4FEFaDN3nyt1t+eZqvKZmU2nSP7RLDSw==
X-Received: by 2002:a17:907:10ce:b0:6fe:c527:1f83 with SMTP id
 rv14-20020a17090710ce00b006fec5271f83mr20739349ejb.135.1653567357460; 
 Thu, 26 May 2022 05:15:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 l12-20020a1709060e0c00b006feb479fcb4sm476440eji.44.2022.05.26.05.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 05:15:56 -0700 (PDT)
Message-ID: <fe05defa-4820-489c-200e-36fc0a3f69f6@redhat.com>
Date: Thu, 26 May 2022 14:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 5/9] tests: add quiet-venv-pip macro
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-6-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220526000921.1581503-6-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/26/22 02:09, John Snow wrote:
> Factor out the "test venv pip" macro; rewrite the "check-venv" rule to
> be a little more compact. Replace the "PIP" pseudo-command output with
> "VENVPIP" to make it 1% more clear that we are talking about using pip
> to install something into a venv.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/Makefile.include | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 839ffde876a..052d7f56e9a 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -104,13 +104,13 @@ else
>   	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
>   endif
>   
> +quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
> +    $(TESTS_PYTHON) -m pip -q --disable-pip-version-check $1, \
> +    "VENVPIP","$1")
> +
>   $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
> -	$(call quiet-command, \
> -            $(PYTHON) -m venv $@, \
> -            VENV, $@)
> -	$(call quiet-command, \
> -            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check install \
> -            -r $(TESTS_VENV_REQ), PIP, $(TESTS_VENV_REQ))
> +	$(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
> +	$(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
>   	$(call quiet-command, touch $@)
>   
>   $(TESTS_RESULTS_DIR):

Sooner or later I'd like quiet-command to be changed to English 
descriptions like the ones currently emitted during the ninja build, but 
stuff for later.

Paolo


