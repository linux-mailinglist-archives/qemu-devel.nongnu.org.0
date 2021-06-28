Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E353B6A11
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:17:19 +0200 (CEST)
Received: from localhost ([::1]:54374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxyd4-00022p-CV
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxyc5-0001Hn-Lb
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxyc4-00064O-0Z
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624914975;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=upweg+AXjtIH3hA+5r1G4zEdqN7FvrdDcPNnYcibp0Q=;
 b=F24X9J4nF95fsJqn/YvKB3Zjqizfugy+jEaWmP6HPzFRiZg2ZZ2wyJhoTq9YcQVESKIV+p
 xMZSjaJT+GKqRy3chjI6H0N4XoP/NAELexpNY9t+VaOxgYT3m42qf8FoGLOhjC3mI1bYPZ
 gnTwlVcvV3CVxcnjzZnZ46oxt6W7KC8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-6iplaKtpPzSeSIpXbazNyA-1; Mon, 28 Jun 2021 17:16:11 -0400
X-MC-Unique: 6iplaKtpPzSeSIpXbazNyA-1
Received: by mail-pf1-f200.google.com with SMTP id
 o11-20020a62f90b0000b02902db3045f898so10026356pfh.23
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 14:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=upweg+AXjtIH3hA+5r1G4zEdqN7FvrdDcPNnYcibp0Q=;
 b=uoZT8Wzh9oew17DPARu7npVQRr8GYyW4DntTzuqyOtEw2Ecvd2jWqRY0T/kJgJi8Jg
 y+Mx5WV0V/dc8wmSLsHIY2fYSr+rx9FWek3iUzdpn0mCb/HicRNwycA4ZVu33qe2NA4r
 ce+MA+meMZgwsGrRSuESq6gtsEqwCVgT+1VisiRf+82nlVK580VwqY00YareMzosrp9s
 /5fWBbuH6ZYuuCaxmO1XStFtSngzOMT9e7r2IzNTjjkEdYkmK3BbtKIIEs8kcb8VsQw3
 9Pf/d9n38V51l4nKrocmrgMOLFMVwIxyYcWw69MYJgxWUc1t+ZHQBhbR32X0lStReQQ8
 nc5A==
X-Gm-Message-State: AOAM533aaoJtNHVznLVNCLvsQY/8uSK1BSm5h08hCT+0L6gPh8BCo1Xu
 FGZ2IwbOukDGqLuF0nOuAfrGHd7zPZHBuiNZkwHoulxa2ePLGLrAuc19vfXuSagO0cBtpj6zxXM
 aWC+kM8o7tchTXFk=
X-Received: by 2002:a17:90a:db0c:: with SMTP id
 g12mr29762444pjv.166.1624914970347; 
 Mon, 28 Jun 2021 14:16:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvLis/OAZ7ChfK9Xo188sTKbt738Xi96rCzKMT1MlIaLPvFOBEtYWZxHIjEYJkIQFjsUzZCw==
X-Received: by 2002:a17:90a:db0c:: with SMTP id
 g12mr29762417pjv.166.1624914970074; 
 Mon, 28 Jun 2021 14:16:10 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id d13sm14798339pfn.136.2021.06.28.14.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 14:16:09 -0700 (PDT)
Subject: Re: [PATCH 07/11] python: update help text for check-tox
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-8-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <76b9d2ac-75f8-faa7-6198-16f5294004e9@redhat.com>
Date: Mon, 28 Jun 2021 18:16:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625154540.783306-8-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
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

Hi,

On 6/25/21 12:45 PM, John Snow wrote:
> Move it up near the check-pipenv help text, and update it to suggest parity.
>
> (At the time I first added it, I wasn't sure if I would be keeping it,
> but I've come to appreciate it as it has actually helped uncover bugs I
> would not have noticed without it. It should stay.)
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/Makefile | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/python/Makefile b/python/Makefile
> index 07ad73ccd0..5cb8378b81 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -9,13 +9,17 @@ help:
>   	@echo "    Requires: Python 3.6 and pipenv."
>   	@echo "    Hint (Fedora): 'sudo dnf install python3.6 pipenv'"
>   	@echo ""
> +	@echo "make check-tox:"
> +	@echo "    Run tests against multiple python versions."
> +	@echo "    These tests use the newest dependencies."
> +	@echo "    Requires: Python 3.6-3.10 and tox."

Nit: I'm not sure it is clear '3.6-3.10' is a range rather than a 
specific version.

- Wainer

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


