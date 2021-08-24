Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784DB3F62E1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:42:29 +0200 (CEST)
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZVM-00031h-GD
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIZRA-0000t4-EG
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:38:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIZR8-0004e6-M0
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:38:08 -0400
Received: by mail-wr1-x434.google.com with SMTP id d26so11891811wrc.0
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D9abI8dXWHwu4LhOaNokwGzkf4/Cjp0jzzaPHgk3mEI=;
 b=LnI9LKsZqWlUXpPQBwZtH+LSEHME677W5PX0HjFQqW2e+nrt4by2vwNZ+x2Jq9xvYs
 t7vNb9KZDato5/VeScGCoE37Wtvt5O/Wp5MZcD8TPkN0xadltjvy2ReTIpCsX7Mzs/dD
 HHGT9+cSrs/D8r610Rj8h/Z/EVTXKfXLlzz7/E7SB5XUcLQPTYye1O2/zu9iqcQL3zTP
 IhMN8Fdt0UfL9CeVBVFL9VYoRE24nTodtMVxB/hOM5pPQWtraTf7R5L/S50eTK0DQmpV
 qChowInTeyyr8gg/glM+Gj0m8bmw5dnxnEjOQ5r4RJOQR7EgwjTC6lFEgm0H8RdIulDr
 eiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D9abI8dXWHwu4LhOaNokwGzkf4/Cjp0jzzaPHgk3mEI=;
 b=SyJngx8OBDIu8TJwGU4gaG9ZYqz7aJHS1WGOEWzbboqq3/e6LeGs/8YWZKzX4+2v2Q
 takRbRV84HqUlj1ti4+zB+Yz0fDmdXVGgs4klcQwrMBT9n7EhT4J00sPA71+Wpcfspvk
 P5Uwd5cDmwT1HRHHA71MJ7WI6WUJELpLnbjOWM9l8XAo3+mOOmWF1CXdY/tzUD8wYVk2
 /9TA5JAjCDQ03g3ix6jgRiQVwShXQCGxnqayu/RGNR7b27OAAKgyGUiEq0o9tXf2vd3Y
 pvuHjUdrOJWDcWWIUM0RlbZ45cgccWERXDEtrDwQ8R6+iUNJXWuivag6aW87zVBJPfT7
 TIDw==
X-Gm-Message-State: AOAM530H1Erm/jWdC+MGVs0QV1eFwJLqZCGp2+bZF0rj26barCWL+yIk
 BhnEEtg3r9NmW+jlg7XQ6kw=
X-Google-Smtp-Source: ABdhPJzAWMEzFC7rR1vXKsgbh5CbdhSPl4iF+YfVpCfA8rzNehlKh787yZPGh2dGF3+iucjsElHpjA==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr20166134wrs.256.1629823085155; 
 Tue, 24 Aug 2021 09:38:05 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c25sm2827138wmr.15.2021.08.24.09.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 09:38:04 -0700 (PDT)
Subject: Re: [PATCH v2 07/30] linux-user/arm: Use force_sig_fault()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a3969995-bd01-5df6-c8ac-0681be48b7a4@amsat.org>
Date: Tue, 24 Aug 2021 18:38:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822035537.283193-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.305,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/22/21 5:55 AM, Richard Henderson wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> 
> Use the new force_sig_fault() function instead of setting up
> a target_siginfo_t and calling queue_signal().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Message-Id: <20210813131809.28655-7-peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/cpu_loop.c | 53 +++++++++++----------------------------
>  1 file changed, 15 insertions(+), 38 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

