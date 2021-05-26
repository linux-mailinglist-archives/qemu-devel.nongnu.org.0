Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0010F392235
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:40:31 +0200 (CEST)
Received: from localhost ([::1]:33312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1GR-0001o5-1Z
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm198-0007XM-CH
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:32:58 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm196-0007Jn-4N
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:32:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1368224wmh.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y+QbXphY73JEQkDLs0OdN6L/1JgIEE96fGPdBjxUgK8=;
 b=C/SYT11lQuDKxGE4vBJhhEZG1EpqS2XVzS+pma9KFoPIG5N7TlHt+wQsduwS53iqkM
 bT30co7mBIWpeuW8C5bdVQXf1naCrQ2d67qbMV+eoypktmEo12unq/r/5NIW8FChlTfO
 4wPu6VtM3sd1DJ2jD+wtFxwLom0wNaB9elPZWNUIxeeVN49/HFEEW5Cu+ofpOvlW0W26
 HZmbRjMx5uUp0jCf3J/R7xVf/+JPIRmQSpIFH38P0iW+hTSbKcmignKgs/9P7Veg0eLQ
 vAGVaXjh/cA4o3lbWj9Z09afzJpzn7xd5LBtuMZ0Y1fNiTpztuRSTsenyY8Re3o47XjV
 W18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y+QbXphY73JEQkDLs0OdN6L/1JgIEE96fGPdBjxUgK8=;
 b=XxoQ8AZodRjs4FmB9Up/onjhLY+iRbG36J130E4cug8iRiJzDfPVI8A83bSkdbqkkO
 DBdPKmi+Mlrb12L3k29yIs7O3o9bUlQ7kjO5+BDnZ4V9WtC8ICDFv3RzXfBnk7pjynr2
 NxlXmVgZ01vT+POCsE3PCe8sjKj6xuNKSWygZ/MkGAdc4BTYLMIy62ewDqn2V8MOMxOf
 5qX6K5M38mFTkWUI4uXIoNHoBV+X48LNY7KU/t+F6YJFXLr0ov+COPR6OfGjgYf3IgO6
 iJKh3wNI3xwPa2dWndWnq80ANCd2YORLbbkDJdAAI7rmBNhXP1AP8naMLX0JuhvaPirp
 zXwg==
X-Gm-Message-State: AOAM5306qTlO2+Odr2BxX61FC8S2X4R7X3/gAn508GoRDMsqYc54Hglm
 pwQ6WEXjZcnoMVWBk7vIXo0=
X-Google-Smtp-Source: ABdhPJz9i0PdsCeYmhaNkW9zSUhXlsYHRc9YkCF+lbgVs7ZBqjasCMN+QbQjWtAXQVwVPE+yk7woeA==
X-Received: by 2002:a1c:98c6:: with SMTP id a189mr5265585wme.178.1622064774516; 
 Wed, 26 May 2021 14:32:54 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id t5sm8223932wmi.32.2021.05.26.14.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 14:32:53 -0700 (PDT)
Subject: Re: [RFC PATCH 11/15] exec/cpu: Make
 address_space_init/reloading_memory_map target agnostic
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-12-f4bug@amsat.org>
 <30a9e423-5d2b-ae00-3f40-2487f3a5b467@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <24280e0e-f1d8-ab92-cd04-f199b745e91a@amsat.org>
Date: Wed, 26 May 2021 23:32:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <30a9e423-5d2b-ae00-3f40-2487f3a5b467@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 9:01 PM, Richard Henderson wrote:
> On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
>> cpu_address_space_init() and cpu_reloading_memory_map() don't
>> have to be target specific. Remove this limitation to be able
>> to build softmmu/cpus.c once for all targets.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   include/exec/cpu-common.h | 23 +++++++++++++++++++++++
>>   include/exec/exec-all.h   | 25 -------------------------
>>   2 files changed, 23 insertions(+), 25 deletions(-)
> 
> It's not clear to me why the declarations moved file, instead of just
> droppig the surrounding ifdef.

hwaddr is target-specific, cpu_address_space_init don't uses it.

softmmu/cpus.c is target-agnostic but uses cpu_address_space_init().

Similarly with cpu_reloading_memory_map() in softmmu/physmem.c.

> If there's a good reason, fine, but the reason belongs in the commit
> message.

OK, I'll mention hwaddr.

