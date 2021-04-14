Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662E735F467
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:01:41 +0200 (CEST)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWf9G-0007zC-4N
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWeS0-0004hq-9z
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:17:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWeRs-0005Jw-EB
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:16:51 -0400
Received: by mail-wr1-x430.google.com with SMTP id a4so19677522wrr.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LF/pp9hdlJ12L2Hr5txi5tTkDmkg/ieXWl32Z2TR8CI=;
 b=TL5FHVAx2O4o6DC1pTu40zHuX0zbsFLuSo3+0nKwhXjL3ALfXxwtIlnREos0YWvmm1
 wppL78uCG22bJOZ+SQBFhlERnsQz6tq/ve4jqGUr/wP2Az+NgoGRZYlxanVZlaHPX9p8
 4WC6grdaf1Qk9JjcBrx7yxJr5cpUbynU0j8TRg+/kiraeEHFp8GFcLhFqjYREy0o0+bP
 qkAZ4qN5crvR8HrebabAyqbkAw2+xnut5GJ/8MIBtz1X6fFLIXt4c86J6X9rdyem6azB
 kkgoNmt4PqLtX3dcdSAwHIbGjv6nkqaW3HwnWhGGsVhu1suYNqRpmP/dBADORhXJRMl3
 KQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LF/pp9hdlJ12L2Hr5txi5tTkDmkg/ieXWl32Z2TR8CI=;
 b=GhRGvBcxmmtvvqZTBN2WimWXpTWUH706EJsrneEuLANux8x6QjjSJ+0Vb2iGsndHhp
 LLakGpuxQ6YyUFJY52rNhikzjzCGQQdjiMqf9Of6t38SUr1wldZQW2jEaBB5SvTgacb1
 J/35DvO3ureb6T9G/xKiOy6aZkdlzu9cGtx7hl6fVMuCqquiIrAewkCgGajB+fYgbiCK
 ad08GT83AE+I/0JLHFEDDKeOfydroxW2nzZ5v2AdZTgmEnMhwpLrYT92UnT0mFDm55Bg
 yNcGZpZHeEb0Ap7BjyxNV+efHgiiFaS0wvGRun5lgAogB2yHCmf8NvGM6bYzNEaW3/3s
 Xrbw==
X-Gm-Message-State: AOAM530zRrAVYpV30u/hcyLSDWysK8Jdrt3Yn7aqhfAZ9nTCkSIctb8P
 RVMnBaJzqWCzms9ikX1Nwm0=
X-Google-Smtp-Source: ABdhPJyail1n/VQKlTkwnp3wqCDh65LdmehCXEguD0Di2RMsWMwWqhsli3RhEgw208IGxQw8P/ZMew==
X-Received: by 2002:adf:ffc3:: with SMTP id x3mr27142857wrs.263.1618402605334; 
 Wed, 14 Apr 2021 05:16:45 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u6sm5916876wml.23.2021.04.14.05.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 05:16:44 -0700 (PDT)
Subject: Re: [PATCH] hw/elf_ops: clear uninitialized segment space
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210414105838.205019-1-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c8f39459-5106-bafb-94e5-2116546f75e0@amsat.org>
Date: Wed, 14 Apr 2021 14:16:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414105838.205019-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 12:58 PM, Laurent Vivier wrote:
> When the mem_size of the segment is bigger than the file_size,
> and if this space doesn't overlap another segment, it needs
> to be cleared.
> 
> This bug is very similar to the one we had for linux-user,
> 22d113b52f41 ("linux-user: Fix loading of BSS segments"),
> where .bss section is encoded as an extension of the the data
> one by setting the segment p_memsz > p_filesz.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/hw/elf_ops.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 6ee458e7bc3c..e3dcee3ee349 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -562,6 +562,23 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>                      if (res != MEMTX_OK) {
>                          goto fail;
>                      }
> +                    /*
> +                     * We need to zero'ify the space that is not copied
> +                     * from file
> +                     */
> +                    if (file_size < mem_size) {
> +                        static uint8_t zero[4096];

Given it is unlikely, maybe better use:

              g_autofree uint8_t *zero = g_new0(uint8_t, 4096);

> +                        uint64_t i;
> +                        for (i = file_size; i < mem_size; i += sizeof(zero)) {
> +                            res = address_space_write(
> +                                         as ? as : &address_space_memory,
> +                                         addr + i, MEMTXATTRS_UNSPECIFIED,
> +                                         zero, MIN(sizeof(zero), mem_size - i));
> +                            if (res != MEMTX_OK) {
> +                                goto fail;
> +                            }
> +                        }
> +                    }
>                  }
>              }
>  
> 


