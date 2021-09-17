Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682C40FB56
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 17:07:57 +0200 (CEST)
Received: from localhost ([::1]:57918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFT2-0006Sa-9N
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 11:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRFPy-0003Ws-FK
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:04:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRFPv-0001Hd-WE
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:04:46 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d6so15634494wrc.11
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fKHIRo6NHs9TDt7Ahl+WE7rLRLSAw+aamsCuIGZl6yA=;
 b=BmWD0D5f/IjxFf3IwLV1dYN9B+mr9kjWyQQWB9xd8UG7eojyhaN7CO5HPM2tVRcZjn
 WzK4dHNpqEBC60EpslK8XfHqwjPmXrg3+SyW19NFUInTa7puBJCr3pwPLjLvQFAPw1HM
 f9sJphGmQUOU9lbwfpRFXmhAZVzXhXKoUeOC0uxMbzUiAmD9UV8dmJ3JMXWRQGfth141
 aRodLAXMgklyWVWRcLryBRUTMVMloHtRcJOmA5BS2N5l0Iba/OPI+b0RD6VnF7GZrVzA
 dPjWt8eI0721nxvrkEEMZBC7KTKATxldxoIDKJl81BgcPzo5r90/LA6gAqxhWGFBHnB1
 LC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fKHIRo6NHs9TDt7Ahl+WE7rLRLSAw+aamsCuIGZl6yA=;
 b=rfNt1TTI1pFR8CwNQxkNNtj4N9Ow0qwKTTRN3zj+Hh0VfjtwwZGeiAkMwFItQxunIT
 vdYn005JXHC0JMPK3F3ga+CfXme8pki63rK928qm91FM215AG8MUfQ83wzgL9x65cZWT
 WNj1xXFv28dQ3TjuPXpb2rl30yBAnZ+dzJzHSXD4bikMI5lzoWpHzNkdDb2PhzVD9J0i
 6WsiUeACaUoxzu/8WKBvQ235nzXLU5B8SWWiAg9uo/YqankUEDPF26V4bSHLKjBIQrUg
 y18/5aqEfnC9jQjbg15vG/k4lfGwWFuzA98yNJ1qV/7wvkndvRN6fvx6hF/WvDmykuj3
 h3eQ==
X-Gm-Message-State: AOAM53078vcDeQIMcjEV2zWECiwyuUO7ra4dhZdH0ULnxZcWsvjOgH3V
 muhWb2zbJuDTZyehaHP3hyXfiVT53Bc=
X-Google-Smtp-Source: ABdhPJwIY1EFeGxJXAch6hwIQapSCR0K79moYjYTR9IStPk7/ZxuEpzS9v408kEE2NhaUhVrgTCHGQ==
X-Received: by 2002:adf:e8c7:: with SMTP id k7mr12765735wrn.47.1631891081603; 
 Fri, 17 Sep 2021 08:04:41 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id 5sm1977629wmb.37.2021.09.17.08.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 08:04:41 -0700 (PDT)
Subject: Re: [PATCH 5/9] bsd-user: mmap prefer MAP_ANON for BSD
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210917025635.32011-1-imp@bsdimp.com>
 <20210917025635.32011-6-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f2e8b433-e4db-f4ea-61e5-c51cfd32c537@amsat.org>
Date: Fri, 17 Sep 2021 17:04:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917025635.32011-6-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 4:56 AM, Warner Losh wrote:
> MAP_ANON and MAP_ANONYMOUS are identical. Prefer MAP_ANON for BSD since
> the file is now a confusing mix of the two.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/mmap.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

