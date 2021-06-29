Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EE43B7947
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 22:25:05 +0200 (CEST)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyKI4-0005p9-9m
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 16:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyKH6-000583-OV
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 16:24:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyKH4-0001p3-6I
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 16:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624998240;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5E3fJGzW/vJunE9R6QwgMxFFb997n2Vpqqy1q/VKQk=;
 b=JJ03s2mdlTG4biUk10zT5qwWTmFylHLAJQCpQOVIA95rsmnwi8+6O4tgHYb49OcD4U1vMs
 YjNwvsOeCZFRU3fwToMpTpnRl5y/Bo4vlBRzmu+fe5MLu4MxLsNvXaC7uxRzq5KErwtdfG
 5Ln9nU3Jtf5/gkKfaoJ1ke1X4ENBU6I=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-U4mUQBE7P9ONuK8CxInZfw-1; Tue, 29 Jun 2021 16:23:58 -0400
X-MC-Unique: U4mUQBE7P9ONuK8CxInZfw-1
Received: by mail-pg1-f197.google.com with SMTP id
 p2-20020a63e6420000b02902271082c631so12044783pgj.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 13:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=D5E3fJGzW/vJunE9R6QwgMxFFb997n2Vpqqy1q/VKQk=;
 b=LBwfXzI2PXoGKdsNPYVfCqcaSDTi8a15rb2tTwuTlJBifkxLWE+osQVYSmIAumYNnV
 /TsNMiFat19lph9Wsl3prPyhDZ+GQjQqKHTzPRpfv314L9xTTT4qAHEHFnvUwVVMK5nQ
 wouCqqe2b7PRsIUAh6NdVDAo3skD/rbem9k/1G4iVUJZAZeZtDX+tREilK3Iq8JkDOen
 wKeiE4EIY6xHsETwUZfhdbqAyCILIWiDPcGwZ7N47x3210iadlG0jvjkH8jDvEowNR6p
 GuiQ3yk6iQkK7kn/gRRUUmC1aifJ0aDvdpgMZYOu8HD+ULjiLWrJJmvUfzYJOQ+tLOVq
 /EWg==
X-Gm-Message-State: AOAM530wAajz6YynNu7aCXAt8iYzDY3NUpl1XIJOo+r6eFz4uSmr83UA
 g5BeGpVzelZjv5txc+yb2rac+h6ON4w+UfD0lavJuaxVR+S1JHHEtEAd0i3/ir2l97EJVeICzxc
 d3Z+Parch3p/Qyas=
X-Received: by 2002:a17:902:bc88:b029:121:146b:3bf9 with SMTP id
 bb8-20020a170902bc88b0290121146b3bf9mr29006909plb.15.1624998237976; 
 Tue, 29 Jun 2021 13:23:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM4xZX4N/S3Zc1vCqoOtlt4Eo3s0NK/KHGvRS/bt7a5BzjS78LQkJh1H6l/yHU4mAlWedoAA==
X-Received: by 2002:a17:902:bc88:b029:121:146b:3bf9 with SMTP id
 bb8-20020a170902bc88b0290121146b3bf9mr29006887plb.15.1624998237676; 
 Tue, 29 Jun 2021 13:23:57 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id 133sm17311890pfx.39.2021.06.29.13.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 13:23:57 -0700 (PDT)
Subject: Re: [PATCH v2 07/12] python: update help text for check-tox
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210629164253.1272763-1-jsnow@redhat.com>
 <20210629164253.1272763-8-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <e8531bbc-aa56-784e-1fe7-f4c4ce5fdd62@redhat.com>
Date: Tue, 29 Jun 2021 17:23:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210629164253.1272763-8-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi John,

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

Somewhat related... in my system I don't have all supported python 
versions installed, thus check-tox fails.

Instead, maybe, you could configure tox (as below) to test to whatever 
supported versions the developer have installed in the system; and on 
absence of some versions it won't fail the tests entirely.

diff --git a/python/setup.cfg b/python/setup.cfg
index e730f208d3..1db8aaf340 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -123,6 +123,7 @@ multi_line_output=3

  [tox:tox]
  envlist = py36, py37, py38, py39, py310
+skip_missing_interpreters=true

  [testenv]
  allowlist_externals = make

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


