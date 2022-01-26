Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D1449CED7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 16:46:10 +0100 (CET)
Received: from localhost ([::1]:43574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCkUq-0005vY-VG
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 10:46:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1nCkQq-0004Je-QQ
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:42:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1nCkQe-0004XV-Dg
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643211707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpHee+nSAqpFAw07VQl0FVXyck8x3gdlbsL18Hw5G3U=;
 b=aNeJkFHitwR/MRhmmAZWF14YcxIfdq75Qtc+8aJHWFTc74LoB4At37UIPlbTukuKUgMs+3
 458BoJnwU8Tg/MOaNN8iJnwILBJ8ZnTaEupBMPe6l1jwVEE+8Cbd+AU3pVjixVhFmiKJqH
 XOXjOAs/jS3XhyuZ0MrqIWdb/Sm0OZU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-NSYQFz37N_qASaj083RNNA-1; Wed, 26 Jan 2022 10:41:46 -0500
X-MC-Unique: NSYQFz37N_qASaj083RNNA-1
Received: by mail-qk1-f199.google.com with SMTP id
 u9-20020ae9c009000000b0049ae89c924aso2389880qkk.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 07:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xpHee+nSAqpFAw07VQl0FVXyck8x3gdlbsL18Hw5G3U=;
 b=qO+yWPJir+q/LYW6wB5laLQSoECAzwfz8OYCyqIkCab2kDHsUHmG7YJMuFYPzPiLG7
 jc4FYeqeGLC+uLzhFChbnaoSHLO7uHg40i7ld5aD/N4jW+RbmcMO/lw3C73WhBNCdK5P
 y3Ek33nL+Km831oPxqxZnS71iB91dh1Neij23l37LzCqb+/qJCUV19eJmrwUAZnStX+J
 vmbw+zJbTafMjYfWJBD0G8K6xFXu/+tVn8vuKkT+NTy9zwl/ymFA3iBg2lqCJLJuh2VJ
 wY/XYbyrzMZAtGHKXJunBXTOgsftwipFBQpSQ+d8PHF6gYhlW2gWtNxDciryNk79578P
 dj2Q==
X-Gm-Message-State: AOAM530Hecmb/8ZPsBaiHB25SgCXKEmJ+BGkRp2DPWC0vU+KU4syk5vf
 sBDJAJthLmyUC7uJPL4V+nrUpJeS3McYAevN8pw/GICbkrhh68+y1XgSH5N0bEA7ffhi0h3f7S3
 wqFcUqjd0MyJ07FJTp3nDKDXBHL3CdIxAQbfcNFlzPmpn4M48NnGTQhXxyOpwKED8
X-Received: by 2002:a05:622a:9:: with SMTP id x9mr20773386qtw.73.1643211705726; 
 Wed, 26 Jan 2022 07:41:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywfMG64CoxHal4jE+3XVIJ9hPpTecDaJ3gOtyqXKnW+ZKmQHnavf07RWJIUoNvNAmsTPlVhQ==
X-Received: by 2002:a05:622a:9:: with SMTP id x9mr20773365qtw.73.1643211705425; 
 Wed, 26 Jan 2022 07:41:45 -0800 (PST)
Received: from [10.0.0.97] ([24.225.241.171])
 by smtp.gmail.com with ESMTPSA id x16sm11440747qko.17.2022.01.26.07.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 07:41:44 -0800 (PST)
Message-ID: <bac2d939-380c-ec6e-d8e4-bfa6e97b0e18@redhat.com>
Date: Wed, 26 Jan 2022 10:44:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] fdc: check for illegal dma length calculation
To: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
References: <20220114013319.348012-1-jmaloy@redhat.com>
From: Jon Maloy <jmaloy@redhat.com>
In-Reply-To: <20220114013319.348012-1-jmaloy@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jmaloy@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jasowang@redhat.com, pjp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/13/22 20:33, Jon Maloy wrote:
> The function fdctrl_start_transfer() calculates the dma data length
> wrongly when certain boundary conditions are fulfilled. We have
> noticed that the if ((fdctrl->fifo[5] - fdctrl->fifo[6]) > 1) we get
> a dma length that will be interpreted as negative by the next function
> in the chain, fdctrl_transfer_handler(). This leads to a crash.
>
> Rather than trying to fix this obscure calculation, we just check if
> the harmful condition is fulfilled, and return without action if that
> is the case. Since this is a condition that can only be created by a
> malicious user we deem this solution safe.
>
> This fix is intended to address CVE-2021-3507.
>
> Signed-off-by: Jon Maloy <jmaloy@redhat.com>
> ---
>   hw/block/fdc.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 21d18ac2e3..80a1f1750a 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -1532,6 +1532,11 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl, int direction)
>           if (fdctrl->fifo[0] & 0x80)
>               tmp += fdctrl->fifo[6];
>           fdctrl->data_len *= tmp;
> +        if (tmp < 0) {
> +            FLOPPY_DPRINTF("calculated illegal data_len=%u, tmp=%i\n",
> +                           fdctrl->data_len, tmp);
> +            return;
> +        }
>       }
>       fdctrl->eot = fdctrl->fifo[6];
>       if (fdctrl->dor & FD_DOR_DMAEN) {
I never received any feedback on this one.
Is there any?

///jon


