Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8F6E8D76
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:04:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQD5-0005ka-Hf; Thu, 20 Apr 2023 05:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQCu-0005kA-E9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:04:00 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQCs-0001O8-Cn
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:04:00 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3003b97fa12so250726f8f.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681981435; x=1684573435;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m3MrkRC5HEaNrlObTclpR3SCc13NToZuAqVM2a42USc=;
 b=d9+3MKNR15DNr4Ezuit/G9W0HVlhPhHsRNgQ9qoK1z6tNo/6Fr+2u1NBkYGBt5XrZB
 P3BYW3SkbaCsNKmH3S5S4Z5x2sUmGw/71mGy/cvwxHtMsdSI4hOc2Id8OlP+szjBesin
 ewEt3JCk5Nlibiq3IG3rSb2P+qAhVXg5hQ1fMu/CsB+HOxSMuDqfBlbDP6SITVpMq2Yp
 xSfD5PzzyKCYB+FahQW2Ncn8fCSByAthYZUE/Rzjqp2SdtHt0szVA324tI+rXgMMY86m
 OPWD0qEc5Mpl9kPO/tRLrr/njiMoDwaF84b5/3FwQAj+U8Jle6Ggmu97zEHleyPlGDbJ
 ULYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681981435; x=1684573435;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3MrkRC5HEaNrlObTclpR3SCc13NToZuAqVM2a42USc=;
 b=Q+i3WJhxt0jzlr28MmlG09eHy9REEQ1xw0aVM85a3gbNHAWJ+v4n80QbkwXELo8iqb
 tlLFko4Vsn+tq4dfE8AqnOemEQGgFKC9LClal/cMON4SzvzEWs7DOj8+YR3NlaBuuIon
 9HIp8AwUOe+fNv6pyuMJA/o1gCCvxk7M3RSDNCbpSopYsFd5vpqHaOI7zq0xZ46llNfm
 wNhvAvOruqzgGUgpQwSEB+Lvv83b8OZDP00sMfARDrTVq/l23g02fowQAhscMcWVxyHw
 JOa4Og4H6fr9szlZCA2XqGHxv1vUGfTdJo1Hc9+eutW9WJ/1XXs+KIC9v21NWD8NQlzV
 14wg==
X-Gm-Message-State: AAQBX9d5XU/RnDZf+X+PKZSfKipiCJdmEHxL+QcxNV5B5dyEMbt1rlwK
 xWPEXs4MCwygtBID9f8/Wj0Syg==
X-Google-Smtp-Source: AKy350avrqR0a0tK2JLsw1obj7xTGZKqFZINNPvb5nbb6AWtxIl35ISzQZgzW5O5oiJsiQsuvQbPTg==
X-Received: by 2002:a5d:4981:0:b0:2fb:4633:4002 with SMTP id
 r1-20020a5d4981000000b002fb46334002mr678954wrq.15.1681981434959; 
 Thu, 20 Apr 2023 02:03:54 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z10-20020a5d654a000000b002f22c44e974sm1377512wrv.102.2023.04.20.02.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:03:54 -0700 (PDT)
Message-ID: <93b43736-6a6f-d41f-07f6-28d59e9de0bd@linaro.org>
Date: Thu, 20 Apr 2023 11:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 08/10] hmp: Add 'one-insn-per-tb' command equivalent to
 'singlestep'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417164041.684562-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/4/23 18:40, Peter Maydell wrote:
> The 'singlestep' HMP command is confusing, because it doesn't
> actually have anything to do with single-stepping the CPU.  What it
> does do is force TCG emulation to put one guest instruction in each
> TB, which can be useful in some situations.
> 
> Create a new HMP command  'one-insn-per-tb', so we can document that
> 'singlestep' is just a deprecated synonym for it, and eventually
> perhaps drop it.
> 
> We aren't obliged to do deprecate-and-drop for HMP commands,
> but it's easy enough to do so, so we do.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   docs/about/deprecated.rst   |  9 +++++++++
>   include/monitor/hmp.h       |  2 +-
>   softmmu/runstate-hmp-cmds.c |  2 +-
>   tests/qtest/test-hmp.c      |  1 +
>   hmp-commands.hx             | 25 +++++++++++++++++++++----
>   5 files changed, 33 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


