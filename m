Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE8C308976
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 15:13:01 +0100 (CET)
Received: from localhost ([::1]:51362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5UWB-00033J-OG
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 09:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5UUf-0002YG-A0; Fri, 29 Jan 2021 09:11:25 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5UUa-0002vo-5h; Fri, 29 Jan 2021 09:11:21 -0500
Received: by mail-wr1-x436.google.com with SMTP id m13so8968817wro.12;
 Fri, 29 Jan 2021 06:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4+6SRrjebL24peYVgT5sgqIP6Qr0Y9yiI0sGJJXcozY=;
 b=uJ35NAKbKpJ6dV5rhMnOlgOa6LEmaNZlU/yYBdh90YZEJAQpq3kByKBspXylCqCBXj
 O3wlT7Kw+4ESVgeD59RwsZzXZvbAOn0NaFu479AxPeAq8k6JWhNwSM9TT5PwNK7Yp/mo
 KDyz3ETA4ES8bZP6MEGsM7P11WQUQNnJvLevKP6QmgVkb4iUa+vDZUdBMgU0dRWCp013
 P90ID0KMJK8AfImwt7mHjH9mmFa63zyPoMiaQWYMQCMMjs8nEfhDWIIAU/graOyEIh20
 9m0ALjXYQovv826wNu+/Cfv45nDOhoeIPvVFQ2hJhxvxZ8vBW9hCcStBiqKT1lB5gqbQ
 jrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4+6SRrjebL24peYVgT5sgqIP6Qr0Y9yiI0sGJJXcozY=;
 b=NxYZ6MHovKfm0ae/m1ydNl5fcTsjsaXME2Uk3dHtBR8E0xz9iYEkULYRpad+6qzyYK
 z7b1LPrvJqAejlnTVbRaSldqlR1MIow3ocu2o/blqrROGk3ddUB+cZ2CGRRBoadl1Vj/
 JHfLzMsd/ghbr8S8zw6lyTzCd++UE3huj4/S1IFzWK4+92apYEL6wuHxPx/uwfPoc+ih
 OwKo6QP+TJ/lKI6Dep7iqxH/HJBy451IknOxlPMmfpXXf2cB0W2vnEuJxGLPvR6XVi0I
 aAN3Zz7Mem2pEWBXkKU3Cvh1scdqxqZ0l5526HRQRjKMW0mzwxXsYwu0Nb7d+6lYTq0d
 8HcQ==
X-Gm-Message-State: AOAM533yb5nY2jx4a3KJ6bcG6lyrUkYdHvhXLkAWPJLExx3AcVvt+A04
 SvyfQ5Wtnn6vYN2Lc7Apvdo=
X-Google-Smtp-Source: ABdhPJwOzapxNXDN+CjpxkAseD64xyTUMA1dLSMhpUuOSxowIKByvO6PofAz6K/xutKkjocU0ixjMw==
X-Received: by 2002:adf:dd05:: with SMTP id a5mr4713270wrm.402.1611929477795; 
 Fri, 29 Jan 2021 06:11:17 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n19sm9856773wmq.25.2021.01.29.06.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 06:11:17 -0800 (PST)
Subject: Re: [PATCH] hw/sd: sd: Bypass the RCA check for CMD13 in SPI mode
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210129085124.21525-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9336f3ec-b500-052b-a8f8-e1b8ec2905b6@amsat.org>
Date: Fri, 29 Jan 2021 15:11:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129085124.21525-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin,

On 1/29/21 9:51 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Unlike SD mode, when SD card is working in SPI mode, the argument
> of CMD13 is stuff bits. Hence we should bypass the RCA check.

Is this for detecting events by polling? From spec v8:

  5.7.5 Event Indication Method
  5.7.5.1 FX_EVENT (Bit06 of Card Status)

    An event indication method is introduced from Version 4.20.
    Card may use Bit06 of R1 (R1b) response of any SD command
    to indicate event generation.

  F.2 Concept of Event Detection Method
  F.2.2 Host Implementation to use Event Detection Method

> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> Based-on: http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226787
> 
>  hw/sd/sd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 8c397d4ad7..4f902d0b72 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1166,8 +1166,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>      case 13:	/* CMD13:  SEND_STATUS */
>          switch (sd->mode) {
>          case sd_data_transfer_mode:
> -            if (sd->rca != rca)
> +            if (!sd->spi && sd->rca != rca) {
>                  return sd_r0;
> +            }
>  
>              return sd_r1;
>  
> 

