Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C228E6DFE13
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 20:55:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmfcu-0005uR-99; Wed, 12 Apr 2023 14:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmfcs-0005u9-OS
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:55:26 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmfcr-0004Ec-33
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:55:26 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-94a34c2bc67so236357666b.2
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 11:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681325723; x=1683917723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V4pWJbzUQpY8EmvUozfn2vkGqj1/INMaAK1x13wucOs=;
 b=toMZkIj6jmJNXgvJM2iCJhd+tD4KlpE79RuzB12bmf2Vf6UYUICXsSC75ScnWgNUlp
 tNF09+6k1wHrTegGkF+f3yr7jQ460DjY/5MoH1XJXhPYVXFBWkltlvFLbpRHOS3TyzEy
 qNV0aH3PtcM/Ao9OvaQ6Lgo5RbfjMqNgHeaqznU2zrfidOotrI8elhxFU891tmc2KMWm
 IbeT3qpoGz+4emMfmcmeYbAj4t+ZGsD76hNBskqsfWYLEaDfiMkLgGmwEd5OsO+TXFF+
 CIhidmHbcloULT6o0kItJmZYi1RglGW+MqFbeYMRkHQkYwjGDoJKusElTRbKQhNnEAZr
 tcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681325723; x=1683917723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V4pWJbzUQpY8EmvUozfn2vkGqj1/INMaAK1x13wucOs=;
 b=BtkGs3zM89E1QS/ggdRWtlQHAwrecJfHpg1UI+1JqybvQX7d8A4cj+D0k89xYlrJcJ
 WfmSe5YTlexUrLv2R9rfCBDQh6FlfmNHfvAd+xftkyi75lVEDKEweY/RdevVenYZij5X
 WwcLjkVvMrJKv6WnFfZ12BYFP6+aOqcEY1So4VqdzQftM/nKws2B1An2FnKNDhZ+ihCg
 zCBIqIERbAYJWguEblhtIWkKU8mWLk2INXOLnoA51E21O1qgGOz8AHpY8IYzare7CcE2
 Bbjq3rfO4OFDt1MoUSZQv4pH3eEseuvJV5xoSZStOTQp11kzep9NQ/ox37p3FAqHKQBz
 nWJg==
X-Gm-Message-State: AAQBX9f26hB0fBkjnDcQvMA2Ct8pmK5qEPBfHW+pVWAmyayOzAiNn9g+
 iIU8h9/EKkAJ4jaK8ofz8zwyByLcEZB0qXjUCGPkNw==
X-Google-Smtp-Source: AKy350brHiGejy7/I5Am1Uiea2aUHJKtqkhZKfRHYEYkw1NA/RSGTtjpBQnE8UYQsaFjrtq6Yg3S62pCjzMkAKOp+BA=
X-Received: by 2002:a50:9f65:0:b0:505:521:7880 with SMTP id
 b92-20020a509f65000000b0050505217880mr1384308edf.6.1681325723523; Wed, 12 Apr
 2023 11:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230412185102.441523-1-dwmw2@infradead.org>
In-Reply-To: <20230412185102.441523-1-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 19:55:12 +0100
Message-ID: <CAFEAcA9G0KpkOivD8fBvEQwGcTsUQz53z5W53YcjcHmZGPHkmQ@mail.gmail.com>
Subject: Re: [PATCH for-8.0 0/5] Xen emulation build/Coverity fixes
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, no Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 12 Apr 2023 at 19:52, David Woodhouse <dwmw2@infradead.org> wrote:
>
> Some Coverity fixes and minor cleanups. And most notably, dropping
> support for Xen libraries older than 4.7.1.
>
> I believe there are two issues that remain to be fixed. The x32 build
> fails, and I've seen patches which attempt to detect x32 and disable
> the Xen emulation. Along with assertions that we just shouldn't care.
> I don't have a strong opinion either way but it seems to be in hand.
>
> The other is the question of what Xen *actually* does if you try to
> unmap an IRQ_MSI_EMU PIRQ. I don't think Linux guests try that, and
> I'm fairly sure Windows doesn't even use MSI=E2=86=92PIRQ mappings in the
> first place, and I doubt any other guests care either. I'd like to
> establish the 'correct' behaviour and implement it, ideally before
> the 8.0 release, but it's going to take me a few days more.
>
> David Woodhouse (5):
>       hw/xen: Simplify emulated Xen platform init
>       hw/xen: Fix memory leak in libxenstore_open() for Xen
>       xen: Drop support for Xen versions below 4.7.1
>       hw/xen: Fix double-free in xen_console store_con_info()
>       hw/xen: Fix broken check for invalid state in xs_be_open()
>

This is highly unlikely to make 8.0 at this point, FYI.
If there's anything in this you think is super-critical we
might be able to sneak it in.

thanks
-- PMM

