Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7451F3B6A84
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:42:17 +0200 (CEST)
Received: from localhost ([::1]:46428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxz1E-0000C8-H2
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxz01-0006va-1r
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:41:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxyzz-0005Ue-8Y
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624916458;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQTMTWyugBMliXiKLXpFoa5OPoj8vkxNkcBC0cK7bBI=;
 b=M4dtvlQl4JZXQNP3fORskCRS1DvfaawLQ725nvaJoTA86EpE6A41hXNxRh6dMylJTW+/+R
 utasuEsb6hsfM9ZE7tAUhR5+qndaTO39JfEPTe1FFiaiVta9E6qotd1CBx0fgYy6G5qk2F
 DZITW1byqZtrsLY0n+wByE2ureDt4Kw=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-no_adHrUO_SZaSEF9JKHKw-1; Mon, 28 Jun 2021 17:40:07 -0400
X-MC-Unique: no_adHrUO_SZaSEF9JKHKw-1
Received: by mail-pg1-f200.google.com with SMTP id
 u8-20020a6345480000b0290227a64be361so2695031pgk.9
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 14:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=wQTMTWyugBMliXiKLXpFoa5OPoj8vkxNkcBC0cK7bBI=;
 b=iBffLlVK4vwls0ZXVmjbi7APSRDfyltRZkN0rkVrvuHz+ixy3ESOzxNHLlDlOybZpp
 Wg8nDgcLxRgYuKIgnyz9HGqn58E52bAYcuFE7skKTpNFoOKzm6T7qbLouGcu0RM/XLH6
 lhcdlr+6bFpemyMCejVM+TCSsSqShVdgSuXqnVQ0NesqpbFsK2j3WaHDb4aZJ2lsEBjz
 cfGiliqxPgZ8k1EfnzLf4VnT6qfDUMW2sr21bwpfJsB9OEKvmIEKhPMM/rqHcWtcIlYK
 CxAIYOYiCYN2aO0dGyHPpm+uaBup24LUy1VfTif5R7IJpTfvwsglVU+LDyc48GxZ7RN7
 AvLg==
X-Gm-Message-State: AOAM530YE8/2naJYHRiCGRHKi2gkq0Jtf5Po8TQqVNyOWesq51SsG8ex
 Q5OyzJU4cQRsCbGthC0b9A5v98C6Gh77KQkC52cfXviYoShIZn9KAc1xzxeaYtUMjixYhourb2T
 Gv+2AQNr5d0zDq1c=
X-Received: by 2002:a63:5c04:: with SMTP id q4mr24868915pgb.127.1624916406455; 
 Mon, 28 Jun 2021 14:40:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygbe/RvgMDgamQMOPRfH5eoEZKu9GsgxU+IJPBr83QAhcDtR19vFK97zN7LEWpwBKMdxVzTw==
X-Received: by 2002:a63:5c04:: with SMTP id q4mr24868894pgb.127.1624916406192; 
 Mon, 28 Jun 2021 14:40:06 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id u24sm15849437pfm.200.2021.06.28.14.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 14:40:05 -0700 (PDT)
Subject: Re: [PATCH 08/11] python: add 'make check-venv' invocation
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-9-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <f27098f2-80ee-3eea-b991-de85d94bd6a7@redhat.com>
Date: Mon, 28 Jun 2021 18:40:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625154540.783306-9-jsnow@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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


On 6/25/21 12:45 PM, John Snow wrote:
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
>      - check-venv: tests newest dependencies on whichever python version
>
> ('make check' does not set up any environment at all, it just runs the
> tests in your current environment. All four invocations perform the
> exact same tests, just in different execution environments.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/Makefile | 35 ++++++++++++++++++++++++++++++++---
>   1 file changed, 32 insertions(+), 3 deletions(-)
>
> diff --git a/python/Makefile b/python/Makefile
> index 5cb8378b81..76bb24e671 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -1,4 +1,6 @@
> -.PHONY: help pipenv check-pipenv check clean distclean develop
> +.PHONY: help pipenv venv check-venv check-pipenv check clean distclean develop
> +
btw, check-tox is missed here ^
> +QEMU_VENV_DIR=~/.cache/qemu-pyvenv

A few suggestions:

1. For the sake of consistence with others temporary directories 
created, use QEMU_VENV_DIR=<path-to-qemu-src>/.devvenv

2. Reword to 'devvenv' or 'dev-venv' (or something similar), instead of 
'venv', the directories and Make targets. IMHO it will make the purpose 
of the targets a bit clear.

What do you think John?

- Wainer

>   
>   help:
>   	@echo "python packaging help:"
> @@ -15,6 +17,11 @@ help:
>   	@echo "    Requires: Python 3.6-3.10 and tox."
>   	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.10'"
>   	@echo ""
> +	@echo "make check-venv:"
> +	@echo "    Run tests in a venv against your default python3 version."
> +	@echo "    These tests use the newest dependencies."
> +	@echo "    Requires: Python 3.x"
> +	@echo ""
>   	@echo "make develop:    Install deps for 'make check', and"
>   	@echo "                 the qemu libs in editable/development mode."
>   	@echo ""
> @@ -23,6 +30,9 @@ help:
>   	@echo "make pipenv"
>   	@echo "    Creates pipenv's virtual environment (.venv)"
>   	@echo ""
> +	@echo "make venv"
> +	@echo "    Creates a simple venv for check-venv. ($(QEMU_VENV_DIR))"
> +	@echo ""
>   	@echo "make clean:      remove package build output."
>   	@echo ""
>   	@echo "make distclean:  remove venv files, qemu package forwarder,"
> @@ -37,8 +47,27 @@ pipenv: .venv
>   check-pipenv: pipenv
>   	@pipenv run make check
>   
> +venv: $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate
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
> +check-venv: venv
> +	@(							\
> +		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
> +		. $(QEMU_VENV_DIR)/bin/activate;		\
> +		make check;					\
> +	)
> +
>   develop:
> -	pip3 install -e .[devel]
> +	pip3 install --disable-pip-version-check -e .[devel]
>   
>   check:
>   	@avocado --config avocado.cfg run tests/
> @@ -50,4 +79,4 @@ clean:
>   	python3 setup.py clean --all
>   
>   distclean: clean
> -	rm -rf qemu.egg-info/ .venv/ .tox/ dist/
> +	rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/


