Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ECD3F93B9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:36:34 +0200 (CEST)
Received: from localhost ([::1]:42884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTbQ-0000CO-51
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTaf-0007tD-Eb
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:35:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTab-0004Ao-O5
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:35:41 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i6so8416422wrv.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 21:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GOY0AJbuJxW1zjfzHJnTBafk0P5u8I86FYGTqiAVoIg=;
 b=DIjZdPDb3ZKkS3t/zBaJrcRKLAuF9ji1d2XoOcpfptlTgzKgMgv7Fv/1XE5vdSnmbK
 KHT/lDuSFCQVEkXHxB5LEdGSGrQNnitsGRjxNgUGyFe8RI6TNz+qyArlg9GDQhj782RS
 sTX/t0uTLN4xDR5MqTmu8tbESYTnFbh/1VrqLhTTs2qiFGAvE9fM6ZhdtK0IOPYtsp1W
 zO2DXIweeh79GNt6Cdblvfpa+rKBQWdUkJaEvP84yZ1OaSsJ2woeAqYFYl9PcLJMgj7x
 l7iGwsNSc0kerq3MO5eK678ujK8zYrw4e4HI5RxDrNg/svO/I/6sY1aenq6oqdqkeLfV
 QX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GOY0AJbuJxW1zjfzHJnTBafk0P5u8I86FYGTqiAVoIg=;
 b=HEYJH5j03P5eMNGlfut4323B2Am5RMEyLjKt6H+ocLi23dyDNnKOreGqSAu8d++G+u
 QIntdtaRoHoiyxqXrdBp3XTvzJmjPklsSTJRZ3NiEXwz2EidZhKXwFXEpQl6CAbUSQaP
 owitCTeYFU747eb6H0u3GBvGWsXXZegqNizAFedjbLaDbUbcpthzlRV4rxVYMTOzI6qR
 +zMvzvhUyhL+ogmQPpCTdh8uehicL399ow1t3HC89dueEknN9hVOJTDb/qAMHkfak79v
 phnB41OUY6vWyEwQmnf9RZWS7bgPQxkog55TwZ5Nmrb8H4np06JsaT1DKWRedqPLz+Pp
 i1TA==
X-Gm-Message-State: AOAM530Ol/MMYywDzrZtNY1CqoqsEJCn4uUgQwxQo9klAzIWm+i/cS6n
 vcq+M1NRk85qEBIAA5RY3M8=
X-Google-Smtp-Source: ABdhPJwN/uLLmPA7sT4Fn9bpIGKPplAIqa8cEVJnzrxRjneZFD9lJPYl2QrutqzD4qTaWHYQd/pwIA==
X-Received: by 2002:a5d:4010:: with SMTP id n16mr7642066wrp.378.1630038935114; 
 Thu, 26 Aug 2021 21:35:35 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k17sm11802411wmj.0.2021.08.26.21.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 21:35:34 -0700 (PDT)
Subject: Re: [PATCH v2 15/43] bsd-user: assume pthreads and support of __thread
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-16-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <33e452c2-4fa8-7ccd-dbe5-184698ae507d@amsat.org>
Date: Fri, 27 Aug 2021 06:35:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826211201.98877-16-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
> From: Warner Losh <imp@bsdimp.com>
> 
> All compilers for some time have supported this. Follow linux-user 

Please insert: "(see 24cb36a61c6: "configure: Make NPTL non-optional")"

> and
> eliminate the #define THREAD and unconditionally insert __thread where
> needed.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/main.c |  2 +-
>  bsd-user/qemu.h | 10 +---------
>  2 files changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

