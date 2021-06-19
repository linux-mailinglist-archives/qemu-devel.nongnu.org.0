Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18773AD92A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:52:22 +0200 (CEST)
Received: from localhost ([::1]:52160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXeH-00072g-L6
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXcv-0004wy-0s
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:50:57 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXct-0005jL-LQ
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:50:56 -0400
Received: by mail-wr1-x429.google.com with SMTP id m18so13603323wrv.2
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 02:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ppu4TvCl1FnyMJStr0LhtSsIC8+tQ6Rf+4pUDgK9M9k=;
 b=QWROF9KHPSEE2oQ6/47trxcxq6FKRLuJIxDaPSYAV+e0K8WywvUP7mpI0mfrA7wBdH
 BMekDTRlDy2viLsYrRohDM6kBumrG8JunFlOdlkncXyd/wWSUc7wsTGXjBWCTjaQZfHN
 VAbf545WjyawujVN3azOx9KBDhHD1xbkLEdXPnmbfumw/gbITt+7+2vW86Ruv816S/8p
 VMe0xuQmUyjmonLuC7SYu1H7FNBTSkyF6nyLaZv6vJ2w23W50FMoRyMSGDIvkL+A0W1B
 TcCuLLtkVMFPtxVVim1zJiki5mgm/ynnT+1XV/73LpAFwUZoyB8KqZpUDEI3fGdamYNP
 6xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ppu4TvCl1FnyMJStr0LhtSsIC8+tQ6Rf+4pUDgK9M9k=;
 b=nFjX785hIgvy2snR6hgUHl2C9O/oYOhvXwlSKrBlBqLrRnKtOmvJJzRXFYmgT5BcNJ
 fQszIyDJC3sdEQDclCEvXRCVknPKxtqFc6GgprtcpGkTaZ20gRVGrOPP4t9I+Ormv5C8
 ba1FQqMWuM2ALnCGoNWCDEr9/RP8Ceep6VQdP85AHILo81ZHJc4K7cdpBqtc+v+OXAdI
 cLSoWzXmNXkyrD8vIPg1RMJmKJDN8g6d0cs5Vs50PH6xo1iPDiJ8K5JkGnSwVk8ZlfUN
 rBUmM2GXKMFpR/8abmnTPd4EdIrG2/np16uFQIpddoWgelDdrnyxkwn25HwD2GYab72M
 7cDQ==
X-Gm-Message-State: AOAM531kamuXPGEcCN/AmxzcBD5xMC62Lvcr06Sc5iacR1j0L+wTekhC
 b85EqcfOu6AZfPJcIuYONFA=
X-Google-Smtp-Source: ABdhPJxsr4ACRO8dpWZcbZ5Fs1COiNWgBIS+Ee8zyS8FOffpwXiET97HTABrWGhtMzVYToXj+3ri+A==
X-Received: by 2002:a5d:6452:: with SMTP id d18mr11029571wrw.80.1624096254313; 
 Sat, 19 Jun 2021 02:50:54 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c18sm645542wrt.83.2021.06.19.02.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 02:50:53 -0700 (PDT)
Subject: Re: [PATCH 04/12] linux-user: Do not clobber bprm_buf swapping ehdr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210619034329.532318-1-richard.henderson@linaro.org>
 <20210619034329.532318-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2cc00575-776e-c298-6cb8-482315e496df@amsat.org>
Date: Sat, 19 Jun 2021 11:50:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619034329.532318-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 5:43 AM, Richard Henderson wrote:
> Rearrange the allocation of storage for ehdr between load_elf_image
> and load_elf_binary.  The same set of copies are done, but we don't
> modify bprm_buf, which will be important later.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

