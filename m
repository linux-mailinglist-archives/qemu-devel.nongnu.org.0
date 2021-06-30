Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808073B8599
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 16:59:09 +0200 (CEST)
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybgC-0003pX-09
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 10:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lybep-00037K-JC
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:57:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lybej-0007JH-4P
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625065054;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wuVGgvQW1pGxOUxKQ6fo2ga1YH5vtLvDpXFonWV6y6U=;
 b=PTN5WRy5gwgInLs7tc1ZyKVTWxM37CHseJkkSs6I6kdo28/S1u7TqKqbDQtLHb9Zv1rX5K
 FuAri3KpI1OlzY6PF0Fjjsk/JtsxsMyT4f+yaeqDS6/NmPsL0+JxjyMJ+nfpQENFs33+85
 xj+y8I6fYn71Y6eRZhMV9aNuSrq6fPA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-ZHVwAqHvNxeuptCx6w1g3g-1; Wed, 30 Jun 2021 10:57:33 -0400
X-MC-Unique: ZHVwAqHvNxeuptCx6w1g3g-1
Received: by mail-pl1-f199.google.com with SMTP id
 c24-20020a1709028498b0290128cdfbb2f1so1271032plo.14
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 07:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=wuVGgvQW1pGxOUxKQ6fo2ga1YH5vtLvDpXFonWV6y6U=;
 b=iI4oF5YEWAEalccg0eQv5nzN2KWRSuE1/fKsJody298dOVtyTVlB/X/Hf6fdySeCM5
 uDQirY24R+mN0Wu1G+caRDMorY5RVr2MK7w/X8OXKIntGHRPYM7WvB8ufCFkZSpTgT75
 d02XwM7dmUjHqNLNeGxuHbj17U8skpBfDEU35PwtxkiBxgZjkewEWG3kDiPvkbmQAWv6
 KAXiIfi6rumj0EwFJdRKDP/bJUfAHkugsECg/MSsv7/43mJtDFbDHi4DmihghMM0zENw
 OreqlLYfrEJESE5HXSzBY4BNXNf+TilXawQZoC40TKBE/rcHqKZAYPt0d3p2BraCc+x2
 Ibrw==
X-Gm-Message-State: AOAM533duijmdtIeQszb/Qga9yNL9J1VwtwFG1+/CcIYoMbW4QehL+Wq
 CSYiZcb6MRKASr+o4hGVLe4m/jMP3DGXazxHsj7gzClYEYbfn1p9Jiln6m20HP6gCZhmvZeYodA
 dEMtXRWrzD5/0hLk=
X-Received: by 2002:a63:2c8a:: with SMTP id s132mr34389225pgs.65.1625065052602; 
 Wed, 30 Jun 2021 07:57:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+v8LXHYM6GBZJbgi+1iSJX9KsD10RJd/ZEttTfDxqdxqKrTPGoKHMlT0Lwj9Ihrk0mMwmGA==
X-Received: by 2002:a63:2c8a:: with SMTP id s132mr34389194pgs.65.1625065052315; 
 Wed, 30 Jun 2021 07:57:32 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id g10sm6885532pji.10.2021.06.30.07.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 07:57:31 -0700 (PDT)
Subject: Re: [PATCH v3 11/15] python: add 'make check-dev' invocation
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210629214323.1329806-1-jsnow@redhat.com>
 <20210629214323.1329806-12-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <8640e641-82b5-247c-cb86-a326295b0fa0@redhat.com>
Date: Wed, 30 Jun 2021 11:57:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210629214323.1329806-12-jsnow@redhat.com>
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


On 6/29/21 6:43 PM, John Snow wrote:
> This is a *third* way to run the Python tests. Unlike the first two
> (check-pipenv, check-tox), this version does not require any specific
> interpreter version -- making it a lot easier to tell people to run it
> as a quick smoketest prior to submission to GitLab CI.
>
> Summary:
>
>    Checked via GitLab CI:
>      - check-pipenv: tests our oldest python & dependencies
>      - check-tox: tests newest dependencies on all non-EOL python versions
>    Executed only incidentally:
>      - check-dev: tests newest dependencies on whichever python version
>
> ('make check' does not set up any environment at all, it just runs the
> tests in your current environment. All four invocations perform the
> exact same tests, just in different execution environments.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/Makefile | 35 +++++++++++++++++++++++++++++++++--
>   1 file changed, 33 insertions(+), 2 deletions(-)

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

It was tested as I mentioned on patch 10.

>
> diff --git a/python/Makefile b/python/Makefile
> index d34c4e35d9..8f8e1999c0 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -1,3 +1,5 @@
> +QEMU_VENV_DIR=.dev-venv
> +
>   .PHONY: help
>   help:
>   	@echo "python packaging help:"
> @@ -14,6 +16,11 @@ help:
>   	@echo "    Requires: Python 3.6 - 3.10, and tox."
>   	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.10'"
>   	@echo ""
> +	@echo "make check-dev:"
> +	@echo "    Run tests in a venv against your default python3 version."
> +	@echo "    These tests use the newest dependencies."
> +	@echo "    Requires: Python 3.x"
> +	@echo ""
>   	@echo "make develop:    Install deps for 'make check', and"
>   	@echo "                 the qemu libs in editable/development mode."
>   	@echo ""
> @@ -22,6 +29,9 @@ help:
>   	@echo "make pipenv"
>   	@echo "    Creates pipenv's virtual environment (.venv)"
>   	@echo ""
> +	@echo "make dev-venv"
> +	@echo "    Creates a simple venv for check-dev. ($(QEMU_VENV_DIR))"
> +	@echo ""
>   	@echo "make clean:      remove package build output."
>   	@echo ""
>   	@echo "make distclean:  remove venv files, qemu package forwarder,"
> @@ -38,9 +48,30 @@ pipenv: .venv
>   check-pipenv: pipenv
>   	@pipenv run make check
>   
> +.PHONY: dev-venv
> +dev-venv: $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate
> +$(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg
> +	@echo "VENV $(QEMU_VENV_DIR)"
> +	@python3 -m venv $(QEMU_VENV_DIR)
> +	@(							\
> +		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
> +		. $(QEMU_VENV_DIR)/bin/activate;		\
> +		echo "INSTALL qemu[devel] $(QEMU_VENV_DIR)";	\
> +		make develop 1>/dev/null;			\
> +	)
> +	@touch $(QEMU_VENV_DIR)
> +
> +.PHONY: check-dev
> +check-dev: dev-venv
> +	@(							\
> +		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
> +		. $(QEMU_VENV_DIR)/bin/activate;		\
> +		make check;					\
> +	)
> +
>   .PHONY: develop
>   develop:
> -	pip3 install -e .[devel]
> +	pip3 install --disable-pip-version-check -e .[devel]
>   
>   .PHONY: check
>   check:
> @@ -56,4 +87,4 @@ clean:
>   
>   .PHONY: distclean
>   distclean: clean
> -	rm -rf qemu.egg-info/ .venv/ .tox/ dist/
> +	rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/


