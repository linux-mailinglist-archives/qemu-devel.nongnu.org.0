Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995C58531F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:55:37 +0200 (CEST)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHSKu-0001wA-FQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHSJR-0000MR-Oi
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:54:05 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHSJQ-0000Ds-2M
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:54:05 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 c19-20020a17090ae11300b001f2f94ed5c6so7321902pjz.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QSuU6VcF7rhN9abmoizMgnOVRF4ayugKMhjfjgRmqSA=;
 b=k3M71yWwYrK5HonJb4ilO3sfCK2PB+ipl5n77ne0xs+0mof+VrtGC3N97Y7T7smv0U
 o+wm8siSY/IdXTqXXEKCZt9Frgj5heo+zNQ0LypR/6CihJxyliDwlLwK8xVb6ujqMIvo
 OuFF67/qjwv0qtf3eacUelWYXdZ1WMpf403VBk69/fkd8SNKFT0FTuE9p4lC0wyAySoB
 ovj0MpeParYbtqiSOJQQengantOM+vhmko9hdOSpU1Ymt8VcPmtYH0t6iAAiFUMZCrRs
 zVnsnauvvYBdNYXW7IHynNoGkL2mWe7l0nidSVCFogW5jwKL8MT4VBnVb5QDwiZL55kd
 3TdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QSuU6VcF7rhN9abmoizMgnOVRF4ayugKMhjfjgRmqSA=;
 b=D+MS3o8tmUAVGG3AaIX72xjCeWOPpMKxKuHIvqkSzgKW0G17uc+ml+3DpMUeZsP+a3
 DdckDl9PpeRKtx8SiUDD8GomLwqzV1XvIG2BSo8Xgrz+gR1IrMD8pWNMB/l0/uh1YjU5
 1vjPeOp75k7iq7QGrxKBNP6ojIKh2FWU4KQZn1PkZchARnorcw4zHgwSV5GKwvuhOvE+
 o7jJQ3SCdqfmcDNMniCVdmZWkEXfZMJxOLMNJyAeJ18Vhp25urnSJpHCinNWC0gcV6oE
 IFqPzGdM8FfPWjJq45z9jF8J/X1ArbClDGNJR/Wn9FKRNqBt+8G6Z9/Xe6nwilmqqx6H
 qp6A==
X-Gm-Message-State: ACgBeo0u3/+KOK8n6vaJkuGgIo8/uWcRG4rlR9seMBVANeUYwmkK5eWb
 6G2d/wu6IzkqSkDBeNrQMuA+KQ==
X-Google-Smtp-Source: AA6agR4rjW7VG3eCw3DpPZnqwgVbA4OqhWxqSEbYYlMcmkAxn72ZMPMgO+YoRYt4fvab3e83gEQqUg==
X-Received: by 2002:a17:902:ef81:b0:16d:cd36:7955 with SMTP id
 iz1-20020a170902ef8100b0016dcd367955mr4367708plb.24.1659110042440; 
 Fri, 29 Jul 2022 08:54:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:51c4:5cf0:5954:aeb6?
 ([2602:ae:1549:801:51c4:5cf0:5954:aeb6])
 by smtp.gmail.com with ESMTPSA id
 h125-20020a625383000000b005288b568d17sm3029304pfb.167.2022.07.29.08.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 08:54:01 -0700 (PDT)
Message-ID: <33b09c17-2056-8c14-9a72-510dee9ec3ef@linaro.org>
Date: Fri, 29 Jul 2022 08:53:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 02/60] semihosting: Return failure from softmmu-uaccess.h
 functions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220628045403.508716-1-richard.henderson@linaro.org>
 <20220628045403.508716-3-richard.henderson@linaro.org>
 <CAFEAcA8xGYd34RgGqo8z5Y1TvPMxeB=99genoJEtd=+eKEjReg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8xGYd34RgGqo8z5Y1TvPMxeB=99genoJEtd=+eKEjReg@mail.gmail.com>
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

On 7/29/22 07:31, Peter Maydell wrote:
> On Tue, 28 Jun 2022 at 05:54, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We were reporting unconditional success for these functions;
>> pass on any failure from cpu_memory_rw_debug.
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> So, this commit makes us check the cpu_memory_rw_debug()
> return value in the softmmu_lock_user() function; but Coverity
> points out (CID 1490294) that we still aren't checking the
> return value from when we call it in softmmu_unlock_user()...
> 
> What, if anything, should we do about that? In particular,
> I think that for semihosting calls that write to guest memory,
> if the guest passes us a pointer to read-only memory we're
> not going to find out about that until unlock time.

Not even then, because address_space_write_rom will in fact write to rom, nevermind 
virtual page permissions.  Moreover, there are no failure conditions from 
address_space_write_rom.  It skips non-{ram,rom} and always returns OK.

It's probable that we should be using cpu_memory_rw_debug at all, but should be using a 
higher-level interface, something that (1) checks the virtual page permissions and (2) 
probably rejects semihosting to mmio.

But in the short term, I think we can just ignore the warning.


r~

