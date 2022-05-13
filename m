Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885752662F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:35:20 +0200 (CEST)
Received: from localhost ([::1]:33982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXJy-0004jS-45
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npXI9-00033V-3q; Fri, 13 May 2022 11:33:21 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npXI7-0006eI-Cz; Fri, 13 May 2022 11:33:20 -0400
Received: by mail-ej1-x631.google.com with SMTP id m20so16926718ejj.10;
 Fri, 13 May 2022 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DDrgyDJD29AL3YuCNB/4Vq6ATMUrPA+dVOs11so7vEM=;
 b=KNygjEN1vw2VBHIjPxX8DJE7kywviKKLX73B+yjz43NmihxK6mepMKaS05n2amthkv
 /WIXsOICsrTrrqQai95Ua0oDCYhFSN/b66mTfbj8PjBN4bOa6TxyWpYYRLjzLYKCDCuW
 xWxhh1/5Wq8xGbVrFvzWt9506/geHmU7Sc4ve8WUAqxhueOE3cWUrxkHfk15rhx4YeMP
 Nml1rtUywNLmoIIU4i7uqAQadr8k61EAUEvDEAdifn7VJeSTR+05fbal77mpea8d0aF8
 YBVbxKal7IjoxRdinFJMyOI2MuW1FJ28URnx8o/GD3miRTSY5uItdThgXi3ngZqN0YMP
 qFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DDrgyDJD29AL3YuCNB/4Vq6ATMUrPA+dVOs11so7vEM=;
 b=BjLpT6i8nkBq3F8sQUHp1IYXvRCi/mAUzdOS7deCUbJXh9VGAC3bjkUjcad+leNo4g
 FCZKRnALkAudbqoLY8gTHIoccAueMM1pTCuELfBoQu4doQrxPDTKZijKOMd/0MxqwjYx
 /vghO/nEkpVMN2bGlF9kwnKED4TOKCVkWcMAdkLIyB3o5VtjgXJ9NJ8w0LvODEqRD4rw
 zFY4RMPJ7uZkJDT07l82YDT9fr9Yo9T1JiuoO/90b66R0XjgFjWikzXzE+bdrMVmGLtW
 js9HbgwvFY1tRgGhwI4tduclLvrNTpAD4chB1baRDBCpeaE+qePAWWH9QZkLJASmMSgz
 OYBg==
X-Gm-Message-State: AOAM530jvcGJkOZEBoZNqTRw9Xxr/Kw4nB6CdazYCmUB2uPjl4fo7qrS
 5OuZSpj+RUnqB7rUym7EyxMxLQKklZ6HUA==
X-Google-Smtp-Source: ABdhPJyc5RiMxWbQTBCw4EVeODUbqAb8NhDN6n0dto39x6e65oxVFx+rfh6k6foWAV+COj/zl40oFg==
X-Received: by 2002:a17:907:971f:b0:6f4:31b1:253 with SMTP id
 jg31-20020a170907971f00b006f431b10253mr4658833ejc.342.1652455996942; 
 Fri, 13 May 2022 08:33:16 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 jx4-20020a170907760400b006f3ef214dccsm849962ejc.50.2022.05.13.08.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 08:33:16 -0700 (PDT)
Message-ID: <b30dd93b-0ced-0aea-5e84-57fa4294f4ad@redhat.com>
Date: Fri, 13 May 2022 17:33:14 +0200
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
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-b19dDshg7ShuNqhH+1h_ptYL4qpZSkTvnVnZOPT3g8HQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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

On 5/13/22 16:38, John Snow wrote:
> It *should*, because "#!/usr/bin/env python3" is the preferred shebang 
> for Python scripts.
> 
> https://peps.python.org/pep-0394/ <https://peps.python.org/pep-0394/>
> 
> 'python3' "should" be available. 'python' may not be.
> 
> Probably the "python" name in Makefile for TESTS_PYTHON should actually 
> be "python3" as well. In practice, all permutations (python, python3, 
> python3.9, etc.) are symlinks* to the binary used to create the venv. 
> Which links are present may be site configurable, but pep394 should 
> guarantee that python3 is always available.

IIRC we have some cases (FreeBSD?) where only the python3.x executable 
is available.  This is why we 1) default to Meson's Python 3 if neither 
--meson nor --python are passed, and 2) use the shebang you mention but 
with *non-executable* files, which Meson treats magically as "invoke 
with the Python interpreter that was used to launch me".

Paolo

