Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038B9517B13
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 01:58:53 +0200 (CEST)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlfwK-0003a7-1G
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 19:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlfvJ-0002u8-5Y
 for qemu-devel@nongnu.org; Mon, 02 May 2022 19:57:49 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlfvH-0004lN-9v
 for qemu-devel@nongnu.org; Mon, 02 May 2022 19:57:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so773865pjb.5
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 16:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=PVKCeA2S5bqJLUfn5MnkPfC5WHn7lSJvrMZRexRldH0=;
 b=XaHBpuX8lBt8utCqfXpmo0ePeA4QCK94Kprd90irVhRbM4pUViuABYrRM6Guhqe0HG
 QEqHYl2N5WHtT4ZVSaak6/whdtJyANf3EcJCV5KuWyRaj6V6Zolz27VchVs7aWfAOeJ0
 IVmNCZnQxZQrYCK/Y40WQ0g9JSq4mRH0itt1RwOWAB5aAjHZT3wiiEAbXMAV612GvXKh
 DzksmPTE0JTCdp6BMG47PZtruHDwvOY8cSgJ+nF8uYU2ne/HptR19UNGknXE4EGpQVKR
 psD+FkgYvgRB0nl3izj1RH6oA3nX5RBUZaiTvMKua27SDSnhm/DdSxWVnFJ3Ms9QOdMm
 UARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PVKCeA2S5bqJLUfn5MnkPfC5WHn7lSJvrMZRexRldH0=;
 b=61llKWbiGvHcSFJxj7g2tYRT6ZXEK/ox7zcI1NQ6LgNtsoRpxr86n9KDSyYQop2tzc
 N8UpX+jumkwzO0yo+Ot1ixrctOPPxIcwTR7fXBj6NvLyiD5F7ZfC+RWbXqXnuMcbP8Eb
 aMnqYJ8LMHZXKO6HfwZEOVSFCNyzE/LpksilohDsj+jIGu5Vqb2vH7GuAtuG0hKYf/p9
 f2JJM2elA2Ur2AsUTwrGwnp28GKBT7sQKIkU0kdhGYKJduAqwzXbvICmOfHNiP+oNWqt
 /xp6k1tf7OWB+SGnhzzlWyDDLu7P/x6GIAwNdtHgEupvJoD7KAjxEiSX9DN0yWevwXV3
 kxdg==
X-Gm-Message-State: AOAM530z4ieUDbgeCp4wK8l7+WxjEuce6fYBRcN8DnMu1aw8MCPM2H5e
 6puA63UCwykQqCSQ4mnibLwcxQ==
X-Google-Smtp-Source: ABdhPJyd0ofEhf4i7+W3CKCai0H7y2rl0KIAKkAEBMHWktD5pArQ6vJMH7/dpKiCj0iNuFdSpK49hQ==
X-Received: by 2002:a17:902:7e06:b0:159:6c1:ea2b with SMTP id
 b6-20020a1709027e0600b0015906c1ea2bmr13797960plm.105.1651535865559; 
 Mon, 02 May 2022 16:57:45 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170903108400b0015e8d4eb2e1sm5156467pld.299.2022.05.02.16.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 16:57:44 -0700 (PDT)
Message-ID: <b1cf3942-115c-bca3-81cf-1f7bfd66dc5a@linaro.org>
Date: Mon, 2 May 2022 16:57:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/openrisc: implement shutdown and reset helpers
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org,
 openrisc@lists.librecores.org, shorne@gmail.com
References: <20220502225230.237369-1-Jason@zx2c4.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502225230.237369-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 5/2/22 15:52, Jason A. Donenfeld wrote:
> OpenRISC defines various nop instructions in or1k as meaning shutdown or
> reset. Implement these in TCG. This has been tested with Linux and
> confirmed to work.

No, OpenRISC does not define various nop instructions, etc.

OpenRISC defines a Power Management Register to handle doze and suspend; there is no 
specification for shutdown or reset.

See https://openrisc.io/architecture


r~

