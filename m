Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077BE6EBE34
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 11:13:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqVmX-0006ZG-Lo; Sun, 23 Apr 2023 05:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVmU-0006Yt-DN
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:13:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVmQ-0001Bz-Ni
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:13:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2efbaad9d76so3076295f8f.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 02:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682241189; x=1684833189;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=48tp1qlfGAjSu2UHYIfLFr+zkU8h5k+h8e98v1p+IeM=;
 b=xUEiNZxnzt2SANSYTQCRw+V08sLDOOYKtVl8301Dq1KF8oFBBE3Pjb62yqAiy3Y5JW
 Sm+Bnnuny7aclGqBJnkeeG620wCk6oFuH51jH1N/yaXm3rDugJQvzsenzEzSn8OgvSp6
 NC4zQv+pO57wWIJwngXxC9v+mXdDK6NU0/TpVob1xRB0FYrK1yVPhzCwf5oJy7C7Z4EB
 iUSzbLa5wq9RFnD9DsQVz1rkJZsnO5EFkcf/bBE6oBTV3F4XUYLjWTSxmQJyCZWaY4QG
 5Y9U9cv+t8Xjhct1R/coM4OaEJUXA9ObweZNCB1ZJQrEjvIkK+IaP2eliB5gOMXoFpNu
 GzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682241189; x=1684833189;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=48tp1qlfGAjSu2UHYIfLFr+zkU8h5k+h8e98v1p+IeM=;
 b=ChXJLNATndwuyqbqkgLXkp9UBIoWT2cHdgFsfJY0Xi9lvSpauKg06t+pUCn19cTdpK
 6s2Wo1gC+fhvua8d+EsfKb+T5uoxq27YxMb8XDzt0VKpkJdjzs7GLvPqtdTYBGen2eit
 ZCU9How7Ct8cauhvtngTeagsne6G9SIdf6+j28037lO33LlBmXdNyJtNbW3zgKqg/6cC
 PjAIqgxfMnJrY7whNVjBOn7zz0xB+eqf4ZAA03PsoBJTHSYHiGGwVkJvWrtgjUI2hgwj
 W7wePHnJuC2xh/b/N18CBVoj8PdZ+bm7VZ4LX1n9Acsf45VLCF7ezH1DKjHt44l4baZJ
 /Fqg==
X-Gm-Message-State: AAQBX9dMawcoLuUebjFfg7lv8kO5ffVM4WshbJdS+d70g1tdvhpJ1gZo
 RgfNtol1cEPdBwQdYh+wQnzGjA==
X-Google-Smtp-Source: AKy350aJHZ4ugYOPVxMin+SaGiWYxb/oDHsSS2FZKq8ogUs7ZJgpflzpeLXazl4ah5IXyM8Bg3Vi7g==
X-Received: by 2002:adf:e0d0:0:b0:2fb:1da5:b998 with SMTP id
 m16-20020adfe0d0000000b002fb1da5b998mr7277177wri.3.1682241188905; 
 Sun, 23 Apr 2023 02:13:08 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 x9-20020a5d60c9000000b002fbdb797483sm8204215wrt.49.2023.04.23.02.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 02:13:08 -0700 (PDT)
Message-ID: <7ab30709-5f65-2d2f-f78b-ad3983a25f3e@linaro.org>
Date: Sun, 23 Apr 2023 10:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/8] accel/tcg: Replace target_ulong with vaddr in page_*()
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-7-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420212850.20400-7-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/20/23 22:28, Anton Johansson wrote:
> -static PageFlagsNode *pageflags_find(target_ulong start, target_long last)
> +static PageFlagsNode *pageflags_find(vaddr start, target_long last)

Both arguments are target addresses.


r~

