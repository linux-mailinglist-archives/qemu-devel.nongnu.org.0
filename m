Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34A66A61F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 23:43:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGSlM-0003bR-BL; Fri, 13 Jan 2023 17:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSlJ-0003aT-2B
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:43:01 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSlH-0002Ph-GS
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:43:00 -0500
Received: by mail-pf1-x42c.google.com with SMTP id a184so17210619pfa.9
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 14:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JFuUXodROaUAYB6ammvWLPyssFQl/W7rShYz6IWmVCY=;
 b=AWV9KmEr6IfZQzOXCg99xRh175WBtG/GCyd7qa2FtQOORF8l9NE1co4+V3sU+6/F8f
 p548pN/4iBthXqQsFh2RD3y8+xi6XSGRRvghvI445pwd92HV5MZ2XcJcxCt8WPwFP602
 TFInURKfv587jaq0uvEhAiU652OFie0j/vVWH3zQFfnCMxjHUzAa/nI2ZD7NsJ89QcxE
 /Z1e4BJDmHmzlH5idUniBJlu91nByR036jyq8tAdMJoNMwDS6nTQ3FsRqfqAhpw17H4R
 hgoZrqQxgM5bFEDtDjMWVE+A1yZQuAM9Mb9cgat9/oFYWJcnOuh0F3eY18f3iTntZV2I
 NyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JFuUXodROaUAYB6ammvWLPyssFQl/W7rShYz6IWmVCY=;
 b=2/qmu9nC6XGw7Fa013db/jvynQuIXIZfAALbwqrYF4hQsJCJfHUkk2nGzd/33A/KJ9
 wvh8QCoMEVlHQaqCCto0UchKt5BcH3RPk1LXJhMRYJWxolC6AmYcI0JCkDZRzUWP15s6
 wELIYrdEaYs6rl9Q+YVcAYeNEu5asO3EJFNCe8sSuW/Hc5Znqdqrjq2XKRegYUHp+xlm
 1yVofklIAR9vQWRQxcEHJW4RH8BVJiI4q5GQENVN6RuBc04LoSfu3yZiefuKHPzr0NKJ
 O4/QmnK+6KbMFDctOybvKQbVOGhDnl7BpnEPtvDL7XZj6qJnQ/sDIMXJALdx4vSH0fd9
 7niQ==
X-Gm-Message-State: AFqh2kpzoMG0KXddTrrHesQ+tyBJ04hiwC5nJgf/Sd3WnwDXB8XSCF9p
 h9phVYQMo/wJdvV7vTDmUlAIWQ==
X-Google-Smtp-Source: AMrXdXu5SKW48TWy1e8voWo/k5XDUG/vHDMevzlxxrLSDjfgn9HuGeBMqZhxD36QCpBYJmrFpH0zjw==
X-Received: by 2002:a05:6a00:2997:b0:582:1f25:5b8 with SMTP id
 cj23-20020a056a00299700b005821f2505b8mr51025334pfb.19.1673649777920; 
 Fri, 13 Jan 2023 14:42:57 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 4-20020a620404000000b00576ee69c130sm14094065pfe.4.2023.01.13.14.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 14:42:57 -0800 (PST)
Message-ID: <b4b23d67-99e3-0b79-85c3-e44943b025c1@linaro.org>
Date: Fri, 13 Jan 2023 12:42:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 28/28] arm/Kconfig: Do not build TCG-only boards on
 a KVM-only build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-29-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-29-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/13/23 06:04, Fabiano Rosas wrote:
>   config CHEETAH
>       bool
> +    default y if TCG && (ARM || AARCH64)

Shouldn't need both ARM and AARCH64?


r`

