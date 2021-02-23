Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6242732332C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 22:22:55 +0100 (CET)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEf8v-0004De-QO
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 16:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEf8A-0003nh-RB
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:22:06 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEf88-0002y1-8A
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:22:06 -0500
Received: by mail-wr1-x42d.google.com with SMTP id y17so2450046wrs.12
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 13:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n+aQkC7SAE9qBtEgvtv0jDuzxZFTG/xq4N24IqSvRN0=;
 b=RW9cfRu9S7JpDwBmDv+7zsJAfFcCybE4zLWYIYKsUgUoySnFjbEZouNeuW5/AkWFFE
 OA85g6Oy6cSxuRKY9Puu5iDogk1zOotMHybN1JTGbFxL8+DgzaJdKvbPy4B4LzSWUc24
 piGp1fsJaGBni8ctsZ7IUtVCcrKxfyncpsScKh9KE+NKVsO8mB5ZsMSC4tQ4wddoSoWV
 VslY4bWn3+j3TKt97umGWgy8vc4axZRQASNuXCaw+7RrYmohp8vqQb1Xwf2zS13kmd0o
 +YqS5Lq2HuY6WB6e/OvKMHVW609JPa6w/QlFaYWUUIOkvMkSjzXnCdUbkSYBf3cZ9yCj
 XN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n+aQkC7SAE9qBtEgvtv0jDuzxZFTG/xq4N24IqSvRN0=;
 b=q+LEYys1SF5t84yDpZ/m+uMHh8/Dj6N38no81I9sQPvXlolXsqP4FvHJe0w+QRwZsQ
 bxoflv8MmxOXitKEBRNVp7fYvcENVzKDgsBvOirIzZfNtlDC5PHSmlC9grt0bTLbQy9u
 z1VCXZfDHye/NY2YPcMutahrUnZUzHiR3RkuAFYqCp2aHQtjcX7U6wJPQ6/9sU9/fIuO
 X0lduq2Yqhv5ypNHEu/Xp5QuBV0sovfHDFj9fIdyNfnjVmn+SeF0I5NASGVTezM6u5Va
 oHLlYSx/PUFGtGJhFoA+NrTqbgFU/wQd/87tcDw4d0PXfVIQOpA1h3IvElNvcUVM67BG
 c2EA==
X-Gm-Message-State: AOAM533iFhCx4q4PRHgdAhyWLIxB3I0tk2c5PU68Gnt9tY9WiTSynf9a
 FWR4Pt8G4jYPl72tCakXBNc=
X-Google-Smtp-Source: ABdhPJxufkNuadh5qhbykIV41rB2LAyn05iC1wkLA0Juoe6TyFxRn3WpvSq5BicX4p3aE5ylHjSWrw==
X-Received: by 2002:a5d:6b42:: with SMTP id x2mr27905902wrw.117.1614115322571; 
 Tue, 23 Feb 2021 13:22:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l4sm6149wrt.42.2021.02.23.13.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 13:22:02 -0800 (PST)
Subject: Re: [PATCH v2 13/42] esp: remove dma_left from ESPState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-14-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <204a6f19-6722-ccc5-306c-05d62b00bb6a@amsat.org>
Date: Tue, 23 Feb 2021 22:22:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-14-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
> The ESP device already keeps track of the remaining bytes left to transfer via
> its TC (transfer counter) register which is decremented for each byte that
> is transferred across the SCSI bus.
> 
> Switch the transfer logic to use the value of TC instead of dma_left and then
> remove dma_left completely, adding logic to the vmstate_esp post_load() function
> to transfer the old dma_left value to the TC register during migration from
> older versions.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 47 ++++++++++++++++++++++++++++---------------
>  include/hw/scsi/esp.h |  5 +++--
>  2 files changed, 34 insertions(+), 18 deletions(-)

I dare to add:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

