Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8232866A5BA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 23:10:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGSG0-0002KN-4q; Fri, 13 Jan 2023 17:10:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSFy-0002Jt-8L
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:10:38 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSFv-0004d3-RQ
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:10:38 -0500
Received: by mail-pl1-x633.google.com with SMTP id c6so24808122pls.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 14:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KDkgJVUOGVqnbtkEvSCUgGW3k1/G5Qsgxm2rGoE3dQE=;
 b=SERqJGtREB0Oj/3xzdY7JQptWJpmAB0rTjVFegDa4iTrk/uc9WSajyvUKpYUNp2dBO
 kN3d9yEKA5E7AT4PO+36NdR0xqiIP5fQGfpZpZwQQ7V+8hvniXf77im5TBQBMltUP9sz
 hJy+2ymaIyoEjf731ORMK9NnCMItQhY/gxbovlfVqGozHziyN2KcuPsmZ3ERohCmSwQD
 GHVkDVSUvFI2133Yjew4oFkLlkiLFJAGFT/ksnp1dmpdsw3C/SOtPUHqxwVR3yd3kr3v
 VqeoWcu0VZh/NF2jiqnKsbYQrPwdsLU7ivDdK1Pl9rwZTS67mc31BTX7dE0cyKQrsTn9
 CczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KDkgJVUOGVqnbtkEvSCUgGW3k1/G5Qsgxm2rGoE3dQE=;
 b=aP4pkRnfs2QN4hg4Ea74FY/T/UFUxoopz67gUmw+ZmQO506u5O+aBZ/E8hanxArLLf
 /XnYFSW0jDo2J3li07M6jee91mhijGt9Iw++yazteDe3RFT0CbD50NX11BEk2LugB3Lc
 mjg4f40Gq7hGi6oYxplNQhuISmqg/nE5vjp1TCTPN4foqDYVdJZyB9kMDspkJXdtwYU3
 d0PnP11AnUeQaPrrZSlEe5SEfmkfOVIunDuyGXtSYOr4ZBFNxGJCmD909RoVZOdWAhhf
 O+Sjbcxn+neSVgDHXAPvt9rH6pPnb9gt2ZVpgt4t+iXk+nSiNU+b/Aa5iP0/Dp16B31d
 XcMA==
X-Gm-Message-State: AFqh2krEcCMesM5JPHZS/LXDnAAc2MOK5V6kccjSbI5D59xMIqNbmzHY
 idFvb1L55rP3GQgSL5Eu6oGS/A==
X-Google-Smtp-Source: AMrXdXvHQZlL1MRCm0NE409EueUE6BO/DKreJUanSkGG0cp1+A20Tr7qgkhCrvqdAh0jiEQmbZ48JA==
X-Received: by 2002:a17:902:8501:b0:194:63a0:54f9 with SMTP id
 bj1-20020a170902850100b0019463a054f9mr6736995plb.24.1673647834442; 
 Fri, 13 Jan 2023 14:10:34 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 a14-20020a170902710e00b00194516b2d88sm5380007pll.260.2023.01.13.14.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 14:10:33 -0800 (PST)
Message-ID: <f63a77d6-c63d-7001-79f0-b31740cf6eda@linaro.org>
Date: Fri, 13 Jan 2023 12:10:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 22/28] tests/qtest: Restrict bcm2835-dma-test to
 CONFIG_RASPI
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-23-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-23-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> We will soon enable the build without TCG, which does not support many
> machines, so only run the bcm2835-dma-test when the corresponding
> machine is present.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/qtest/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

