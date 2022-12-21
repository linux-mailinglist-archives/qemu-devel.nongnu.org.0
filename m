Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AAC652AAC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 01:58:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7nQl-0007S4-Tt; Tue, 20 Dec 2022 19:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nQj-0007Rs-4A
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 19:57:57 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nQh-0002jU-Dd
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 19:57:56 -0500
Received: by mail-pl1-x62a.google.com with SMTP id w20so7408687ply.12
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 16:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eWDaTTYHV4TS0cMGZ3mANoHuFg1kPMCrbdg8vdOs+wA=;
 b=Au2p6gFz/KOSDbGOGtvNJLsTt5nSt+E91W2IV9kosy2G+P2SmlySQ/0XYKcXYtir5r
 +S2eZegsx1qKsaavuE9/wDaVatddK+piCeW+jAwPYsGQXEu9kk4D9Ya2bip7dEHZSV4z
 PTyC7hM8IQIj+kjsmTV1quiGYw+zPOTOBLvNNtTbqD4AjAanVJTs1YYz+gTMOtWfy7X1
 jgKFuBBlEuWEt75sNaNTWp2tRIrqc61B582kRlF3L+foHs3oTc2RdRDbfFp6S1MhYqAv
 c6/5YcubjS5OLFIcNmnzAUaREPlo8qr7YDyb1yLtR7IP58OaN+OjTyNGGMuPA5og7Zzh
 wwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eWDaTTYHV4TS0cMGZ3mANoHuFg1kPMCrbdg8vdOs+wA=;
 b=LvYvZzOZESac5V0rRgw0yEL4Z8KwIcUI5rBtyYe7ui7wl+vpaYFblP7ck3kVWcJ/BO
 Pi8Z4z3YtL/6jXPVF11fEH7rl6y3WYWET/r0v7jRwo2Upl4O8OGfDAbgmP5MLDxDLqxn
 TIVW6bKhtk6DttbQP3JeJBOnXV7RLkMOWudD12Vfta1tNEocA7kGnKyTvsUnHEQ1RRDP
 4wifpp51PiEzSFb1Le9L7Q7HCh8gcxnPWJQkEgj7MaXmapGc8IkqMebXhLZ4UJNFFW3F
 tdp/iN558whwQ4Dcnvp4qHjLNG0FBd4tNZnoZPaP2xoPNWIw3UHbA6GpHwFlxnGsfefU
 sPkQ==
X-Gm-Message-State: AFqh2kpYawMxBv0fuKFPYjyGQwjfDXx2KhdgZrCwSfX4KJfy+RwT6cZe
 6UULppqY4WffRr6trzgULHTeWA==
X-Google-Smtp-Source: AMrXdXuUrgotGb0uiRUqpqxEq6q7Xu4wchPKzAgg6XHpJBEMZMbWF9w0UoMlfDasSYRsn+wd+FMqdA==
X-Received: by 2002:a17:902:a406:b0:189:6ab3:9e75 with SMTP id
 p6-20020a170902a40600b001896ab39e75mr80967plq.15.1671584273569; 
 Tue, 20 Dec 2022 16:57:53 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b00190c6518e30sm9921816plb.243.2022.12.20.16.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 16:57:53 -0800 (PST)
Message-ID: <db37ea00-230b-e470-1c2e-6b781ee2e28d@linaro.org>
Date: Tue, 20 Dec 2022 16:57:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] qom/object_interfaces: Fix QAPI headers included
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20221220115709.18508-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220115709.18508-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/20/22 03:57, Philippe Mathieu-Daudé wrote:
> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-qom.h"
> header in a user-emulation-only build.
> 
> Commit f375026606 ("qom: Factor out user_creatable_process_cmdline")
> incorrectly added a dependency on this "qapi/qapi-commands-qom.h"
> header (the QMP handlers are still defined in qom/qom-qmp-cmds.c).
> Remove it, and add "qapi/qmp/qobject.h" which declares qobject_unref.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   qom/object_interfaces.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

