Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE083A5C88
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 07:43:41 +0200 (CEST)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsfNs-0005Rf-Fz
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 01:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsfMh-0004lW-4K
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 01:42:27 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsfMf-00084v-8B
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 01:42:26 -0400
Received: by mail-wr1-x430.google.com with SMTP id l2so13089622wrw.6
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 22:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gTHplJcetyNjBt7ZVeXzCnPXCImP/0dsLcTTkdTVdzM=;
 b=YuRqooIbx362GAjjiY0LuJhv+gVdrGba+kvfspibp2uqtsr6XVA072DUOYlbRKKQYI
 sWBqFQLSd9lu6OzZ6jdyX6pum2Y96pRzbM72lEaD1JaKOpuLSrrVzWZ3rd6ioCTwdMzG
 5Jj+xw7z/rqze3LVEAABk9lvFEK1VFcieNZbmmLf4vaLFudGFgxjiUDsc9bxkGetVfRl
 6uxDbD4e/QJF0RPravyEw1277IM0fAVM/ACwor9LRpszED1JIh3OsRnAW06pXX1ejeIq
 NVq71QJpQ0yJqEXfFypWwMX+Wxs277Oy4O1nawHMLY81VnbRGLu0Y6gCQEeaDVnIU5ge
 U/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gTHplJcetyNjBt7ZVeXzCnPXCImP/0dsLcTTkdTVdzM=;
 b=Sq0Lpqbc6nq8pXWn//nTPNJTH1egMgj5Ss+r4Yg0/jwyASlUgTwKhV/EwOGpwAimFg
 BvwXS6hhOWqq/5X19TU6xfnMK/QZfiHoxBg5Oh+mPZmgCsyKTvRPykt6h238rLWqGT9E
 Nk7ooeeaS2QYaBoCPNmIglK4TXd1XXHDiiYvQoQlYemVFwTHoRNusAHRHo/DvEqswjO1
 WBkblLbQ1aB/NPO4qXyM06zpAhu6xYWLd7r8JUhygK/tfV35hN6gfFiFGdAazuCMpBLC
 nxYma7M2+Ci0es0C+CuWPLCwoohJtsbNLnE/RLrFdGT3Q9qJamXC1dtNmby9UtGCwRGc
 89Mg==
X-Gm-Message-State: AOAM531Cf5xunqxFJ6bUg9GsfhuMjWwtkr+N4FDclWq7ySKoe0PtfGo8
 Yx+pwIwPQJQ4dJfq1PJO9TM=
X-Google-Smtp-Source: ABdhPJy4+r0MXZ2/gNO5sbxep44ZJ49vz00R1jey+8yq52Bcavf1XqtAaa4zIzcJvb1R1v+2LK9qUw==
X-Received: by 2002:adf:82a3:: with SMTP id 32mr16089403wrc.136.1623649338587; 
 Sun, 13 Jun 2021 22:42:18 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j34sm11906606wms.7.2021.06.13.22.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jun 2021 22:42:18 -0700 (PDT)
Subject: Re: [PATCH] esp: fix migration version check in esp_is_version_5()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, laurent@vivier.eu, hpoussin@reactos.org
References: <20210613102614.5438-1-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <75bf9945-9953-ba75-048a-a1570c6746ac@amsat.org>
Date: Mon, 14 Jun 2021 07:42:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210613102614.5438-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
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

On 6/13/21 12:26 PM, Mark Cave-Ayland wrote:
> Commit 4e78f3bf35 "esp: defer command completion interrupt on incoming data
> transfers" added a version check for use with VMSTATE_*_TEST macros to allow
> migration from older QEMU versions. Unfortunately the version check fails to
> work in its current form since if the VMStateDescription version_id is
> incremented, the test returns false and so the fields are not included in the
> outgoing migration stream.
> 
> Change the version check to use >= rather == to ensure that migration works
> correctly when the ESPState VMStateDescription has version_id > 5.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 4e78f3bf35 ("esp: defer command completion interrupt on incoming data transfers")
> ---
Well, it is not buggy yet :)

>  hw/scsi/esp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index bfdb94292b..39756ddd99 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -1120,7 +1120,7 @@ static bool esp_is_version_5(void *opaque, int version_id)

Can you rename esp_is_at_least_version_5()?

>      ESPState *s = ESP(opaque);
>  
>      version_id = MIN(version_id, s->mig_version_id);
> -    return version_id == 5;
> +    return version_id >= 5;
>  }
>  
>  int esp_pre_save(void *opaque)
> 


