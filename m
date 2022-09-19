Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADC15BCD68
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:40:58 +0200 (CEST)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaH17-0004XN-B3
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaGwF-00074J-BZ
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:35:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaGwB-0000rK-UY
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663594551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c5YyjWBJrmMqOD7FJT66vsGalm1lmHtYNpSG2RXsMVc=;
 b=H1TqEE50Q01QcYomdYKyQMZwPxspIWknY1AV7sqc7pkGLHYbIt/deDpNmqY2DdsFGGBNxg
 3szYIPc2nO/e/HUsXSEpryklYU8Q2B2Yx4YdTrwWvXfFOWM/Y2JEGeZl3w+/m9NKfC8IGJ
 yfnExDG+8pb7KTGVmk1vBkUAG2Do/Kc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-rb-b3CxyNmyIms9HUzEVjA-1; Mon, 19 Sep 2022 09:35:49 -0400
X-MC-Unique: rb-b3CxyNmyIms9HUzEVjA-1
Received: by mail-qk1-f198.google.com with SMTP id
 d18-20020a05620a241200b006ce80a4d74aso12979781qkn.6
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 06:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=c5YyjWBJrmMqOD7FJT66vsGalm1lmHtYNpSG2RXsMVc=;
 b=SNInDjgoos+xpXLIIQL+XC7d/pmH1iLAZlvQUo/8W6ggRg20g+g2oigyKpysFJyCum
 Nr/L1HCAKIRz7M36mFQRwVQQLcw7AV46mJcGu3sTXWkLkEDHXnwrDo4v0SZ3xzEp7ssC
 XGVSTgWFO9H7SB7x3OhVUEBFXLEtCtOqnKCEykgY1lIsYRi7XXXGNkyJaDv87p9z7Y/h
 MvEtx57Lpxlb+LQdlhUt+ipThkSetGBYsV9GM+AK0uY/xT+iOynF0kBHnbrIv2KxJNAg
 rD9mDjy2G+VktGGArfKkdxbH/rJ1Tz0tAG43LbPfjetHIGUbIzXXBd2WxNRcS6DZVPMb
 XlKg==
X-Gm-Message-State: ACrzQf3klXw8btd6F6CL5+Ntuyqxqztu3sftpB3t5j26oYWhOjbvOtkH
 pI1ifCXWxkL2XN1UFbxRIpUhWKrg24zdcMOTvUZcTbwofmJVSanOwdwoZRwgbwiII4YAzamEX95
 0zgCatoa9+feTrG/9aa57AGNuaLPEVTw=
X-Received: by 2002:a0c:a90a:0:b0:4ad:715:897 with SMTP id
 y10-20020a0ca90a000000b004ad07150897mr14609498qva.114.1663594549227; 
 Mon, 19 Sep 2022 06:35:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5N1MFmjZ5+UD5+V6HhOX2l12SLyeEmws1yu0D/Ovk1cSKn+10ERAdQENJKepLq7OxpZo2Wn/EMjOUSFN87MgA=
X-Received: by 2002:a0c:a90a:0:b0:4ad:715:897 with SMTP id
 y10-20020a0ca90a000000b004ad07150897mr14609487qva.114.1663594548985; 
 Mon, 19 Sep 2022 06:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220916133603.693135-1-Jason@zx2c4.com>
In-Reply-To: <20220916133603.693135-1-Jason@zx2c4.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 19 Sep 2022 15:35:37 +0200
Message-ID: <CABgObfaCzWEcwTxFNRyrBFR72onpeMuEA=NZb5YDVbMpmJSaMw@mail.gmail.com>
Subject: Re: [PATCH qboot] Place setup_data at location specified by host
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Sep 16, 2022 at 3:42 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> QEMU places setup_data at a particular location, which cannot be
> relocated due to it containing self references in absolute address
> terms. For this reason, it supplies the intended location in
> FW_CFG_SETUP_ADDR, which is what SeaBIOS uses.

(Technically not SeaBIOS, but rather the option rom provided in QEMU).

> So use this too in qboot.
> This also has the effect of removing the 8k limit on the copied size,
> since the header is copied to the right location from the beginning.

This was "intentional" to make qboot more similar to the edk2 linuxboot code.
At the time it seemed like a good idea; of course it was not.

If I understand correctly the bad situation cannot happen because
QEMU and fw_cfg share the same code to decide on the setup_addr.
Unlike with the UEFI handover protocol, qboot always boots the
real mode stub. Still it's a nice fix to remove the 8K limit.

Patch pushed to qboot.git, and the submodule update will be in the
next pull request.

Paolo


