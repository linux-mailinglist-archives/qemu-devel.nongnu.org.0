Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71A3230B4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:27:27 +0100 (CET)
Received: from localhost ([::1]:52006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcP8-0001Jm-U2
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcMQ-0007N9-E9
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:24:38 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcMP-0006lY-1B
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:24:38 -0500
Received: by mail-wr1-x433.google.com with SMTP id c7so6823295wru.8
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YyJt4xzxV+OEmZs+yqhsgppR3VOuRecaRp0RgNhPplU=;
 b=pQ48BzteHsuCRmtxDMbmaCIWBwzsPpaNYPm0jLCCPYhHx5tPP86xwA3AkJBP/rtZgf
 8aUGNqhTqU2HsUWhdFUyp2kc4526U4fNzU2FV2eizofOi3dySSxKBxwkN/Z0V15OeyRe
 nkiUaOY9CE1LaikzguPm0pHGmgF7qnFFNThzhCHRw9Uql+7G5+JaUNFmdZqsvBoKJ//U
 7K3MttfKEgZia4/jNTGjc43Y3zx2J0hFvFkGuFHhT6tY/AQkyMZCkT6YDhA5IipKpEfN
 NeQ3agp/8+c6pNvrHzzfkNBp+mQw0sFpX/1J1z6PPRgnVEzvFqkpRKhdFQsaKU6+gW9c
 DI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YyJt4xzxV+OEmZs+yqhsgppR3VOuRecaRp0RgNhPplU=;
 b=VozaTlPThsL250FQsFS5vPO8mUOA7RqeKM61iDfCzprCa5bIZLb0L+9gUPgp5RFqpk
 rimjc9S/AtHXrrrUBuGzA9xfm7tgYZa09YfSa03xPn3PPiQvj3kGp37bTM7rBXmTxAOW
 Xe++VFiWcstc7Q/fZymqu00BqsvD+D9CFVNLZz/HisHVb8V9HN/DlAfGsnKCFPADB+kI
 qMrYn8UYUPRidONAe6i4Owe8APXAjl5oNvtKSk4b2E+hlKazWyvOvY4Gt8oteqlyWpos
 oPm0R5Qz7MMzHVI7L4z9xyysbRStqJilerHn4CmIQxCx1Jy6EEUIbBOcBgiDHJM6vB5b
 fzGw==
X-Gm-Message-State: AOAM533+MCVLSOigdKHE5ACk7hWGR1OefpyWwmzn/tfGq6NRY+Efno/0
 595zkAwBS2uNDzuKrgUULAs=
X-Google-Smtp-Source: ABdhPJxV/bxE0FYILdJs3OShzBP2/3gOHdk9+mpstagMbkLTiBFaeultBBX+1XuQPw4M5PXEDRcGRw==
X-Received: by 2002:adf:e444:: with SMTP id t4mr16849030wrm.97.1614104675466; 
 Tue, 23 Feb 2021 10:24:35 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j14sm21064265wrw.34.2021.02.23.10.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:24:34 -0800 (PST)
Subject: Re: [PATCH v2 14/42] esp: remove minlen restriction in handle_ti
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-15-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <380774c0-002e-232a-8a3f-bd85835868d7@amsat.org>
Date: Tue, 23 Feb 2021 19:24:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-15-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
> The limiting of DMA transfers to the maximum size of the available data is already
> handled by esp_do_dma() and do_dma_pdma_cb().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

