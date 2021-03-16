Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1733E158
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:25:18 +0100 (CET)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMI7p-0008RW-6o
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMI6C-0007bx-If
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:23:36 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMI69-0001vv-T7
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:23:36 -0400
Received: by mail-wr1-x430.google.com with SMTP id l12so11303792wry.2
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c+Mw0+C6OAbNZtFPKLf3ymnIdHAti95as7x7rDgxV8Y=;
 b=BE9i3LaQvpKF3dWMY1gK/G+E/dw7MVzMR+Vc/unZDREcwVM9eFlcrJFwGNHd7KkjgP
 pI0X8NyjnXtY6gdbTrvjpEgRyyx4lDhigK4sJqBwhC3ALZgoszrdsuHS8N4d73CFXKwI
 QPcCn+V3KKLuQ/YGhMT/P8cyEaY6K1X3OiQ5zi+3f24zkCcKP7Zc5u60g6Jn1W29WZwt
 3Gyadk1uS7skPHWmQLTRuO+ZMZBAXV++RZ3/nT7SHeuC5IX6wi0vGNPQPLMrI6Knvsbz
 4SQNjMmR3gXKPfUOPgZMpjEwXLtkL13HYrPofYJm9lQ+stWTI8fR8wgA9bT+9AbpXJw4
 3P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c+Mw0+C6OAbNZtFPKLf3ymnIdHAti95as7x7rDgxV8Y=;
 b=jADyfLzRFr/tzBTv6kvVaVuEzlhZ8t8RcltApOH5hBJoxRiHTDV6mIEurQ/kBjqD2e
 FSaA8nVg9kaJPQUkn+c072ll01exwZRKWABwTNQiG8QrmfN5hZeVIpLjALgGQbxbn2aJ
 YdaIBKpEPhpLItDAohPVhIoPHWyHpFhvuGBbLuizFhVERFdrQChe4zIsWYmT76YqURpL
 M7w7z8sdXAlF1HrSI/QClXzobbSLqfaMejZNTekRoKuGhY3S64haC1rRnVkYVZp33Oao
 iSrwDjEj9a/GQsKRR8wardxzzwgYbHZ6U5dUSJpJNp2jU839sjLiYI4jos2+Yznv9v5S
 Kv1A==
X-Gm-Message-State: AOAM532F+TL6wrUgDcOu8dGWOIMShp/zCGXdYEMhxYX0F1sKuCIcg5Pc
 1MBiyTT3S7n+QmRnNFbKiV0=
X-Google-Smtp-Source: ABdhPJxSSjWbmmM6QqztU8FzttxEWGhA4mm99xWBxsdVp3qHNBBcSei4j1N6LXZGW62wa/6Toblp7g==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr1136362wrt.343.1615933411364; 
 Tue, 16 Mar 2021 15:23:31 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z7sm23891915wrt.70.2021.03.16.15.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:23:30 -0700 (PDT)
Subject: Re: [PATCH v5 19/57] tcg/tci: Hoist op_size checking into tci_args_*
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <441bd18c-8eb8-feff-b353-ef66b52f0511@amsat.org>
Date: Tue, 16 Mar 2021 23:23:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> This performs the size check while reading the arguments,
> which means that we don't have to arrange for it to be
> done after the operation.  Which tidies all of the branches.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 73 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

