Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77296EA424
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:53:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkeG-0001NR-Jp; Fri, 21 Apr 2023 02:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkeE-0001Ms-7E
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:53:34 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkeC-0000La-Fo
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:53:33 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e2f7so839694f8f.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682060011; x=1684652011;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9yT3VjkybhCVBaKu+89v5QM5MAlJdkCBmus85P093/E=;
 b=g6mq2pWiB/LpxnbfWSM/IWFQLxTq9rv0Nz3+6ibJVGthZ+2rRoe02FqdHG+qKMnWfw
 sGCWfDc8+CPn7hh/euzsvyvtb33cL3CvL5BJOhgb1oQvTTwsYsUoaNsTQcnkj8f4ufal
 VSIVGhooMPHwIx43xRLOlW6y58V/fiapFsdgkc3cly148NKZrC5+5HiJe35hREHzlNDt
 zpLFyrA5jjCAmp71coC7CcdKKsYLORnGFJUEl/rQdkfJg4HX8oOOEmazB+HwDHtovSby
 jBNh3RqbW4EMNwFWX6MkrUvFbMZwHCPjjW0akG5oFBRVt+/R/tJWO+oFLxvEH9TlS7JM
 HXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682060011; x=1684652011;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9yT3VjkybhCVBaKu+89v5QM5MAlJdkCBmus85P093/E=;
 b=V1YrPRP5pUvmDzh4KI2Ptb8Uee3MOJmSVHSxoluZu8B3+TqlB4MgDznMEAeMd3mADG
 3hAixmmVlW0kx33gq8wVEKRVqBVmQPLgVskaDNQaCi8W14P4cz7LU1GFUsETQTEua6Q8
 jK6rZr/67p//dIgobZNswrgdWVS7Soo+Yag7GQ9Mucemjk/1NUYnxBlo1jE4FbVU2aZf
 /fHL/3oe+pma+3sSfPF/P6AfkNcdyEWn/FZWAS6YfOplrSLqAq6T3Pz3flTr3GNLBWEX
 piwWdGUEa/IiSWsR8JKGMXCJ5mAT542H/yy2rhRGtt4RgFE8RHR5q4IXoIKnn5Fijd6N
 TJVg==
X-Gm-Message-State: AAQBX9c+hXLs4bI8RQNcelIwOtbrXkYhEhlDaiY5GEv+plqYnlBjYeZG
 mevcneg1J79DLd4eVHsPx2fGdQ==
X-Google-Smtp-Source: AKy350ZTItqOVPC0jNYQXV5QpryERrm4LVydvgVMFiX59U0vQzhc7F5nQ/C912bPK1kZDMhElNViig==
X-Received: by 2002:a5d:494e:0:b0:2f5:c57c:192f with SMTP id
 r14-20020a5d494e000000b002f5c57c192fmr3191315wrs.68.1682060010756; 
 Thu, 20 Apr 2023 23:53:30 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 m13-20020adffa0d000000b003017a46781fsm3384147wrr.62.2023.04.20.23.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:53:30 -0700 (PDT)
Message-ID: <a0a2b159-5a79-2e67-8871-21b3490fb495@linaro.org>
Date: Fri, 21 Apr 2023 08:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 10/10] xxhash: remove qemu_xxhash7
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Riku Voipio <riku.voipio@iki.fi>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
 <20230420150009.1675181-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420150009.1675181-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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

On 20/4/23 17:00, Alex Bennée wrote:
> Now we no longer have users for qemu_xxhash7 we can drop an additional
> multiply and rol and make qemu_xxhash6 the implementation. Adjust the
> smaller hash functions accordingly.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/qemu/xxhash.h | 17 ++++-------------
>   1 file changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


