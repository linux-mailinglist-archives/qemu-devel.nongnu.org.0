Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239F2258359
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 23:16:35 +0200 (CEST)
Received: from localhost ([::1]:33884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCrAI-0007KI-1j
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 17:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCr8I-0005ml-8S
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 17:14:30 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCr8G-0000pn-DI
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 17:14:29 -0400
Received: by mail-pg1-x541.google.com with SMTP id 5so1409424pgl.4
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 14:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=22ecnwz+xQW3jC3RmGUWnbBUJnB+yHXpUAC3wkYPOZM=;
 b=CLNxAAe+WaENWsLmNvra+PCKEJZZf6eskpqFY0XUytZPyrwF+gwAoBmmROdwcAwA0V
 K6DRuLe1WLT+w6qRdoAmu9xXNBGEA+/op1R6Q5cQfCMk2jMMvLW/uJaaZvnQG4HHGWHH
 5KBlGPcTzODDiwfvc5hMN6blYqmAhi3mGieoRhSzDILvb2ZxGMo6t9n9lyntTJcPF2hv
 5hUB4KSxIN2+pVXvEIm+3yIEYnHvtM8XnX4JpbksTmOy/mAApJsEuDGPxfYgtI8a4uq/
 aGb0NwFLUC1T2jANlvuz94ZxxPa1Q7rCeVXwDPuTFjGIx2/H4n+w8gfD6WIgME8RqXR1
 bIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=22ecnwz+xQW3jC3RmGUWnbBUJnB+yHXpUAC3wkYPOZM=;
 b=G8c2LanH8XnoOoMgJ8Le7T+YRo7sIOzAeWWxIeKXsR52JmHgYutE6pXWVJz1aWOkDo
 X4cp/IpDYkzYxz6o4THrSETW39CH19xfHhnL0NZnKTxWsynPjqjuH+UhCZeVjoir5HSg
 E83cmtUCvp9TJsjB1P/XfCvj1BEOft3wSSuUU4UY5Ffu52dUZpIsqw0F8XOqvY8tvTMF
 IVwOadLMGpHEhbth1ip9yTcGNUBVjUe3fLga177oyTYrhWojzJAxmEFW0NvXrBTYFzYu
 eywe6q/VZpTdmyVBu1fBMjwjaKA54dQzcQVmr2UEyLsD8VM5fu3s52HjWC3eReWEUujb
 Oh1w==
X-Gm-Message-State: AOAM530aXL108ncg5Tkj4eFMZm8JfEvjRYN+R+943thCb0GIryUpJ58U
 rKZGD8+SPlIgMyo7sdwXQMUnig==
X-Google-Smtp-Source: ABdhPJxFuPR+29HZdaPJx2lHNbrzWzLlBqAb9kdsGjblmeTNHekGacpovLmbUh/crggwrgUfOdrouQ==
X-Received: by 2002:a63:4923:: with SMTP id w35mr1200787pga.368.1598908465353; 
 Mon, 31 Aug 2020 14:14:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l145sm9590077pfd.45.2020.08.31.14.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2020 14:14:24 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] target: rename all *_do_interupt functions to
 _do_interrupt_locked
To: Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org
References: <20200819182856.4893-1-robert.foley@linaro.org>
 <20200819182856.4893-2-robert.foley@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45ce8b56-a00d-9504-7eeb-e4cce4efed31@linaro.org>
Date: Mon, 31 Aug 2020 14:14:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819182856.4893-2-robert.foley@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, peter.puhov@linaro.org,
 Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 Richard Henderson <rth@twiddle.net>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, "open list:sPAPR" <qemu-ppc@nongnu.org>,
 pbonzini@redhat.com, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/20 11:28 AM, Robert Foley wrote:
> The rename of all *_do_interrupt functions to *_do_interrupt_locked
> is preparation for pushing the BQL lock around these functions
> down into the per-arch implementation of *_do_interrupt.
> In a later patch which pushes down the lock, we will add
> a new *_do_interrupt function which grabs the BQL and calls to
> *_do_interrupt_locked.
> 
> This is the first patch in a series of transitions to move the
> BQL down into the do_interrupt per arch function.  This set of
> transitions is needed to maintain bisectability.
> 
> The purpose of this set of changes is to set the groundwork
> so that an arch could move towards removing
> the BQL from the cpu_handle_interrupt/exception paths.
> 
> This approach was suggested by Paolo Bonzini.
> For reference, here are key posts in the discussion, explaining
> the reasoning/benefits of this approach.
> 
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00784.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg01517.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg08731.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00044.html
> 
> Signed-off-by: Robert Foley <robert.foley@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

