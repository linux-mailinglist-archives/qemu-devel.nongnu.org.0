Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CE03249BF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 05:29:48 +0100 (CET)
Received: from localhost ([::1]:43652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF8Hb-0002RY-Jr
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 23:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF8GZ-0001q4-GL
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 23:28:43 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF8GW-0007iO-TZ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 23:28:43 -0500
Received: by mail-pj1-x102b.google.com with SMTP id t9so2728234pjl.5
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 20:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HUGsmA0znWXN+fZf3x3DY6izGlwX3YlTA+S5U5q1HJI=;
 b=bf45gkqAuHeLEfh2upBLlnevQpPws2g49ST1DHotSInEGUG9lkhTa+Cmg+DmAA+sTs
 IkkrZ1kt4nptRMZFGPU3/AUFBFH1nebOv6srPn7/05xq5OdEGs1yOyGcaUEy/mNHFAA+
 VrXhD9SaPiS2Ia0UIlnypiuhCdZElhaXs1UAiFYfRNOpc0qKazqvecYC21RUJ0D6ZpAJ
 xSWQGeK1y7YDLZl82Xae6L+fE7u4BDX6lZb/7RKtPiPvsuxDXdn8rs4ZBKoofZu2GFEi
 aXmIxbabPTqkY+ywNNWP/To7BZ+2msKa4ix0ZzoO8m0gMzKYictyp5f8cgqHMghMqOFz
 56Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HUGsmA0znWXN+fZf3x3DY6izGlwX3YlTA+S5U5q1HJI=;
 b=guxeWbThe69FlFoRFmBQNCVuswh1ZUalCtgQ1/k++x5ikgOCDzsVWfP5nWjbDIXAfm
 HuQvi8K6vF0rutaBqLfYqB0wtfQ0NiCICR3Qpp7KVT9yUSOo5sewbK0rR6bsUlzNxeZn
 eJ2EXt2JcrYGY2yvC4savn6/uFA5bforbCETkfkHWWpQrN0mT5OR1tMHP1PISuGlPdLS
 mfnPwSfVnJMBq9bQdyMfCcTfKyu/ySoioMkWRAdN5gsJ+IHygU1iwuNF5UjyHfgwYqVn
 KkSYznO03PeEjrvZko1Fs08rW8A9E+9fPGnBtewAbeFJDZTh5HgsS0/YuqjRp8jVSGte
 td9g==
X-Gm-Message-State: AOAM5334pvHvzp5EpgSXIBEUpvsna3NJ5UgeiWq22D+yls8QwRq+v2LN
 cwfG/DrTdzm7MxT4Jiy22aHLqj9Rc6ERUA==
X-Google-Smtp-Source: ABdhPJwy5CCy5OXlwvmGmwcwwba/Jgna74wDN80cEpD0TyBzw8HRkyHct0P936GpuKzb/1oUsNYqEw==
X-Received: by 2002:a17:902:f541:b029:e3:c356:a3ab with SMTP id
 h1-20020a170902f541b02900e3c356a3abmr1398247plf.68.1614227319365; 
 Wed, 24 Feb 2021 20:28:39 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id v5sm4295469pfc.100.2021.02.24.20.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 20:28:38 -0800 (PST)
Subject: Re: [PATCH v22 17/17] i386: move cpu_load_efer into sysemu-only
 section of cpu.h
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-18-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dfca2069-9d18-4431-f3d5-fa189aafaa80@linaro.org>
Date: Wed, 24 Feb 2021 20:28:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-18-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:34 AM, Claudio Fontana wrote:
> cpu_load_efer is now used only for sysemu code.
> 
> Therefore, make this inline function not visible anymore
> in CONFIG_USER_ONLY builds.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/cpu.h | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)

Perhaps move to cpu-internal.h?  It is not used outside of target/i386/.

Or declared in cpu-internal.h and placed in cpu-sysemu.c?  I don't see that
it's particularly performance sensitive either.

But one way or the other,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

