Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE02324894
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 02:37:17 +0100 (CET)
Received: from localhost ([::1]:46342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF5ad-0006my-R7
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 20:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5XT-0005id-Cr
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:33:59 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5XP-0003jr-Kn
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:33:58 -0500
Received: by mail-pf1-x432.google.com with SMTP id q204so1484881pfq.10
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 17:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ue9WYH6Oho3NQNkuqDzpqLniDCQxKotVljdNPtO5QtU=;
 b=dccExEwfmv00bI7sSdx11exIrphu3XskxI9nfQXPbdDAapsUjIf8yUlSNPA6+2CgFQ
 qpCCrqPrZ033u7mWAZhYZ8KIHkpxyq0lmUJOKEDGKZ+//eMlJ98CWQXY6Z38L8lLndTs
 pd9Kr7W1ZTma9JW+UteabA/pGoTBOBbG/P6ho+m2y/pwMlMwSNep+1BDUcrCutnRXd8J
 Y49pQZV6PksCyBDP3Lkw1Wme2+/DhvSyAYXFTsswm+bDgd7YX2yvBwLCn9MvUJLQhJ1w
 g+mPTYhGndXOTMCPHoh2knlRHdPf2G/ZRQqSMqT7qjYfsog8n6UZacLToGL2wavK9yO8
 yv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ue9WYH6Oho3NQNkuqDzpqLniDCQxKotVljdNPtO5QtU=;
 b=XBrxHcvGngdNdzS0D1td4f8Rj9VhZ+0iOjkdZNyWOitXCYWZEgIyQGfcK1/XcOJZQH
 +TFu0ZpsZR1g75LCWEm2aVbaGQl5Em86q189KT1SxnDUvzhNpF3BwCV2AJixQrPJeI0z
 J0kkVhi77ZoCdHiU5HYqaXgliuLiQOoxZPVgEOhRvAVgNnYUstpiGDD/5zRaKuJVuIjH
 nuGetiWkhQRkZTMmecS2bTkEY0uC8l0DOF17VNdRuWek/TplDARd+xTaWsWT/oY54yAk
 cb7tW7YPsSxWl1pLOrwD3v3EUDsGQsMKIuhd0nNeafv0kwgC8gZBC2vDdB3J4I0gS+92
 hntw==
X-Gm-Message-State: AOAM530W47GyL7VYdRXoYjJHrfFjkPq4W5CF5Rws6VT7TzbElvGvpDpm
 9Yu62Uza6a7ahizHlABWndeK8q0PJWpm8Q==
X-Google-Smtp-Source: ABdhPJywrgPWtqnIsD7sIYAndJaR6PVNBLhJHz/taUvVJNzCGe9D8qMvHozPyxsaFaF6QONAUNK5fQ==
X-Received: by 2002:a63:1b1b:: with SMTP id b27mr661369pgb.377.1614216834127; 
 Wed, 24 Feb 2021 17:33:54 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 67sm4234805pfw.92.2021.02.24.17.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 17:33:53 -0800 (PST)
Subject: Re: [PATCH v22 09/17] i386: split tcg excp_helper into sysemu and
 user parts
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-10-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a493303-3d66-3f78-b86b-139476a022dd@linaro.org>
Date: Wed, 24 Feb 2021 17:33:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-10-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/tcg/excp_helper.c        | 572 --------------------------
>  target/i386/tcg/sysemu/excp_helper.c | 581 +++++++++++++++++++++++++++
>  target/i386/tcg/user/excp_helper.c   |  39 ++
>  target/i386/tcg/sysemu/meson.build   |   1 +
>  target/i386/tcg/user/meson.build     |   1 +
>  5 files changed, 622 insertions(+), 572 deletions(-)
>  create mode 100644 target/i386/tcg/sysemu/excp_helper.c
>  create mode 100644 target/i386/tcg/user/excp_helper.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

