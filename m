Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45E9525DC5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:45:05 +0200 (CEST)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQv3-0002Pg-0v
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQoX-00067D-8x; Fri, 13 May 2022 04:38:21 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQoS-00032i-4l; Fri, 13 May 2022 04:38:20 -0400
Received: by mail-ed1-x529.google.com with SMTP id c12so9084188edv.10;
 Fri, 13 May 2022 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=llJdyDJhq3qBWG4AhxpUSwouGKLUL/9YfumGwxT799I=;
 b=ifpxxCj7LJEQeXYZtNDh6gw+7TyghvAcz6IbZqLZULKt4aHiB1h2GBmDYOuC0qDYXG
 Zz0xxchaDhvyOERt5gg5g1P7Ohy9dlIABnuAkZtnykvf08EkREZ++UXNemc3a3eC70Vj
 HPd9alA99/WIHqbJ2L04/KrwTL7sQ24jLVR70ybNcy7Mmb5rv9hADtORCfOKK7S9kXIx
 aFm26CbUDFMVX8J/jt91+2A3BsYe2fV1IrZMWYCs9uEgIInVSvfhtyBGZSKEYDGNf5HV
 Zpd6G50AKvql24VLu7GGo1ilogGPzI+YD45AFWYEggKGzibvBYUCFF77TuCpXZYg1GJY
 Yrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=llJdyDJhq3qBWG4AhxpUSwouGKLUL/9YfumGwxT799I=;
 b=DLW6qYLOmDoXZceD4SoQQOWQf4clRRXeMJ3Pm0vbv8Uz0MKNvlXFnDVOTyVZnKxO2X
 43CSqSqS0YTok5LD64BByPvvIZcnZYNDQS6q78Ty1WMg3wHPFlJ/UTo8s654Rfrzj50i
 aUI56gl56ky+8/1xzJlBZiJ6NSI/ahdHceVD6FRIFcxZlmZvPZ4COVvFesU4xlNnWLgl
 yBQuuBZ1kCK5xqiRkn77/ALEuUoFGs4sAc2EtbAS+8EXkRaBu3iSOL+2eUz/hnRNqzEy
 ktm1eCIRBYNqXhD21ieBzsEEoWAaJ83379341EAnX/JxHY7gUPxIYWeUvZTGIA894Wp9
 yDXw==
X-Gm-Message-State: AOAM533nXqKot1t51fdTQ/usJhdpOMWrdNaPZ1X6mkPTC7Go4rJsUnO3
 CurnPBE7Ac8YVCTRw7u8wDI=
X-Google-Smtp-Source: ABdhPJxqi+QJyQe/0lU/2RdNHqOFbNLT8xhWGPV82DMrC6eqH2+31MWfDcn9PmDL+DHALAc1azcqTQ==
X-Received: by 2002:a05:6402:849:b0:427:edfe:1b7e with SMTP id
 b9-20020a056402084900b00427edfe1b7emr39445048edz.355.1652431094327; 
 Fri, 13 May 2022 01:38:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 gz13-20020a170907a04d00b006f3ef214deasm535723ejc.80.2022.05.13.01.38.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:38:13 -0700 (PDT)
Message-ID: <ab6d4171-74f0-3b6c-9ffc-1ed8f4fb0493@redhat.com>
Date: Fri, 13 May 2022 10:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 9/9] iotests: use tests/venv for running tests
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
 <20220513000609.197906-10-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220513000609.197906-10-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
> Essentially, this:
> 
> (A) adjusts the python binary to be the one found in the venv (which is
> a symlink to the python binary chosen at configure time)
> 
> (B) adds a new VIRTUAL_ENV export variable
> 
> (C) changes PATH to front-load the venv binary directory.
> 
> If the venv directory isn't found, raise a friendly exception that tries
> to give the human operator a friendly clue as to what's gone wrong. In
> the very near future, I'd like to teach iotests how to fix this problem
> entirely of its own volition, but that's a trick for a little later.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/testenv.py | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 0007da3f06c..fd3720ed7e7 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -65,8 +65,9 @@ class TestEnv(ContextManager['TestEnv']):
>       # lot of them. Silence pylint:
>       # pylint: disable=too-many-instance-attributes
>   
> -    env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
> -                     'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
> +    env_variables = ['PYTHONPATH', 'VIRTUAL_ENV', 'PYTHON',
> +                     'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
> +                     'QEMU_PROG', 'QEMU_IMG_PROG',
>                        'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
>                        'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
>                        'QEMU_IO_OPTIONS', 'QEMU_IO_OPTIONS_NO_FMT',
> @@ -98,6 +99,10 @@ def get_env(self) -> Dict[str, str]:
>               if val is not None:
>                   env[v] = val
>   
> +        env['PATH'] = os.pathsep.join((
> +            os.path.join(self.virtual_env, 'bin'),
> +            os.environ['PATH']
> +        ))
>           return env
>   
>       def init_directories(self) -> None:
> @@ -107,13 +112,17 @@ def init_directories(self) -> None:
>                SOCK_DIR
>                SAMPLE_IMG_DIR
>           """
> -
> -        # Path where qemu goodies live in this source tree.
> -        qemu_srctree_path = Path(__file__, '../../../python').resolve()
> +        venv_path = Path(self.build_root, 'tests/venv/')
> +        if not venv_path.exists():
> +            raise FileNotFoundError(
> +                f"Virtual environment \"{venv_path!s}\" isn't found."
> +                " (Maybe you need to run 'make check-venv'"
> +                " from the build dir?)"
> +            )
> +        self.virtual_env: str = str(venv_path)
>   
>           self.pythonpath = os.pathsep.join(filter(None, (
>               self.source_iotests,
> -            str(qemu_srctree_path),
>               os.getenv('PYTHONPATH'),
>           )))
>   
> @@ -138,7 +147,7 @@ def init_binaries(self) -> None:
>                PYTHON (for bash tests)
>                QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
>           """
> -        self.python = sys.executable
> +        self.python: str = os.path.join(self.virtual_env, 'bin', 'python3')

Is this guaranteed even if, say, only a /usr/bin/python3.9 exists? 
os.path.basename(sys.executable) might be more weirdness-proof than 
'python3'.

Paolo

