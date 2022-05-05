Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B686A51C063
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 15:17:16 +0200 (CEST)
Received: from localhost ([::1]:52202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmbM3-0005cQ-QW
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 09:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmbKp-0004Ng-IX; Thu, 05 May 2022 09:15:59 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmbKn-0008OJ-O2; Thu, 05 May 2022 09:15:59 -0400
Received: by mail-ej1-x62b.google.com with SMTP id i19so8651403eja.11;
 Thu, 05 May 2022 06:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bVHpdlXjJqbuzkOgac9g+nqK1N7tsZ/xmjygjHtPwjM=;
 b=W8wD3zqpCV0TskwFs+6wcXLlU2J3J/Ct7vHUvNbOIKotXbwUB9JUayjrLmPLZbiBb6
 ZjuhoqSrwIc7jo5+Lj4g4RaibzMzM9Em/c/1etsRtHwnjE9gIu4UP3drLzKDQZImFGVi
 fByxWvDeo18z8ru4YYl8h8mju7g1BUfzqk/YKG02Pvu6HXD8YFiZZkquvhYJ39jtKipt
 irN5ZCM83AofQBAdLnXvLUGcYDrzLyG0FBJm9ARPEIPDhn7VZaxIXFw8KjuPXznzUeB2
 KDb6J+7WbRq8aNuRbsMi8zKJQch/05KK2pl7Euj0qjWDlowejY4a5+cjwIBjyqdjMPuh
 S9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bVHpdlXjJqbuzkOgac9g+nqK1N7tsZ/xmjygjHtPwjM=;
 b=GrOgDdPRe9Ikr63gZWqVtRfkQvqZMUGmQ+M6zc0/2sBipK3TWkbMxI5FSOGVuF/Kl+
 R5mXqSic+bXKpKKI+1L0z6nm5wsjuJp60QDMrjQE5KeRUIIq9Lm8odg1T1Y0hm+gKT7h
 MStO+z3aeI7ip5D+HahU4pKctekIkHPNsn08IdBzpRmPtGJnqI/w+82SNtOPgvq7Jagp
 xnvXwz8sKGXpWgLkriaJnN/24wwqxjHLkGD/jXyRQt+4+HwLsqyHyPiSN7XxqOeJl4Nl
 Wh1ePXT9bmQG9jnelb8pIp79brztEKvEpeVaQPauPZ/liIkMAqMUR4s1XZYIK7TZkZeo
 UrYg==
X-Gm-Message-State: AOAM532ra8GaZhpGi+GzXR7I2FD34fOZMOYEijR9iljyVks0mfHP8Yvr
 hfB0J2Vs32XHUzjc+ZLKL3Q=
X-Google-Smtp-Source: ABdhPJwHFmomVR0NpNMILW8SNZdF0bMuLBkehwR6+UD2wRf6dRw6t9KfyYIoEGt1lkaACQ0KlO4F/A==
X-Received: by 2002:a17:907:2cc7:b0:6df:b76d:940d with SMTP id
 hg7-20020a1709072cc700b006dfb76d940dmr25571885ejc.742.1651756555908; 
 Thu, 05 May 2022 06:15:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 cf16-20020a0564020b9000b0042617ba63a6sm804757edb.48.2022.05.05.06.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 06:15:55 -0700 (PDT)
Message-ID: <07a829c2-4eb8-01e3-0c8c-691c1420f51a@redhat.com>
Date: Thu, 5 May 2022 15:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: iotests and python dependencies
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Cleber Rosa <crosa@redhat.com>
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOGJ+rUIn2S8ZOD@redhat.com>
 <CAFn=p-bBCbokmZ8FeHon6FBGxp38_z4=vmDNMi5vKKF_1KjQLQ@mail.gmail.com>
 <YnPEGrwa9KVyup6T@redhat.com>
 <CAFn=p-ZpoJvoZSnk9gN+uiaas=h-tvZqBCZw2kJf88=rq_5LYQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-ZpoJvoZSnk9gN+uiaas=h-tvZqBCZw2kJf88=rq_5LYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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

On 5/5/22 15:10, John Snow wrote:
> 
>      > Hm, do we need iotests during an rpm build? Is it because of
>     "make check"?
> 
>     Yes, and this is good, because it prevents us from outputting an
>     RPM build that has a broken QEMU in it.
> 
> Guess this means I need to make a Fedora package too, though. My hubris.

I would rather keep python/qemu/qmp as a submodule for a longer time, 
and still go through a virtual environment that installs it together 
with its pip dependencies.

Paolo

