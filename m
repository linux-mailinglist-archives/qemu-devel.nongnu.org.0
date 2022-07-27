Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4941C581E14
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 05:16:13 +0200 (CEST)
Received: from localhost ([::1]:39628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGXWt-0004N4-S0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 23:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGXU5-0000Or-7d
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 23:13:17 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGXU2-0001UZ-04
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 23:13:16 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 b7-20020a17090a12c700b001f20eb82a08so820456pjg.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 20:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4WC9f5lxSfx7hhl1OarFAfA2LCu5RHfDHjy7VyYabp4=;
 b=kdKm3UYYBeOVX5Lhw1lwvX0HwV0rHuScfB/6Tcv4Lf2DvY2MsJYXfC6IpjC1Bw4sua
 pzNfjqPVOZd7xt5ob0p6Q1Qk/o8A93DFs2T7HhQ6o/GBSdD6NmgAdUZa0wpofVtS4dQj
 /CJnHh2chx7xaTPSKe5+sJRIY8fbS30jeDthFVYbmiKBG9z9jMYDHxr6zSzLpAW7BhyW
 +WsLqChqTf8cEPrj0PYkakFLZIEenH0uNL4ND6N8WSnDsfmuWRuQWXyyqdPYylzsL+18
 N7DAHJTAl4MQa8oh60Lx1jaUvi96oa82C3zUrxoOUnbB7GvnG0dKoPlKqh2UE6lKfynX
 r+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4WC9f5lxSfx7hhl1OarFAfA2LCu5RHfDHjy7VyYabp4=;
 b=sVV9LOTDTQ+Ew0XRhNYSJ/tX2K54qD8bcuguVe7995vJPkfM3GUGPNbTroUDejEMfH
 ARt/cznS8afC7Ok38p2MK5GnOhzeDm22lpuyrZohiVSETsrBsTqhFYBxrE5OyAD7Lo8X
 bOzbR/mYkXEhLZ0PuugtvRUI1bCeVkGFOLjSws52nfW+humMIe1E35O61+wMctBNDUPB
 lCJQP2T0kLIgp4sdYJXgvSk6PBzv3vRdslMey7pL/Tdv8LllNp50rY26/D0r0/BSc0pA
 1uqhgGC3GiP4zzpIgkD3Yi2yrDSIiDXjAvbhqOh3+7q/JiMFPTQzX7N0/oUnn+WWV9/t
 IMLw==
X-Gm-Message-State: AJIora+ml+BKqstTo5FUfIM2jL5Fml3gln93ZS21UUQv2VHbxKkM/RlQ
 Xge9rdRCxPEVuiPYQbfzSGr/aQ==
X-Google-Smtp-Source: AGRyM1tJ5OLUBSihisF29lFu8Eb0THnm+ZintwWiaEkVTVUrAQByfOzpbeKJBzE9NuGJiEF21RpLaw==
X-Received: by 2002:a17:902:ce09:b0:16c:c7b6:8b63 with SMTP id
 k9-20020a170902ce0900b0016cc7b68b63mr19773969plg.35.1658891592320; 
 Tue, 26 Jul 2022 20:13:12 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:4e4e:de15:7ffb:6b9b?
 ([2602:ae:1549:801:4e4e:de15:7ffb:6b9b])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a170902784100b0016d4f05eb95sm8227697pln.272.2022.07.26.20.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 20:13:11 -0700 (PDT)
Message-ID: <0c5d679f-367f-080d-7c46-137383fd054c@linaro.org>
Date: Tue, 26 Jul 2022 20:13:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] hw/microblaze: pass random seed to fdt
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220719122334.136290-1-Jason@zx2c4.com>
 <CAJy5ezq7_F6uDrY6RuXe5ru0mAbmx-pBTQoFCtZj4DhEM7EZpw@mail.gmail.com>
 <CAHmME9opYzwtK4oJo1bZo+9FDbXt6TfgybtFTfQpxqx6pOoGWA@mail.gmail.com>
 <CAJy5ezp-x2R=4yg=S6Tq2U67N8J2mkXNJ=wkv1oqB3r37hiunQ@mail.gmail.com>
 <CAHmME9r1L5PV8GB4HL+7QW7LRmy1fEh54A57M3aQ+0K_OwLPdQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAHmME9r1L5PV8GB4HL+7QW7LRmy1fEh54A57M3aQ+0K_OwLPdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/26/22 18:49, Jason A. Donenfeld wrote:
> Hi Edgar,
> 
> On Thu, Jul 21, 2022 at 8:43 PM Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
>> Ah OK, Paolo, it would be great if you would take this via your tree!
> 
> It looks like Paolo never did this. So you might want to queue this
> somewhere, or bug him to take it, or something. I don't know how this
> works with 7.1-rc0 just being tagged, but I assume this means this has
> to wait until 7.2

Yes, it has missed the window by over a week now: soft freeze.
You really should have kept all of these in one thread.


r~

