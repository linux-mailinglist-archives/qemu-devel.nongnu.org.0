Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E8E58AEF8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:35:49 +0200 (CEST)
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK1Ei-0002Ma-6z
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oK1CI-0007CP-0D
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:33:18 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:45903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oK1CG-0004gT-E1
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:33:17 -0400
Received: by mail-ed1-x52b.google.com with SMTP id e13so4179386edj.12
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 10:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=47h+5QLoFI8dpX/gaz8zZ3+5baq62/L2avQ+7lQ41XE=;
 b=G2IBNYW+LnsZ95KoTyhpqSJuRfRdyj2/fvJOiG8m+EVKK3FWwAOnC46SsLjgBIv5N9
 +TAjjSCrE7jheZsyKQQ0vAB0sEn0mdtZ1VljN0Wv+a4Wc7QYIRb70OFZXhOZD0vINzIm
 rShm4KOX16ydlCAptEnB4cMgSV1i/36tt8/CNZQB0I5TgfiOIzr9uQJfWKkas3WkucsO
 Dzs/o9kfHw39egbmC4yBg00MAjLMXDHfxfamX5PeIAwRUlgCb9nPUX8zW3MqkzFk8gLf
 dYyurTI1nGsoFmaySO1yXyY+q1FHlbRD/BVQGYFVKxY+SZgDyifE9swPjH3fDD5ncz0X
 IBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=47h+5QLoFI8dpX/gaz8zZ3+5baq62/L2avQ+7lQ41XE=;
 b=xkR+7riVSb17/KHEwbGuYtCQQHMDyPCOpK3dMk8Kk+KY9XMEkLxVN548E3+xUNZAV4
 uWlYhW1X5xkX4zZoF+xdZPnFJhtVuTMdul/x4JAD+k3woxiaAkszf16XP3w7VxA+mOID
 iQMwGV99NeYmOxqdCP6dfRLwSsr8Eu2c16VrNDQBsXndsQW944dssh6ZIpfQDgO07oa8
 BPOps9JlVO6N00e4xOwIE5OBKW3O9iZ4vVZzPEZbKBo/T8vq/9RpOlIG7jNza+4kuaFH
 feU3HZ6fKJgshwJXnnTzOuekIGZkv4epjzvndvTllLxk+13B4lfsv9Rxw5hOHgfaVJlK
 Pphg==
X-Gm-Message-State: ACgBeo1hNXCV6jfiBpn8nOWUyzv1mYh8nnu9ZLK7Aq1HU13duub0aTMn
 B19Y/oi7Ut3n+2S7fggEKRk=
X-Google-Smtp-Source: AA6agR6upxh8WBQM9egEJ3lm2NM55gVF9aNUiIjYAMOm3YgA0dvxjx3O84gDuPgjO7OHri/xexB9UA==
X-Received: by 2002:a05:6402:e96:b0:43a:f21f:42a0 with SMTP id
 h22-20020a0564020e9600b0043af21f42a0mr7682817eda.382.1659720794800; 
 Fri, 05 Aug 2022 10:33:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 f23-20020a170906085700b0072637b9c8c0sm1771231ejd.219.2022.08.05.10.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 10:33:14 -0700 (PDT)
Message-ID: <4452eaa1-979f-66d6-90cc-761b8d312577@redhat.com>
Date: Fri, 5 Aug 2022 19:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: libslirp and static linking
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Michael Tokarev <mjt@tls.msk.ru>
References: <CAFEAcA87=Xs8vd8e+eHzSFboWOUcAhJUuFvuG1gzw+Zs_M-DyQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA87=Xs8vd8e+eHzSFboWOUcAhJUuFvuG1gzw+Zs_M-DyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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

On 8/5/22 18:13, Peter Maydell wrote:
> Hi; I noticed today that Debian's libslirp-dev package doesn't ship
> a static library version of libslirp. I was going to file a Debian
> bug about that, but then looking at upstream 'libslirp' I found
> that its README.md
> https://gitlab.freedesktop.org/slirp/libslirp
> only documents how to build a shared library libslirp, and says
> "(QEMU may build with the submodule static library using --enable-slirp=git)"
> 
> So:
> (1) is it possible to build the separate libslirp package as
>      a static library currently?

Yes (same with any other meson project):

$ meson setup -Ddefault_library=both build
$ ninja -Cbuild
$ ls -ld build/libslirp*
-rw-r--r--. 1 pbonzini users 1182058 Aug  5 19:30 build/libslirp.a

Paolo

