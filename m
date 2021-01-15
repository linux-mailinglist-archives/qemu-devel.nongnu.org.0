Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23042F894A
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 00:19:11 +0100 (CET)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0YN1-0007Dk-Ng
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 18:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0YA1-00038Y-Fs
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 18:05:41 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Y9z-0002i0-45
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 18:05:41 -0500
Received: by mail-pg1-x52a.google.com with SMTP id c22so6929129pgg.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 15:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ebnzjwVguKxw/csjqUv7Px25j/JIheXeopz65cUiHwE=;
 b=qeD77m998Bq3PbnJG6m3ie0UaldOxlQw+RpUZ+AnUBE1dH+F9tr8s0+izPpacW/dP8
 U6ltIZ4CulAw5tl/WaNXsCn2KZjv8eEsD6VmHffzEZ1jsMarcXBqQxyBRUMg4SrtearW
 rAvLuOI9bBNyjfBS5QXtex1v9RenAPxUgq2R7nM01WCQeJba8o+gsttr5yZ9RaERJlpt
 739AoRwfELIhAeSG3lAYP1HPpvaEIltEOI4uQVbk9wJff9sPC56pt2x+UGMVpLbEhy1S
 S+CmzXZeuNPRFwRE9Dtm9pMt8+6RbmGkhJVifJOkN5B+JYfcsmDXiwkBubtq3UtDzT57
 2n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ebnzjwVguKxw/csjqUv7Px25j/JIheXeopz65cUiHwE=;
 b=M7UudhnBkNiqHIHlSXSZ8z+rnBYsggUCNQpl/16NRgBHfUq8KiBTxIRhGvWj0mChSJ
 C3YnCqDZCei+yIX6cP8f38vKEiloMsaGJmtkTIBtIeZoyWwp0dur2Bi2+/DTe7hbi0x8
 n4ped74c9k4Ik3j0mfDVYT+HFpDUu5DUHgPd28HUEr3eIncXX3fQGMprvW4bKjqUROaf
 aD3mw2wLOtQ7tcXNiJuuDWWSxachZ1oSBhk59r1EI4HipmPQTW6htehGImETws3amhLO
 gTpNo3Vw7ONfvJd3fkPzhAkt5/lNw9sf1CDjsszxy0FbOz5QxzJoaoMyZGHSLORZucO8
 tfgQ==
X-Gm-Message-State: AOAM531KtR1U8uf99fz+gELmFiuJq7eapE1SnM0DrQDx+0QjpdIZdq0N
 GnsRoahlFAyeHeWQjy/3EuXCuw==
X-Google-Smtp-Source: ABdhPJyqMcg48xApzqn/CTz/KHfhz5fSP5DstEz6Hl/SvOxZYqvVzSAVC0MTx7ao7A3J6XHIl3MJbg==
X-Received: by 2002:aa7:8b51:0:b029:1ae:687f:d39b with SMTP id
 i17-20020aa78b510000b02901ae687fd39bmr15010298pfd.50.1610751936416; 
 Fri, 15 Jan 2021 15:05:36 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a7sm703686pfb.95.2021.01.15.15.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 15:05:35 -0800 (PST)
Subject: Re: [PATCH] cpu_exec_step_atomic: update the cpu running flag
To: Douglas Crosher <dtc-ubuntu@scieneer.com>, qemu-devel@nongnu.org
References: <a272c656-f7c5-019d-1cc0-499b8f80f2fc@scieneer.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd0d8648-d270-2b59-41fb-94f9cbcb228d@linaro.org>
Date: Fri, 15 Jan 2021 13:05:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a272c656-f7c5-019d-1cc0-499b8f80f2fc@scieneer.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/20 9:42 PM, Douglas Crosher wrote:
> 
> The cpu_exec_step_atomic() function is called with the cpu->running
> clear and proceeds to run target code without setting this flag. If
> this target code generates an exception then handle_cpu_signal() will
> unnecessarily abort.
> 
> For example if atomic code generates a memory protection fault.
> 
> This patch at least sets and clears this running flag.
> 
> The related code paths look rather convoluted and it is not immediately clear
> that this patch comprehensively addresses the issue, but it might at least
> direct people to a problem, and it might be an incremental improvement, and it
> gets some code running here. The patch adds some assertions to help detect
> other cases.
> 
> Signed-off-by: Douglas Crosher <dtc-ubuntu@scieneer.com>

Sorry this got overlooked, but better late than never.
Yes, this looks right, thanks.

Queued to tcg-next.


r~

