Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6F96298EB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:31:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouv3U-0002Bw-Io; Tue, 15 Nov 2022 07:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouv3G-00022E-Qa
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:28:36 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouv3F-0007V9-BN
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:28:30 -0500
Received: by mail-pl1-x629.google.com with SMTP id v17so13037736plo.1
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 04:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rrmLktEkiNyMX71VG8wjnY/9D2Kaw5MV3nNa6OMxlTU=;
 b=PARyTTBR+vj+4wQM2SyFDL2ja7yoWzshr7yO6xsmoB/0MGApiIFW3xW/IRpq8FqVf9
 IUPkawOao1HtNp7hpLdToiqpk4ydhmQqS7QpoD0lvmMhlf7l6yUd51eXsNzlwFo1qKip
 6696SNXSWBnhr5JgRqdBBSFsxHBgZqLVaowS1ofUJUxCRUZj3qSomcto5tPXfnYMQMkY
 I00emz9zcUgh0NdU+3bsyDSXi9HMNpD91YxOx7bQ2+W9SumErDI1QhSr+IBDhPVmCglR
 HBhLmXxNgcQAopD8bFGSbcqfc4z8Rctpw39mXr2SslFeur5YF8sG0Dr2kUGSPPcsGJdC
 Z+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rrmLktEkiNyMX71VG8wjnY/9D2Kaw5MV3nNa6OMxlTU=;
 b=qMk2HS1I2piqBl4c6gLyiP+Pq3D2STUCw1Y/OyScTfmuJwse2x+th7W7XfjgD9mOwd
 EQkosq3q0jKwyl5fKWvR98C7vhmSs1f9B6otV/6VUxb7Qlus4CYo3cOKd4gNgmAFI6l1
 5Ce4V/ykf9ku/VbWPdv3+rOyTag22v2bIU3trrTmtrZC+bBgxnq5+ZlDvhIHF2Zn/A4X
 J2vRq0ovXdspH6vaMrDkr2DPZdy1J4YT7Xwsso5PFWl6DShisCdMsL3/9Urub8yHA8Gj
 WkwQaGf8rUEm+rMitNtu8o0zU3r0x7PFX+deBOqKAax2Tfqoq4mfuUBOE2L6s1AiQT7T
 36WA==
X-Gm-Message-State: ANoB5pmGphZf7bdNvfDSACUxzh5okf8hGbzE60rxt4annuu+5v9FyU+R
 BFlipd97fRz5g7UXaPLhqYMLpw==
X-Google-Smtp-Source: AA0mqf6JVNBLNF4zLx7CtQNh3W0PZm0fGRgQdoN9DL2f3m8LnldZ33h01Gdj5rPFmJFRtsKmAo0CVA==
X-Received: by 2002:a17:902:ef87:b0:188:77a7:eb4 with SMTP id
 iz7-20020a170902ef8700b0018877a70eb4mr3794440plb.32.1668515305817; 
 Tue, 15 Nov 2022 04:28:25 -0800 (PST)
Received: from [10.0.0.228] (119-18-35-77.771223.bne.static.aussiebb.net.
 [119.18.35.77]) by smtp.gmail.com with ESMTPSA id
 b24-20020aa79518000000b0056abfa74eddsm8887192pfp.147.2022.11.15.04.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 04:28:25 -0800 (PST)
Message-ID: <895a0695-7015-2600-db00-79cc1d4e4bf9@linaro.org>
Date: Tue, 15 Nov 2022 22:28:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] disas: recognize either <capstone.h> or
 <capstone/capstone.h>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20221115115552.77242-1-mjt@msgid.tls.msk.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221115115552.77242-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/15/22 21:55, Michael Tokarev wrote:
> Historically, capstone varies in requiring either <capstone.h>
> or <capstone/capstone.h> include depending on version and the
> way how it has been installed.  This has already been an issue
> before, and will likely become an issue again with capstone
> 5.0 which seem to have changed this aspect once again.
> 
> Recognize both ways in the meson check, but prefer <capstone.h>
> so it's easy to override which capstone to use by
> pkgconfig's --cflags (or --extra-cflags).
> 
> Signed-off-by: Michael Tokarev<mjt@tls.msk.ru>
> ---
> v2: use cc.has_header, not cc.compile (pm215)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

