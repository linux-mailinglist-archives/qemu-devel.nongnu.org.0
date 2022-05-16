Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7CB527FC0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 10:34:15 +0200 (CEST)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqWBB-00010Z-Ni
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 04:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqVLr-0006qe-Ud; Mon, 16 May 2022 03:41:12 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqVLq-0002su-0Z; Mon, 16 May 2022 03:41:11 -0400
Received: by mail-ed1-x533.google.com with SMTP id s3so1945100edr.9;
 Mon, 16 May 2022 00:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iy55AIvdLNSIG3p8wIo+mNP/tzyfOhABGh8S2xtpUjI=;
 b=NqGkSgI4GUxZgIRgKOm7plA/6I6YBSs9BotqhbQUtGvYkZO3PrVhpt6UkBnxmmTtf9
 w/Y5GotZKeRhIqd2Ii11xKIBqGygCXoq6z59kQ6HEAI1EqIR94+Raat/o/4Fl5+rgPXQ
 qh8MHUNl3hVWUEAFJBGycN2Nr7Rk1/pS7sDY+6c6J9FQ4aFLRn9Yhg3r3KYRQGtCV6LH
 IMH6aAwSDuIGD0cNjw5PvogQz6xV8EIq2yCO7XHe8CIdwuRVLaKAUaejlodZY1kqErJ6
 a85KPbKJHJvmwQOdZx4LUUmDYSyatyAq8PJAGXPO3/PTLFJHHJi7jMkuKxv7hhAnjJE0
 1nnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iy55AIvdLNSIG3p8wIo+mNP/tzyfOhABGh8S2xtpUjI=;
 b=1sYAcC7FLTa2QtkBAdX3xGXJB8LYdB0QbZy+n7I4eFwyt0zgFG07KX+i+y+pedMfd9
 rzi+H+viML50hnq9ew6TjFLej03QDrhZYnEb7KZrTQw6BLUCjgwaor5AxcpjWsmtSesO
 BfK2gIrK/p3KI91y/ZJCxd2Qs8l9bewKI7qxjn0WxBzZpDFcmUTkJU/TmU+pwKUZgINW
 pE1HJ0MOZXfGa0DGEHLsMnUXX/rJ7Dg9GqZZ3/vi+mw+OiXvMPR46p5OwDPE8umHPyfn
 J4vWMymIH4hdFC+FVCq7t28xjLAyp/+aOptCA0hPNwYonpWGJHvHWP6WYRub0BYGwI5d
 0N9w==
X-Gm-Message-State: AOAM530/lXMZMl/h3CtUbl8XtUXg7mHS1EYgKSOVBtKQncvuN//Q/EO/
 De4AA9mp6xUSo8pLGYUQrEA=
X-Google-Smtp-Source: ABdhPJwc07aF0qoxjOEl/T2g3Gu/cCDM31xgc+a3P9Odu/UyLYCI1FhtRWlAbNpiVurgd5T5VwtWPw==
X-Received: by 2002:a05:6402:4010:b0:42a:6266:3f14 with SMTP id
 d16-20020a056402401000b0042a62663f14mr11818611eda.417.1652686867322; 
 Mon, 16 May 2022 00:41:07 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 h11-20020aa7c94b000000b00428a42815aasm4833264edt.0.2022.05.16.00.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 00:41:06 -0700 (PDT)
Message-ID: <15a9d6cb-e7c6-98f0-4b6f-766600b36274@redhat.com>
Date: Mon, 16 May 2022 09:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 9/9] iotests: use tests/venv for running tests
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-10-jsnow@redhat.com>
 <ab6d4171-74f0-3b6c-9ffc-1ed8f4fb0493@redhat.com>
 <CAFn=p-b19dDshg7ShuNqhH+1h_ptYL4qpZSkTvnVnZOPT3g8HQ@mail.gmail.com>
 <b30dd93b-0ced-0aea-5e84-57fa4294f4ad@redhat.com>
 <CAFn=p-bqbcXBLLmT3Fqu1b7Y0Hu=M6B5oKT7J9idXn=tmrt4UA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-bqbcXBLLmT3Fqu1b7Y0Hu=M6B5oKT7J9idXn=tmrt4UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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

On 5/14/22 17:55, John Snow wrote:
> On Fri, May 13, 2022, 11:33 AM Paolo Bonzini <pbonzini@redhat.com 
> <mailto:pbonzini@redhat.com>> wrote:
>     IIRC we have some cases (FreeBSD?) where only the python3.x executable
>     is available.  This is why we 1) default to Meson's Python 3 if neither
>     --meson nor --python are passed, and 2) use the shebang you mention but
>     with *non-executable* files, which Meson treats magically as "invoke
>     with the Python interpreter that was used to launch me".
> 
> pkg install python3 on fbsd 13.0-R gives you /usr/bin/python3 fwiw. do 
> you know in what circumstances you get only a point release binary?

Aha, tests/vm/freebsd installs python37, not python3.  But I guess it's 
still a plausible configuration for this packaging setup.

Paolo

> Creating a venv on fbsd with "python3 -m venv testvenv" created a 
> python3 binary link, but not a python3.8 link, also.
> 
> Still leaning towards the idea that "python3" is safest, but maybe it 
> depends on how you install from ports etc. I'd still say that it's 
> reasonable to expect that a system with python pays heed to PEP0394, I 
> think you've got a broken python install if you don't.
> 
> (But, what's the use case that forced your hand otherwise?)
> 
> --js
> 


