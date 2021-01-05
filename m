Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C3A2EA6AE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 09:39:00 +0100 (CET)
Received: from localhost ([::1]:42996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwhrn-0007PE-0w
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 03:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwhoL-0005ax-7K
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 03:35:27 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwhoI-0004Yp-QR
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 03:35:23 -0500
Received: by mail-wm1-x32a.google.com with SMTP id e25so2237780wme.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 00:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P8s0tXowNJGErxQpZkJPpjiWSfmHubKnH23zdETSvgU=;
 b=InmKGCKoAj2e/ee1orQvVvN61STLpfgZC8LZgIKw5LK9b2d5Lp1SHbM/xmDEDx7STB
 9hxuJl3F24OBouK6F8HRkKD4unBucT0YSAJqN0mlG4IiA3Ia7wJUsff4zK4itBSDMXJ+
 i6h7wfqMmZ6AWb8uKkJd2CsLLToi47Ip0VDnEQwlK0kXxQD4GQN3MKT1oj5Vx+v65o/g
 cZWIMfYX3AxIJG4aKGu6W7AgXwTwFBjxSCnNyIOFZYnVeFYwy3RLh5snxTM1FW56gk5p
 C4dxJL4yL8MZgULR1MSf9M0di5HAW7JbOt4GRpFNbGCDgLugUs2zVuFlQbNCrnh1PS1H
 SAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P8s0tXowNJGErxQpZkJPpjiWSfmHubKnH23zdETSvgU=;
 b=guXtZu+1VR7HypOO1zwGDsTXqkNjIijfDIGUQ1e9SEjwfEghJ6OK0b8cmRdJ6Mrbra
 L/M3oPSK+x+S3wJ+9g+rWaq7XyNzqxye+9vzRNofYLewSQVazQM+rzfxX3O+3UIHQh4k
 Zfqrv+Ut7JT1IwblroaCO31q5l8b6rls4Dmwejpa90wyLAh3wfQZM8WnnUZoXVUrj183
 sf4Fq+tPKJ34Q1prmo2M9g9zbnLzYpaL6VIsRc69ZaRJEc3jPmqvvyGYM9y58GzF126j
 7pEaW85sF+aaPNo1GWgTM+vx4oiPL++2y5hP6MosjKGEjZ383gxKCtn3Hp/1BPHxyvvv
 HzIg==
X-Gm-Message-State: AOAM533gznrbTFDDMUlSRmWsiZWbWYTapwY8EFInic+as6v4JorKd1WR
 6VBiceZTsNOhsLhzH6W5hPg=
X-Google-Smtp-Source: ABdhPJxr/y+QmV3XNVCcDvyIkhFEj5D27MGRmCAQT0a99C2t3Gs/bPUO1mAgHV/Sbc6IlzvdWJ7pdw==
X-Received: by 2002:a7b:c319:: with SMTP id k25mr2485623wmj.142.1609835720898; 
 Tue, 05 Jan 2021 00:35:20 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id 125sm3133902wmc.27.2021.01.05.00.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 00:35:20 -0800 (PST)
Subject: Re: [PATCH, BUILD-FIX] linux-user: Conditionalize TUNSETVNETLE
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210104234415.405521-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ee552032-515a-5bc3-c081-870aaa730add@amsat.org>
Date: Tue, 5 Jan 2021 09:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104234415.405521-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, Josh Kunz <jkz@google.com>,
 Laurent Vivier <laurent@vivier.eu>, Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 12:44 AM, Richard Henderson wrote:
> This fixes the build for older ppc64 kernel headers.
> 
> Fixes: 6addf06a3c4
> Cc: Josh Kunz <jkz@google.com>
> Cc: Shu-Chun Weng <scw@google.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/ioctls.h | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

