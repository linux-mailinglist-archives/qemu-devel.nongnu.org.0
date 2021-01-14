Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697952F55D8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 02:38:21 +0100 (CET)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzrae-0004XX-GD
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 20:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzrXu-0003KB-50
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 20:35:30 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzrXs-0006HI-9w
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 20:35:29 -0500
Received: by mail-pl1-x629.google.com with SMTP id q4so2094098plr.7
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 17:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e/7KKIN5p+2Rayp/3uJ93uh6J2ShWsfU9IeCzoyzLOE=;
 b=rden4R2pYj+dwM/zOxMVRyONRxmnQL5LFBZxZw4ybn0X2ahPccS5Q8r/6n2hXmN2YV
 j6FnopIMFnuRfkXmyRG1HzI8206i6eHaVCR9a7AC81NXTUeydCoPKCQEVk8WzSBeHw8e
 ifT+eWUkT0ItD18VOrxF8XR4KOVMbRuNoEF30mnEx3kuHkaDM8trZMXtyWkUUEe/OPzy
 pGcxFRLqtRHLFkJhCs/LdM5pjNS6NLp8zgfvkZz6aSmQjhDz0djxkbuy6hORorQT4H8G
 Jst2NRl2GY/o48wgoEwZ6kT+SRqApT1ortNXb5L0LVRKED4Fe3QGDXpvzbWkjYa7Bp6p
 k3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e/7KKIN5p+2Rayp/3uJ93uh6J2ShWsfU9IeCzoyzLOE=;
 b=DlSqiF1mkCCHnutef77nuPPm9xsQBhk/TQee2EUiTZiEdY/AnIuC2XAokKvMTKMVwR
 yQQPofFItkXAxs4C9fhtcU31gK1VA7d/yMUNeR9/3ZT7Csqtd5OZe/dZtMYW9/Qoh/ov
 nU7vkdiMSrVKEAwn8qFdaXzs7BQppbQlxrAHnKUh3L3wZ3I6yR6PPNKzoUxfmmhqa8jo
 XYfEr/lcEFwLNOs1oL/fFG+A/8pV6aUr20ghBGUk0S6rT5xqcqWw4G415yBR9q4rG00s
 NTN3IBvajL4zQ4eTDAgTPxIL6Mgr2g6kWxxbSA9SXtcKeRgHeKh116lb/SJHUa3vrFHe
 4Zqg==
X-Gm-Message-State: AOAM5304se+naImqKPDY4JgxhlNmcCslYQreoQ83bEodma3XBzKbNt8n
 /y6AG2znvleZXkV9RCwMzQopGA==
X-Google-Smtp-Source: ABdhPJyTsC6Mc8FHEN7uDcNyu+IYwCktDGMeI5ZI0E4H4C4pcMnrTgumWuGPNXGHhhsPGtMg91hbww==
X-Received: by 2002:a17:902:9b84:b029:dd:f952:db30 with SMTP id
 y4-20020a1709029b84b02900ddf952db30mr5206034plp.56.1610588126642; 
 Wed, 13 Jan 2021 17:35:26 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id b7sm3835661pff.96.2021.01.13.17.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 17:35:26 -0800 (PST)
Subject: Re: [PATCH v3] tcg: Fix execution on Apple Silicon
To: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
References: <20210113032806.18220-1-r.bolshakov@yadro.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62cb11ac-b251-d7f1-f050-4536354c54ae@linaro.org>
Date: Wed, 13 Jan 2021 15:35:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113032806.18220-1-r.bolshakov@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 5:28 PM, Roman Bolshakov wrote:
> Pages can't be both write and executable at the same time on Apple
> Silicon. macOS provides public API to switch write protection [1] for
> JIT applications, like TCG.

So... considering that split w^x is now upstream, can we just call this once
per thread to enable write and leave it write?
Since we have the separate rw mapping.


r~

