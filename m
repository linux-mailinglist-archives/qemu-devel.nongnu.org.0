Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3966D50B5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 20:35:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjP1V-0003Ca-Kz; Mon, 03 Apr 2023 14:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjP1Q-0003B0-Ik
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:35:17 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjP1O-0001e4-Fs
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:35:16 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f22so24837147plr.0
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 11:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680546912;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q6LvyU6QGKhuMNDE7/2b7QiDG3CEbR76RgjKEuu7fio=;
 b=F8AerTUZh2q9400HJ3kuCcOCYcez1zbfQC4TMqWzLkS6Eo6doXuSAL3Wzbo4qMYOA2
 Y8E3byv68GB2x3yCEGJ8BFUHNV22bTVvI9BO7JHpqx0K3RJtc6stOSIw35kaPUA6bz8E
 IF+mKKTMUQ/PdDokX5iOe+JHy8Yi28U9yrgkG4Nbh/ltPtr9bPsqK7IAxNGUCKk+RvmL
 IXhjF4zQB80QQbVS7RaUu/q7kO/sIpcwLQ/it4+zHw7hWsT2/XdIfIkqLdOxdgJwp9dJ
 uTbpPtJg2PqmZS7EfgDh9Ng5rt4lXjRX6wwv/YprRmXZkpHyOi+OLo2XtB5Vv99Avkge
 IvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680546912;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q6LvyU6QGKhuMNDE7/2b7QiDG3CEbR76RgjKEuu7fio=;
 b=qQPbyMEZyj8yHz7q2NEDGJLs1kQaZuQDMRPT/BxmbXE8fncJHJ+S0H0+OEGRqOH4p/
 SQbCHltDEoWRUHIrKD/1XwHfvusg4a8YZt+0Di9J9Q7fSfqd9hAFxwpgVkADSssXnVAS
 mPasa/DvoO/7EQJPym4xkG4qoCfVJcI+amYBrSe/goDkNCbQIbzQ34sNCezCzydfGaTr
 e0gW1CUeElZ48Qz1a4jBkTY976/BRfum+Qo2PUACh2YBZhXQxYFkPH97IZJGXhEiqW48
 TioAHiz3XPBH+tL31FXABdQZxBn71S5BLrXQ+GNSruCVPymDMcDynS2qYX3us8Opq8Bq
 HYtA==
X-Gm-Message-State: AO0yUKW96Wunj5nk2P6eOzBg+bF9MIinlirRYKRXkovJ0GhZaeqhvC+i
 8W7sZbHyetGbuXFvajPA9PxCuQ==
X-Google-Smtp-Source: AK7set+qZrJWW+DXejs0D0zGH4M9qy5Bxd56XPh3uf2N2O+cTCS7SUutKML4hk47M0A9gDf5xZaHzg==
X-Received: by 2002:a05:6a20:4ca3:b0:dd:44a8:9d2c with SMTP id
 fq35-20020a056a204ca300b000dd44a89d2cmr30191893pzb.47.1680546912306; 
 Mon, 03 Apr 2023 11:35:12 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a631403000000b004fb5f4bf585sm6330145pgl.78.2023.04.03.11.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 11:35:11 -0700 (PDT)
Message-ID: <441b74d5-2f13-6166-ec5c-e96b0d0c7de6@linaro.org>
Date: Mon, 3 Apr 2023 11:35:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 04/10] linux-user: Add '-one-insn-per-tb' option
 equivalent to '-singlestep'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230403144637.2949366-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 4/3/23 07:46, Peter Maydell wrote:
> The '-singlestep' option is confusing, because it doesn't actually
> have anything to do with single-stepping the CPU. What it does do
> is force TCG emulation to put one guest instruction in each TB,
> which can be useful in some situations.
> 
> Create a new command line argument -one-insn-per-tb, so we can
> document that -singlestep is just a deprecated synonym for it,
> and eventually perhaps drop it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/user/main.rst | 7 ++++++-
>   linux-user/main.c  | 9 ++++++---
>   2 files changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

