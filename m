Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE4C3B76B9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:53:19 +0200 (CEST)
Received: from localhost ([::1]:44282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyGz8-0004dB-Ci
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyGxE-0000H4-Az
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:51:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyGx8-0002xb-0y
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624985472;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgjWLm/jvEJqHWV8JY9LYyOvsBrP8LCGHzCMTub6EdE=;
 b=eIkvLJ9OqA6o6GQbhvp7sKC8fNpTJG1Tmoj+iEDBa3F6/8QdWHnks990QSClyeNyvtbsQQ
 yPiUykqWNEYsknD3LeQ9zHY8UfjGDZRIT3YcAKotWg1vh+0iqe8elzpRerbLmp4ubEThRd
 cIF5ChylhYwk08i4cdEV0llwG/dGqMg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-YDRLGVj3P6qCrCXMav2-GA-1; Tue, 29 Jun 2021 12:51:11 -0400
X-MC-Unique: YDRLGVj3P6qCrCXMav2-GA-1
Received: by mail-pj1-f69.google.com with SMTP id
 n34-20020a17090a5aa5b029017068421287so1127868pji.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 09:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=MgjWLm/jvEJqHWV8JY9LYyOvsBrP8LCGHzCMTub6EdE=;
 b=oJDiNbhsFyleS917XTBnlm/baWoFxMWqeHthAE1wiuH6I2v6xzt2EXunXGxF8oUF8B
 GzR9zzk3JULzqMePkKGwB+NoIVnL2DVIXM8nr5pBmPNF7MJP53xH0quByjPhNNzeNboO
 dzdlp4gnMUzF4yiH0cATgnC1Ze9qDt1Z286k1JkFGZ1dunfc68ZC9QmATDQu3VkoeH+K
 LJY3E9mljjaw6XjSMmxqWUlzUrZObyxtCCOTFclkr9qw1gNodoKp+Dv0R8qSWhMdxTTA
 pQZ1AoRG3FMkTHtCN7RdkZvZuGZeYoquuTZT48eeSguBwqfuVJHlGG1qEEzWfakxOgj3
 CnRA==
X-Gm-Message-State: AOAM533/cT/jKoUyPI9b6cBNJT1v4A7Odlur/x31lUIie3ar/9HU0HsB
 XjaCGhxDVwqdMQahu+pujI79k2uXdtoXCW+4z21A4/ciqw6Tq3vUVYEmUs0v2ccEgXr3jSacMuZ
 Sajvq5Pw2WlFkHnw=
X-Received: by 2002:a65:50c5:: with SMTP id s5mr29033017pgp.138.1624985470031; 
 Tue, 29 Jun 2021 09:51:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI27OdUsuAmjQuo9SyufgBoEzPDE7RIor0ZrGecG7fVzxol/K7VJkLigg/xA5BzEn4PP6Gsg==
X-Received: by 2002:a65:50c5:: with SMTP id s5mr29032996pgp.138.1624985469818; 
 Tue, 29 Jun 2021 09:51:09 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id x17sm12284933pfa.26.2021.06.29.09.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 09:51:09 -0700 (PDT)
Subject: Re: [PATCH v2 07/12] python: update help text for check-tox
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210629164253.1272763-1-jsnow@redhat.com>
 <20210629164253.1272763-8-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <94a1d206-190c-3605-513f-ee073928141f@redhat.com>
Date: Tue, 29 Jun 2021 13:51:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210629164253.1272763-8-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/29/21 1:42 PM, John Snow wrote:
> Move it up near the check-pipenv help text, and update it to suggest parity.
>
> (At the time I first added it, I wasn't sure if I would be keeping it,
> but I've come to appreciate it as it has actually helped uncover bugs I
> would not have noticed without it. It should stay.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   python/Makefile | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/python/Makefile b/python/Makefile
> index 07ad73ccd0..d2cfa6ad8f 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -9,13 +9,17 @@ help:
>   	@echo "    Requires: Python 3.6 and pipenv."
>   	@echo "    Hint (Fedora): 'sudo dnf install python3.6 pipenv'"
>   	@echo ""
> +	@echo "make check-tox:"
> +	@echo "    Run tests against multiple python versions."
> +	@echo "    These tests use the newest dependencies."
> +	@echo "    Requires: Python 3.6 - 3.10, and tox."
> +	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.10'"
> +	@echo ""
>   	@echo "make develop:    Install deps for 'make check', and"
>   	@echo "                 the qemu libs in editable/development mode."
>   	@echo ""
>   	@echo "make check:      run linters using the current environment."
>   	@echo ""
> -	@echo "make check-tox:  run linters using multiple python versions."
> -	@echo ""
>   	@echo "make pipenv"
>   	@echo "    Creates pipenv's virtual environment (.venv)"
>   	@echo ""


