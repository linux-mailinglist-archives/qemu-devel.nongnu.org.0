Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E08525FA6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:24:00 +0200 (CEST)
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npSSl-0001SQ-EW
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npSQ0-00088S-Gj; Fri, 13 May 2022 06:21:08 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npSPy-000219-Nu; Fri, 13 May 2022 06:21:08 -0400
Received: by mail-ed1-x531.google.com with SMTP id c12so9378657edv.10;
 Fri, 13 May 2022 03:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TlyRecomiSvXNqhFXxAHHXdK7SqeZYuAvTiQSqe0QX0=;
 b=RAXJG5ZvQUlxIrPXWKtRS0HTIsgIuT3+mQT1SdqKa0GxOOWil19uo3gQbNHFOlzYpJ
 ApcQ8VHMaoyO63vT3R6ru/NhppsQ+tY8fh0yEc5UcET5XaAa7brTLjdYh3VHu7g8QjOa
 10LrHWV6nosMUiYSoIhCYD/MmAeOoreRl5yM+I8FEvgcnbbvvu+/nEoZBZdrOIg9YvwE
 OCU569sYe9vTc3o2DiGzGd+EfubOOtCeN8rMRq8YNiJIFb7jrNRARAqJQ87Yq7/KYYFW
 K8jR3A5EP5ZS/ynZj1jDAgXYdL4Cjbngqd/GgqeApfNMV60vhDoUHo30KOKLO0k9kbuC
 AiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TlyRecomiSvXNqhFXxAHHXdK7SqeZYuAvTiQSqe0QX0=;
 b=E3TnkVWPlCrarWqZaEcIQ0BCnGCY+48vE6NygWB6nxq/FsVoAqHoM4bKp55SkEpE5Y
 McXmwTrbI8ebEnp0+hqfmHY80DrWUR+0txK0dUo6AmdMvnYZnDBC9E4oz6Nk7tn2c34Y
 Mj5OgzArgoKtktAgpaYwrnBVYzA4fECPWALEGn83QwZysRZ6z8mhMaWYk50t8peVhnZH
 I/BS3Gn/C8dZgTvw7lyx9Kdbp9phzoWrVd/imsJSQw3mk0N9vZhiOVZrgQI885fW+NWS
 FF9Apq/ckDPMePJRIXCvJlul83XrxjqJxWyP7nGZ08D+g0I1At/VAKZa+Zio9ZC5iQMt
 qz3w==
X-Gm-Message-State: AOAM531eddWtrn9p2C8J/vj1n3s+sAR1jsDEsPLuKicVjPiUt71nvP2l
 //p0p8tMysr8DfvlwPNZbU0=
X-Google-Smtp-Source: ABdhPJymfRd1oGSPAdv8qXRBpxg1Hsr/uUjQREQfcot+rjxm2fhrpZmtfogWkcln8tcodGWa1E54Tg==
X-Received: by 2002:a05:6402:11c7:b0:428:5fdc:80c5 with SMTP id
 j7-20020a05640211c700b004285fdc80c5mr38454100edw.332.1652437264612; 
 Fri, 13 May 2022 03:21:04 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 jy10-20020a170907762a00b006f3ef214da2sm634317ejc.8.2022.05.13.03.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 03:21:04 -0700 (PDT)
Message-ID: <0248b5df-dbc6-48bf-b5c8-e5c73decc1c1@redhat.com>
Date: Fri, 13 May 2022 12:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 0/9] tests: run python tests under the
 build/tests/venv environment
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
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220513000609.197906-1-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
> The only downside I am really frowning at is that I will have to
> replicate some "update the venv if it's outdated" logic that is usually
> handled by the Make system in the venv bootstrapper. Still, I think it's
> probably the only way to hit all of the requirements here without trying
> to concoct a fairly complex Makefile.
> 
> any thoughts? If not, I'll just move on to trying to hack up that
> version next instead.

I would not even bother with keeping the venv up to date.  Just initialize
it in configure, this is exactly what configure remains useful for in the
Meson-based world:

- add configure options --enable-python-qemu={enabled,system,internal,pip,
auto}/--disable-python-qemu (auto means system>internal>pip>disabled; enabled means
system>internal>pip>error) and matching CONFIG_PYTHON_QEMU=y to
config-host.mak

- use CONFIG_PYTHON_QEMU to enable/disable iotests in tests/qemu-iotests/meson.build

- add a configure option --enable-avocado=
{system,pip,auto,enabled}/--disable-avocado and matching
CONFIG_AVOCADO=y to config-host.mak

- use it to enable/disable acceptance tests in tests/Makefile.include

- build the venv in configure and use the options to pick the right pip install
commands, like

has_python_module() {
   $python -c "import $1" > /dev/null 2>&1
}

# do_pip VENV-PATH VAR PACKAGE [PATH] -- PIP-OPTIONS
do_pip() {
     local num_args source
     num_args=5
     test $4 = '--' && num_args=4
     eval source=\$$2
     # Try to resolve the package using a system install
     case $source in
       enabled|auto|system)
         if has_python_module $3; then
           source=system
         elif test $source = system; then
           error_exit "Python package $3 not installed"
         fi
     esac
     # See if a bundled copy is present
     case $source in
       enabled|auto|internal)
         if test $num_args = 5 && test -f $4/setup.cfg; then
           source=internal
         elif test $source = internal; then
           error_exit "Sources for Python package $3 not found in the QEMU source tree"
         fi
     esac
     # Install the bundled copy or let pip download the package
     case $source in
       internal)
         # The Pip error message should be clear enough
         (cd $1 && . bin/activate && pip install "$@") || exit 1
       ;;
       enabled|auto|pip)
         shift $num_args
         if (cd $1 && . bin/activate && pip install "$@"); then
           source=pip
         elif test $source = auto; then
           source=disabled
         else
           # The Pip error message should be clear enough
           exit 1
         fi
       ;;
     esac
     eval $2=\$source
}

rm -rf venv/
$python -m venv venv/
do_pip venv/ enable_python_qemu qemu.qmp python/qemu -- qemu.qmp
do_pip venv/ enable_avocado avocado -- -r tests/requirements.txt

