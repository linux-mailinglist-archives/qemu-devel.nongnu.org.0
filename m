Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B9131739C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:46:37 +0100 (CET)
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9yFo-0003y1-Hk
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9y6t-0005au-MI
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:37:24 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9y6s-0004sC-6A
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:37:23 -0500
Received: by mail-ej1-x635.google.com with SMTP id lg21so7013704ejb.3
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VETjWwPS1A0Get4RuQ1eTncopjKiXuUN2mgob0OtEE4=;
 b=nG5goGunGKn4ytPDqPgum6L6/i5gwrzPoLBSfieTBBxcu+mqi+MFGhdLxdDDobxkhw
 8g/xXuAOENk1YDl+APgVfHxcq9yA2ezfDbXZkkUQO8yeoUcr0tOmbAPQR3/d/Srs1Pv8
 xDjkGvX0NwOf6YZT8FlOvXiXV5gKlNK6Chg/kbwf/5/h3O6XuYkVf8+weKEHzJnZeXn2
 8KwbrkR5Izjdne0oaOaigxXOUJeHZ/R00yX8f6zACG+Kp2qhPjJa6dF2BBC6QBAucsjn
 lfgs/EW5asMk387aDn0C+IY4+UkvJeRaH95sOXCukd1sFM6v7xBHFOcNRFu10p8SsN7V
 m65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VETjWwPS1A0Get4RuQ1eTncopjKiXuUN2mgob0OtEE4=;
 b=DHt5QM22wXF+r6yCofB+udVhqnlw3qt5YRNv4edkJaKjDFp5fMjv5GHiqTpQQ0/BCX
 qog6FIxU7xNce9TiRJNXRpdlxsVtEPBGZTLj6HrqL1BVwHRGHbz8VRfMNVbMHApOIjxe
 LvO6ptInlLc1n9VJv8S8t21A6rXFUqiUyOLsuyjAqYRGrGgnWOrVSaGGA9l52OcJCSRS
 Mf7wbaP64yi24ubuJPH6mHgbRncdN8nzFHjykqpEKbt0XRVX+Z5sqER6EEkYtGQOkD0n
 3SeCNQgH0PdyX2cPPm+nn46PevJtcKSU9cGrW3BzPocfSqRsu3GDSPfulBEkUMB+GgeZ
 rMpA==
X-Gm-Message-State: AOAM532SGqTkKxT54dNRw9uB8gAs0udpICwwNqiD/D8KowHS3mEiiGOJ
 R2VA586so29vAmyQLCaXEl8=
X-Google-Smtp-Source: ABdhPJxBRoBArOmlMnmQMFd4yHxPoGAkO40by7L35QoVv86lJCLoKQV3/29f+WYPHWO/vIzQTjDmoQ==
X-Received: by 2002:a17:906:503:: with SMTP id
 j3mr5201304eja.172.1612996640097; 
 Wed, 10 Feb 2021 14:37:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v9sm2303471ejd.92.2021.02.10.14.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 14:37:19 -0800 (PST)
Subject: Re: [PATCH v2 12/42] esp: remove dma_counter from ESPState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-13-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <67c9e0e2-e5b4-780d-3bd1-8d01f07fd822@amsat.org>
Date: Wed, 10 Feb 2021 23:37:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-13-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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
> The value of dma_counter is set once at the start of the transfer and remains
> the same until the transfer is complete. This allows the check in esp_transfer_data
> to be simplified since dma_left will always be non-zero until the transfer is
> completed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 4 +---
>  include/hw/scsi/esp.h | 3 ---
>  2 files changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

