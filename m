Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD55652664C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:39:10 +0200 (CEST)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXNl-0007sa-Hs
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npXJ0-0004Mn-A2; Fri, 13 May 2022 11:34:14 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npXIy-0006hS-Pc; Fri, 13 May 2022 11:34:13 -0400
Received: by mail-ed1-x52f.google.com with SMTP id ba17so10425111edb.5;
 Fri, 13 May 2022 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uKF/OaF2U5Ze8wB6DHbE8BQy3DLd0gCTSk5bNtFgVyk=;
 b=iv7FxewJfpo0Ti6Sz3c1Tscm1ikFzv3q1eDLGIlyE/y8Jj6/PBy2/Ohw6eNyD9nbmF
 yDtOsom6LbbeMTx1QFORRbeu/8dywXCSsVsm6CvQhnrgUAkHvcBC4rXBlgnXRNl5u5ca
 BsJzZM74wTrzQRyeQpVSokvosQ9efSwVjLcfh78gVNyhx/TEg4/RiA1e4ew7E8BDXtZ4
 9rxam3PyipE6CZZyt/t0CEvhC7ZHBrSgWdckBgF7ZlGDYSlvwndS5VyBW6mJVkgaclQd
 /A+PAGIJpIEMKCzz9xEaWOjPquNR8w4rmPJA/gY2cd7FvQbKvmt887deJhQ/INSyQrFJ
 PnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uKF/OaF2U5Ze8wB6DHbE8BQy3DLd0gCTSk5bNtFgVyk=;
 b=h3eSIu3HXVm8FpqRWbRHAV6dlrJAxGCmvnCpDC6czmmfxdDINU0F36le2DzBmC5Pkw
 LyyBJOUUNMbtH3egthHtWKLd7SOmKWycOw7yVO9nxUJu4Kc3hcsetBqMTE2rRKhI2Gcm
 vMmvV/TcyTc3j665B9WLlcg9fimGyuY/M7ViayiNEIskTCH78th0oXiGSUg6K/+rBRY8
 h601QTJ4Wzt0wgZWcxgrED2mpVuJRi9PgBUrmUtVLP8aiE93JRJMwRPJOBTjEtE+vedX
 HbueLGgNmE2olBiBL5nCbI82tZEk1EgQStjnJgRmIGUSgvI0Z2talTYtyTSOW1McSfab
 nv+A==
X-Gm-Message-State: AOAM5321ObXe0GZYfdYNzKBOM850rvsnWk7NhBGLam7rMjkuidUbr3MC
 GmHjrRomlt1oW+JjfyzAAfc=
X-Google-Smtp-Source: ABdhPJxvjR15YVFbpOsq4yPlK05CdohKPhGBCgm9m8u82YtxaUTPu+kx4eaBb9WIDFzfta/79rnAdw==
X-Received: by 2002:a05:6402:50d2:b0:428:b39:5c08 with SMTP id
 h18-20020a05640250d200b004280b395c08mr41092778edb.146.1652456050786; 
 Fri, 13 May 2022 08:34:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 n19-20020a17090673d300b006f52dbc192bsm894864ejl.37.2022.05.13.08.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 08:34:10 -0700 (PDT)
Message-ID: <e55f3fcc-28c7-9bd5-bc52-526106ab7eae@redhat.com>
Date: Fri, 13 May 2022 17:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 6/9] tests: add check-venv as a dependency of check
 and check-block
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
 <20220513000609.197906-7-jsnow@redhat.com>
 <cce38c36-30d6-2868-8e50-570216891549@redhat.com>
 <CAFn=p-ZXjaGN8Sf8+UxS9q1-xZD4_g4A6MBes2ip3JevUt1Tpw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-ZXjaGN8Sf8+UxS9q1-xZD4_g4A6MBes2ip3JevUt1Tpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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

On 5/13/22 16:12, John Snow wrote:
> 
>     I think you need instead:
> 
>     # The do-meson-check and do-meson-bench targets are defined in
>     Makefile.mtest
>     do-meson-check do-meson-bench: check-venv
> 
>     and I would even add "all" to the targets that create the virtual
>     environment.
> 
>     Paolo
> 
> 
> Great, thanks! I'll try that out today.

Well, check out the other suggestion of creating the venv at configure 
time, because that would remove all these complications/annoyances.

Paolo

