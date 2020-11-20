Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891322B9F0A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 01:12:31 +0100 (CET)
Received: from localhost ([::1]:38284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfu2Q-00023g-J0
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 19:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfu0t-0001BE-Id
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:10:56 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfu0q-0008Ag-On
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:10:54 -0500
Received: by mail-pf1-x444.google.com with SMTP id y7so6096902pfq.11
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ikXEX+nN8UC/zRi3z2BATJW8sOiZDyUWP+kWAom7Ls=;
 b=McKa7qCX6KTzahwxhyQvav0w2IWW5qb3bh8K+8tODe40FJgXqJhPPPKvLvAMzyAmaP
 iL6D1BppabDVgQViKBlDr9FrAatAXL+BBlEHOR/n5U4qImvn/tHrAKDZDcnvLS4D5ZGc
 3YwnKZk1YpwH8SOaYxSm4Huq7J7FPGBfRoQbpis6AoJx+2T5doBV29pBBbReMZxfK8bJ
 p7su52DWC4LdLsbjYQIwMwZkNrHPu0HbrUGxn0b3CIgImP8At6JlaTTktPrb6ebn5+Gb
 8MAoGvhfSSB9YzeimMvqxaPOspVvsYVH32Xa08C0077LEZrsg5KDIH6fLru4bcF2vwJ2
 2Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ikXEX+nN8UC/zRi3z2BATJW8sOiZDyUWP+kWAom7Ls=;
 b=PoGF8PqzljtLVYsoLCp2tZVw8x2v0eLnPePgM0I2SGx90mGIZAM68uuuPXaDSpYj+y
 htX20pru9NfCxaDF8rUzppJEsuTxFUo7AxWJiQzeP29ZyHZiiKf1fkhnUmyZY7W30rSU
 5vbjuetTj1DCZdY26nZqk6o3uAOjAzVbOYQFLrlLlBbB+nx/8jHaw0MI+n7uUkKJ+7Yb
 ap1WRoNj41wUmP8kNBW+CRHAJOozlQgFtuVl1f8wmbaZciDAYzOj2NoNwo08MRcBJwPx
 L1D7+V/QvaDLwM3qHrZzQ6RI+ays3SF8bXna+Uvj7QJHtkomh+PUixoqCfDsM/Cm1iwI
 5ajg==
X-Gm-Message-State: AOAM532kvBErCWMUOIeGhpks/7hp34Ov2rQiCbM22FCpbR+2P9kZ16a9
 BAtmvWB/YMbTsxlNPHLz++PPeA==
X-Google-Smtp-Source: ABdhPJzrtxqW0TG/6JxYNS6TsabkN/wnX9XjPKtPCZ1Ci3MMGmcqpJrzR5vsJaqBagXMZ9or1Oe9og==
X-Received: by 2002:a17:90a:ee82:: with SMTP id
 i2mr7256725pjz.158.1605831051201; 
 Thu, 19 Nov 2020 16:10:51 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id z68sm849772pgb.37.2020.11.19.16.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 16:10:50 -0800 (PST)
Subject: Re: [PATCH 4/6] configure / meson: Move check for sys/signal.h to
 meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-5-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <95b44dc4-91ea-406f-5f52-5d1ef21e7206@linaro.org>
Date: Thu, 19 Nov 2020 16:10:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-5-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 9:10 AM, Thomas Huth wrote:
> This check can be done in a much shorter way in meson.build
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure   | 10 ----------
>  meson.build |  1 +
>  2 files changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

