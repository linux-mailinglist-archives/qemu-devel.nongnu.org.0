Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D125B2CA78A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:00:19 +0100 (CET)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk84g-0005o2-U6
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:00:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk83V-0004EN-GO
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:59:06 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk83O-0008MJ-2v
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:59:05 -0500
Received: by mail-ot1-x342.google.com with SMTP id f16so2072852otl.11
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kT4blV82+ZRTD4Or5hWLVKblOjgz3AusGOV/ZjlB7tE=;
 b=xPYmBQjAGmv55b1pI4ptH1KRkBgqrcN13czBKo7CRByhIdrSkXfDRnV2fv7SlM7494
 3QL6Im8wOthjf/Xcj/l42SvFJkflPf+OEY44ndIChJHkfwLKSaQ8y5MHaQv5QaoQdUVD
 mqkdpdDqsuvLJXZpIo8VjCdN3/BRkGl8PND14Ahems4F+Tui0A+hJI9NpzG+tK3FS/CJ
 TqhkFCnziy9RJ1nqZb+n/igKzPdkLHUcxJcMyLV7GuZUWFx43+z3GFW2TVAphxqINiSQ
 dxAN1Ue5sxjBwDZExvqBWY19jcNGSkLXzWqdOCQ4JvkO+5f41BPSKV/bI1H3gnrk/VZ1
 FGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kT4blV82+ZRTD4Or5hWLVKblOjgz3AusGOV/ZjlB7tE=;
 b=hSV4Pg9DnJKJbiMV/j3yylrVxkHLPOwPVspHsoLUxiRB7R7o6H1E//l+M6MvDLQxQp
 jRMIHZxgwhpcTh1CNRytUTXpiH1bNabd1fBtSk4shF7H0D3hxgX41gSvIf30UKS+gx+a
 XVvnYjXK4HvJbUeaKrjfH8WS1d61XHydcEbdDPRUiUXa1HFOJGdNjJ67n6oO9Md/r6rH
 geCqF11amEaphTwe3gLmQKPIKGi65ZRa9+8qL1Ur/wU1ZNOdbNZUcK63CAM0009Iq0OV
 vXFzoxChRnQUV2jkGWp6vKBMAbaKorjy+k9OOlipA9hHKOWByQOR967+8jptmUpMedw8
 t4+Q==
X-Gm-Message-State: AOAM531mvjixh2OHTMvanvQBYjUK2wJFLRgs8OJ7lpKJDnD7j0iTxjcy
 aO2RbhwN/OCw+WsJa4N038iXd3dgiYqT1n7z
X-Google-Smtp-Source: ABdhPJwS1d5olJo/7QiecsZCjRi42ecKEfz6Z/nmnJSvosJwbAZ2DqQH6RHRmZlfhpL/ouv6tKOqGg==
X-Received: by 2002:a9d:2d84:: with SMTP id g4mr2276647otb.212.1606838336594; 
 Tue, 01 Dec 2020 07:58:56 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id r4sm21631otd.66.2020.12.01.07.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:58:55 -0800 (PST)
Subject: Re: [PATCH v2 24/28] hw/intc/armv7m_nvic: Fix "return from inactive
 handler" check
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30bcef40-a260-91c3-0693-f017446f4916@linaro.org>
Date: Tue, 1 Dec 2020 09:58:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:56 PM, Peter Maydell wrote:
> In commit 077d7449100d824a4 we added code to handle the v8M
> requirement that returns from NMI or HardFault forcibly deactivate
> those exceptions regardless of what interrupt the guest is trying to
> deactivate.  Unfortunately this broke the handling of the "illegal
> exception return because the returning exception number is not
> active" check for those cases.  In the pseudocode this test is done
> on the exception the guest asks to return from, but because our
> implementation was doing this in armv7m_nvic_complete_irq() after the
> new "deactivate NMI/HardFault regardless" code we ended up doing the
> test on the VecInfo for that exception instead, which usually meant
> failing to raise the illegal exception return fault.
> 
> In the case for "configurable exception targeting the opposite
> security state" we detected the illegal-return case but went ahead
> and deactivated the VecInfo anyway, which is wrong because that is
> the VecInfo for the other security state.
> 
> Rearrange the code so that we first identify the illegal return
> cases, then see if we really need to deactivate NMI or HardFault
> instead, and finally do the deactivation.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 59 +++++++++++++++++++++++--------------------
>  1 file changed, 32 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



