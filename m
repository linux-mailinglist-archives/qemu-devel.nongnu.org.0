Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3341D31C6E9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 08:38:29 +0100 (CET)
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBuwG-0005Ep-8k
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 02:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBuuA-0004KF-Sb
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:36:19 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBuu4-0004v5-5P
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:36:16 -0500
Received: by mail-wr1-x433.google.com with SMTP id n6so11782251wrv.8
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 23:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N36nd/stL0TtZDsXjUgYDCH4RGGFK9UhRSAWU2ldUY0=;
 b=pzAjfX5binEqf5cKcsrIYKLI8LlELqEV0JGmmd7OYghee47ZUTOOsh4Os0qEa+1YTx
 1sBBXwQJR6T94pvibdyZ9kXbafTrSnwdKWfm90qzYs3/kQdV7y1JzRT3lSfDtW8GXqSm
 h0ojAdzAZGPB3gb663ClNgVSI2aLlYQy3ttFXXSKQGSrq7nHZoVHO5i6WVXgq//YOYXJ
 hhdzQjU4Oz+TnudM2UT8qFp8P4gT1dArbNLEDBhMdpL6EuGULxcSfKQUQy6kX9/JKiCY
 e7fpDwenPy8ciuMNf/dAcFaIloXdJBewcWh7NK5nIovtzakNQ51RoQbp71ZeEd58CQkM
 LQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N36nd/stL0TtZDsXjUgYDCH4RGGFK9UhRSAWU2ldUY0=;
 b=Zck9i6zvdwwkZzleYwY5g+0tjsHVDqrlHbdwZmitUMHukmsxYH6jPQxa7QkPKQpuCJ
 FEyEGLzRkEkzioV23TkVPUVj/5Y0NZt5SWw2nILP+yT587ZirMpIE61Dr1YhCttU1s5t
 BMmm5KXIdPA39SULCfiBRyRghUIr4q00j1B8Fsu+O+TplDqMLgcn2fDEd+Fyaey26t4j
 7pjP4X46rJoy1205CFJ+t0vcIXNaR4xHOVISRZPQlF3keQtzi0NzG6sjP08NLlx5rJc0
 FhiPZ6Y8WH/qoxZpKve/oBKbX0Arf1G0t4UQoY7ZwBUqvW2lJTxVbRwe09F+jB+TPnh9
 7FbA==
X-Gm-Message-State: AOAM533/+h6IorVleCQrSy4FK2ko2WGDKvtwgoGHTfgA+f1zTj/OKuyp
 4MYqBijbwv57m21U2nx8Fzk=
X-Google-Smtp-Source: ABdhPJzYNnQyLmizBc6IxgUszn2m1PTSJfYYxp7pUafSnkCmivEWANYGHDTRHNPO5g2oroggHG7lEg==
X-Received: by 2002:adf:f80e:: with SMTP id s14mr5603202wrp.363.1613460970709; 
 Mon, 15 Feb 2021 23:36:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o124sm2390846wmo.41.2021.02.15.23.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 23:36:10 -0800 (PST)
Subject: Re: [PATCH v2 08/42] esp: determine transfer direction directly from
 SCSI phase
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-9-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a81b37eb-5025-b73e-ab77-127396d3f580@amsat.org>
Date: Tue, 16 Feb 2021 08:36:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
> The transfer direction is currently determined by checking the sign of ti_size
> but as this series progresses ti_size can be zero at the end of the transfer.
> 
> Use the SCSI phase to determine the transfer direction as used in other SCSI
> controller implementations.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

