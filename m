Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8B238F389
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 21:13:44 +0200 (CEST)
Received: from localhost ([::1]:53088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llG1I-0006Tx-0V
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 15:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llG0T-0005ji-Lo
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:12:53 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llG0Q-0000wf-N5
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:12:53 -0400
Received: by mail-pf1-x431.google.com with SMTP id d78so20767355pfd.10
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 12:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2VNuMHAjlFBNVczoGZhWv/Oncln75SFg6j/XUT6B9yE=;
 b=WkGaX+g51FXVVcpl6u9dDkS2o+0AMvgrkvEMXQhqUJ+xk3PiDtHJQ65CiXMM1gFBnZ
 hSekFM2W3BjWhxcu0oWlu8b428CwNVvDz4nhjeuZAZjZXGNfS2O39YNl1jUPYw5of0rF
 o4jGh87HFnGL0pZuwyWY4c+d0shUlVimgBjKj8PKR2XVJK2EVDZGUAuI5GdJ2bpTXKaY
 ftqbuDZ3TNEJlxiWAv1Qp5GL/pySuQkCHgOLkMC5mniPYVbI6sStDCsX2Hk6kdht32wA
 D5xPAl0opD58yy4AxkAdCwcaD55pyiDYHZtjdCLF8XjcW9ogzuANDbVY7OdXIB7rz696
 PsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2VNuMHAjlFBNVczoGZhWv/Oncln75SFg6j/XUT6B9yE=;
 b=RR8vl5DyUOpBcw1Rr3214lur8cOy+w7ww2pdsrlYa8wO7zgkK0thGmRQOaAYhRzWrf
 odaNMO9deyeOm+0IK+D96jNZv4NJaSzT/BVdhXYOpVnwSAGTV3YtMzs8IwHYz1KIYmh4
 UUn+VbG8l6ecAN9AivWkPMHY14srl+Hemmm8GazmfcMsCKKzo9/f0OsxaPmkQYtZPA6h
 /kryZYSFxnOSVgsABFg+LVTLcgEovIJ2ea9JLjGNKmADhnZwkiwbFFHgyX+rJWydQzJh
 pXdqCX8fn50le8Crx7gkBFap+F6v7bOXohv5bulOc5Apl0XqreXEyg2SG9VH96D/gigB
 dHgg==
X-Gm-Message-State: AOAM531v4/3zdLRb4sMR0XPcNdxsZc07A+Se/dR21GOGgU3KYLk8P3Vs
 trfkWX4+TEKels6FsOPP3V7iKQ==
X-Google-Smtp-Source: ABdhPJyuwEsLXKeiqMOFKbBh6nojkmPL79zA4M1XGDKKb8NT+o4xuPYzvUKYXwjeo+hgvFMhNc2JYA==
X-Received: by 2002:aa7:982e:0:b029:2e4:eef5:e0c9 with SMTP id
 q14-20020aa7982e0000b02902e4eef5e0c9mr17686296pfl.3.1621883569118; 
 Mon, 24 May 2021 12:12:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 e23sm11915571pfl.84.2021.05.24.12.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 12:12:48 -0700 (PDT)
Subject: Re: [RFC PATCH] linux-user: glib-ify is_proc_myself
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210524112323.2310-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f3337919-c96f-bc13-bb89-584ec1295714@linaro.org>
Date: Mon, 24 May 2021 12:12:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210524112323.2310-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>, yamamoto@midokura.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/21 4:23 AM, Alex Bennée wrote:
> +        } else if (g_ascii_isdigit(*filename)) {
> +            g_autofree char * myself = g_strdup_printf("%d/", getpid());
> +            if (!g_str_has_prefix(filename, myself)) {

This seems roundabout.  Wouldn't it be better to qemu_strtoul and compare the 
integers?


r~

