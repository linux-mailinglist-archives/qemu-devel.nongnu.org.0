Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64039259D78
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 19:43:59 +0200 (CEST)
Received: from localhost ([::1]:42652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDAK6-0000Zp-GQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 13:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDAH4-0005in-EE
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 13:40:51 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDAH2-0001aV-Ku
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 13:40:50 -0400
Received: by mail-pg1-x543.google.com with SMTP id p37so1062519pgl.3
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 10:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=66gQa6kGpxBdIN5DQxQg6iycf5I0HYWdCFEL/9u+eTA=;
 b=KfaihqznucikKrpqj+xTZgf5dpa96trExqYE9+D60p+bZ6BeolyimSZuZAeJXHQnFc
 b0v/Qij4hRcGYPXCRbRzNTk/TTlVo9LOmjQBXQj6z+21ZB2wEfr3fyJJI1Kz0qccI02X
 wo5ocirYP9TuYTGxZ1Kb/tMVuZeE66v9sQqpM62geoGZg+hQ0khS423ojUnS0CofvyH2
 79VfdU0XFgLpLtZdLN31NvxX1e4NEmUgTCW1/Osl8mu7yCuQztiBJvv3oYz3GO9GTcUs
 ziR2R7I2NeHH7L8nTl1vCTvmqvsWsE9EMQU+6e05wAhrwBY7fjaaBRGbaJRsL8yqmqCH
 QUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=66gQa6kGpxBdIN5DQxQg6iycf5I0HYWdCFEL/9u+eTA=;
 b=DbHbtOorMgSvy7FWTAl/zhtVGqEvppLpMxmIc3NRmjFTkD+jLNPjF1XuH4CvWaQQv1
 OT7u9yO4oAL1qQnIeCfSqyqWD+vtjtqZojuqyfe6wVV0Ry4mBm21nHQDRMmAzuvI5YdP
 0HQqsEwXnL5zS7jgBMlsIFJKdirnDSzHEL8/xUcyp3GbA4+QO7z+2cAzsz4z9eSRT8Tq
 N2ubpApjNd9fzMYYr+XV5dIUlNd40WXGJuyzOumrvbSOl1DajQy9qWq7db5kwz7t9wfO
 WMTn0I9YXoCrqU938yRrkAt8QqeJr4beU+nHdGS1re0cwIe2WIHSdIiseXDFqKXUbjzm
 LpJQ==
X-Gm-Message-State: AOAM533CG2TqTnndfuJB/lRzi9rKRCnFoFmL7k/ZFZFwYGad65DsZAXs
 fsTN94ToqBb0tzbZvGQ/Sc0A3g==
X-Google-Smtp-Source: ABdhPJxvv/h7/Ut96ncHHUlLpDyykL4dvs3wsdfCId80dIFUVJZFwEwLnfQMJNvBuypTFZ1TsVZ5TQ==
X-Received: by 2002:a62:19cd:: with SMTP id 196mr2848299pfz.143.1598982046852; 
 Tue, 01 Sep 2020 10:40:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h8sm2613426pfr.195.2020.09.01.10.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 10:40:46 -0700 (PDT)
Subject: Re: [PATCH v6 11/16] cpus: remove checks for non-NULL cpus_accel
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20200901072201.7133-1-cfontana@suse.de>
 <20200901072201.7133-12-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8bf0e29d-4801-c06c-c19f-408aaa7e631f@linaro.org>
Date: Tue, 1 Sep 2020 10:40:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901072201.7133-12-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
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
 Alberto Garcia <berto@igalia.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Colin Xu <colin.xu@intel.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/20 12:21 AM, Claudio Fontana wrote:
> now that all accelerators support the CpusAccel interface,
> we can remove most checks for non-NULL cpus_accel,
> we just add a sanity check/assert at vcpu creation.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  softmmu/cpus.c | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



