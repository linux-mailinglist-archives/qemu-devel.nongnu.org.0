Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDC6377610
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 11:40:13 +0200 (CEST)
Received: from localhost ([::1]:35864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lffv2-0007mg-5b
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 05:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lffsj-0004UA-Gg
 for qemu-devel@nongnu.org; Sun, 09 May 2021 05:37:49 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lffsi-0002BJ-9Y
 for qemu-devel@nongnu.org; Sun, 09 May 2021 05:37:49 -0400
Received: by mail-wm1-x32e.google.com with SMTP id o127so7510961wmo.4
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 02:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YaSz7vNy92/HY9P3v+qhZVXmgrUG3155zKLjumoNNio=;
 b=LqHgIZZYwoeZDx4vTSspza3d/KAZVDHVGoVqUZK7d62+cSYvzWZGdrxbGYz8Xcabi9
 Gz3MBu6dgLX/OBtEuW00C50CWRSPAbidB3PANOKIob2iRhkaPzlecN/lQdJUxiW8Ccb8
 LBEgoAWvr3SOC8IZEyMJPAgKUhsq83Xo9g+zPZx+FLyLbNxamnDcqPq4EE2ohW2sCNR9
 iajtoI7UGWjxvpz+Pst2DY76GBxAoOehtDSMP/3VPliCj5gVGy5MeFM0WQJHUBdc8X24
 Ujp0OlLuRB/RvmUZX79SzyS4jIUye6RgViT0lNQ3jekwiO2f4LAlduxQbosiJ2pvGtYJ
 w+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YaSz7vNy92/HY9P3v+qhZVXmgrUG3155zKLjumoNNio=;
 b=UmRhsA3yan88azNboxh0RPSGAP0JaimT/dZys3UcdR7u8ECSQ4iJGklc3I1R2Q6qvE
 /WMROsbldtkqp7v4x3iWOEm7e2iTJOpX5oLvSxOW+trM8WsjK2evsrEQDcZifSQvUNYB
 FW6YhM8M6MxILk9ldtOL6IXnmyA8BaLJ5QHuk/DUz0rEBwjMzScH+ME5/j0unWTkCX6L
 8uWg7Y9ZjPWvIMGNoRV1/IiHxypqEz6HIx95eMzqvZy7EA041jHnajH5v7AXv1ETi2gu
 L0yqvnmHJIW0K2Z6e5rYbJaWCQcvaOTEeeIxoLgSRzyffCR1u8q1eG08LGFJ6nSR7Jc1
 5p3g==
X-Gm-Message-State: AOAM530LjeK0oaJLIbqWbz+1rkXkwXv5wgeJfd/gnZw6af/6EchyHxml
 YFi0AZD6IJuDw1c+chFUrPE=
X-Google-Smtp-Source: ABdhPJzVpz+wEVB6V794JrY2jh5yVqs0TFSnzFtLq6zulINT4Hd5b5sAvHWcgXlQ2U3VIa+T/S7i+g==
X-Received: by 2002:a1c:b406:: with SMTP id d6mr19511979wmf.105.1620553066821; 
 Sun, 09 May 2021 02:37:46 -0700 (PDT)
Received: from [192.168.43.238] (45.red-95-127-157.staticip.rima-tde.net.
 [95.127.157.45])
 by smtp.gmail.com with ESMTPSA id c15sm17124572wrr.3.2021.05.09.02.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 May 2021 02:37:46 -0700 (PDT)
Subject: Re: [PATCH 04/72] accel/tcg: Use add/sub overflow routines in
 tcg-runtime-gvec.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7c357fd4-6618-a785-3e27-6eeb93aa3ae9@amsat.org>
Date: Sun, 9 May 2021 10:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/21 3:46 AM, Richard Henderson wrote:
> Obvious uses of the new functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/tcg-runtime-gvec.c | 36 ++++++++++++++++--------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

