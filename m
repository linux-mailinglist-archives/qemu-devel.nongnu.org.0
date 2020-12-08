Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454872D373F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 00:57:45 +0100 (CET)
Received: from localhost ([::1]:40900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmmrD-0000nY-Oa
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 18:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmpQ-0008Id-U0
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 18:55:32 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmpO-0007bR-3O
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 18:55:32 -0500
Received: by mail-ot1-x343.google.com with SMTP id q25so472258otn.10
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 15:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=in1cgibS8mfB63jOjh9ssiTrUqauLz5o77iYCzjNbTY=;
 b=qO8U3nr4f9PpcL3OUo3MBn35zBBGz+dPN/upiCFtQewNKn6UmGfabJ1ANDdwgM9FAI
 ohXGZULAi5Gij0kWJAA1LtEiLnzVIpSxGH+oLLm61/7AeyJmlNYzIvlabUWLYe3Pw2Qh
 gTVLiFhep559mEMZ894mfD6oK+Ra8TBzpAjXCnuCkf9tvqjCEWLAPqf39KzRp1UYAfI+
 lgeP8OViZ7yJjZVZTIxCeOAZjxPiCxIgovvujJfOiFINDyXH/hdXkw4M2ezhhd0271ID
 70JyqWYQvpkWbFHjZWeNyLS0LmL40bOD2lhycBwZtVnoRBT9d5zbjx1FKR5GDvSKgspd
 l6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=in1cgibS8mfB63jOjh9ssiTrUqauLz5o77iYCzjNbTY=;
 b=DuMkOuOIbyifTaHz1Jj9WpMTM/oarOB0IdBzD4R3eeG0cbe+G22HgVS/f4uRnq+EW+
 +neB1+pXrdEdx1lkReE52fKDxxEnSRf4VeJZV3zhfrYi4JxxE8bzScSF/YDl/UB6vaPq
 6Y6y5bC5cvbM1A8R7jExOFVNBNPdwp7x1JauDWh92PDQZX3wpG8azjGswKPEmeHWbk+O
 MBmT5h7q3dz2w4HtTU/fE3wxED+YKV4hGVG6nKDqhqR1tpEERrACLiCnga/mY853zJ5o
 PuNPo4vgBWuktNSybYB3IqVAwZndU8/r7UBMu/TyCLWApldcYMlpi8d3hg/yT25J3Jpe
 xQlw==
X-Gm-Message-State: AOAM531DDEj4hSRvWme2+h1VIQENriYwRhypK6XsNR31rILbqK6vxeAR
 lHz+NDEvRbT4biNatXlo1QfAew==
X-Google-Smtp-Source: ABdhPJy2R+cvCFa7QJFtR0bYqwWYUD5y0el8HP6/5ia3sxCMJQTP8glNuiuCYpw+Il/WVvR/jAYi3Q==
X-Received: by 2002:a05:6830:1c3d:: with SMTP id
 f29mr479570ote.47.1607471728854; 
 Tue, 08 Dec 2020 15:55:28 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c18sm84135oib.31.2020.12.08.15.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 15:55:28 -0800 (PST)
Subject: Re: [PATCH 11/17] target/mips: Move msa_reset() to mod-msa_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208003702.4088927-1-f4bug@amsat.org>
 <20201208003702.4088927-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <503795ea-e68b-a78a-d65f-39cce13a619b@linaro.org>
Date: Tue, 8 Dec 2020 17:55:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208003702.4088927-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 6:36 PM, Philippe Mathieu-Daudé wrote:
> translate_init.c.inc mostly contains CPU definitions.
> msa_reset() doesn't belong here, move it with the MSA
> helpers.
> 
> One comment style is updated to avoid checkpatch.pl warning.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h           |  2 ++
>  target/mips/mod-msa_helper.c     | 36 ++++++++++++++++++++++++++++++++
>  target/mips/translate_init.c.inc | 34 ------------------------------
>  3 files changed, 38 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

