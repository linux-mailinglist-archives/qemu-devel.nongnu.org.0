Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BAE323331
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 22:23:57 +0100 (CET)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEf9w-00058A-RR
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 16:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEf9C-0004iE-E6
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:23:10 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEf9B-0003RL-4K
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:23:10 -0500
Received: by mail-wm1-x335.google.com with SMTP id p3so61656wmc.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 13:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1NlJEQSL3qJhjpeaw+wHBI+W6u7PmZjxsBDwqV+OISY=;
 b=Im0Y7oQvC7B9demfwPj6YINkNWaWZ6m2XDANKVtPlF1uKA+KlbKtVXZp4SqFr6rTHR
 tslb4QvVZeTHsdA2IoOgNdTNreR9UnXL07PwRrqOWwGi4Vn2nNFvOA8zorF2tzsxSq6I
 +rao35GVUH62lNCWwu3c6UPNoIo9QprmvYQo1bQHbXx62TY/bT1tcBT4n1NxzY1tn3KE
 4luthBRMjLLoUCMs0qvpoHppZBmrUeEmWAAqJAWLbl7pZmxt8q/oHZlwpc9d90QzcI04
 4BShFu/O+oXeoynLeQQ3u92zSyeCeDLqPG1EqWtSEWwWR1Dh8xYD7/Pei4NhABNe9p+n
 hBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1NlJEQSL3qJhjpeaw+wHBI+W6u7PmZjxsBDwqV+OISY=;
 b=V0ss2tHoee7JUmY1FTsiUCgO3Mpfhf0xONWBOc8UtJQMFeJ9XugKJeEOp/vMUUEUSi
 AbCRfQmWkwRggRYBtoPH9/t+IVWELm/RQ7zjQEDwAfCFDTKoBD8eqApIvYHJBMbUAhGf
 Lw3IwhYRTVtGV+++HqsgqlNzp2RIe0z6WJWnWCvJpEx5T1idrBzIZ6ZZW/NGuGl//0bS
 BM1g1MnJOJamGBHZS2uagDBzrl9lEl3JtIKLx91nbvQfN3XVywzJ3vb3Dy9fP5srXhL+
 BN13OBpI6tZ1P05xhM1XSyUskm2H+ftUZbaoGOFXWFq5DjJgBCMqy3M1Tw5bozmuQmyd
 9GgQ==
X-Gm-Message-State: AOAM532lFO4uzrIz1qGdmcfo2M+u7nn6FtDzvqX0d5z1jhvjCAteaFt4
 5+tdzOTcrKI7NZp++Ccs/SM=
X-Google-Smtp-Source: ABdhPJw5b+6k/JqtkuYZ9ruTGIvKqI2nYitrHeLuzrepEBGX5QLzFBf1lmT4QJuDNIhpF9+ZyLOWRQ==
X-Received: by 2002:a7b:c18b:: with SMTP id y11mr630765wmi.132.1614115386430; 
 Tue, 23 Feb 2021 13:23:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w13sm25222wre.2.2021.02.23.13.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 13:23:05 -0800 (PST)
Subject: Re: [PATCH v2 17/42] esp: move pdma_len and TC logic into
 esp_pdma_read()/esp_pdma_write()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-18-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9f5a7759-4aeb-4eb2-be1d-0d43b5b78822@amsat.org>
Date: Tue, 23 Feb 2021 22:23:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-18-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 50 ++++++++++++++++++++++++++++++++------------------
>  1 file changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index cfeba2feb0..7134c0aff4 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -153,22 +153,45 @@ static uint8_t *get_pdma_buf(ESPState *s)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

