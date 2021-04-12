Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A2E35C456
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 12:49:11 +0200 (CEST)
Received: from localhost ([::1]:40736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVu7y-0008FK-8N
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 06:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVu6m-0007g7-5w
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:47:56 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:56078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVu6k-0001Qc-EX
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:47:55 -0400
Received: by mail-wm1-x32e.google.com with SMTP id 12so6510754wmf.5
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 03:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g7BGOBbLxdqBvtWGkeEHeuFRGYY77sBPkKc6YIDNHrE=;
 b=DkV3xb7SRM9AQLSUcG3Ehgos/sTx3DyAdfieRn5kf5tqOa0QPvE/oIKiqQzmN4L4/x
 oDJz4vAEONQLyW5tLN2EVMv6XqzwKWe/jdD2KZoKEu5tB5fPHGZwgfa4rTedycY/nM7w
 5AOwxBrivKnL+5dNoS/trELEdk/vmQ1C50q7iLUjfyxDvq3WgBqZ/VYqaAzM/LVsxij/
 xv2psrYNmt5zFIB+0SsY0OMqxavDfZ3czAgaXrSdtBM6DPH0vuf/FP1o4A6qYPS+gt5D
 V4dbjox9ljiLKG4iU9Ti9YT7XIkznhX5WhRi6jZ7YDK8jNsTC6HMQpGWxMuY7jfownCQ
 vIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g7BGOBbLxdqBvtWGkeEHeuFRGYY77sBPkKc6YIDNHrE=;
 b=JucTsjUmq66ILmN0qu27cdiUsZFtEBjX/trq4vLZZzhL54lubfLnqhgsIcuZSGV10v
 z/SotnCZ2xjPo1QfnMT6btYd5uiSZRIQgmlCPazh5Sc4dmDHrplrQV6Z33qAq6X7m37q
 KqjBmyROm9jLBEu0ykOAaEU9Y076NV5gUOluBn2fy0u6nU9D83+UkRAT4Pled1F4om49
 J3QBHFPe2soENGGUFEgQljb4xCKlJyghboFDNWIHkNyvBYfnb2HWZ5ijEtH0ZfdHL+eO
 ZSjNTpweeqO0M/oAjd78kIQYk7ZV8sd+z5eWY2UtQgmPLvP0JEMB2G27azgbUEagbuIR
 2asw==
X-Gm-Message-State: AOAM530X6txFonZYnERUV0JOWuIvfH0dl0czTxNTEqEcxZTDaD/VLTmd
 ANjEZq6s3tIdkVLv2RH1Axw=
X-Google-Smtp-Source: ABdhPJxgK0zAlRLWfpOCluTyqaoLTFifDLaMvRp2oLcAohNGO9y2mi0Q5UVi3yxpdMFduzLOH4xykg==
X-Received: by 2002:a7b:c098:: with SMTP id r24mr5994526wmh.179.1618224473020; 
 Mon, 12 Apr 2021 03:47:53 -0700 (PDT)
Received: from [192.168.1.36] (63.red-83-51-208.dynamicip.rima-tde.net.
 [83.51.208.63])
 by smtp.gmail.com with ESMTPSA id c8sm14347292wmb.34.2021.04.12.03.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 03:47:52 -0700 (PDT)
Subject: Re: [PATCH v4 for-6.0 05/12] esp: introduce esp_fifo_pop_buf() and
 use it instead of fifo8_pop_buf()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210407195801.685-1-mark.cave-ayland@ilande.co.uk>
 <20210407195801.685-6-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <06ed2995-d11d-6c85-49dc-aaf1ad7f552f@amsat.org>
Date: Mon, 12 Apr 2021 12:47:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407195801.685-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

On 4/7/21 9:57 PM, Mark Cave-Ayland wrote:
> The const pointer returned by fifo8_pop_buf() lies directly within the array used
> to model the FIFO. Building with address sanitizers enabled shows that if the
> caller expects a minimum number of bytes present then if the FIFO is nearly full,
> the caller may unexpectedly access past the end of the array.
> 
> Introduce esp_fifo_pop_buf() which takes a destination buffer and performs a
> memcpy() in it to guarantee that the caller cannot overwrite the FIFO array and
> update all callers to use it. Similarly add underflow protection similar to
> esp_fifo_push() and esp_fifo_pop() so that instead of triggering an assert()
> the operation becomes a no-op.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  hw/scsi/esp.c | 40 ++++++++++++++++++++++++++++------------
>  1 file changed, 28 insertions(+), 12 deletions(-)

Way cleaner/safer.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

