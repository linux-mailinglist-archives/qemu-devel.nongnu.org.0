Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E1532346F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 01:07:39 +0100 (CET)
Received: from localhost ([::1]:39794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEhiL-00049W-SL
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 19:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEhh0-0003iq-Pn
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 19:06:14 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEhgy-000144-JS
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 19:06:14 -0500
Received: by mail-pl1-x62f.google.com with SMTP id p5so50909plo.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 16:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rQLLLDiuFPJ9X8aGRPk58f4+2mqg3Tnu8e0FseQEWUU=;
 b=QNzQHJ/6M8n1wBiERD7q1IjXJWI6lysp67ywPBOAefppCHBpnMxiH8o8q1A/sZG01c
 lTnFo2vPunqrwqJdcrxcmPBGxZ1F09sEjGfvTA9Z/RDekdsUwfW5fj0kVpM8eK4t9XpO
 D1MZxEsWBeop6VZr2AsUVgVD7gYUNI7e7BOcje9cjLcmj+rKGHlcahHlienyvOP6LPxQ
 OXZA9shwN/7GzLAkDGBRoFyfk6dzSbk0FNb78wDifUWcrTx3Zs374JYxLY0JgnMs4hqy
 5L8UFlic7AAqvx9PrAy52pBp/2gEJBwE3Ubu60dcS1FLPwQ35mpOM9F6ZGEtaF5EFcbB
 lIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rQLLLDiuFPJ9X8aGRPk58f4+2mqg3Tnu8e0FseQEWUU=;
 b=bT3nywUiGVa4PGq21KnxN8TWgKh1aDmMCsci/Xp2eC+Anpg+n4haQ4SLzI6ono0Smq
 y+7ndtDc61yAo+Drqbez6YF0Umwm+QRczgynK4f9L7SYANJUlr8jyL52T8WFjlTZMedX
 aupqAaZ/IxRl4yI8OiLS7OfKXT4RqbD8aQypLlHjO3vEBAwXaBogfJk9fPuANejtJT7z
 PcL5tgZmdGzrQOMWQhEiD1XiBQ6gspKwUMP0zZRq0bfEe3P96cm/GdWa0uPwk/wG1Bma
 vXCA8f0neeAXyqYmwzUoKA3YVrCfID/tMvOE41/iOxUWr+U7Xnnnm7u0CwCnA+Y4KwKP
 PpYQ==
X-Gm-Message-State: AOAM5320JvMu+D/DFH9HdVaz2fNtSdZBYCZgV5IL1EhcXZaGrGHOMcqA
 2my5SIl9k/wi3VJvAR23vT+Xlg==
X-Google-Smtp-Source: ABdhPJxxlVzXf/VDkeZ8oWKuafX3BDxZBTUQfngvR1zs26v9aBM2mVb9CERr3ig22dcT/D1l2TYRPQ==
X-Received: by 2002:a17:902:e54e:b029:de:8c70:2ec4 with SMTP id
 n14-20020a170902e54eb02900de8c702ec4mr30083937plf.56.1614125166084; 
 Tue, 23 Feb 2021 16:06:06 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id x17sm301839pfq.132.2021.02.23.16.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 16:06:05 -0800 (PST)
Subject: Re: softmmu vs sysemu [Was: Re: [RFC v1 06/38] target/arm: split off
 cpu-softmmu.c]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-7-cfontana@suse.de> <87blcc57rj.fsf@linaro.org>
 <e7f21ff9-b2c6-668e-c973-d2949b81327e@suse.de>
 <2765ff1d-8b77-c2c8-c48a-dc2f582d80ff@redhat.com>
 <477a7799-cb25-afa7-c280-09d839a2b180@suse.de>
 <a6682a0f-5993-ed12-98d7-0c8f59385bbd@suse.de>
 <0a47d627-fda8-54c7-dbf8-2ebfc9000137@linaro.org>
 <9dee8138-2088-33ba-b941-494c64925004@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cbece07f-67ae-147b-98b7-62b37b16e808@linaro.org>
Date: Tue, 23 Feb 2021 16:06:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9dee8138-2088-33ba-b941-494c64925004@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 3:43 PM, Philippe Mathieu-Daudé wrote:
> On 2/23/21 7:51 PM, Richard Henderson wrote:
>> I just want the file naming done correctly, while you're renaming.  That is
>> something you are actively changing in this patch set, so we should get it right.
> 
> So what is the new directory structure?
> 
> - user/
> - sysemu/{tcg,kvm,}/
> 
> or
> 
> - tcg/a-user.c
> - tcg/b-sysemu.c
> - kvm/kvm.c

Personally I think this second one makes more sense, focused primarily on the
accelerator and secondarily on the kind of emulation.


r~

