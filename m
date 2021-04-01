Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D193510C1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:21:34 +0200 (CEST)
Received: from localhost ([::1]:59716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsa5-0007wf-He
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsYG-0006am-W5
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:19:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsYF-00031C-F0
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:19:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v11so888551wro.7
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 01:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gmuds0U0jq2c5B9Dp09CcfNWR02HuTmniLRVTt4LE54=;
 b=EQNCb4fZb3L8MLWI/9ZCoWlkzF3Rv83GN3QC3+Ngl/bA4dlAPjxPWWqGFFVx/yEVRI
 mMH1yquZyhgsS0mXGOd6oVH6Mm9cbZuIMCEg1ZNiptfgQ8PswUFV45U6k201piCDV9lJ
 +rhwl1E8IPz4gPqHhg2cTaEO7Aas/pG6SFObTN8V0UjHB/l1qnsLdCQty38fPzFasL3Z
 CXN7SzmNRvixcs9XuN1BuyEN5XiBeUPhWuse4XaOZDssY7q+V4PJfzMc6Kyh4sr6sOj6
 a8kvxEO1cs33cr5dki5lho6nfL4dk64vNdILLz201HKKgjhM0S50ZYUmnIOOeLhVA6bf
 YYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gmuds0U0jq2c5B9Dp09CcfNWR02HuTmniLRVTt4LE54=;
 b=L5EengJnu0vuCcPTWnKw3SIQKc4oMESWnl2V2bG0o1IhCH22tiCSviBledQJHtHVOm
 92twq0xbdKVa20/IyvKIQdp/eZPcCw1i7RU7MvsUxQSW0JYdDm3YIVUxkg1iKM0hhLjM
 jpiUYClDRuZho1xuu9qKgq8BmZQgowVtvdJgEl7acJhreSy5NkS1Gs493l/a6symZ7+P
 zhNTw7GNqp553iV30TO5vRJndprgab26aMIxfNBGa4EuhJViuPk+AE9hX98vROlsAf+Y
 N45IEBFknPLo24XZezSuB0nLKPEF+KYWy3UiL14VdO/WV3fWXufhIMvGACUEiQrj8ap/
 pgXA==
X-Gm-Message-State: AOAM530Mr1HfklnkvdEtctJF7x54FsM4SkIpR9+sl9Ru1KpQLB9fmfPM
 4e9PHK3Lj00s20k5kgm9wUw=
X-Google-Smtp-Source: ABdhPJxfqD1cdzDagSgfUTd0sTmsI7A1WMeoetz14yFF4lYe/eo1CYUQmFTeRgI7FUIwA2hYwDHdgA==
X-Received: by 2002:adf:e84f:: with SMTP id d15mr8169797wrn.394.1617265177739; 
 Thu, 01 Apr 2021 01:19:37 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m14sm7194414wmi.27.2021.04.01.01.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 01:19:37 -0700 (PDT)
Subject: Re: [PATCH v3 08/11] esp: don't overflow cmdfifo in get_cmd()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-9-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1aa39496-e535-5e38-552b-1e314fcb9905@amsat.org>
Date: Thu, 1 Apr 2021 10:19:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401074933.9923-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

On 4/1/21 9:49 AM, Mark Cave-Ayland wrote:
> If the guest tries to read a CDB using DMA and cmdfifo is not empty then it is
> possible to overflow cmdfifo.
> 
> Since this can only occur by issuing deliberately incorrect instruction
> sequences, ensure that the maximum length of the CDB transferred to cmdfifo is
> limited to the available free space within cmdfifo.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 7f49522e1d..c547c60395 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -243,6 +243,7 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
>          }
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, buf, dmalen);
> +            dmalen = MIN(fifo8_num_free(&s->fifo), dmalen);

Ditto, GUEST_ERRORS?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>              fifo8_push_all(&s->cmdfifo, buf, dmalen);
>          } else {
>              if (esp_select(s) < 0) {
> 


