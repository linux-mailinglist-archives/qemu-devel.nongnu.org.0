Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281E53CC824
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 09:56:09 +0200 (CEST)
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m51ei-0006pO-7b
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 03:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51dG-0005dP-Bm
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:54:39 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51dF-000708-0Z
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:54:38 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so8455212wms.5
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 00:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nSYxH0W5r4nyUBx6mkeAZc2lQamd4a9B0AjK1SZ68S0=;
 b=Dau6hUS+OjzIwfByYIRv2QhtdllNc9vuimEESxy/cXMwm/fkZ93e1DuPK4u0pF/2n7
 rGLAKvx1tFycRSjLkPub8Qh0O1S5H+OlGmE+vLSwJ1sKIedX4H31XVwr7KlqU64jy1As
 c4PrwGYZFy8NtdMUDdECpM2iM/CgK+HWlVI3aQ97fF+6uMRTywhNmAhcpnn7T3Jtu1jA
 44Qf1G5dZ+XhJp0R/6fzIl2mGb/MpSVgH7mANkExtENyvqaVi5Q++PQjs5xVScHT9afZ
 1P+K3xbch6dwySwgMGxyut4sJkPSkB2ob+AHedAWmUjOj1fvlfXYJm/j2Kjz8YrGBUGK
 SLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nSYxH0W5r4nyUBx6mkeAZc2lQamd4a9B0AjK1SZ68S0=;
 b=CuYaRX4quhBJ+yC80XHe62qtA489UkJThOYii4M62zqr/W1E4+uaaTi9JLIlIN9lwh
 aeFJGiXRhvPwBCOtVeXkWPxt5lf2ajl57v4w+MIhd4fFuDTQln+hopPmiLOHzycV2Ejb
 20jSxXM+jtZX74/e21zXJGsRr/3vepKPls9CpWcUCDnTdbETZD+O0G/E3XAwTrMGECke
 +ezTPhsORHY68i1C7Iwkh6gpFbrHoKYXj5bUUwcjIOuV1sWzPZ8Vtr6je7rsDiJ0D8LT
 MJbwGRBw6adHeDQJzrm1PkUXdiU/TSn0cMqGMBdGTUB46++z7Gy8xKB7mUOg31rqwpb2
 DbIQ==
X-Gm-Message-State: AOAM533yiIPhWTzicNHeVGfSya4pYWgmYjnMyqTj8IQOfPT/Xzthh5+q
 Jd3GOuSQygvdvxXBUpJC45s=
X-Google-Smtp-Source: ABdhPJzT1GtB/nd524PTwKlGCJNdgZYn2XVZNbs+hvs03+BJu91rmLv0X1ZOj9/C3H/N0oNCZa7/kw==
X-Received: by 2002:a7b:c1ca:: with SMTP id a10mr27109120wmj.0.1626594875128; 
 Sun, 18 Jul 2021 00:54:35 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id p5sm12643735wme.2.2021.07.18.00.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 00:54:34 -0700 (PDT)
Subject: Re: [PATCH v3 08/13] target/avr: Advance pc in avr_tr_breakpoint_check
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <089c3565-3119-3a84-c775-b5a59d92bc4e@amsat.org>
Date: Sun, 18 Jul 2021 09:54:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717221851.2124573-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 12:18 AM, Richard Henderson wrote:
> Since 0b00b0c1e05b, tb->size must not be zero.
> Advance pc so that the breakpoint covers the insn at the bp.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/translate.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

