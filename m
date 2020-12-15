Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0E02DB71C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:28:45 +0100 (CET)
Received: from localhost ([::1]:50522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJkK-0003uD-F0
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJbU-0001Nb-Le
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:19:40 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJbS-0007jz-1T
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:19:36 -0500
Received: by mail-oi1-x244.google.com with SMTP id f132so25274628oib.12
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BFk+RbFhUDPE+4uHD/EOO2rTkKk8eRA8B65xORGKwnM=;
 b=S7OgkjghOyLgLwUt+NoK3seQXXk1csS2SksfHSrRvdzfCNM5A0bxdMxOYMOFmNQQrB
 PhWFXN7dhroinkvX2vFDyReccMflmcg+oEzV3UwZM5L7/nURMiTQemZRScd+897ZV9ae
 5YKHUZFDHB1XplBMw9OFPcuCpK2kYHNF7DxsWkYy6zUuafN/8Njl3zeCS4N5IXRC/TSb
 w63pYXIhC4BKghvXCF5H45cOEQmMOLhJ/dh9rDMfyO68ctCnn0+bzf3viTiE976+Cd3w
 u8oTuaBpfqhrJP0y/imIEcQW+86PmIRmQhT9V5G3uxYnHC/dnUA5pNE9LmlIGuTL+kkC
 aCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BFk+RbFhUDPE+4uHD/EOO2rTkKk8eRA8B65xORGKwnM=;
 b=lQFy0CNMn7UOBq2GA0hRgsdMfNS/MU/mJA27nboMByzt0OFszCeKbpVkvsAO3LU67S
 xUiFTbk/BT9YtQVqimWIBtkRmMbr0T7csn2FcBwi92/rZgg6lZOP8BQrbBSaTkYlQh6W
 3XVnYnSvVA/hyEljybQ3jkvYt7CrHBO9KSBlB9UzAu4ssFjUnyNYqkVHwSQUG0eblM53
 8LnR/xbhug7m0FDzLjgv7WrBd/Jh3uSnfNa14wv2DHYmA20VSACJy3WanarYNKHrYFNm
 PXI+1OrOoSX4xklWfFZ6GwLldECqNOUt9KsAjAVIdy9Gf/AD5l5rBeVIO60tXVDAMxTk
 h1qg==
X-Gm-Message-State: AOAM533cz8Xtf1yjTqwiIRL3xskavPVsYJKKgM9Pu2jJ78Z7liCSHya8
 EeLCr8vI/E9CohsQ2CBhXkslHw==
X-Google-Smtp-Source: ABdhPJxSkuob1gD8ovABSieDXdTsLywP6dtXReK4/D/YRFFSZUnjhgUyvGHzUTOimHUERWYgkeug2A==
X-Received: by 2002:aca:410:: with SMTP id 16mr607949oie.97.1608074370684;
 Tue, 15 Dec 2020 15:19:30 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q18sm70807ood.35.2020.12.15.15.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:19:30 -0800 (PST)
Subject: Re: [PATCH v2 20/24] target/mips: Use decode_ase_msa() generated from
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-21-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <efb56dcc-3322-075d-7f00-89ad9b045bb2@linaro.org>
Date: Tue, 15 Dec 2020 17:15:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215225757.764263-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:57 PM, Philippe Mathieu-Daudé wrote:
> Now that we can decode the MSA ASE opcodes with decode_msa32(),
> use it and remove the unreachable code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h         | 12 ------------
>  target/mips/mod-msa_translate.c | 29 +----------------------------
>  target/mips/translate.c         | 31 ++++++++++---------------------
>  3 files changed, 11 insertions(+), 61 deletions(-)

Need an update to the comment after function name change?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

