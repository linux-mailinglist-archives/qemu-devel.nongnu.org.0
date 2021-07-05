Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A884A3BC30A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 21:15:30 +0200 (CEST)
Received: from localhost ([::1]:35166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0U41-0005rW-Nn
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 15:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0U2d-0004sU-9I
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 15:14:03 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0U2b-0008KM-BM
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 15:14:02 -0400
Received: by mail-wr1-x433.google.com with SMTP id i8so10346056wrp.12
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 12:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7KCu5LcULzk+Mh45HAp/NOidErmVNDB5Az1FBDWeCBA=;
 b=VdcD33QiNT5RL7BXjwKScu7vBzoNsKmG5gU5T4O95RlO96TwjD2sxFyYLY+oVX79UC
 WnZbLJTaO2d9fznf7JHXdj5uC3TORfyOBbrvPgv4gKAYH4/V53Q5S6qzeRVJw7ZAx10m
 D6yItTXfochgY8FJNRu1eedpaf6/cH0jtbw179w12IfzfRSfHtslAvF2E8iiGuVkPDsP
 ER73PxYx0d133HksFbxlWwCE62aR8nMsAx9FXwZwBBCCI1Snb5CQo2UAXFfFc5CL9taI
 zhFehe2Hx6GeNC9XkJoeS9olIr2+84CPtWB3Vgx4RCJMpkEycEei/DeziSpzaAA94W9C
 rhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7KCu5LcULzk+Mh45HAp/NOidErmVNDB5Az1FBDWeCBA=;
 b=nh/L0HiX10aFSVnCDfELtClLoEoQlw/tINiT8CdffD3oihYHFcf8sUwTaX9Rr+3QQl
 LmGaGWkXg1jW4Bgn1UTyQRJbculPW/JE0B++RNsHMuDCJyPKlnV7xuFCagxXctmf8yed
 AhFl/apm9Ut8ccl+9im/piT8BEMiAhIzFaUTwUP0aKwlhfyQtujIJaQMad2kw5xmbJ0d
 /lctcadKMICleiKu2PQPI3YrJvNan2aiekdpnshwrhG9w0UrlEVaxb2M5vzR6VfuoKgu
 bXln263J3C+M5BHCP0WI4BgNrPTxkjhQnUjiXabXQQqLskml0GabOyg0Mh43lqS/mu9N
 MzNA==
X-Gm-Message-State: AOAM532OzLgFXnXU3rTTBjmINfjxPLkZCeIxeNMv0PD/KVEvwPTe0Sqa
 XFSdVTHpVKFnya0VRBugYlY=
X-Google-Smtp-Source: ABdhPJxz7C895tF4sVTDBAQ3A58lnvva6pYmRL3DlCxPzZ1V1+UmaNZO//MLXPxQ0Mk58IuM9WUu6w==
X-Received: by 2002:adf:f907:: with SMTP id b7mr17283080wrr.357.1625512438553; 
 Mon, 05 Jul 2021 12:13:58 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r9sm334032wmh.40.2021.07.05.12.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 12:13:58 -0700 (PDT)
Subject: Re: [PATCH v2 09/10] dp8393x: fix CAM descriptor entry index
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-10-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fd76402a-d19d-e8f6-1b3d-ea38d7a70b3d@amsat.org>
Date: Mon, 5 Jul 2021 21:13:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625065401.30170-10-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 8:54 AM, Mark Cave-Ayland wrote:
> Currently when a LOAD CAM command is executed the entries are loaded into the
> CAM from memory in order which is incorrect. According to the datasheet the
> first entry in the CAM descriptor is the entry index which means that each
> descriptor may update any single entry in the CAM rather than the Nth entry.
> 
> Decode the CAM entry index and use it store the descriptor in the appropriate
> slot in the CAM. This fixes the issue where the MacOS toolbox loads a single
> CAM descriptor into the final slot in order to perform a loopback test which
> must succeed before the Ethernet port is enabled.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/net/dp8393x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch queued to mips-next.

