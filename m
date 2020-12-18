Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30D02DE3C5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:15:49 +0100 (CET)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGXs-0004WN-UR
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqGUO-0001lw-J9
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 09:12:12 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:35675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqGUN-0000Tu-7f
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 09:12:12 -0500
Received: by mail-lf1-x135.google.com with SMTP id a9so5813656lfh.2
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 06:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vUdbFVHAGqZe2iLUdfpMqGdAgOdQZTRbLYeiiG/cUlQ=;
 b=QQDz9YTYC80G4zSvZNMIfUmht2Sz+F/ii6NQ9LtiEY9yUQeKMDc3IEIubNoDeJzZgL
 yq1B40qOhi2nKukNRSPG+8zI/wX8liudRzTcYUKtNa00T1pz3JsturmghpXiJ07fwyFP
 KV9WDLHT54SW+1qYDM7+yiHyHRnbJSbJJwmvPUE8clIhwfZUg5s3UAUzbJZnDleXW0K1
 taG0WFWFgDlZlakF+6/NQD7U1kHwFs3TwHI0ynkLAy1NTfB8CSYv192IXLrz1AmSbj4t
 llG7zG9r1cV7PzQQQtDchgrYyM624iKUWZGTcT3s5Xo+Ns6uFO3NlhW6TaOfmwrsxatl
 N+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vUdbFVHAGqZe2iLUdfpMqGdAgOdQZTRbLYeiiG/cUlQ=;
 b=Pc0aQ1jvdgdmQHI0J/4c5gDiDFodulZ+dlNEBeT/XvTjvtTyCRWagXF2BoodbeG+zJ
 xwqnYypzYB9tOR8TknAS74LyDa6YUHLnVZA4QWF6bDJX26gcsoYM17yurIDgy6Yggn2m
 5Q5rpKZj6dihIkgUKFhhTpljJF4zItJ9HXuHH/9RJ3dQmte/2wjFUbo2GIMVqfONS4z9
 lFAK9EuGyQezdQm0/uv2N82HyRUz+8eeGcAHk/RyRXlFVCKsjk4g0TlKmye6gcZ/GyHO
 tG9CnidYePYGAEP4mz6bADEpLmTq5SfOeTAuhuohWmpinNTS4iUDpCBqUhl0t72ndXw8
 N4tA==
X-Gm-Message-State: AOAM533sjeksH6OCspxT+2MwJMVaI7QOCxrGme06WLgZ3a8bEn0y6cK9
 u4HsPl8QpwEVQopiyBhPfnY=
X-Google-Smtp-Source: ABdhPJyFeq2G9qGatGlCChUVMNzk5nltsSfQnc1pW1ExAUUu++LPCmgLIva7muZASfAmDoiFGqncyQ==
X-Received: by 2002:a2e:980f:: with SMTP id a15mr1857977ljj.301.1608300729045; 
 Fri, 18 Dec 2020 06:12:09 -0800 (PST)
Received: from [10.101.1.184] ([185.224.57.162])
 by smtp.gmail.com with ESMTPSA id g2sm937782lfb.255.2020.12.18.06.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 06:12:08 -0800 (PST)
Subject: Re: [PATCH v2 8/9] gdbstub: ensure we clean-up when terminated
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201218112707.28348-1-alex.bennee@linaro.org>
 <20201218112707.28348-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3b14ac1b-28a5-b03f-e700-9b5ac29aca2a@amsat.org>
Date: Fri, 18 Dec 2020 15:12:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218112707.28348-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:27 PM, Alex Bennée wrote:
> If you kill the inferior from GDB we end up leaving our socket lying
> around. Fix this by calling gdb_exit() first.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20201214153012.12723-7-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  gdbstub.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

