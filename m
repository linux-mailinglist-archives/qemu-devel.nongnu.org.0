Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2D5696937
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:21:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRy3B-000217-At; Tue, 14 Feb 2023 11:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRy35-00020t-Vt
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:20:56 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRy32-0007Ni-Sz
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:20:54 -0500
Received: by mail-wr1-x434.google.com with SMTP id o15so12927994wrc.9
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wmLzgPnKGW067FXTQed0pL7FxoU2P5cDDamSIIIEX5o=;
 b=NJO2WEJ/PVvQ6XKTD6tVGde6HvTW1vp8x22CpJfq3vEDGUITsEDsVNBVYmiwuuwx9U
 FuR98U8gRrdPRnvE3KapkR3t/2bOvrd5tHBqMA6PcwCFU+KbX1CMsfRHNzycskJKLR0t
 7xuQDQXUyvednqaXE9kEPdXu7OwXvbEgLCXqh765OQtvRW1SZf1k4zvJsNEWFppPrjwN
 5OmAcYTVr4twd6N9sG99UByaKQUhresARHTVOs2asoJTu0TDyZHNpwDAUaVje/br3EA5
 NLDk/mX7JQvN1aNvzdundhWkPUhU7oApu8Pe8DLVGBgurz+td/toWai76v/lcCKfMrPy
 XgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmLzgPnKGW067FXTQed0pL7FxoU2P5cDDamSIIIEX5o=;
 b=LzQoBSLClxtQowESLcDyrcIeh7ATtf1uU2J9rYI5AgjalL316uHsl7YLNXRHrz9e+J
 4BcEGxIGA11ta26HZXPOOV47eKCBtsYdDpaBOkwI5PHKXFdi29DB+SOiJPZe8+D0qSUc
 dT6bL42vi9pt0/iBPqCvfvEE+R7X24FO1fPaVQsaRlUrttWy9l68YhBizM/YtZ7swLB+
 ic6veGacwHqxr3Vo6wCN8rlRU5fkHZFCN56UvPcrlJYeauDBZbyrub/QjXqZr9yrfq6C
 mWvZzLFUZ8NIB73gWMes0MPyZ783LMs5qefVVR74HmRKtoArlKvutf+KAz8Q+7IqhKFL
 lKxg==
X-Gm-Message-State: AO0yUKXBRDQM2WnEo4zTVyqPcOM02oSFA4/n3FZOmKmlIFx0uHVQwYqQ
 x34/9AkA1niUxAZZvkblX+Q=
X-Google-Smtp-Source: AK7set+Ly1j37chgqDsc0eb0kCkWOR4nVr2ps914H3d7+SP5DnuuKN8PIEFLK0mDNOjnAk2g0+ca2Q==
X-Received: by 2002:a5d:6652:0:b0:2c5:5ff8:6aff with SMTP id
 f18-20020a5d6652000000b002c55ff86affmr2972443wrw.3.1676391651153; 
 Tue, 14 Feb 2023 08:20:51 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 b16-20020adfe650000000b002c5534db60bsm7144653wrn.71.2023.02.14.08.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 08:20:50 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d1d425b6-6136-d5fd-ba62-6f48fcbbbcf9@xen.org>
Date: Tue, 14 Feb 2023 16:20:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 59/59] i386/xen: Document Xen HVM emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-60-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-60-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw2@amazon.co.uk>
> ---
>   docs/system/i386/xen.rst    | 76 +++++++++++++++++++++++++++++++++++++
>   docs/system/target-i386.rst |  1 +
>   2 files changed, 77 insertions(+)
>   create mode 100644 docs/system/i386/xen.rst
> 

Reviewed-by: Paul Durrant <paul@xen.org>


