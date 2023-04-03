Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F706D513F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 21:23:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjPlQ-00028O-Ki; Mon, 03 Apr 2023 15:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjPlN-00024M-7b
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:22:45 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjPlL-0002tp-Po
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:22:45 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso29675222pjz.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 12:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680549762;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fe9CXpaILP+nu6PAXDET8sZ+LXI3AvxJTTq6UMX/dTo=;
 b=u6rdl81G//vz3gJ6TV2OY2W+soI2qsTIRX7wy5JOqYgN5f6Yx0x5JhZHT0LdD3Y56I
 7lGfFUN9Lv5mcti1OVrexhoExYzuSna2DU1hW+Q3SP1W0suPY9RuRFWxpRXkHoxy73Q5
 tdpcunnW5KbylFpD7BbVR5ccKgVaOc8F7HpocZ4DqfwQzSR3OyUIh2iEIW+1gpXj/sMw
 xuGUq9QID0BZ6/Aur+VY4z/ZTJq9x3SGWR4DT622esR6kpKKe0o61GbmwlessktVjmEs
 PUYGLwPRGJzVUWq5LqjLEmJfvPdGPCU8XZvlUNf/lX2KSUftlUvr2tClo3I3zph7KSFs
 qM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680549762;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fe9CXpaILP+nu6PAXDET8sZ+LXI3AvxJTTq6UMX/dTo=;
 b=S/Hv1yoB8W8dlMRUi56PaWsH+cgXKj1qwZvYMQ/IzZBA6Hi/1v8rYBNdQq0g3ZRhVI
 /z4lzZsgnbKUa5i6ThSWIRt05V7z435DmLMEbtscTUuIw/EdObJDwc0SRbz98HkACbo4
 7E9XtIx4XtU2WxGNSBy8evecsqvs7pj37xlo9aPeZe5kDV3XIBfMDka0NXB9OIhRYLOV
 cL6U5D9meHIuEJtvrdyk8Yu5LGYIg6qKaeftRhHJ+N2/b8Supe6MpV5s8g1eWMfq8FhH
 8CPTCZz0AFuOHWpRz3QOBuf5Nc+UbqJBKF/xKgckJAV1XJxPzWZHlFTDgiR25woApraJ
 VI4w==
X-Gm-Message-State: AAQBX9eLCjF45lXydbyf4T9/C8fvvGUsp+O78CsjD0v+LqudXNmhyxFY
 Z1LfXc9r5HapwMu7C6iF0sBybw==
X-Google-Smtp-Source: AKy350YeeuyLEGZblwGd/x9sKrGbzOT/MJEfMOETmStGD7hWn46+ExEYhU2TplQjEXcTSZkyotmmJA==
X-Received: by 2002:a17:90b:3ecd:b0:23e:feef:38ef with SMTP id
 rm13-20020a17090b3ecd00b0023efeef38efmr40772128pjb.41.1680549762315; 
 Mon, 03 Apr 2023 12:22:42 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a17090a284900b0023440af7aafsm6487857pjf.9.2023.04.03.12.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 12:22:41 -0700 (PDT)
Message-ID: <3ec7767d-dc45-faca-df69-f0ea831f9c92@linaro.org>
Date: Mon, 3 Apr 2023 12:22:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 08/10] hmp: Report 'one-insn-per-tb', not 'single step
 mode', in 'info status' output
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230403144637.2949366-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
> The HMP 'info status' output includes "(single step mode)" when we are
> running with TCG one-insn-per-tb enabled. Change this text to
> "(one insn per TB)" to match the new command line option names.
> 
> We don't need to have a deprecation/transition plan for this, because
> we make no guarantees about stability of HMP output.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   softmmu/runstate-hmp-cmds.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

