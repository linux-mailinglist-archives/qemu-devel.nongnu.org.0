Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37606FE11B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:05:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlNG-0005gE-Kh; Wed, 10 May 2023 11:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwlN7-0005XD-JF
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:04:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwlN4-0000re-Nu
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:04:53 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f42c865534so19763875e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731083; x=1686323083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gOi5g7wDlbRMvmje5SNfttoW9pl6ZQtmt7lkVB1eqk4=;
 b=MbmEGhTiaH9Gpaeg7nfQky78rU+IUbX/N97vUg7KzJCRyQFVclIzc+NacBvWFfLAk+
 lJbEr/zHBBvzii0CiyF5I1yaRjKBEsLGutiNf9cxcSiR/FvlvsO1DwLE4TMWQcHq3XxN
 7Yg4D1ysWLeztM5DoOENQvmhYuZ1GnMYbm9OFXlXqt6DAAElq3kNSihvPbdgK3ZogAm/
 8kwUdj6+ZxZpp7YP0P36eq9UtPavE3Dme+7Fd9s62Omf5BmdIQ4Jc0889KzOwWONoK2T
 TozmXNOuountouTiT63792L1RcgnICLc/6ZLfqDwgA1fayyPODYctf/RqC3fADYXH4NA
 kKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731083; x=1686323083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gOi5g7wDlbRMvmje5SNfttoW9pl6ZQtmt7lkVB1eqk4=;
 b=gWNoR6R/05dwch5mtWNoC3xtWPGaBuUQUtw9SsJLQYHvvzpUeWl8vcqIPqORYQIQUA
 uBrt4alSAZ7oUw/axNMpBVdtDymGC3j/UxthBaMZnBSwRJVx2uHhPQDR0bVODkkCs+Ns
 nIsfjw6JJ/Si9bTlNhwlAr32a2khFUK1eU76lrzJPnXc+aG4rFvKrILtCXGNqV63BgaG
 4JirBxMosRrc0A8hlXNTjFq4d4bLWsT+qkcdEbLfjCVCHchxtP6433gLLFWzqFuYQr9n
 K68iGDZCbkzrQxx0EgU8q0cp+95DAcOv35fwt2gSyY3Tql685FS0PoY8PdvcZ11wHXlm
 f2yA==
X-Gm-Message-State: AC+VfDypBmtoP/K1eCbw5tITpa6RivRH2Czalnc74GlL7lDI/Si6CSdB
 5iZIvPXdkeuR3NzMXtiaxJX55A==
X-Google-Smtp-Source: ACHHUZ60DLW557rWkyMviTqTcFsXSUwELRseDKg1CiWG8rly9PJNzLujXSPa5C8lsJGmwiein/p5zg==
X-Received: by 2002:a7b:c051:0:b0:3f1:6ec5:3105 with SMTP id
 u17-20020a7bc051000000b003f16ec53105mr12770732wmc.20.1683731083479; 
 Wed, 10 May 2023 08:04:43 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm23160976wmh.27.2023.05.10.08.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 08:04:43 -0700 (PDT)
Message-ID: <66095dfb-64d1-cb13-c66a-b21d303ae33f@linaro.org>
Date: Wed, 10 May 2023 16:04:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC 2/3] linux-user: Drop uint and ulong
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20230510143925.4094-1-quintela@redhat.com>
 <20230510143925.4094-3-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230510143925.4094-3-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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

On 5/10/23 15:39, Juan Quintela wrote:
>   static bool can_passthrough_madvise(abi_ulong start, abi_ulong end)
>   {
> -    ulong addr;
> +    unsigned long addr;

This should be abi_ulong, to match the parameters.
Which should matter for 32-bit host and 64-bit guest.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

