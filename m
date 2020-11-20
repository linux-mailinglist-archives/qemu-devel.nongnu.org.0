Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E6B2BA76A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 11:27:08 +0100 (CET)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg3dD-0002c5-HO
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 05:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg3a5-0000rg-QC
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:23:53 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg3a4-0001X6-9P
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:23:53 -0500
Received: by mail-wm1-x343.google.com with SMTP id s13so9321023wmh.4
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 02:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6FiH5u9WcYGskj2Leg7v7J+QMJcv2c3eaY8XZB7DYqA=;
 b=m7ZgpGcD6rbKNU005JcynnTvDZysZr4nHMYBGIsJav3CGi1400Pwtr62EBMmi+dzCM
 ybSPtQCPSbAoL8FKQIgYTBniRvniyW1VCg8g3ERzZSnWgpaLWVm+KXbtyqlHjoTnUe2d
 +O/z53z6dES1A45YpjSzGChUZK4dElmzaZO8VZv7Czu3CK1G6id0kmHPM2au4S5/TM2S
 jF5CnqnFA2eGLVl3ZbHZyo9XoBsOI4HDq0ivPXQpC87bTw5Q6YQKJs0FgY/zPEH37qS2
 S4NP4sBUqkGxJfpT2TzX/LSov5+SUvYKlxNWUh24bjzvpQIWi2oxUJYy9dXb9G18ZfS2
 XEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6FiH5u9WcYGskj2Leg7v7J+QMJcv2c3eaY8XZB7DYqA=;
 b=iiRbNwv1S074Jgs32hiSkQnGJWPpc/Km06RrM6CDwfdycsKpkoDTzTGQ8XxUl8ltLu
 F0wKcZujGqkHqSXZDzn1ocuLh+07rzxoTd+I4Qw9b+raKlJrfYy4azQuVJyEHe/+gzWJ
 XuWVwIkBJivsdr40IsVwgdpW0BgBhzDYO7aPcF/nhDEEASfO25T0Iy3UnrNnBxMhnsIG
 yn69CK8HdGIYqyarTGDsY9kskN3cZkgiKyJn6rnuj45VcljhjLzpaBHdfYr/9K0xHFOk
 +SFNxqwrqWq3BypVBtpka7+VDbS/v8l17msVYANNstad16fXzHpVinP5VUDHyi06XBlq
 tl/g==
X-Gm-Message-State: AOAM530ZKph4qzMYei0Re9VcsptvEV+xew6L2NSoSgHY5OLo5bhQuVLa
 uZukXj0tCrgmko1wsQtEj4puHu58g0g=
X-Google-Smtp-Source: ABdhPJzIsxNL838rAsV4gkptCdW4TzWk/p7dS2aEYqcDh3baNHS2gqFK0glaJCkIgvPwPP9Hl1ysXQ==
X-Received: by 2002:a1c:6a16:: with SMTP id f22mr712434wmc.86.1605867830425;
 Fri, 20 Nov 2020 02:23:50 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id o2sm4483335wrv.4.2020.11.20.02.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 02:23:49 -0800 (PST)
Subject: Re: [PATCH v5 2/7] configure: cross-compiling with empty cross_prefix
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20201108232425.1705-1-j@getutm.app>
 <20201108232425.1705-3-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0218ad3-3fc7-c75e-cced-e780701393f6@amsat.org>
Date: Fri, 20 Nov 2020 11:23:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201108232425.1705-3-j@getutm.app>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 12:24 AM, Joelle van Dyne wrote:
> The iOS toolchain does not use the host prefix naming convention. So we need
> to enable cross-compile options while allowing the PREFIX to be blank.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

