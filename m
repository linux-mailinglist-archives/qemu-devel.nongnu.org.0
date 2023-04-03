Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6086D503B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 20:24:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjOqR-00072C-PW; Mon, 03 Apr 2023 14:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjOqQ-000724-Hl
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:23:54 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjOqO-0007A6-PH
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:23:54 -0400
Received: by mail-pl1-x635.google.com with SMTP id o11so28950148ple.1
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 11:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680546231;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m98EvcSfdJomgYLrcqcMk9PDNBKCv4LxxmfaftE5TSg=;
 b=VOasyh9JLlIoNcI7OA7yUJm5dtOKk3ZJ9X3JMcYPFFTCV+wHUU9f3s7242L1n2hlLA
 Jx+QPb6C1JT8L4nF4XING/FgVFQ5taFGR1croeIFSTUnz96SxQXwvJSeFG0VNa1ZX/Kc
 ZKzMR0qrA2DKssQX+VaueDh12/imEIeFK0iH5y3euY/vIkQqx/sFhiWiDoYNpun1pZQ/
 0lHzsZJMuweo6q0zZ83DcV1nvIoPI1+M7SJQty6kxufcP0KJSPhPZRXMTxI61ZaPh5c0
 oLydbAVS0h2WF7gvltVCJMhZaSmZszWOzc7TPwwvGctlkkFT8S9ATP53KA0uMaxy37wg
 iSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680546231;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m98EvcSfdJomgYLrcqcMk9PDNBKCv4LxxmfaftE5TSg=;
 b=Dka/hyZD61ek8HIkJiNlJiSpv73o/8s+MeZR4yJdJIX/c11HWLQxtD2J08G/NYDzkK
 SiUmUB6HYqC4OFyPkpTblafyFKuFUBATVhg8c+OfLHQl1zcAATkEByN3IiWYKtpK6AkF
 6Cf1wnBSz28ycVoCrMdl/yj30h02eshAof+vrcLpUCtRIpN6Q41SiQeUkTZS+uLLge24
 pCWW3mKdzPBy9Cj9N5WVYQNv9E4p+gc1Elv2wKfe5aR+Om2w1/a6JxCWDAcktei7McEO
 Ozxl6/ACmVpwY1UjbNxU2ukvjCFl02+qeb8WZaEBEdWxuvc7dO+PQszYDyf1+d+f/pYn
 veHQ==
X-Gm-Message-State: AAQBX9crnHruRJOG2dCPTcPkiME1NAVqJTOne/GD6fJIwanu4gXMgOUh
 ZxyHyDjT7Jq/HZV2iXv+uApsfA==
X-Google-Smtp-Source: AKy350YtR1KbNWloW6OiOlJ7sjbV1+a7ggIn3nflnIfoDlZXkFFdPgZxIHAAbagoD2U1TzwuvvLzQA==
X-Received: by 2002:a17:902:dac4:b0:1a1:a9a4:ba36 with SMTP id
 q4-20020a170902dac400b001a1a9a4ba36mr46424134plx.41.1680546230995; 
 Mon, 03 Apr 2023 11:23:50 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a170902db8600b001a280c04528sm6902340pld.248.2023.04.03.11.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 11:23:50 -0700 (PDT)
Message-ID: <f2add15b-de30-f481-8f7e-7506a2ee380f@linaro.org>
Date: Mon, 3 Apr 2023 11:23:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 01/10] make one-insn-per-tb an accel option
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230403144637.2949366-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/3/23 07:46, Peter Maydell wrote:
> This commit adds 'one-insn-per-tb' as a property on the TCG
> accelerator object, so you can enable it with
>     -accel tcg,one-insn-per-tb=on
> 
> It has the same behaviour as the existing '-singlestep' command line
> option.  We use a different name because 'singlestep' has always been
> a confusing choice, because it doesn't have anything to do with
> single-stepping the CPU.  What it does do is force TCG emulation to
> put one guest instruction in each TB, which can be useful in some
> situations (such as analysing debug logs).
> 
> The existing '-singlestep' commandline options are decoupled from the
> global 'singlestep' variable and instead now are syntactic sugar for
> setting the accel property.  (These can then go away after a
> deprecation period.)
> 
> The global variable remains for the moment as:
>   * what the TCG code looks at to change its behaviour
>   * what HMP and QMP use to query and set the behaviour
> 
> In the following commits we'll clean those up to not directly
> look at the global variable.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   accel/tcg/tcg-all.c | 21 +++++++++++++++++++++
>   bsd-user/main.c     |  8 ++++++--
>   linux-user/main.c   |  8 ++++++--
>   softmmu/vl.c        | 17 +++++++++++++++--
>   qemu-options.hx     |  7 +++++++
>   5 files changed, 55 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

