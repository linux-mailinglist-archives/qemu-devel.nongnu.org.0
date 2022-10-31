Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E4612E9E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 02:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opJaz-0008L7-G9; Sun, 30 Oct 2022 21:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1opJaw-0008L0-Tt
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 21:28:06 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1opJav-0006Yl-8z
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 21:28:06 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so14599732pji.1
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 18:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z1fMt94J1kz3TwP77XQHxXKg1UGWfHFzdWaU+dGb2OE=;
 b=WzMy2v46LZ6ZLhgKJCEkMVn3t6n1X/x/k07GMbcb5OfsiO8bTrOxyJ2I625tgF+Qk/
 gCX12RKwcA30YMR5wIea/919AJ3sdSjz+VKEbzb/h+ttpyspcfzUkpKIAyyAn/vuTqBD
 DuA30TZCOt8tU6M7jlGJxuM5wDaWq5gvNHFCTuRkJVt/J6e/+MKnP2iNuT8WHLkF9Rlc
 pmVvDKJ76SVOc25dwMreco5Le6hk//mV/KtWMp4fEMSGPReQQwbRX6McCMSpM5/jPPRt
 OKN8uWhr0QVeiCvx3QGncmWgWhUAiuraq+rkEm055RM2XODyt8EDLABCy47PxkyQsbuo
 Wbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1fMt94J1kz3TwP77XQHxXKg1UGWfHFzdWaU+dGb2OE=;
 b=kJbOAjzKa6j5+JN4D3cHBozkol5GrRHlrrHltYe16pFP84UpfSS9WqO0+9dUsw+yxU
 GW+97OafvezeG8R5Tcjt7ET7lcGsXy+eLFYn46YywGS5jaBMn7czLqjRbIFYKoWf692+
 5bv7NUc6RsdPMhku7RCHc+YlAXD+HDOT3oyR5SZa6SlK0OUViEjJ+X/i1WhRs3ntyXDg
 f0AIZU2/DGINdVmFYIBCYN+Ib4tspIraiHSULdwvdwObLLZsi2GmfvNvdcJ9aruuJwdQ
 9Fd8kh6Xz6ex/1F10a/qnU0VEueHrpYUiSESqAh470exwCTPgLJ+GwR+OzPy1Eu1cL9V
 uQXg==
X-Gm-Message-State: ACrzQf2cywfe+ydgssCQ7da2wsedSOaC2pRLDsoQ/XlU6nkoUAfW/xJv
 KIXY/4DZQiTxv1J+V+p+aV8=
X-Google-Smtp-Source: AMsMyM625a0s5kVCa1gxQZqwKrvges77lnwhKW8Ll72tOjy6YE7Q/gBMWcjnZD4C3Fjo4i1pvWwBIQ==
X-Received: by 2002:a17:902:ba8f:b0:17f:9b1b:6634 with SMTP id
 k15-20020a170902ba8f00b0017f9b1b6634mr11901856pls.171.1667179683567; 
 Sun, 30 Oct 2022 18:28:03 -0700 (PDT)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170902654c00b00176acd80f69sm3217016pln.102.2022.10.30.18.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 18:28:03 -0700 (PDT)
Message-ID: <64575f86-b37f-561d-537c-cea46a5bc816@gmail.com>
Date: Mon, 31 Oct 2022 10:28:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] ui/cocoa: Support hardware cursor interface
To: Elliot Nunn <elliot@nunn.io>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org
References: <54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com>
 <CAFEAcA_bip7nifW-Zq8qrSmZTCUQA1VMpMR8HSHsKVBAeQxy0A@mail.gmail.com>
 <CAMVc7JXPi3kbFyrN9757uKt-cUprKUBLM9nuDMRjawtVePVVAw@mail.gmail.com>
 <5232C333-9F52-455D-A0D5-B1A438800717@nunn.io>
 <a5029b6b-d0a9-a379-09c0-05d6786af0f2@gmail.com>
 <A51A48EC-0616-4325-84F0-BDC8846F46A7@nunn.io>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <A51A48EC-0616-4325-84F0-BDC8846F46A7@nunn.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2022/10/30 19:12, Elliot Nunn wrote:
> Akihiko,
> 
> Sounds like you've done a lot of work on ui/cocoa, with the goal of
> improving the experience with modern Linux guests. My goal is to improve
> the experience with antiquated Mac OS 9 guests.
> 
>> My patch has been only tested with recent Linux, but it certainly should
>> be ensured that it works well for old systems when upstreaming.
>>
>> First I'd like to know what display device you use. It looks like
>> dpy_mouse_set is used only by ati-vga, vhost-user-gpu, virtio-gpu, and
>> vmware.
> 
> I was using my own hardware cursor patches to the VGA device, but now I am
> using virtio-gpu. My Mac OS 9 driver for virtio-gpu is in progress.

Interesting, but I'm worried that your driver may be not performant 
enough to drive dpy_mouse_set. Does your driver provide hardware cursor 
as smooth as software cursor? If not, the proper way to fix the problem 
is to fix your driver. Strictly speaking, ignoring dpy_mouse_set and 
using the input information directly violates the semantics and should 
be avoided if possible. That said, if your driver already does the best 
to the extent what Mac OS 9 allows and you want even better, it can be a 
worthwhile option.

> 
>>> 1. In absolute pointing mode, re-enable Cocoa's cursor and let the host
>>> OS move it according to user input.
>>> 2. Keep the cursor sprite, but move it according to Cocoa's mouse
>>> movement events instead of dpy_mouse_set events.
>>
>> Also, can you give reasoning while 2 is preferred? 1 would allow to
>> exploit the hardware's feature for cursor composition, resulting in
>> smoother experience and a bit less power consumption. But there may be
>> complications it can cause so I have not decided which one is the better
>> yet.
> 
> Mainly that it would simplify the code. OTOH, if we expect the guest to
> use the hardware cursor facility, then it's only fair that the host does
> the same. I'm open to either option. We should probably try both.

Regarding the code complexity, option  2 can be still the better option 
because option 1 requires additional code to pass the input information 
to the cursor composition code. But it is just a possibility and I guess 
we will not know which is the better unless we implement them as you say.

> 
>>> And I didn't realise that you had added VirGL support to cocoa.m. Well
>>> done! Is it on track for release?
>>> My patch should be withdrawn from consideration, in favour of a future
>>> solution that does not use cursor warping.
>>
>> I'm not really pushing my changes hard so it's kind of stale. Perhaps it
>> is better to rewrite the cursor composition patch in a way that does not
>> depend on the Virgl patch. I'm also aware that the cursor composition
>> using Core Graphics is somewhat laggy so it may be better to rewrite it
>> using subview, Core Animation, Metal, or something else. But I have not
>> done that yet.
> 
> Is there some Cocoa-native way of compositing within the window, that
> will work with or without a GL surface? Subviews sound appropriate.

I'm for subview because we can retain the current implementation using 
[-NSView drawRect:] for the screen output in this way. The current 
implementation using Core Graphics or OpenGL for cursor composition 
should be avoided as Core Graphics cannot accelerate it with GPU and 
OpenGL requires the deprecated CGL or an external library like ANGLE.

Regards,
Akihiko Odaki

> 
> Not that I have any influence, but I think your virgl patch is an
> excellent contribution and should go upstream.
> 
> Thanks again,
> 
> Elliot

