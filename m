Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006C461A426
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 23:39:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or5Jo-0004ED-Kf; Fri, 04 Nov 2022 18:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or5Jm-0004Do-Gp
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:37:42 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or5Jk-00020E-HP
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:37:42 -0400
Received: by mail-oi1-x232.google.com with SMTP id t62so6588688oib.12
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 15:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IO7Sm74j02R5N+IpYke7UXxMjiXfHFyQhtT67MPCEHc=;
 b=BYvwA8ypxkngb6d2e+UuqiAYJvrGrXyGvWXaK/T3k6dZW8g3QIvsCQeuYi8kQCm4/c
 IGYq0zR4iA/XuvmS8RwHYdr6+e+U7DGv64XJKknoGBaBqqhC1nePltG56fvmey+ZETcZ
 oO5lhNI7YpE8UrR4GGZd2mq+OzVN2y7YkviM+kpKbl6e7ur3LDZjvhOi/XErYm0pwXsh
 1uXcODjIDqW3zMZZJtFQA1Ss/EXvX3iQJlQ9yDvB6TRXGbd9sZjsh3RfmMUG3TIGJSHA
 Yng0g6jJ2PLb0GTdxukqNJ95wbNrfMKPKdjsI0nQf4CyXaUchUddH3q44XrQ66R5fZMi
 bcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IO7Sm74j02R5N+IpYke7UXxMjiXfHFyQhtT67MPCEHc=;
 b=BiP2K3V99zu8iXS2UN+Q6VNdvl9TBJmalP7itMIlDPtm0r+WFTXRwchIHg1dj1WpBH
 Zm9oQcnVyofHKAWOe4us+oDO/NEhklDHTitdWWHc5DDx1opegQygBwnqtV1vaO74+ewo
 gXkx5uCaI2ZfKNVGxC90iunW9/jhm5L1GVibpul4A+yiTHK5KzKrEUF1XaQDRbjRZcKV
 TQf45jW6wPd5LdPnodCwktP5M8j7r/4pno4P+tUkWqmynpUotigXyK60eLH7+gY8Okkj
 QAbSaChXqLTyQFQY2r56C4slRnf06NPJepu5PrqUEZWOOxUr1ArmXt6sSVkpYtCIGuGT
 Z3eQ==
X-Gm-Message-State: ACrzQf3NvfEFZUuNv3CxT/u3Q65hhFN/I3yMWsLtHIApMgvGYEUYKUIp
 RtRKnD8aQya3noHOl7N6okDnwA==
X-Google-Smtp-Source: AMsMyM4M5iFid3/BzP5JoqyUGy3ZmqQatsCbWpMikREXC7h2zCNJMr6aFUWwFgApmgtr6r2LthW/NQ==
X-Received: by 2002:a05:6808:11d0:b0:347:ca40:66ec with SMTP id
 p16-20020a05680811d000b00347ca4066ecmr28447079oiv.214.1667601458859; 
 Fri, 04 Nov 2022 15:37:38 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 a36-20020a9d2627000000b00661a16f14a1sm252243otb.15.2022.11.04.15.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 15:37:37 -0700 (PDT)
Message-ID: <136930a7-7e9d-8450-284a-17dba47f4e31@linaro.org>
Date: Sat, 5 Nov 2022 09:37:26 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/2] util/log: Make the per-thread flag immutable
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221104120059.678470-1-groug@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104120059.678470-1-groug@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 23:00, Greg Kurz wrote:
> While working on the "util/log: Always send errors to logfile when daemonized"
> series [1], I've encountered some issues with the per-thread flag. They stem
> from the code not being designed to allow the per-thread flag to be enabled
> or disabled more than once, but nothing is done to prevent that from
> happening. This results in unexpected results like the creation of a log
> file with a `%d` in its name or confusing errors when using the `log`
> command in the monitor.
> 
> I'm posting fixes separately now in case it makes sense to merge them during
> soft freeze. If so, I'll open an issue as explained in this recent mail [2].
> 
> [1] https://patchew.org/QEMU/20221019151651.334334-1-groug@kaod.org/
> [2] https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg00137.html
> 
> Date: Wed, 19 Oct 2022 17:16:49 +0200
> Message-ID: <20221019151651.334334-1-groug@kaod.org>
> 
> Greg Kurz (2):
>    util/log: Make the per-thread flag immutable
>    util/log: Ignore per-thread flag if global file already there
> 
>   util/log.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 

Series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

