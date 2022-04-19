Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADAA50795D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:47:27 +0200 (CEST)
Received: from localhost ([::1]:56310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsso-0003nY-7l
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsoU-0002BK-BE
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:42:58 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsoP-0002RU-AP
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:42:57 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 z6-20020a17090a398600b001cb9fca3210so2783968pjb.1
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0e9X/HSVKOqmtHaUpwok/lcFZZBy/z9L7Vm2RhwBKwo=;
 b=OGnsK0YGxPmHqGSlmRH+N66sEgKDJNH+Z82i7tuAKf4fGZ0NIrOZjhs2C/Qi5x7gQc
 zaxu6dO5MznbFUFm40YsPDpTmgI/JRun/Xx142IyqSGpJqldnY9EeXCWBdfhst+sATu9
 Co2W58LPwcUGZmh825hubIazWBnNB8pmLPD3Gs/c5woN5li0Z6KaHw4yCai6vn7zwSCp
 c0m2n0BDASwuBRhvHj/kpA9vp4sxiubOTz0IkSbBIFyZVupM9UJJw1jjAfvoxomGOU41
 fQiU2f2DHB7Wx7SCvfFQyY+ba9E/E7Q8Or2kfNF/6xmkjFY3bI0xcRmat+xOfLXDocfQ
 mRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0e9X/HSVKOqmtHaUpwok/lcFZZBy/z9L7Vm2RhwBKwo=;
 b=28ObVSv4yxgYquv0DlMmTUc4Qxmg9kFUp72AbHJykt/T+sz8J8YOGFkOPOkiahSotd
 9IacDMicVwZDyFqv8PB5mAlE5jJCr8JuSnuUUj8lrv1FxYXi1RMc/2m8jnoYocn4HUQ5
 O6hcouCVITHExRso5kwJURirhaiN81sNwo1MJs/8oXguKqzaKSvmNj+rCN+Nmkjd7E9g
 P+mS0dtzRQJyZtoeR01gxx/ceUqq7o9EUUDuU8a02YU+qUJQuU+6jBAo7N316e+Zhpd4
 714CrbcDYL2VmFhJEqgLEUNGmC85wDW+3a3eudgsLt4Sf2Z3bXMqStMx6xi6SJeKqpL5
 gBsQ==
X-Gm-Message-State: AOAM533RB9EPLtUqL9poNDuT6F9j/TvN/DDUdg5y05q/s5LvdYUsGueP
 HMyO1meJOkLHcEE16ofSYL5Htg==
X-Google-Smtp-Source: ABdhPJxf98CV1bnW60V8IH/cyZLv3ZY7/tNClNeMYBHL8NxVRCruD/cMd8iJl1YU18N3Pa6iT9d0HQ==
X-Received: by 2002:a17:902:a503:b0:15a:1050:d605 with SMTP id
 s3-20020a170902a50300b0015a1050d605mr4318238plq.87.1650393765083; 
 Tue, 19 Apr 2022 11:42:45 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 bu7-20020a056a00410700b0050a4ccc6138sm13504236pfb.139.2022.04.19.11.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:42:44 -0700 (PDT)
Message-ID: <41fbe512-f7e7-03c8-a39a-a1f862956c45@linaro.org>
Date: Tue, 19 Apr 2022 11:42:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 08/25] tests/docker: inline variable definitions or
 move close to use
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> Variables that are defined with ":=" are handled imperatively, so moving
> them closer to the first use ensures that all the assignments prior to
> the first use are taken into account.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20220401141326.1244422-6-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

