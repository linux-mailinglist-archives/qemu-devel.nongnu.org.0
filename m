Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4D43294C2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 23:23:58 +0100 (CET)
Received: from localhost ([::1]:45954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGqxJ-0005Fg-M0
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 17:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGqwB-0004oz-VN
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 17:22:47 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGqwA-0001kX-9T
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 17:22:47 -0500
Received: by mail-pj1-x1036.google.com with SMTP id e9so553641pjj.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 14:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lu+dphN40GLelh+4KvkpDb3OuH+q26Z2Q7cMEAMc9ow=;
 b=NImE0iHOsjV2isqzTIWEfwxasgqh8lMV4uDkhA4U8rM8BdPy/XnF02dEblXnPrtv+A
 6pQ2zs58VScnQat1LoaSJe6VOegSKPLz8MfQ2lrCPca6eoa2yM3uq+Ts57cAtwlyWptM
 Odiz+pxp93QrZYVe37NGyFcLzoWK1t+c2spTEBCpuxZ5T4Xt7rYIWAZlTUBxafUqtodN
 KajZxXFGKo0ofz0IVb/E/gg/nCy/W6tHtQgWa15KN2yOFeQRjjA4xATmU7wdIW5Ct/AZ
 Pr8kEzMz42PhheUiwvKG/of9j08i56f26j1UKmfBznXEsJvtfArxp+aD8OniI44FauLZ
 hPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lu+dphN40GLelh+4KvkpDb3OuH+q26Z2Q7cMEAMc9ow=;
 b=VHgmXVzkeDv06zLNmOsyNCmX0ettzA8Ih3ZzpHmU40NT3wJkdIkUGYEZYliVYWsQQE
 CBu34GL4n7DcJIKPadPa1FlTHTofA4FBvrpS+cpPXEq94knAI/okHdBbCTJJhS8Jp0LH
 8McpdA/0qgfS9c8lShUjBBQDQaPHNbnX2HyoeAsUGZVaQtG6zy+BqmffsB/BH/Ya09IW
 zIOXdvZnjB3MFVAsjPmsVT7djAZ4jjFxeh9zD6olOupcS3NFvVVHSfq4UonNgWy9XOBp
 fQDdz0nWY9A66Yo79wpHhLaGUxzzkXpj52zBhc5N1FiRPZqQj8NHkQ85UJLz88qqf4Ww
 D7lg==
X-Gm-Message-State: AOAM531CzyhZTNlWOdZk7s2c26Z5gwtE8KXzmyXEF4crUwRrlZwL/yVO
 owxnm5HPaZk4Il2TvkNo1WUX8fRbd8yvdA==
X-Google-Smtp-Source: ABdhPJyJe+qMsuC4GtvUibz5f4uwSuKag5myktyCgCoBtM0o0MW2JFvRHYtBcCQZLkoThPmC0B57OA==
X-Received: by 2002:a17:90a:654a:: with SMTP id
 f10mr1060436pjs.202.1614637364545; 
 Mon, 01 Mar 2021 14:22:44 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id k69sm18722424pfd.4.2021.03.01.14.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 14:22:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC v2 08/24] target/arm: split cpregs from tcg/helper.c
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-9-cfontana@suse.de>
Message-ID: <10eb7278-4716-2a5a-e5e6-cfb0c904fe95@linaro.org>
Date: Mon, 1 Mar 2021 14:22:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-9-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
> +uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri);
> +void raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +               uint64_t value);

These shouldn't go in cpu.h; the new cpregs.h seems reasonable.

Otherwise, LGTM.

r~

