Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFA86A8E3A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 01:40:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXtRz-00006l-Bd; Thu, 02 Mar 2023 19:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXtRw-0008Oe-3P
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 19:39:04 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXtRu-0006KK-8n
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 19:39:03 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so699242pja.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 16:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677803940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jjs+PXaJwEZjInDVd9k3GdzSx3neDkBzjkUnOMNHmLY=;
 b=kLzkmdRTakxMBzigKLuzJmDm8wjQ5W5QFwbITTvZ4vHNabsS2pUahL7tUHVuPf9hP5
 7JA7QEGwSf6XoRtQArYl3HHtuXcmFPHrUdvHo96ogErSojrdKbECh6vutpDGmnHNOKiF
 uLh9aCg+G6zvFOGFX8IHr62O5zf/auBic7OSKVG959MT85DtG9h3VTK0kYBYH6pMBk/v
 vEred8AiKaQkdNWmlAZUdptZdLfFIuq2sZ6fweQPe7fM4qDlyrGlclFEp67UIx2BIH2g
 ZXTnvngFQgJKbDiZ8NGciQiSDrZyNxglUVQ0+Z1NfVW3fw9Y/GDju/X0urFdk82TRcA8
 xZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677803940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jjs+PXaJwEZjInDVd9k3GdzSx3neDkBzjkUnOMNHmLY=;
 b=gTY3aIT7ujgyAeRcnfEmL8dNqqzYFPaVtTuGov4iV1myNVLVKmT5LecDQik0OK0P0/
 SYmjCZOqCJf2MsE3Q7DMuBv3A0LhEQTCJMoBSdcsBk4FaJJIj7KuW+Rbrw89yQXoorK8
 yR350+kuhLlIYEUL9cYFNuOLIWTWKxEEtoi+EmIRnrabLKYsXa/BjhtS7eqTQaZCipFm
 oeJJSAciB9wMq4tBfqjSlwVhs43n/I56s8MU+Tqv7liAyv6q+bXc0CchAcHlbRHFsV/W
 TaCZ1JKfN1AnQqxrOueNSopjVHvJfFKeBuUryK0Vx+uEZmJ6u2JrTcue6QJKrDSvRbkj
 strw==
X-Gm-Message-State: AO0yUKXfOmnoatglFXoS4XMhVzmeemsuRPzKh94H2dYrUI/tz926vro5
 IuaUC90HEkQH0GcEjm9FYDZP+w==
X-Google-Smtp-Source: AK7set8IivoW/X1D+KK4w7jhdZQGSF6MCP1cz/+RPgtNyTKIBIDb4Q9gagbHQwVKs2bdp9JCseUaXw==
X-Received: by 2002:a05:6a21:6d81:b0:cc:63c6:5a09 with SMTP id
 wl1-20020a056a216d8100b000cc63c65a09mr494849pzb.18.1677803940315; 
 Thu, 02 Mar 2023 16:39:00 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce?
 ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 78-20020a630451000000b00502e1c50af3sm251837pge.45.2023.03.02.16.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 16:38:59 -0800 (PST)
Message-ID: <7823fa02-08fd-4130-cea3-f44b8c51d584@linaro.org>
Date: Thu, 2 Mar 2023 16:38:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] gdbstub: attempt to split gdb into 32/64 bit targets
 [!WORKING PLZ HELP]
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230302192546.2617633-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230302192546.2617633-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/2/23 09:25, Alex Bennée wrote:
> Instead of building gdb syscalls for every target only build what
> really matters, 64 or 32 bit support.

Since the *only* usage of target_ulong is in the va_list for gdb_do_syscall, and as that 
passes on to printf, we could just adjust the interface to always pass uint64_t.


r~

