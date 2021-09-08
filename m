Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0328403D40
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:04:29 +0200 (CEST)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO03o-0005o2-EB
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mO00C-0000Ea-8S
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:00:44 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mO00A-0007k8-IS
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:00:44 -0400
Received: by mail-wm1-x32f.google.com with SMTP id m2so2166435wmm.0
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VUNkqenJf0vaSP402chASSTe8hiZzb6rgvUXiuUOR0U=;
 b=W+hH2W/2h4wU3Z5E0vNZQKMyvsVGpOLOSFrhvk++uNYwadEw4DbeNFIhLMcM6Z6sic
 rLOgJ9AZpTVpzxUjrM9QUmTx4i6FQejOgSRvaO6T4zoQIssJz1YcZrQNXrgSSfrEDXov
 cyJKwObm6+7ZAnpzRzEr/04CFrQdD4oBBhqQX/o6r4EZBoM/RP5qD2Bpy7Q7aregv4fb
 veo3ntKJ/OAtbOBwaeb7rfR/1PcfIpLMEfC1L5meAdtekdYJrgldDgN0m+RLSpC7eI4m
 t7snmdVVW6zJ5mSvHxpzupwDaLiLhtB/brQCBX4p2KiB38OMgHmqiOexqCYc4mEXJb5H
 41vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VUNkqenJf0vaSP402chASSTe8hiZzb6rgvUXiuUOR0U=;
 b=hNVC4QllKBUJVs5sBOqJJGUsF5PesTF6sunaWAZvDw6/WS1ryyByWMmv+ezK/d9ZyY
 ytwzIH0j0S07yyemtqV9sR3JL6/giKYiI0tTG1SBdgxIO71E5cqMexmUAjVDAIPZQ+CB
 bsVHsP+IH1yLgPJW8FIIZwhhe1k+vaz76hhnfdDHhWCVtXx+w/8saThnpF3JRkFWibbF
 WwrQ0gjPBBsuoA+Yk76XZuVX0QBdgizuMDcBP+/GS/RtxIl7WAer+d9oLMP+Vm803fQT
 HaJAK+u81p5Y/CxGmYYP3NK8aIZf6xICLNdV7s6fwB4H5v+7OXyH9PKtLh5z2roUSkZX
 Zq2Q==
X-Gm-Message-State: AOAM531bAYxJJIDTQMAhWAbsKDVoG8YZ/y1JkkLdGFkTNJ65CajrcA91
 OBWWKxUNH35R7hTNraeJG0k=
X-Google-Smtp-Source: ABdhPJxg8MtdbVTqZUgecPP5qjfJI49nauL3AVrQ3XtmAPHl7yIjoHMv5DPBtIqNGOMLm29hAnkdyA==
X-Received: by 2002:a1c:21c3:: with SMTP id h186mr4432089wmh.89.1631116840607; 
 Wed, 08 Sep 2021 09:00:40 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n4sm2885999wro.81.2021.09.08.09.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 09:00:40 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] linux-user: Split loader-related prototypes into
 loader.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <986c0879-0dc5-d1da-676c-0572a5a2c45e@amsat.org>
Date: Wed, 8 Sep 2021 18:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.922,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 5:44 PM, Peter Maydell wrote:
> Split guest-binary loader prototypes out into a new header
> loader.h which we include only where required.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/loader.h    | 59 ++++++++++++++++++++++++++++++++++++++++++
>  linux-user/qemu.h      | 40 ----------------------------
>  linux-user/elfload.c   |  1 +
>  linux-user/flatload.c  |  1 +
>  linux-user/linuxload.c |  1 +
>  linux-user/main.c      |  1 +
>  linux-user/signal.c    |  1 +
>  linux-user/syscall.c   |  1 +
>  8 files changed, 65 insertions(+), 40 deletions(-)
>  create mode 100644 linux-user/loader.h
> 
> diff --git a/linux-user/loader.h b/linux-user/loader.h

> +void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
> +abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
> +                              abi_ulong stringp, int push_ptr);
> +int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
> +             struct target_pt_regs *regs, struct image_info *infop,
> +             struct linux_binprm *);

Pre-existing invalid style alignment, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

