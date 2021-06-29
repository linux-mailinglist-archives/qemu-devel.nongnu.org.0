Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D673B76C5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:59:50 +0200 (CEST)
Received: from localhost ([::1]:59870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyH5R-0006yS-Rb
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyGzY-0006q7-Qt
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:53:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyGzT-0004Z6-E0
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624985618;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e8rqfxMHYxvvLfNojbYyo3iWnkHcqQX8OVHRD3jiaJI=;
 b=QQV7nbvMqwDCR8Rs2Y150B/meHTMQrLwfWa0R/fsjRT1T+a22/sXUzWDM21ouyLISmn4sU
 6nPZgMw5WgX/jglOebyhSGRa8NDM6vDHuAjCvl8ZPFzzayYc2uQLSlq4VONWSRxOFFg1Mq
 jFgaoyw4X3nj+ieULaqc3Lm+QitagvM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-YXsNbemDMoiEGgT3BMgung-1; Tue, 29 Jun 2021 12:53:37 -0400
X-MC-Unique: YXsNbemDMoiEGgT3BMgung-1
Received: by mail-pf1-f200.google.com with SMTP id
 o11-20020a62f90b0000b02902db3045f898so11772339pfh.23
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 09:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=e8rqfxMHYxvvLfNojbYyo3iWnkHcqQX8OVHRD3jiaJI=;
 b=eHophUyMTeBLUJBALdISBnTo8kWdr0LAozkBBuT3WJ1kv/atLEFQs1hTxxxY0coGhC
 XQ7wlQPWAzfryt+r4Fi+P+IDDZZnz9aAwhYN7DboEU0zpIGn5HIWJW4vUVfBsfB9y49O
 xD+lKrK31ZcxDrF8ovO2zl1vjNjMZ0F+3yVts1vbEjgOSK//FbdMCLqF37SYd/uDLQpr
 9pQJx2L68Hff5IvIYJbf7zUj89EhwS0E2Qx6GYvR5xGzB0kbTbU20h8tVyjWlxeBRluZ
 I98QpQV4N+TyljeUc757aQdfaJ/i3IECKtdolTYgrKpqF3Eb9DU68bboU/nFllrQeaCx
 M+gw==
X-Gm-Message-State: AOAM530zrS9iHarq/ngJaZBLN31m++/vf5nj+6zz5+bA9KR5Zw3qZgC0
 HOkrcNLThZ4rdyXy5I/NaPpZe2kIQF1xfeZS+m6IE2KpZ8NygXGVsGgL63ysbPpEWeJLGnJWkbh
 vppZtVpdzWfhIu5s=
X-Received: by 2002:a65:6243:: with SMTP id q3mr29595767pgv.297.1624985616139; 
 Tue, 29 Jun 2021 09:53:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9Ot+HuhAHjWk5C4DOX9Umv8C2vl8JfPMgBBlodG1q7/spGN70dBcYo7EbrNTXLSABSKA1Dg==
X-Received: by 2002:a65:6243:: with SMTP id q3mr29595743pgv.297.1624985615796; 
 Tue, 29 Jun 2021 09:53:35 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id lt14sm19286267pjb.47.2021.06.29.09.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 09:53:35 -0700 (PDT)
Subject: Re: [PATCH v2 08/12] python: Fix .PHONY Make specifiers
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210629164253.1272763-1-jsnow@redhat.com>
 <20210629164253.1272763-9-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <fc0a7a03-8893-5083-4929-2d493f2bd629@redhat.com>
Date: Tue, 29 Jun 2021 13:53:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210629164253.1272763-9-jsnow@redhat.com>
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
> I missed the 'check-tox' target. Add that, but split the large .PHONY
> specifier at the top into its component pieces and move them near the
> targets they describe so that they're much harder to forget to update.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/Makefile | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

I didn't know .PHONY could be split. Nice!

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/python/Makefile b/python/Makefile
> index d2cfa6ad8f..d34c4e35d9 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -1,5 +1,4 @@
> -.PHONY: help pipenv check-pipenv check clean distclean develop
> -
> +.PHONY: help
>   help:
>   	@echo "python packaging help:"
>   	@echo ""
> @@ -29,25 +28,32 @@ help:
>   	@echo "                 built distribution files, and everything"
>   	@echo "                 from 'make clean'."
>   
> +.PHONY: pipenv
>   pipenv: .venv
>   .venv: Pipfile.lock
>   	@PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev --keep-outdated
>   	@touch .venv
>   
> +.PHONY: check-pipenv
>   check-pipenv: pipenv
>   	@pipenv run make check
>   
> +.PHONY: develop
>   develop:
>   	pip3 install -e .[devel]
>   
> +.PHONY: check
>   check:
>   	@avocado --config avocado.cfg run tests/
>   
> +.PHONY: check-tox
>   check-tox:
>   	@tox
>   
> +.PHONY: clean
>   clean:
>   	python3 setup.py clean --all
>   
> +.PHONY: distclean
>   distclean: clean
>   	rm -rf qemu.egg-info/ .venv/ .tox/ dist/


