Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490C2509FB0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:31:52 +0200 (CEST)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVyR-00052n-7F
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhVWK-0003WX-9A
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:02:50 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhVWI-0002RT-HF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:02:47 -0400
Received: by mail-ej1-x629.google.com with SMTP id l7so9606717ejn.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 05:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IAnkDIOMK7KpJGH6G6j00obVBGG3WrJ8502yv5lcsQE=;
 b=RM3xIJLjUKu4MVsVdAR4EnD/+EUj3WrZF8Gfrlw2+RP2xlVePPe7ukPVLlWJO5c4Bg
 l6154zn9lguzAhAv9cNtlEGBTt+r6c0Y+KPDjYZJ+3nLPYoP4fgNIyBoEl0wypsIYLXa
 tMrC3E2Xj6rXS/vVbhzV48AHvFlMTTomCJWzME43xtu1KLYmapWumQTXT/y9AWyGHeef
 uw7tUk32yj2EKtLuZHiqHsaX2g85fnK9GuDU3Eilq+IsvTeI7PtOp8wrukFj7md1tfwN
 84L1I5jLQ80F4J/qMat/LNImuwJVh8+f87rzfA44/6lZO1bR5wZc91TG14TpER7Szkaa
 imsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IAnkDIOMK7KpJGH6G6j00obVBGG3WrJ8502yv5lcsQE=;
 b=Tv8eXfg+umojGXxvL8wsWGie1eSPquTmAyZIlAJ8QxpFMg6lvlDI9QeJq+GQOr2H6b
 XDOZtgYu738dQDio3g9UppDxZMYEDFr2uKqRntZMId0uABOl2ROCfh5kWVoaq00YsxM9
 5Ql7p+WTK7mB802ugBzde2D5Ad7H5KYax9qsJxhTRUrdxKye0XF9/PolcPojjEJL9HPI
 Ls4QiDFlWLwtLYr8kGYV6z0/SvomV28oGhAgJ7EJJ0wdX+kP15no0moelSOZUHZfsOhU
 kOnejWail1dHArMtUKar11ZO0pXYIPxCt54e4UhKBbc+Dr+ug6MVesYPVMDCGTSLY6wu
 e4eA==
X-Gm-Message-State: AOAM532QpdVHhbPMVTJGQJ+JSbAi+9vfNhulYAvSI1/aWw14/Vvy8ows
 EBVcJrE9PFXqxUXq6ngPcu0=
X-Google-Smtp-Source: ABdhPJzMLT7WIFyNAMHQDuDzdfxQyTtiKWBuEWMnuEY/ymLqsiTNyI9DErOcjnJIXPVV/jnI4QtlIg==
X-Received: by 2002:a17:906:19c6:b0:6ce:98a4:5ee6 with SMTP id
 h6-20020a17090619c600b006ce98a45ee6mr22261932ejd.567.1650542564736; 
 Thu, 21 Apr 2022 05:02:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 i41-20020a0564020f2900b004204c9911a6sm11324228eda.10.2022.04.21.05.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 05:02:44 -0700 (PDT)
Message-ID: <f3cfd7a0-748d-58a1-528f-b0285dd64ea9@redhat.com>
Date: Thu, 21 Apr 2022 14:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 24/34] configure: switch directory options to automatic
 parsing
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-25-pbonzini@redhat.com>
 <CAJ+F1C+hjPLUSE8N2khDROT_G2-D-8X8M5W4Uf+F2r+ewgGz+g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJ+F1C+hjPLUSE8N2khDROT_G2-D-8X8M5W4Uf+F2r+ewgGz+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 11:48, Marc-André Lureau wrote:
>     While prefix, bindir and qemu_suffix needs special treatment due to
>     differences between Windows and POSIX systems, everything else
>     needs no extra code in configure.
> 
> 
> Afaik, it's not common to install binaries under $prefix on Windows. I 
> don't know any open-source project doing that. msys2 explicitly change 
> it to bin again: 
> https://github.com/msys2/MINGW-packages/blob/master/mingw-w64-qemu/PKGBUILD#L94 
> <https://github.com/msys2/MINGW-packages/blob/master/mingw-w64-qemu/PKGBUILD#L94>

It's not, but it's been done like this forever in QEMU for the sake of installing
in "C:\Program Files".

I didn't want to introduce visible changes with this patch, but we could
remove this special casing, and apply it instead when building the NSIS
installers.

Paolo

