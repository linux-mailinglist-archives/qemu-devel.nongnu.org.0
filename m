Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF7A32DA5F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:29:30 +0100 (CET)
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHtf7-0003pc-8y
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHtbn-0002PO-IV; Thu, 04 Mar 2021 14:26:03 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:33504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHtbm-0000bP-1R; Thu, 04 Mar 2021 14:26:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so5015319wma.0; 
 Thu, 04 Mar 2021 11:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K1rMeJSzwzcq98KjXfKjITR3jsmxskM8W7FX7UnUdWM=;
 b=rs/4W8tPuM/MAzTPkgfenRbbFQ6m5CgD1CMLfCmkzwDx6edd20DBZfdu2FVs+csbW2
 zaW+sJs14dqT8/OldzMk4ZszUthHC5efW4jrHjLxIDbrbheBa9Zrrnl76WR6O0SWlg2g
 pnMG33E2WFIW20rwbZ8mYo6lpB8/Ol4fOCtTVL2TdIABnY6bUMeg21x0gmfS+dbBiViJ
 QFST5anZaibLJrEoTrdat03q2w50wJINbxElELmvcfRR8GtdCntct781h+3GVbUKB5l8
 co/VHfEmv0d1U6KrS43SFn3gzRcDBeVeu/C7Fd+T5w4FEUj4QMnq3bjcXBhdYQsJ746V
 M3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K1rMeJSzwzcq98KjXfKjITR3jsmxskM8W7FX7UnUdWM=;
 b=slTCYkL7XQOWckDH4xB5de4dfAyJbvXVUvC4Clu9t9+nNosEZbUxUtXNIqp3gCI7nQ
 Eedd5Xasp5ZACuog2mU58NPZR930tJqBL7DN089aQnjEQyCDnaNsvwPm/W2hX1IxH2Y7
 DQAsMup10ITxC7SI1da/xSZWxDBevrhTV0VqON5ISPvg1mPVQKri+O0fbWdsNZGHFwuS
 ZMe2WM7XPePdtp5t2z1nRYO+AW8oE3Oqm6FZaLcuWuXmwIA6yDidA3osBtGGRziqlAWX
 pWXISYUJhIC6lPuYv3AoWsbUsz0BIEFT89kfUmP6RV4ekRAbfMZDjw6D9gkPGWIZ6Gt8
 ubmQ==
X-Gm-Message-State: AOAM5329IQ2LmOEMoMIBPJfmi2RB1t0dYIcqmTf7dQiTjPOLbEoCkURO
 ZBgGmoMZKMlNj90Kgmc81RY=
X-Google-Smtp-Source: ABdhPJzXyamAlrjSNY+hfTRG5LpIrWByypnuH95AHlow2cjiddxnz8x8p06b5lPMQcGulA1U84Mr4Q==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr4561826wmg.108.1614885959999; 
 Thu, 04 Mar 2021 11:25:59 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm332582wry.90.2021.03.04.11.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:25:59 -0800 (PST)
Subject: Re: [PATCH v6 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-4-f4bug@amsat.org>
 <1f571396-c225-0372-12f2-1a366ad181c7@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3c84ad2a-7fb9-241d-c0ba-81ff16269240@amsat.org>
Date: Thu, 4 Mar 2021 20:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1f571396-c225-0372-12f2-1a366ad181c7@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 12:55 PM, Claudio Fontana wrote:
> Hi,
> 
> I am trying to take these patches,
> in the hope that they help with some of the test issues I am having with the kvm-only build,
> 
> but they fail with:
> 
> target/arm/Kconfig: does not exist in index
> 
> so I guess I need the "target/arm/Kconfig" series right, how can I find that one?

See the Based-on in the cover ;)
https://www.mail-archive.com/qemu-block@nongnu.org/msg79924.html

Regards,

Phil.

