Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2E323100
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:52:00 +0100 (CET)
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcmt-0002Iy-Au
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcm3-0001kv-NX
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:51:07 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcm2-0001e9-BK
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:51:07 -0500
Received: by mail-ej1-x62e.google.com with SMTP id lu16so36058142ejb.9
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4vcXOnDpqCsX/NCwEK6n74zmGMApHxBJTEi7gBtCz7k=;
 b=o4mcPXGu7Ir7wiFqhV8NoaJFIQaHLVXEaLPuv1YYDcxyYnwvfbiwSapnOSVRyhJRUw
 Gt/u8Ya10HxcbYzhh6NGPn+jBBBfdMd2pcaMXXJkP2+uxd4d8k4ZjkZq73ndVrYJNNbG
 TalBhodTYz4ALCzT2VoBLkMRrg4an0MQOSyWMqC0wPueoYXv19Zd0+BPcRHEuj2ijGsY
 ttq3qlPxmQcPr98pMxjKdJzVYJuLqZ2O4VSanSeuWySIaNHBzu1x++On5us8AbXivnfX
 lVZ1TZ8v0+D5MRkRy2g5VVioXNoEtc28+cOw2S5lTt3FpOnpO/nIITVVziZbUnxV0a3d
 Y5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4vcXOnDpqCsX/NCwEK6n74zmGMApHxBJTEi7gBtCz7k=;
 b=Al/saQy8ZcDg2cHIJEhkI1euL4BMKXld9tr1n0WjxJuDs+5CEj0qsMnhOUfkn9O7mG
 ky+CO37TaBT/5Af5w5ZUwbHByvYtWFKU7DJrueLqt4Y/iGI0PfEVUGtxIAkjrSnr4uDX
 kmQVyUsujzsSMgMqC6Vcdq3ROEwC+l3Nbcs3av2j0+vnFdzBmvIMy2qPvKg4bGREG7H4
 WNDJ1y1Wykw8p/ihPZ/t4biOLMlKu3PuCx+y1HmlZTYN/ecgCBurdWNhL+EVu3jzLkTI
 TPFdKw8lgpkBJEiLZnlCtdGxIr5Q/b9hLiBYwveLqmZvR1TXKXqaiEjxVcXYZ1m9GuG5
 JRQQ==
X-Gm-Message-State: AOAM533vsxDZ1kTBSJ47OPbZxBrXz3SHuzAnQPv7+mE7N5rDxa0WFgfr
 c1fju+bOc13YLp18UA1gUUU=
X-Google-Smtp-Source: ABdhPJx3gFw0q0aszuvV4wj7lf+4r9fP9TiylI5MOXdZypx454DGsdT5kD1hSZ2sZshikztMfwgaJg==
X-Received: by 2002:a17:906:73c2:: with SMTP id
 n2mr27942307ejl.224.1614106264795; 
 Tue, 23 Feb 2021 10:51:04 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q16sm13219988ejd.39.2021.02.23.10.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:51:04 -0800 (PST)
Subject: Re: [PATCH v2 40/42] esp: add trivial implementation of the
 ESP_RFLAGS register
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-41-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d90ae400-1eb1-591f-ee54-f2c4c0be8e17@amsat.org>
Date: Tue, 23 Feb 2021 19:51:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-41-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
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

On 2/9/21 8:30 PM, Mark Cave-Ayland wrote:
> The bottom 5 bits contain the number of bytes remaining in the FIFO which is
> trivial to implement with Fifo8 (the remaining bits are unimplemented and left
> as 0 for now).
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

