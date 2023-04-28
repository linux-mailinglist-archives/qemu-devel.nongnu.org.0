Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C296F1DCB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:04:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSS5-0008I3-6I; Fri, 28 Apr 2023 14:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psSS2-0008EA-Re
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:04:10 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psSS0-0006KG-JF
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:04:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so90785725e9.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 11:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682705044; x=1685297044;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Iof5fmYKPkoW74oQrRCkYGRBT3271SKTyq4QttHHqkM=;
 b=gT3rSlKcPxpE8ZZ4R9LXbTGTS7VofGXF3JLhHtCDwdmlf3ramWQmyyRUmAULHajMAY
 2zrEQjvAL9sUvWxswGD113/slqg9a/tQIBCigkjaRR6h+GOEISvR+Vn9rSaiosOgCoKb
 ueBZAiCjAmxAE1OJLpTX54dAkywBKAHbhXt8lXxx0JUInx5xGG0a3H2dFVqJRSTWl05g
 fePNsxop6kajfFjJhADObcVcLBG/kAoMlhr7XsGrk2Ozf1Mb1hOZbB6rF9Q/lN3la0k6
 wLwkIF9N/nrXBeYYxOjuryv8Gp6Jknfi6q7Y1b3vQOI5TIEeZtIjDtbeMFTAUuFvxkVR
 ee7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682705044; x=1685297044;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iof5fmYKPkoW74oQrRCkYGRBT3271SKTyq4QttHHqkM=;
 b=N9YGZ+elWAzCpCyNGq9RduJbsxzz3QAtfJZZFcogy76s0EjLq3wUPfSRsKKSoIdcQg
 99mixOTt/NaOT1rH7a/BHew7SdkQVJOfOXEmQO5W+PHcHJf9V6AWs4cL0DIDIiipWe5h
 1e3ZuJd7rwCfa1zh3+XWeYgbpqt8szGoma0Rs8oEp3mHtxrwte7l3AprcFAVTlUjHEio
 47dE3US/tHXq8j+IYAB7qHcsa20/CRTjvmNz76W5hnVHVkQi5AeNIOuUyPVY0X66XAFr
 PP5wXbOJGvd+qa7Br0FUbzNFxONyipWom1HPGXkxhiH9D8NoAtXG5fPC+sTj8EBWih1l
 TexA==
X-Gm-Message-State: AC+VfDxRN36lPUD6jRMZzGsb4ZmsqtuNs3VYbGa80yAuQ0ibU5JeBQh2
 yeq71/F29/3xQKSckx2W6j8a1A==
X-Google-Smtp-Source: ACHHUZ5HAPpN5FqKqXEsUKStQzSDrnV7CGACcdwfGQ8oQLrt4AyCDRs5cMl6GVcrJOXh/fuSmhD7ig==
X-Received: by 2002:a05:600c:364f:b0:3f3:1cb7:b2a6 with SMTP id
 y15-20020a05600c364f00b003f31cb7b2a6mr3644995wmq.6.1682705043984; 
 Fri, 28 Apr 2023 11:04:03 -0700 (PDT)
Received: from [192.168.199.175] (29.red-95-127-38.staticip.rima-tde.net.
 [95.127.38.29]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b003f0a6a1f969sm28747464wmo.46.2023.04.28.11.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 11:04:03 -0700 (PDT)
Message-ID: <2413dd51-b01d-4ba0-3cf0-ea11c3c463e9@linaro.org>
Date: Fri, 28 Apr 2023 19:03:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] ui: return NULL when getting cursor without a console
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20230428154807.2143652-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230428154807.2143652-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 28/4/23 17:48, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> VNC may try to get the current cursor even when there are no consoles
> and crashes. Simple reproducer is qemu with -nodefaults.
> 
> Fixes: (again)
> https://gitlab.com/qemu-project/qemu/-/issues/1548
> 
> Fixes: commit 385ac97f8 ("ui: keep current cursor with QemuConsole")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/console.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


