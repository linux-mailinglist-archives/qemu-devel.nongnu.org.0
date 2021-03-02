Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A000A32A6CA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 17:59:04 +0100 (CET)
Received: from localhost ([::1]:39830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8MR-0000Ee-My
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 11:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH8Lh-0008Dn-C8
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:58:17 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH8Le-0005uR-Lr
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:58:17 -0500
Received: by mail-pg1-x52b.google.com with SMTP id o38so14194594pgm.9
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 08:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DPNNSFXnxoCc2lptsMJfu2XONSjFsCEZGEv+SmVhx1w=;
 b=hNC2ALIrBW85ehxCebze7OhcJk9lLBNGq4E6hNhTu5WHse9Gb9cRHzm1IQX2+g7QKh
 I1OnHapXEIdZBrMPSQxjDit2Oj/VSerrzSlR76thvgajh1Lf/F5z87yMOv8i5cp3AGir
 xA8U+9R1WweljTXD6KgGjUCdnsEXxcxC1gAfZ5amiWVVkqJ53BJeLwNas/zI/mj3e+g2
 aTRVOxwjoMSTb2rEzAQMlvfDk7+JqWKFzVZxTF1nnItFwF0W1NOT2Z2OW+p4Tb2pamMx
 U5faJAV0VPffk/g49we3cw5jkfsIlcLx+OT32rS7KrspusLOlYiTWYpFEAhCp30GbMQa
 erUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DPNNSFXnxoCc2lptsMJfu2XONSjFsCEZGEv+SmVhx1w=;
 b=La5o9ewfOfiXjh1UVVbvzE4F9XbEFIACBvt33CgbQUjwTyeK/bmIGLMHVvBPksRNoZ
 T6Y5BEJWfwp/UnA6t0WamPUZneNcJXYjjc8bTjBzP0YRebN+ZNn9Gxhgqg2gxmfLfGXd
 v//OuAR7mg4/bTZNsWZA7RTRFphOImUbWovf1PhO/1bWpEpWTq42XfgufThfLXEPfc5J
 vsb+MWuYQ1sqjkqFJHhqD5REGlZURLOyyeZ+3O0PeXDaWwvW/MaNAUqsBtgibP8/rDo1
 7fgFZPiqLNjnDVaRS3RKn39ptseTfM7OukskuWQzdDZu6ctIaX3VbFH91Wwe5qPDkClk
 6z0A==
X-Gm-Message-State: AOAM532o5U/jT92+jcqm0r+FsjZhdtKZxtIC1Xh0tyUsl7yyKAPgLwRw
 Ajw3E2G4hzCDrBiul/O1j5C0xXkyJFGRdA==
X-Google-Smtp-Source: ABdhPJwUWKK5Qt+ZU1nL60LvbFpDiJBmGAcmSDjCNhj/5GvUSOhm9aYwAK6ZXEllpTcMVxhBxqv0WA==
X-Received: by 2002:a65:524b:: with SMTP id q11mr18478484pgp.207.1614704292881; 
 Tue, 02 Mar 2021 08:58:12 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b9sm19966183pgn.42.2021.03.02.08.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 08:58:12 -0800 (PST)
Subject: Re: [RFC v2 22/24] target/arm: cpu64: wrap arm cpregs with CONFIG_TCG
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-23-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d85fe6a2-1288-8c15-f723-3e7f7550a19d@linaro.org>
Date: Tue, 2 Mar 2021 08:58:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-23-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> these cpregs should be moved to tcg/ later on.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu64.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

What is this in aid of?  It's certainly wrong.

r~

