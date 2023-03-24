Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F016C8091
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 15:59:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfet3-0001oZ-1o; Fri, 24 Mar 2023 06:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfeso-0001nb-DZ
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 06:42:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pferD-0006gY-Lh
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 06:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679654469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kHMMU3W28y0CY3Qc257QDdUCWCn17XgMw6Qt5aPSe8o=;
 b=LXae87CWa0NH7Gb08gkXORrD/lSomj5c5N7l4WagqYTZnR6k25xyqoEOfTAGhWQXSY6bMo
 poWGNVZC88aKhCb3CLJheSDxaoB5CnTJyIVpp/QTYnUuvP6OG3si1NPk6sGsaWGEzcIGbT
 Q9FnAx3GZkjrruzqobvJsG7kFo1bEbI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-6jlp9xX7MLurGx3z207bJA-1; Fri, 24 Mar 2023 06:34:47 -0400
X-MC-Unique: 6jlp9xX7MLurGx3z207bJA-1
Received: by mail-qt1-f200.google.com with SMTP id
 w13-20020ac857cd000000b003e37d3e6de2so792771qta.16
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 03:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679654087;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kHMMU3W28y0CY3Qc257QDdUCWCn17XgMw6Qt5aPSe8o=;
 b=og6cHGqKbvWjM4Hx8eWYczoE/5mojtAyorgBrjSBYqmdUZh7tlgRqzjjgSV//Xrnc6
 H4xXHaTQAK1XR820gMCuMAoVKAWqNAe61gYOpaH7ChxlPSqf8Jfr0/LIufGvktXizuBk
 uS5n/3cIfW8m5C9lnjGiVIkE37SKmHsz/Yu601tjUlIZkAPdKlm40VpUbqOODQdvuu4x
 yeu2s99tKGlOZPIPqyBti64IP948Pjwc2AlbW01nyt4ehcZZRJa2ZLfFiNLEaE7vyVg9
 LAeNm5TcEUjMNYsXf77coot2sqRSPxVCUilDVbQIwASQ7GKphw81DWCeOpJ6egtDun2M
 ifsw==
X-Gm-Message-State: AAQBX9dq8T4MNMY0HhzykpRxj3hSB7GmcPaVHqClGSKmJBTWbUzdhb91
 7bBvRi0o9QaMPKzpiey7w8AE7Ubui4NosG79v1gr9fc28lK3GrS8vdW6lVr6K6eXNUdNjxySb7K
 NIz4riZU2S7iMnUg=
X-Received: by 2002:ad4:5dec:0:b0:5a3:2e65:69ef with SMTP id
 jn12-20020ad45dec000000b005a32e6569efmr2874523qvb.49.1679654086953; 
 Fri, 24 Mar 2023 03:34:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350afEXUx9Z50uTIoK52mcXSYpyY0WRGNLHtyzBRTZJk/vPPNjsqgEz4gkBnVG0GYZQZX8V4Cug==
X-Received: by 2002:ad4:5dec:0:b0:5a3:2e65:69ef with SMTP id
 jn12-20020ad45dec000000b005a32e6569efmr2874235qvb.49.1679654081259; 
 Fri, 24 Mar 2023 03:34:41 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-101.web.vodafone.de.
 [109.43.179.101]) by smtp.gmail.com with ESMTPSA id
 15-20020a05620a048f00b0074636e35405sm6714910qkr.65.2023.03.24.03.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 03:34:40 -0700 (PDT)
Message-ID: <f8a3fdf2-a348-9dee-4871-fe894ff43c91@redhat.com>
Date: Fri, 24 Mar 2023 11:34:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] hw/ide: replace TABs with space
Content-Language: en-US
To: Yeqi Fu <fufuyqqqqqq@gmail.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <20230315043229.62100-1-fufuyqqqqqq@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315043229.62100-1-fufuyqqqqqq@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/03/2023 05.32, Yeqi Fu wrote:
> Bring the block files in line with the QEMU coding style, with spaces
> for indentation. This patch partially resolves the issue 371.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/371
> Signed-off-by: Yeqi Fu <fufuyqqqqqq@gmail.com>
> ---
>   hw/ide/cmd646.c           |  28 +--
>   hw/ide/core.c             |  84 ++++-----
>   hw/ide/microdrive.c       | 360 +++++++++++++++++++-------------------
>   include/hw/ide/internal.h | 248 +++++++++++++-------------
>   4 files changed, 360 insertions(+), 360 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

PS: Please make sure to always CC: qemu-devel for all patches (done now), 
even if you mainly target the qemu-block mailing list. Thanks!

> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index 26a90ed45f..a68357c1c5 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -36,20 +36,20 @@
>   #include "trace.h"
>   
>   /* CMD646 specific */
> -#define CFR		0x50
> -#define   CFR_INTR_CH0	0x04
> -#define CNTRL		0x51
> -#define   CNTRL_EN_CH0	0x04
> -#define   CNTRL_EN_CH1	0x08
> -#define ARTTIM23	0x57
> -#define    ARTTIM23_INTR_CH1	0x10
> -#define MRDMODE		0x71
> -#define   MRDMODE_INTR_CH0	0x04
> -#define   MRDMODE_INTR_CH1	0x08
> -#define   MRDMODE_BLK_CH0	0x10
> -#define   MRDMODE_BLK_CH1	0x20
> -#define UDIDETCR0	0x73
> -#define UDIDETCR1	0x7B
> +#define CFR                  0x50
> +#define   CFR_INTR_CH0       0x04
> +#define CNTRL                0x51
> +#define   CNTRL_EN_CH0       0x04
> +#define   CNTRL_EN_CH1       0x08
> +#define ARTTIM23             0x57
> +#define    ARTTIM23_INTR_CH1 0x10
> +#define MRDMODE              0x71
> +#define   MRDMODE_INTR_CH0   0x04
> +#define   MRDMODE_INTR_CH1   0x08
> +#define   MRDMODE_BLK_CH0    0x10
> +#define   MRDMODE_BLK_CH1    0x20
> +#define UDIDETCR0            0x73
> +#define UDIDETCR1            0x7B
>   
>   static void cmd646_update_irq(PCIDevice *pd);
>   
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index 2d034731cf..45d14a25e9 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -318,52 +318,52 @@ static void ide_cfata_identify(IDEState *s)
>   
>       cur_sec = s->cylinders * s->heads * s->sectors;
>   
> -    put_le16(p + 0, 0x848a);			/* CF Storage Card signature */
> -    put_le16(p + 1, s->cylinders);		/* Default cylinders */
> -    put_le16(p + 3, s->heads);			/* Default heads */
> -    put_le16(p + 6, s->sectors);		/* Default sectors per track */
> +    put_le16(p + 0, 0x848a);                    /* CF Storage Card signature */
> +    put_le16(p + 1, s->cylinders);              /* Default cylinders */
> +    put_le16(p + 3, s->heads);                  /* Default heads */
> +    put_le16(p + 6, s->sectors);                /* Default sectors per track */
>       /* *(p + 7) := nb_sectors >> 16 -- see ide_cfata_identify_size */
>       /* *(p + 8) := nb_sectors       -- see ide_cfata_identify_size */
>       padstr((char *)(p + 10), s->drive_serial_str, 20); /* serial number */
> -    put_le16(p + 22, 0x0004);			/* ECC bytes */
> -    padstr((char *) (p + 23), s->version, 8);	/* Firmware Revision */
> +    put_le16(p + 22, 0x0004);                   /* ECC bytes */
> +    padstr((char *) (p + 23), s->version, 8);   /* Firmware Revision */
>       padstr((char *) (p + 27), s->drive_model_str, 40);/* Model number */
>   #if MAX_MULT_SECTORS > 1
>       put_le16(p + 47, 0x8000 | MAX_MULT_SECTORS);
>   #else
>       put_le16(p + 47, 0x0000);
>   #endif
> -    put_le16(p + 49, 0x0f00);			/* Capabilities */
> -    put_le16(p + 51, 0x0002);			/* PIO cycle timing mode */
> -    put_le16(p + 52, 0x0001);			/* DMA cycle timing mode */
> -    put_le16(p + 53, 0x0003);			/* Translation params valid */
> -    put_le16(p + 54, s->cylinders);		/* Current cylinders */
> -    put_le16(p + 55, s->heads);			/* Current heads */
> -    put_le16(p + 56, s->sectors);		/* Current sectors */
> -    put_le16(p + 57, cur_sec);			/* Current capacity */
> -    put_le16(p + 58, cur_sec >> 16);		/* Current capacity */
> -    if (s->mult_sectors)			/* Multiple sector setting */
> +    put_le16(p + 49, 0x0f00);                   /* Capabilities */
> +    put_le16(p + 51, 0x0002);                   /* PIO cycle timing mode */
> +    put_le16(p + 52, 0x0001);                   /* DMA cycle timing mode */
> +    put_le16(p + 53, 0x0003);                   /* Translation params valid */
> +    put_le16(p + 54, s->cylinders);             /* Current cylinders */
> +    put_le16(p + 55, s->heads);                 /* Current heads */
> +    put_le16(p + 56, s->sectors);               /* Current sectors */
> +    put_le16(p + 57, cur_sec);                  /* Current capacity */
> +    put_le16(p + 58, cur_sec >> 16);            /* Current capacity */
> +    if (s->mult_sectors)                        /* Multiple sector setting */
>           put_le16(p + 59, 0x100 | s->mult_sectors);
>       /* *(p + 60) := nb_sectors       -- see ide_cfata_identify_size */
>       /* *(p + 61) := nb_sectors >> 16 -- see ide_cfata_identify_size */
> -    put_le16(p + 63, 0x0203);			/* Multiword DMA capability */
> -    put_le16(p + 64, 0x0001);			/* Flow Control PIO support */
> -    put_le16(p + 65, 0x0096);			/* Min. Multiword DMA cycle */
> -    put_le16(p + 66, 0x0096);			/* Rec. Multiword DMA cycle */
> -    put_le16(p + 68, 0x00b4);			/* Min. PIO cycle time */
> -    put_le16(p + 82, 0x400c);			/* Command Set supported */
> -    put_le16(p + 83, 0x7068);			/* Command Set supported */
> -    put_le16(p + 84, 0x4000);			/* Features supported */
> -    put_le16(p + 85, 0x000c);			/* Command Set enabled */
> -    put_le16(p + 86, 0x7044);			/* Command Set enabled */
> -    put_le16(p + 87, 0x4000);			/* Features enabled */
> -    put_le16(p + 91, 0x4060);			/* Current APM level */
> -    put_le16(p + 129, 0x0002);			/* Current features option */
> -    put_le16(p + 130, 0x0005);			/* Reassigned sectors */
> -    put_le16(p + 131, 0x0001);			/* Initial power mode */
> -    put_le16(p + 132, 0x0000);			/* User signature */
> -    put_le16(p + 160, 0x8100);			/* Power requirement */
> -    put_le16(p + 161, 0x8001);			/* CF command set */
> +    put_le16(p + 63, 0x0203);                   /* Multiword DMA capability */
> +    put_le16(p + 64, 0x0001);                   /* Flow Control PIO support */
> +    put_le16(p + 65, 0x0096);                   /* Min. Multiword DMA cycle */
> +    put_le16(p + 66, 0x0096);                   /* Rec. Multiword DMA cycle */
> +    put_le16(p + 68, 0x00b4);                   /* Min. PIO cycle time */
> +    put_le16(p + 82, 0x400c);                   /* Command Set supported */
> +    put_le16(p + 83, 0x7068);                   /* Command Set supported */
> +    put_le16(p + 84, 0x4000);                   /* Features supported */
> +    put_le16(p + 85, 0x000c);                   /* Command Set enabled */
> +    put_le16(p + 86, 0x7044);                   /* Command Set enabled */
> +    put_le16(p + 87, 0x4000);                   /* Features enabled */
> +    put_le16(p + 91, 0x4060);                   /* Current APM level */
> +    put_le16(p + 129, 0x0002);                  /* Current features option */
> +    put_le16(p + 130, 0x0005);                  /* Reassigned sectors */
> +    put_le16(p + 131, 0x0001);                  /* Initial power mode */
> +    put_le16(p + 132, 0x0000);                  /* User signature */
> +    put_le16(p + 160, 0x8100);                  /* Power requirement */
> +    put_le16(p + 161, 0x8001);                  /* CF command set */
>   
>       ide_cfata_identify_size(s);
>       s->identify_set = 1;
> @@ -1131,13 +1131,13 @@ static void ide_cfata_metadata_inquiry(IDEState *s)
>       memset(p, 0, 0x200);
>       spd = ((s->mdata_size - 1) >> 9) + 1;
>   
> -    put_le16(p + 0, 0x0001);			/* Data format revision */
> -    put_le16(p + 1, 0x0000);			/* Media property: silicon */
> -    put_le16(p + 2, s->media_changed);		/* Media status */
> -    put_le16(p + 3, s->mdata_size & 0xffff);	/* Capacity in bytes (low) */
> -    put_le16(p + 4, s->mdata_size >> 16);	/* Capacity in bytes (high) */
> -    put_le16(p + 5, spd & 0xffff);		/* Sectors per device (low) */
> -    put_le16(p + 6, spd >> 16);			/* Sectors per device (high) */
> +    put_le16(p + 0, 0x0001);                    /* Data format revision */
> +    put_le16(p + 1, 0x0000);                    /* Media property: silicon */
> +    put_le16(p + 2, s->media_changed);          /* Media status */
> +    put_le16(p + 3, s->mdata_size & 0xffff);    /* Capacity in bytes (low) */
> +    put_le16(p + 4, s->mdata_size >> 16);       /* Capacity in bytes (high) */
> +    put_le16(p + 5, spd & 0xffff);              /* Sectors per device (low) */
> +    put_le16(p + 6, spd >> 16);                 /* Sectors per device (high) */
>   }
>   
>   static void ide_cfata_metadata_read(IDEState *s)
> @@ -1153,7 +1153,7 @@ static void ide_cfata_metadata_read(IDEState *s)
>       p = (uint16_t *) s->io_buffer;
>       memset(p, 0, 0x200);
>   
> -    put_le16(p + 0, s->media_changed);		/* Media status */
> +    put_le16(p + 0, s->media_changed);          /* Media status */
>       memcpy(p + 1, s->mdata_storage + (((s->hcyl << 16) | s->lcyl) << 9),
>                       MIN(MIN(s->mdata_size - (((s->hcyl << 16) | s->lcyl) << 9),
>                                       s->nsector << 9), 0x200 - 2));
> diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
> index f1017f7333..981cfbd97f 100644
> --- a/hw/ide/microdrive.c
> +++ b/hw/ide/microdrive.c
> @@ -40,7 +40,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(MicroDriveState, MICRODRIVE)
>   /***********************************************************/
>   /* CF-ATA Microdrive */
>   
> -#define METADATA_SIZE	0x20
> +#define METADATA_SIZE   0x20
>   
>   /* DSCM-1XXXX Microdrive hard disk with CF+ II / PCMCIA interface.  */
>   
> @@ -65,29 +65,29 @@ struct MicroDriveState {
>   
>   /* Register bitfields */
>   enum md_opt {
> -    OPT_MODE_MMAP	= 0,
> -    OPT_MODE_IOMAP16	= 1,
> -    OPT_MODE_IOMAP1	= 2,
> -    OPT_MODE_IOMAP2	= 3,
> -    OPT_MODE		= 0x3f,
> -    OPT_LEVIREQ		= 0x40,
> -    OPT_SRESET		= 0x80,
> +    OPT_MODE_MMAP    = 0,
> +    OPT_MODE_IOMAP16 = 1,
> +    OPT_MODE_IOMAP1  = 2,
> +    OPT_MODE_IOMAP2  = 3,
> +    OPT_MODE         = 0x3f,
> +    OPT_LEVIREQ      = 0x40,
> +    OPT_SRESET       = 0x80,
>   };
>   enum md_cstat {
> -    STAT_INT		= 0x02,
> -    STAT_PWRDWN		= 0x04,
> -    STAT_XE		= 0x10,
> -    STAT_IOIS8		= 0x20,
> -    STAT_SIGCHG		= 0x40,
> -    STAT_CHANGED	= 0x80,
> +    STAT_INT        = 0x02,
> +    STAT_PWRDWN     = 0x04,
> +    STAT_XE         = 0x10,
> +    STAT_IOIS8      = 0x20,
> +    STAT_SIGCHG     = 0x40,
> +    STAT_CHANGED    = 0x80,
>   };
>   enum md_pins {
> -    PINS_MRDY		= 0x02,
> -    PINS_CRDY		= 0x20,
> +    PINS_MRDY       = 0x02,
> +    PINS_CRDY       = 0x20,
>   };
>   enum md_ctrl {
> -    CTRL_IEN		= 0x02,
> -    CTRL_SRST		= 0x04,
> +    CTRL_IEN        = 0x02,
> +    CTRL_SRST       = 0x04,
>   };
>   
>   static inline void md_interrupt_update(MicroDriveState *s)
> @@ -99,7 +99,7 @@ static inline void md_interrupt_update(MicroDriveState *s)
>       }
>   
>       qemu_set_irq(card->slot->irq,
> -                    !(s->stat & STAT_INT) &&	/* Inverted */
> +                    !(s->stat & STAT_INT) &&    /* Inverted */
>                       !(s->ctrl & (CTRL_IEN | CTRL_SRST)) &&
>                       !(s->opt & OPT_SRESET));
>   }
> @@ -145,17 +145,17 @@ static uint8_t md_attr_read(PCMCIACardState *card, uint32_t at)
>       at -= s->attr_base;
>   
>       switch (at) {
> -    case 0x00:	/* Configuration Option Register */
> +    case 0x00:  /* Configuration Option Register */
>           return s->opt;
> -    case 0x02:	/* Card Configuration Status Register */
> +    case 0x02:  /* Card Configuration Status Register */
>           if (s->ctrl & CTRL_IEN) {
>               return s->stat & ~STAT_INT;
>           } else {
>               return s->stat;
>           }
> -    case 0x04:	/* Pin Replacement Register */
> +    case 0x04:  /* Pin Replacement Register */
>           return (s->pins & PINS_CRDY) | 0x0c;
> -    case 0x06:	/* Socket and Copy Register */
> +    case 0x06:  /* Socket and Copy Register */
>           return 0x00;
>   #ifdef VERBOSE
>       default:
> @@ -173,14 +173,14 @@ static void md_attr_write(PCMCIACardState *card, uint32_t at, uint8_t value)
>       at -= s->attr_base;
>   
>       switch (at) {
> -    case 0x00:	/* Configuration Option Register */
> +    case 0x00:  /* Configuration Option Register */
>           s->opt = value & 0xcf;
>           if (value & OPT_SRESET) {
>               device_cold_reset(DEVICE(s));
>           }
>           md_interrupt_update(s);
>           break;
> -    case 0x02:	/* Card Configuration Status Register */
> +    case 0x02:  /* Card Configuration Status Register */
>           if ((s->stat ^ value) & STAT_PWRDWN) {
>               s->pins |= PINS_CRDY;
>           }
> @@ -189,11 +189,11 @@ static void md_attr_write(PCMCIACardState *card, uint32_t at, uint8_t value)
>           md_interrupt_update(s);
>           /* Word 170 in Identify Device must be equal to STAT_XE */
>           break;
> -    case 0x04:	/* Pin Replacement Register */
> +    case 0x04:  /* Pin Replacement Register */
>           s->pins &= PINS_CRDY;
>           s->pins |= value & PINS_MRDY;
>           break;
> -    case 0x06:	/* Socket and Copy Register */
> +    case 0x06:  /* Socket and Copy Register */
>           break;
>       default:
>           printf("%s: Bad attribute space register %02x\n", __func__, at);
> @@ -232,7 +232,7 @@ static uint16_t md_common_read(PCMCIACardState *card, uint32_t at)
>       }
>   
>       switch (at) {
> -    case 0x0:	/* Even RD Data */
> +    case 0x0:  /* Even RD Data */
>       case 0x8:
>           return ide_data_readw(&s->bus, 0);
>   
> @@ -245,18 +245,18 @@ static uint16_t md_common_read(PCMCIACardState *card, uint32_t at)
>           }
>           s->cycle = !s->cycle;
>           return ret;
> -    case 0x9:	/* Odd RD Data */
> +    case 0x9:  /* Odd RD Data */
>           return s->io >> 8;
> -    case 0xd:	/* Error */
> +    case 0xd:  /* Error */
>           return ide_ioport_read(&s->bus, 0x1);
> -    case 0xe:	/* Alternate Status */
> +    case 0xe:  /* Alternate Status */
>           ifs = ide_bus_active_if(&s->bus);
>           if (ifs->blk) {
>               return ifs->status;
>           } else {
>               return 0;
>           }
> -    case 0xf:	/* Device Address */
> +    case 0xf:  /* Device Address */
>           ifs = ide_bus_active_if(&s->bus);
>           return 0xc2 | ((~ifs->select << 2) & 0x3c);
>       default:
> @@ -296,7 +296,7 @@ static void md_common_write(PCMCIACardState *card, uint32_t at, uint16_t value)
>       }
>   
>       switch (at) {
> -    case 0x0:	/* Even WR Data */
> +    case 0x0:  /* Even WR Data */
>       case 0x8:
>           ide_data_writew(&s->bus, 0, value);
>           break;
> @@ -313,10 +313,10 @@ static void md_common_write(PCMCIACardState *card, uint32_t at, uint16_t value)
>           s->io = value & 0xff;
>           s->cycle = !s->cycle;
>           break;
> -    case 0xd:	/* Features */
> +    case 0xd:  /* Features */
>           ide_ioport_write(&s->bus, 0x1, value);
>           break;
> -    case 0xe:	/* Device Control */
> +    case 0xe:  /* Device Control */
>           s->ctrl = value;
>           if (value & CTRL_SRST) {
>               device_cold_reset(DEVICE(s));
> @@ -350,35 +350,35 @@ static const VMStateDescription vmstate_microdrive = {
>   };
>   
>   static const uint8_t dscm1xxxx_cis[0x14a] = {
> -    [0x000] = CISTPL_DEVICE,	/* 5V Device Information */
> -    [0x002] = 0x03,		/* Tuple length = 4 bytes */
> -    [0x004] = 0xdb,		/* ID: DTYPE_FUNCSPEC, non WP, DSPEED_150NS */
> -    [0x006] = 0x01,		/* Size = 2K bytes */
> +    [0x000] = CISTPL_DEVICE,    /* 5V Device Information */
> +    [0x002] = 0x03,             /* Tuple length = 4 bytes */
> +    [0x004] = 0xdb,             /* ID: DTYPE_FUNCSPEC, non WP, DSPEED_150NS */
> +    [0x006] = 0x01,             /* Size = 2K bytes */
>       [0x008] = CISTPL_ENDMARK,
>   
> -    [0x00a] = CISTPL_DEVICE_OC,	/* Additional Device Information */
> -    [0x00c] = 0x04,		/* Tuple length = 4 byest */
> -    [0x00e] = 0x03,		/* Conditions: Ext = 0, Vcc 3.3V, MWAIT = 1 */
> -    [0x010] = 0xdb,		/* ID: DTYPE_FUNCSPEC, non WP, DSPEED_150NS */
> -    [0x012] = 0x01,		/* Size = 2K bytes */
> +    [0x00a] = CISTPL_DEVICE_OC, /* Additional Device Information */
> +    [0x00c] = 0x04,             /* Tuple length = 4 byest */
> +    [0x00e] = 0x03,             /* Conditions: Ext = 0, Vcc 3.3V, MWAIT = 1 */
> +    [0x010] = 0xdb,             /* ID: DTYPE_FUNCSPEC, non WP, DSPEED_150NS */
> +    [0x012] = 0x01,             /* Size = 2K bytes */
>       [0x014] = CISTPL_ENDMARK,
>   
> -    [0x016] = CISTPL_JEDEC_C,	/* JEDEC ID */
> -    [0x018] = 0x02,		/* Tuple length = 2 bytes */
> -    [0x01a] = 0xdf,		/* PC Card ATA with no Vpp required */
> +    [0x016] = CISTPL_JEDEC_C,   /* JEDEC ID */
> +    [0x018] = 0x02,             /* Tuple length = 2 bytes */
> +    [0x01a] = 0xdf,             /* PC Card ATA with no Vpp required */
>       [0x01c] = 0x01,
>   
> -    [0x01e] = CISTPL_MANFID,	/* Manufacture ID */
> -    [0x020] = 0x04,		/* Tuple length = 4 bytes */
> -    [0x022] = 0xa4,		/* TPLMID_MANF = 00a4 (IBM) */
> +    [0x01e] = CISTPL_MANFID,    /* Manufacture ID */
> +    [0x020] = 0x04,             /* Tuple length = 4 bytes */
> +    [0x022] = 0xa4,             /* TPLMID_MANF = 00a4 (IBM) */
>       [0x024] = 0x00,
> -    [0x026] = 0x00,		/* PLMID_CARD = 0000 */
> +    [0x026] = 0x00,             /* PLMID_CARD = 0000 */
>       [0x028] = 0x00,
>   
> -    [0x02a] = CISTPL_VERS_1,	/* Level 1 Version */
> -    [0x02c] = 0x12,		/* Tuple length = 23 bytes */
> -    [0x02e] = 0x04,		/* Major Version = JEIDA 4.2 / PCMCIA 2.1 */
> -    [0x030] = 0x01,		/* Minor Version = 1 */
> +    [0x02a] = CISTPL_VERS_1,    /* Level 1 Version */
> +    [0x02c] = 0x12,             /* Tuple length = 23 bytes */
> +    [0x02e] = 0x04,             /* Major Version = JEIDA 4.2 / PCMCIA 2.1 */
> +    [0x030] = 0x01,             /* Minor Version = 1 */
>       [0x032] = 'I',
>       [0x034] = 'B',
>       [0x036] = 'M',
> @@ -396,142 +396,142 @@ static const uint8_t dscm1xxxx_cis[0x14a] = {
>       [0x04e] = 0x00,
>       [0x050] = CISTPL_ENDMARK,
>   
> -    [0x052] = CISTPL_FUNCID,	/* Function ID */
> -    [0x054] = 0x02,		/* Tuple length = 2 bytes */
> -    [0x056] = 0x04,		/* TPLFID_FUNCTION = Fixed Disk */
> -    [0x058] = 0x01,		/* TPLFID_SYSINIT: POST = 1, ROM = 0 */
> -
> -    [0x05a] = CISTPL_FUNCE,	/* Function Extension */
> -    [0x05c] = 0x02,		/* Tuple length = 2 bytes */
> -    [0x05e] = 0x01,		/* TPLFE_TYPE = Disk Device Interface */
> -    [0x060] = 0x01,		/* TPLFE_DATA = PC Card ATA Interface */
> -
> -    [0x062] = CISTPL_FUNCE,	/* Function Extension */
> -    [0x064] = 0x03,		/* Tuple length = 3 bytes */
> -    [0x066] = 0x02,		/* TPLFE_TYPE = Basic PC Card ATA Interface */
> -    [0x068] = 0x08,		/* TPLFE_DATA: Rotating, Unique, Single */
> -    [0x06a] = 0x0f,		/* TPLFE_DATA: Sleep, Standby, Idle, Auto */
> -
> -    [0x06c] = CISTPL_CONFIG,	/* Configuration */
> -    [0x06e] = 0x05,		/* Tuple length = 5 bytes */
> -    [0x070] = 0x01,		/* TPCC_RASZ = 2 bytes, TPCC_RMSZ = 1 byte */
> -    [0x072] = 0x07,		/* TPCC_LAST = 7 */
> -    [0x074] = 0x00,		/* TPCC_RADR = 0200 */
> +    [0x052] = CISTPL_FUNCID,    /* Function ID */
> +    [0x054] = 0x02,             /* Tuple length = 2 bytes */
> +    [0x056] = 0x04,             /* TPLFID_FUNCTION = Fixed Disk */
> +    [0x058] = 0x01,             /* TPLFID_SYSINIT: POST = 1, ROM = 0 */
> +
> +    [0x05a] = CISTPL_FUNCE,     /* Function Extension */
> +    [0x05c] = 0x02,             /* Tuple length = 2 bytes */
> +    [0x05e] = 0x01,             /* TPLFE_TYPE = Disk Device Interface */
> +    [0x060] = 0x01,             /* TPLFE_DATA = PC Card ATA Interface */
> +
> +    [0x062] = CISTPL_FUNCE,     /* Function Extension */
> +    [0x064] = 0x03,             /* Tuple length = 3 bytes */
> +    [0x066] = 0x02,             /* TPLFE_TYPE = Basic PC Card ATA Interface */
> +    [0x068] = 0x08,             /* TPLFE_DATA: Rotating, Unique, Single */
> +    [0x06a] = 0x0f,             /* TPLFE_DATA: Sleep, Standby, Idle, Auto */
> +
> +    [0x06c] = CISTPL_CONFIG,    /* Configuration */
> +    [0x06e] = 0x05,             /* Tuple length = 5 bytes */
> +    [0x070] = 0x01,             /* TPCC_RASZ = 2 bytes, TPCC_RMSZ = 1 byte */
> +    [0x072] = 0x07,             /* TPCC_LAST = 7 */
> +    [0x074] = 0x00,             /* TPCC_RADR = 0200 */
>       [0x076] = 0x02,
> -    [0x078] = 0x0f,		/* TPCC_RMSK = 200, 202, 204, 206 */
> -
> -    [0x07a] = CISTPL_CFTABLE_ENTRY,	/* 16-bit PC Card Configuration */
> -    [0x07c] = 0x0b,		/* Tuple length = 11 bytes */
> -    [0x07e] = 0xc0,		/* TPCE_INDX = Memory Mode, Default, Iface */
> -    [0x080] = 0xc0,		/* TPCE_IF = Memory, no BVDs, no WP, READY */
> -    [0x082] = 0xa1,		/* TPCE_FS = Vcc only, no I/O, Memory, Misc */
> -    [0x084] = 0x27,		/* NomV = 1, MinV = 1, MaxV = 1, Peakl = 1 */
> -    [0x086] = 0x55,		/* NomV: 5.0 V */
> -    [0x088] = 0x4d,		/* MinV: 4.5 V */
> -    [0x08a] = 0x5d,		/* MaxV: 5.5 V */
> -    [0x08c] = 0x4e,		/* Peakl: 450 mA */
> -    [0x08e] = 0x08,		/* TPCE_MS = 1 window, 1 byte, Host address */
> -    [0x090] = 0x00,		/* Window descriptor: Window length = 0 */
> -    [0x092] = 0x20,		/* TPCE_MI: support power down mode, RW */
> -
> -    [0x094] = CISTPL_CFTABLE_ENTRY,	/* 16-bit PC Card Configuration */
> -    [0x096] = 0x06,		/* Tuple length = 6 bytes */
> -    [0x098] = 0x00,		/* TPCE_INDX = Memory Mode, no Default */
> -    [0x09a] = 0x01,		/* TPCE_FS = Vcc only, no I/O, no Memory */
> -    [0x09c] = 0x21,		/* NomV = 1, MinV = 0, MaxV = 0, Peakl = 1 */
> -    [0x09e] = 0xb5,		/* NomV: 3.3 V */
> +    [0x078] = 0x0f,             /* TPCC_RMSK = 200, 202, 204, 206 */
> +
> +    [0x07a] = CISTPL_CFTABLE_ENTRY, /* 16-bit PC Card Configuration */
> +    [0x07c] = 0x0b,             /* Tuple length = 11 bytes */
> +    [0x07e] = 0xc0,             /* TPCE_INDX = Memory Mode, Default, Iface */
> +    [0x080] = 0xc0,             /* TPCE_IF = Memory, no BVDs, no WP, READY */
> +    [0x082] = 0xa1,             /* TPCE_FS = Vcc only, no I/O, Memory, Misc */
> +    [0x084] = 0x27,             /* NomV = 1, MinV = 1, MaxV = 1, Peakl = 1 */
> +    [0x086] = 0x55,             /* NomV: 5.0 V */
> +    [0x088] = 0x4d,             /* MinV: 4.5 V */
> +    [0x08a] = 0x5d,             /* MaxV: 5.5 V */
> +    [0x08c] = 0x4e,             /* Peakl: 450 mA */
> +    [0x08e] = 0x08,             /* TPCE_MS = 1 window, 1 byte, Host address */
> +    [0x090] = 0x00,             /* Window descriptor: Window length = 0 */
> +    [0x092] = 0x20,             /* TPCE_MI: support power down mode, RW */
> +
> +    [0x094] = CISTPL_CFTABLE_ENTRY, /* 16-bit PC Card Configuration */
> +    [0x096] = 0x06,             /* Tuple length = 6 bytes */
> +    [0x098] = 0x00,             /* TPCE_INDX = Memory Mode, no Default */
> +    [0x09a] = 0x01,             /* TPCE_FS = Vcc only, no I/O, no Memory */
> +    [0x09c] = 0x21,             /* NomV = 1, MinV = 0, MaxV = 0, Peakl = 1 */
> +    [0x09e] = 0xb5,             /* NomV: 3.3 V */
>       [0x0a0] = 0x1e,
> -    [0x0a2] = 0x3e,		/* Peakl: 350 mA */
> -
> -    [0x0a4] = CISTPL_CFTABLE_ENTRY,	/* 16-bit PC Card Configuration */
> -    [0x0a6] = 0x0d,		/* Tuple length = 13 bytes */
> -    [0x0a8] = 0xc1,		/* TPCE_INDX = I/O and Memory Mode, Default */
> -    [0x0aa] = 0x41,		/* TPCE_IF = I/O and Memory, no BVD, no WP */
> -    [0x0ac] = 0x99,		/* TPCE_FS = Vcc only, I/O, Interrupt, Misc */
> -    [0x0ae] = 0x27,		/* NomV = 1, MinV = 1, MaxV = 1, Peakl = 1 */
> -    [0x0b0] = 0x55,		/* NomV: 5.0 V */
> -    [0x0b2] = 0x4d,		/* MinV: 4.5 V */
> -    [0x0b4] = 0x5d,		/* MaxV: 5.5 V */
> -    [0x0b6] = 0x4e,		/* Peakl: 450 mA */
> -    [0x0b8] = 0x64,		/* TPCE_IO = 16-byte boundary, 16/8 accesses */
> -    [0x0ba] = 0xf0,		/* TPCE_IR =  MASK, Level, Pulse, Share */
> -    [0x0bc] = 0xff,		/* IRQ0..IRQ7 supported */
> -    [0x0be] = 0xff,		/* IRQ8..IRQ15 supported */
> -    [0x0c0] = 0x20,		/* TPCE_MI = support power down mode */
> -
> -    [0x0c2] = CISTPL_CFTABLE_ENTRY,	/* 16-bit PC Card Configuration */
> -    [0x0c4] = 0x06,		/* Tuple length = 6 bytes */
> -    [0x0c6] = 0x01,		/* TPCE_INDX = I/O and Memory Mode */
> -    [0x0c8] = 0x01,		/* TPCE_FS = Vcc only, no I/O, no Memory */
> -    [0x0ca] = 0x21,		/* NomV = 1, MinV = 0, MaxV = 0, Peakl = 1 */
> -    [0x0cc] = 0xb5,		/* NomV: 3.3 V */
> +    [0x0a2] = 0x3e,             /* Peakl: 350 mA */
> +
> +    [0x0a4] = CISTPL_CFTABLE_ENTRY, /* 16-bit PC Card Configuration */
> +    [0x0a6] = 0x0d,             /* Tuple length = 13 bytes */
> +    [0x0a8] = 0xc1,             /* TPCE_INDX = I/O and Memory Mode, Default */
> +    [0x0aa] = 0x41,             /* TPCE_IF = I/O and Memory, no BVD, no WP */
> +    [0x0ac] = 0x99,             /* TPCE_FS = Vcc only, I/O, Interrupt, Misc */
> +    [0x0ae] = 0x27,             /* NomV = 1, MinV = 1, MaxV = 1, Peakl = 1 */
> +    [0x0b0] = 0x55,             /* NomV: 5.0 V */
> +    [0x0b2] = 0x4d,             /* MinV: 4.5 V */
> +    [0x0b4] = 0x5d,             /* MaxV: 5.5 V */
> +    [0x0b6] = 0x4e,             /* Peakl: 450 mA */
> +    [0x0b8] = 0x64,             /* TPCE_IO = 16-byte boundary, 16/8 accesses */
> +    [0x0ba] = 0xf0,             /* TPCE_IR =  MASK, Level, Pulse, Share */
> +    [0x0bc] = 0xff,             /* IRQ0..IRQ7 supported */
> +    [0x0be] = 0xff,             /* IRQ8..IRQ15 supported */
> +    [0x0c0] = 0x20,             /* TPCE_MI = support power down mode */
> +
> +    [0x0c2] = CISTPL_CFTABLE_ENTRY, /* 16-bit PC Card Configuration */
> +    [0x0c4] = 0x06,             /* Tuple length = 6 bytes */
> +    [0x0c6] = 0x01,             /* TPCE_INDX = I/O and Memory Mode */
> +    [0x0c8] = 0x01,             /* TPCE_FS = Vcc only, no I/O, no Memory */
> +    [0x0ca] = 0x21,             /* NomV = 1, MinV = 0, MaxV = 0, Peakl = 1 */
> +    [0x0cc] = 0xb5,             /* NomV: 3.3 V */
>       [0x0ce] = 0x1e,
> -    [0x0d0] = 0x3e,		/* Peakl: 350 mA */
> -
> -    [0x0d2] = CISTPL_CFTABLE_ENTRY,	/* 16-bit PC Card Configuration */
> -    [0x0d4] = 0x12,		/* Tuple length = 18 bytes */
> -    [0x0d6] = 0xc2,		/* TPCE_INDX = I/O Primary Mode */
> -    [0x0d8] = 0x41,		/* TPCE_IF = I/O and Memory, no BVD, no WP */
> -    [0x0da] = 0x99,		/* TPCE_FS = Vcc only, I/O, Interrupt, Misc */
> -    [0x0dc] = 0x27,		/* NomV = 1, MinV = 1, MaxV = 1, Peakl = 1 */
> -    [0x0de] = 0x55,		/* NomV: 5.0 V */
> -    [0x0e0] = 0x4d,		/* MinV: 4.5 V */
> -    [0x0e2] = 0x5d,		/* MaxV: 5.5 V */
> -    [0x0e4] = 0x4e,		/* Peakl: 450 mA */
> -    [0x0e6] = 0xea,		/* TPCE_IO = 1K boundary, 16/8 access, Range */
> -    [0x0e8] = 0x61,		/* Range: 2 fields, 2 bytes addr, 1 byte len */
> -    [0x0ea] = 0xf0,		/* Field 1 address = 0x01f0 */
> +    [0x0d0] = 0x3e,             /* Peakl: 350 mA */
> +
> +    [0x0d2] = CISTPL_CFTABLE_ENTRY, /* 16-bit PC Card Configuration */
> +    [0x0d4] = 0x12,             /* Tuple length = 18 bytes */
> +    [0x0d6] = 0xc2,             /* TPCE_INDX = I/O Primary Mode */
> +    [0x0d8] = 0x41,             /* TPCE_IF = I/O and Memory, no BVD, no WP */
> +    [0x0da] = 0x99,             /* TPCE_FS = Vcc only, I/O, Interrupt, Misc */
> +    [0x0dc] = 0x27,             /* NomV = 1, MinV = 1, MaxV = 1, Peakl = 1 */
> +    [0x0de] = 0x55,             /* NomV: 5.0 V */
> +    [0x0e0] = 0x4d,             /* MinV: 4.5 V */
> +    [0x0e2] = 0x5d,             /* MaxV: 5.5 V */
> +    [0x0e4] = 0x4e,             /* Peakl: 450 mA */
> +    [0x0e6] = 0xea,             /* TPCE_IO = 1K boundary, 16/8 access, Range */
> +    [0x0e8] = 0x61,             /* Range: 2 fields, 2 bytes addr, 1 byte len */
> +    [0x0ea] = 0xf0,             /* Field 1 address = 0x01f0 */
>       [0x0ec] = 0x01,
> -    [0x0ee] = 0x07,		/* Address block length = 8 */
> -    [0x0f0] = 0xf6,		/* Field 2 address = 0x03f6 */
> +    [0x0ee] = 0x07,             /* Address block length = 8 */
> +    [0x0f0] = 0xf6,             /* Field 2 address = 0x03f6 */
>       [0x0f2] = 0x03,
> -    [0x0f4] = 0x01,		/* Address block length = 2 */
> -    [0x0f6] = 0xee,		/* TPCE_IR = IRQ E, Level, Pulse, Share */
> -    [0x0f8] = 0x20,		/* TPCE_MI = support power down mode */
> -
> -    [0x0fa] = CISTPL_CFTABLE_ENTRY,	/* 16-bit PC Card Configuration */
> -    [0x0fc] = 0x06,		/* Tuple length = 6 bytes */
> -    [0x0fe] = 0x02,		/* TPCE_INDX = I/O Primary Mode, no Default */
> -    [0x100] = 0x01,		/* TPCE_FS = Vcc only, no I/O, no Memory */
> -    [0x102] = 0x21,		/* NomV = 1, MinV = 0, MaxV = 0, Peakl = 1 */
> -    [0x104] = 0xb5,		/* NomV: 3.3 V */
> +    [0x0f4] = 0x01,             /* Address block length = 2 */
> +    [0x0f6] = 0xee,             /* TPCE_IR = IRQ E, Level, Pulse, Share */
> +    [0x0f8] = 0x20,             /* TPCE_MI = support power down mode */
> +
> +    [0x0fa] = CISTPL_CFTABLE_ENTRY, /* 16-bit PC Card Configuration */
> +    [0x0fc] = 0x06,             /* Tuple length = 6 bytes */
> +    [0x0fe] = 0x02,             /* TPCE_INDX = I/O Primary Mode, no Default */
> +    [0x100] = 0x01,             /* TPCE_FS = Vcc only, no I/O, no Memory */
> +    [0x102] = 0x21,             /* NomV = 1, MinV = 0, MaxV = 0, Peakl = 1 */
> +    [0x104] = 0xb5,             /* NomV: 3.3 V */
>       [0x106] = 0x1e,
> -    [0x108] = 0x3e,		/* Peakl: 350 mA */
> -
> -    [0x10a] = CISTPL_CFTABLE_ENTRY,	/* 16-bit PC Card Configuration */
> -    [0x10c] = 0x12,		/* Tuple length = 18 bytes */
> -    [0x10e] = 0xc3,		/* TPCE_INDX = I/O Secondary Mode, Default */
> -    [0x110] = 0x41,		/* TPCE_IF = I/O and Memory, no BVD, no WP */
> -    [0x112] = 0x99,		/* TPCE_FS = Vcc only, I/O, Interrupt, Misc */
> -    [0x114] = 0x27,		/* NomV = 1, MinV = 1, MaxV = 1, Peakl = 1 */
> -    [0x116] = 0x55,		/* NomV: 5.0 V */
> -    [0x118] = 0x4d,		/* MinV: 4.5 V */
> -    [0x11a] = 0x5d,		/* MaxV: 5.5 V */
> -    [0x11c] = 0x4e,		/* Peakl: 450 mA */
> -    [0x11e] = 0xea,		/* TPCE_IO = 1K boundary, 16/8 access, Range */
> -    [0x120] = 0x61,		/* Range: 2 fields, 2 byte addr, 1 byte len */
> -    [0x122] = 0x70,		/* Field 1 address = 0x0170 */
> +    [0x108] = 0x3e,             /* Peakl: 350 mA */
> +
> +    [0x10a] = CISTPL_CFTABLE_ENTRY, /* 16-bit PC Card Configuration */
> +    [0x10c] = 0x12,             /* Tuple length = 18 bytes */
> +    [0x10e] = 0xc3,             /* TPCE_INDX = I/O Secondary Mode, Default */
> +    [0x110] = 0x41,             /* TPCE_IF = I/O and Memory, no BVD, no WP */
> +    [0x112] = 0x99,             /* TPCE_FS = Vcc only, I/O, Interrupt, Misc */
> +    [0x114] = 0x27,             /* NomV = 1, MinV = 1, MaxV = 1, Peakl = 1 */
> +    [0x116] = 0x55,             /* NomV: 5.0 V */
> +    [0x118] = 0x4d,             /* MinV: 4.5 V */
> +    [0x11a] = 0x5d,             /* MaxV: 5.5 V */
> +    [0x11c] = 0x4e,             /* Peakl: 450 mA */
> +    [0x11e] = 0xea,             /* TPCE_IO = 1K boundary, 16/8 access, Range */
> +    [0x120] = 0x61,             /* Range: 2 fields, 2 byte addr, 1 byte len */
> +    [0x122] = 0x70,             /* Field 1 address = 0x0170 */
>       [0x124] = 0x01,
> -    [0x126] = 0x07,		/* Address block length = 8 */
> -    [0x128] = 0x76,		/* Field 2 address = 0x0376 */
> +    [0x126] = 0x07,             /* Address block length = 8 */
> +    [0x128] = 0x76,             /* Field 2 address = 0x0376 */
>       [0x12a] = 0x03,
> -    [0x12c] = 0x01,		/* Address block length = 2 */
> -    [0x12e] = 0xee,		/* TPCE_IR = IRQ E, Level, Pulse, Share */
> -    [0x130] = 0x20,		/* TPCE_MI = support power down mode */
> -
> -    [0x132] = CISTPL_CFTABLE_ENTRY,	/* 16-bit PC Card Configuration */
> -    [0x134] = 0x06,		/* Tuple length = 6 bytes */
> -    [0x136] = 0x03,		/* TPCE_INDX = I/O Secondary Mode */
> -    [0x138] = 0x01,		/* TPCE_FS = Vcc only, no I/O, no Memory */
> -    [0x13a] = 0x21,		/* NomV = 1, MinV = 0, MaxV = 0, Peakl = 1 */
> -    [0x13c] = 0xb5,		/* NomV: 3.3 V */
> +    [0x12c] = 0x01,             /* Address block length = 2 */
> +    [0x12e] = 0xee,             /* TPCE_IR = IRQ E, Level, Pulse, Share */
> +    [0x130] = 0x20,             /* TPCE_MI = support power down mode */
> +
> +    [0x132] = CISTPL_CFTABLE_ENTRY, /* 16-bit PC Card Configuration */
> +    [0x134] = 0x06,             /* Tuple length = 6 bytes */
> +    [0x136] = 0x03,             /* TPCE_INDX = I/O Secondary Mode */
> +    [0x138] = 0x01,             /* TPCE_FS = Vcc only, no I/O, no Memory */
> +    [0x13a] = 0x21,             /* NomV = 1, MinV = 0, MaxV = 0, Peakl = 1 */
> +    [0x13c] = 0xb5,             /* NomV: 3.3 V */
>       [0x13e] = 0x1e,
> -    [0x140] = 0x3e,		/* Peakl: 350 mA */
> +    [0x140] = 0x3e,             /* Peakl: 350 mA */
>   
> -    [0x142] = CISTPL_NO_LINK,	/* No Link */
> -    [0x144] = 0x00,		/* Tuple length = 0 bytes */
> +    [0x142] = CISTPL_NO_LINK,   /* No Link */
> +    [0x144] = 0x00,             /* Tuple length = 0 bytes */
>   
> -    [0x146] = CISTPL_END,	/* Tuple End */
> +    [0x146] = CISTPL_END,       /* Tuple End */
>   };
>   
>   #define TYPE_DSCM1XXXX "dscm1xxxx"
> diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
> index d9f1f77dd5..2bfa7533d6 100644
> --- a/include/hw/ide/internal.h
> +++ b/include/hw/ide/internal.h
> @@ -38,32 +38,32 @@ OBJECT_DECLARE_SIMPLE_TYPE(IDEBus, IDE_BUS)
>   
>   
>   /* Bits of HD_STATUS */
> -#define ERR_STAT		0x01
> -#define INDEX_STAT		0x02
> -#define ECC_STAT		0x04	/* Corrected error */
> -#define DRQ_STAT		0x08
> -#define SEEK_STAT		0x10
> -#define SRV_STAT		0x10
> -#define WRERR_STAT		0x20
> -#define READY_STAT		0x40
> -#define BUSY_STAT		0x80
> +#define ERR_STAT                0x01
> +#define INDEX_STAT              0x02
> +#define ECC_STAT                0x04    /* Corrected error */
> +#define DRQ_STAT                0x08
> +#define SEEK_STAT               0x10
> +#define SRV_STAT                0x10
> +#define WRERR_STAT              0x20
> +#define READY_STAT              0x40
> +#define BUSY_STAT               0x80
>   
>   /* Bits for HD_ERROR */
> -#define MARK_ERR		0x01	/* Bad address mark */
> -#define TRK0_ERR		0x02	/* couldn't find track 0 */
> -#define ABRT_ERR		0x04	/* Command aborted */
> -#define MCR_ERR			0x08	/* media change request */
> -#define ID_ERR			0x10	/* ID field not found */
> -#define MC_ERR			0x20	/* media changed */
> -#define ECC_ERR			0x40	/* Uncorrectable ECC error */
> -#define BBD_ERR			0x80	/* pre-EIDE meaning:  block marked bad */
> -#define ICRC_ERR		0x80	/* new meaning:  CRC error during transfer */
> +#define MARK_ERR                0x01    /* Bad address mark */
> +#define TRK0_ERR                0x02    /* couldn't find track 0 */
> +#define ABRT_ERR                0x04    /* Command aborted */
> +#define MCR_ERR                 0x08    /* media change request */
> +#define ID_ERR                  0x10    /* ID field not found */
> +#define MC_ERR                  0x20    /* media changed */
> +#define ECC_ERR                 0x40    /* Uncorrectable ECC error */
> +#define BBD_ERR                 0x80    /* pre-EIDE meaning:  block marked bad */
> +#define ICRC_ERR                0x80    /* new meaning:  CRC error during transfer */
>   
>   /* Bits of HD_NSECTOR */
> -#define CD			0x01
> -#define IO			0x02
> -#define REL			0x04
> -#define TAG_MASK		0xf8
> +#define CD                      0x01
> +#define IO                      0x02
> +#define REL                     0x04
> +#define TAG_MASK                0xf8
>   
>   /* Bits of Device Control register */
>   #define IDE_CTRL_HOB            0x80
> @@ -71,50 +71,50 @@ OBJECT_DECLARE_SIMPLE_TYPE(IDEBus, IDE_BUS)
>   #define IDE_CTRL_DISABLE_IRQ    0x02
>   
>   /* ACS-2 T13/2015-D Table B.2 Command codes */
> -#define WIN_NOP				0x00
> +#define WIN_NOP                         0x00
>   /* reserved                             0x01..0x02 */
> -#define CFA_REQ_EXT_ERROR_CODE		0x03 /* CFA Request Extended Error Code */
> +#define CFA_REQ_EXT_ERROR_CODE          0x03 /* CFA Request Extended Error Code */
>   /* reserved                             0x04..0x05 */
>   #define WIN_DSM                         0x06
>   /* reserved                             0x07 */
> -#define WIN_DEVICE_RESET		0x08
> +#define WIN_DEVICE_RESET                0x08
>   /* reserved                             0x09..0x0a */
>   /* REQUEST SENSE DATA EXT               0x0B */
>   /* reserved                             0x0C..0x0F */
>   #define WIN_RECAL                       0x10 /* obsolete since ATA4 */
>   /* obsolete since ATA3, retired in ATA4 0x11..0x1F */
> -#define WIN_READ			0x20 /* 28-Bit */
> +#define WIN_READ                        0x20 /* 28-Bit */
>   #define WIN_READ_ONCE                   0x21 /* 28-Bit w/o retries, obsolete since ATA5 */
>   /* obsolete since ATA4                  0x22..0x23 */
> -#define WIN_READ_EXT			0x24 /* 48-Bit */
> -#define WIN_READDMA_EXT			0x25 /* 48-Bit */
> +#define WIN_READ_EXT                    0x24 /* 48-Bit */
> +#define WIN_READDMA_EXT                 0x25 /* 48-Bit */
>   #define WIN_READDMA_QUEUED_EXT          0x26 /* 48-Bit, obsolete since ACS2 */
> -#define WIN_READ_NATIVE_MAX_EXT		0x27 /* 48-Bit */
> +#define WIN_READ_NATIVE_MAX_EXT         0x27 /* 48-Bit */
>   /* reserved                             0x28 */
> -#define WIN_MULTREAD_EXT		0x29 /* 48-Bit */
> +#define WIN_MULTREAD_EXT                0x29 /* 48-Bit */
>   /* READ STREAM DMA EXT                  0x2A */
>   /* READ STREAM EXT                      0x2B */
>   /* reserved                             0x2C..0x2E */
>   /* READ LOG EXT                         0x2F */
> -#define WIN_WRITE			0x30 /* 28-Bit */
> +#define WIN_WRITE                       0x30 /* 28-Bit */
>   #define WIN_WRITE_ONCE                  0x31 /* 28-Bit w/o retries, obsolete since ATA5 */
>   /* obsolete since ATA4                  0x32..0x33 */
> -#define WIN_WRITE_EXT			0x34 /* 48-Bit */
> -#define WIN_WRITEDMA_EXT		0x35 /* 48-Bit */
> -#define WIN_WRITEDMA_QUEUED_EXT		0x36 /* 48-Bit */
> +#define WIN_WRITE_EXT                   0x34 /* 48-Bit */
> +#define WIN_WRITEDMA_EXT                0x35 /* 48-Bit */
> +#define WIN_WRITEDMA_QUEUED_EXT         0x36 /* 48-Bit */
>   #define WIN_SET_MAX_EXT                 0x37 /* 48-Bit, obsolete since ACS2 */
> -#define WIN_SET_MAX_EXT			0x37 /* 48-Bit */
> -#define CFA_WRITE_SECT_WO_ERASE		0x38 /* CFA Write Sectors without erase */
> -#define WIN_MULTWRITE_EXT		0x39 /* 48-Bit */
> +#define WIN_SET_MAX_EXT                 0x37 /* 48-Bit */
> +#define CFA_WRITE_SECT_WO_ERASE         0x38 /* CFA Write Sectors without erase */
> +#define WIN_MULTWRITE_EXT               0x39 /* 48-Bit */
>   /* WRITE STREAM DMA EXT                 0x3A */
>   /* WRITE STREAM EXT                     0x3B */
>   #define WIN_WRITE_VERIFY                0x3C /* 28-Bit, obsolete since ATA4 */
>   /* WRITE DMA FUA EXT                    0x3D */
>   /* obsolete since ACS2                  0x3E */
>   /* WRITE LOG EXT                        0x3F */
> -#define WIN_VERIFY			0x40 /* 28-Bit - Read Verify Sectors */
> +#define WIN_VERIFY                      0x40 /* 28-Bit - Read Verify Sectors */
>   #define WIN_VERIFY_ONCE                 0x41 /* 28-Bit - w/o retries, obsolete since ATA5 */
> -#define WIN_VERIFY_EXT			0x42 /* 48-Bit */
> +#define WIN_VERIFY_EXT                  0x42 /* 48-Bit */
>   /* reserved                             0x43..0x44 */
>   /* WRITE UNCORRECTABLE EXT              0x45 */
>   /* reserved                             0x46 */
> @@ -136,11 +136,11 @@ OBJECT_DECLARE_SIMPLE_TYPE(IDEBus, IDE_BUS)
>   #define WIN_SEEK                        0x70 /* obsolete since ATA7 */
>   /* reserved                             0x71-0x7F */
>   /* vendor specific                      0x80-0x86 */
> -#define CFA_TRANSLATE_SECTOR		0x87 /* CFA Translate Sector */
> +#define CFA_TRANSLATE_SECTOR            0x87 /* CFA Translate Sector */
>   /* vendor specific                      0x88-0x8F */
> -#define WIN_DIAGNOSE			0x90
> +#define WIN_DIAGNOSE                    0x90
>   #define WIN_SPECIFY                     0x91 /* set drive geometry translation, obsolete since ATA6 */
> -#define WIN_DOWNLOAD_MICROCODE		0x92
> +#define WIN_DOWNLOAD_MICROCODE          0x92
>   /* DOWNLOAD MICROCODE DMA               0x93 */
>   #define WIN_STANDBYNOW2                 0x94 /* retired in ATA4 */
>   #define WIN_IDLEIMMEDIATE2              0x95 /* force drive to become "ready", retired in ATA4 */
> @@ -150,31 +150,31 @@ OBJECT_DECLARE_SIMPLE_TYPE(IDEBus, IDE_BUS)
>   #define WIN_SLEEPNOW2                   0x99 /* retired in ATA4 */
>   /* vendor specific                      0x9A */
>   /* reserved                             0x9B..0x9F */
> -#define WIN_PACKETCMD			0xA0 /* Send a packet command. */
> -#define WIN_PIDENTIFY			0xA1 /* identify ATAPI device	*/
> +#define WIN_PACKETCMD                   0xA0 /* Send a packet command. */
> +#define WIN_PIDENTIFY                   0xA1 /* identify ATAPI device */
>   #define WIN_QUEUED_SERVICE              0xA2 /* obsolete since ACS2 */
>   /* reserved                             0xA3..0xAF */
> -#define WIN_SMART			0xB0 /* self-monitoring and reporting */
> +#define WIN_SMART                       0xB0 /* self-monitoring and reporting */
>   /* Device Configuration Overlay         0xB1 */
>   /* reserved                             0xB2..0xB3 */
>   /* Sanitize Device                      0xB4 */
>   /* reserved                             0xB5 */
>   /* NV Cache                             0xB6 */
>   /* reserved for CFA                     0xB7..0xBB */
> -#define CFA_ACCESS_METADATA_STORAGE	0xB8
> +#define CFA_ACCESS_METADATA_STORAGE     0xB8
>   /* reserved                             0xBC..0xBF */
> -#define CFA_ERASE_SECTORS       	0xC0 /* microdrives implement as NOP */
> +#define CFA_ERASE_SECTORS               0xC0 /* microdrives implement as NOP */
>   /* vendor specific                      0xC1..0xC3 */
> -#define WIN_MULTREAD			0xC4 /* read sectors using multiple mode*/
> -#define WIN_MULTWRITE			0xC5 /* write sectors using multiple mode */
> -#define WIN_SETMULT			0xC6 /* enable/disable multiple mode */
> +#define WIN_MULTREAD                    0xC4 /* read sectors using multiple mode*/
> +#define WIN_MULTWRITE                   0xC5 /* write sectors using multiple mode */
> +#define WIN_SETMULT                     0xC6 /* enable/disable multiple mode */
>   #define WIN_READDMA_QUEUED              0xC7 /* read sectors using Queued DMA transfers, obsolete since ACS2 */
> -#define WIN_READDMA			0xC8 /* read sectors using DMA transfers */
> +#define WIN_READDMA                     0xC8 /* read sectors using DMA transfers */
>   #define WIN_READDMA_ONCE                0xC9 /* 28-Bit - w/o retries, obsolete since ATA5 */
> -#define WIN_WRITEDMA			0xCA /* write sectors using DMA transfers */
> +#define WIN_WRITEDMA                    0xCA /* write sectors using DMA transfers */
>   #define WIN_WRITEDMA_ONCE               0xCB /* 28-Bit - w/o retries, obsolete since ATA5 */
> -#define WIN_WRITEDMA_QUEUED		0xCC /* write sectors using Queued DMA transfers, obsolete since ACS2 */
> -#define CFA_WRITE_MULTI_WO_ERASE	0xCD /* CFA Write multiple without erase */
> +#define WIN_WRITEDMA_QUEUED             0xCC /* write sectors using Queued DMA transfers, obsolete since ACS2 */
> +#define CFA_WRITE_MULTI_WO_ERASE        0xCD /* CFA Write multiple without erase */
>   /* WRITE MULTIPLE FUA EXT               0xCE */
>   /* reserved                             0xCF..0xDO */
>   /* CHECK MEDIA CARD TYPE                0xD1 */
> @@ -184,33 +184,33 @@ OBJECT_DECLARE_SIMPLE_TYPE(IDEBus, IDE_BUS)
>   /* obsolete since ATA3, retired in ATA4 0xDB..0xDD */
>   #define WIN_DOORLOCK                    0xDE /* lock door on removable drives, obsolete since ATA8 */
>   #define WIN_DOORUNLOCK                  0xDF /* unlock door on removable drives, obsolete since ATA8 */
> -#define WIN_STANDBYNOW1			0xE0
> -#define WIN_IDLEIMMEDIATE		0xE1 /* force drive to become "ready" */
> -#define WIN_STANDBY             	0xE2 /* Set device in Standby Mode */
> -#define WIN_SETIDLE1			0xE3
> -#define WIN_READ_BUFFER			0xE4 /* force read only 1 sector */
> -#define WIN_CHECKPOWERMODE1		0xE5
> -#define WIN_SLEEPNOW1			0xE6
> -#define WIN_FLUSH_CACHE			0xE7
> -#define WIN_WRITE_BUFFER		0xE8 /* force write only 1 sector */
> +#define WIN_STANDBYNOW1                 0xE0
> +#define WIN_IDLEIMMEDIATE               0xE1 /* force drive to become "ready" */
> +#define WIN_STANDBY                     0xE2 /* Set device in Standby Mode */
> +#define WIN_SETIDLE1                    0xE3
> +#define WIN_READ_BUFFER                 0xE4 /* force read only 1 sector */
> +#define WIN_CHECKPOWERMODE1             0xE5
> +#define WIN_SLEEPNOW1                   0xE6
> +#define WIN_FLUSH_CACHE                 0xE7
> +#define WIN_WRITE_BUFFER                0xE8 /* force write only 1 sector */
>   /* READ BUFFER DMA                      0xE9 */
> -#define WIN_FLUSH_CACHE_EXT		0xEA /* 48-Bit */
> +#define WIN_FLUSH_CACHE_EXT             0xEA /* 48-Bit */
>   /* WRITE BUFFER DMA                     0xEB */
> -#define WIN_IDENTIFY			0xEC /* ask drive to identify itself	*/
> +#define WIN_IDENTIFY                    0xEC /* ask drive to identify itself */
>   #define WIN_MEDIAEJECT                  0xED /* obsolete since ATA8 */
>   /* obsolete since ATA4                  0xEE */
> -#define WIN_SETFEATURES			0xEF /* set special drive features */
> +#define WIN_SETFEATURES                 0xEF /* set special drive features */
>   #define IBM_SENSE_CONDITION             0xF0 /* measure disk temperature, vendor specific */
> -#define WIN_SECURITY_SET_PASS		0xF1
> -#define WIN_SECURITY_UNLOCK		0xF2
> -#define WIN_SECURITY_ERASE_PREPARE	0xF3
> -#define WIN_SECURITY_ERASE_UNIT		0xF4
> -#define WIN_SECURITY_FREEZE_LOCK	0xF5
> +#define WIN_SECURITY_SET_PASS           0xF1
> +#define WIN_SECURITY_UNLOCK             0xF2
> +#define WIN_SECURITY_ERASE_PREPARE      0xF3
> +#define WIN_SECURITY_ERASE_UNIT         0xF4
> +#define WIN_SECURITY_FREEZE_LOCK        0xF5
>   #define CFA_WEAR_LEVEL                  0xF5 /* microdrives implement as NOP; not specified in T13! */
> -#define WIN_SECURITY_DISABLE		0xF6
> +#define WIN_SECURITY_DISABLE            0xF6
>   /* vendor specific                      0xF7 */
> -#define WIN_READ_NATIVE_MAX		0xF8 /* return the native maximum address */
> -#define WIN_SET_MAX			0xF9
> +#define WIN_READ_NATIVE_MAX             0xF8 /* return the native maximum address */
> +#define WIN_SET_MAX                     0xF9
>   /* vendor specific                      0xFA..0xFF */
>   
>   /* set to 1 set disable mult support */
> @@ -231,68 +231,68 @@ OBJECT_DECLARE_SIMPLE_TYPE(IDEBus, IDE_BUS)
>   
>   /* The generic packet command opcodes for CD/DVD Logical Units,
>    * From Table 57 of the SFF8090 Ver. 3 (Mt. Fuji) draft standard. */
> -#define GPCMD_BLANK			    0xa1
> -#define GPCMD_CLOSE_TRACK		    0x5b
> -#define GPCMD_FLUSH_CACHE		    0x35
> -#define GPCMD_FORMAT_UNIT		    0x04
> -#define GPCMD_GET_CONFIGURATION		    0x46
> +#define GPCMD_BLANK                         0xa1
> +#define GPCMD_CLOSE_TRACK                   0x5b
> +#define GPCMD_FLUSH_CACHE                   0x35
> +#define GPCMD_FORMAT_UNIT                   0x04
> +#define GPCMD_GET_CONFIGURATION             0x46
>   #define GPCMD_GET_EVENT_STATUS_NOTIFICATION 0x4a
> -#define GPCMD_GET_PERFORMANCE		    0xac
> -#define GPCMD_INQUIRY			    0x12
> -#define GPCMD_LOAD_UNLOAD		    0xa6
> -#define GPCMD_MECHANISM_STATUS		    0xbd
> -#define GPCMD_MODE_SELECT_10		    0x55
> -#define GPCMD_MODE_SENSE_10		    0x5a
> -#define GPCMD_PAUSE_RESUME		    0x4b
> -#define GPCMD_PLAY_AUDIO_10		    0x45
> -#define GPCMD_PLAY_AUDIO_MSF		    0x47
> -#define GPCMD_PLAY_AUDIO_TI		    0x48
> -#define GPCMD_PLAY_CD			    0xbc
> +#define GPCMD_GET_PERFORMANCE               0xac
> +#define GPCMD_INQUIRY                       0x12
> +#define GPCMD_LOAD_UNLOAD                   0xa6
> +#define GPCMD_MECHANISM_STATUS              0xbd
> +#define GPCMD_MODE_SELECT_10                0x55
> +#define GPCMD_MODE_SENSE_10                 0x5a
> +#define GPCMD_PAUSE_RESUME                  0x4b
> +#define GPCMD_PLAY_AUDIO_10                 0x45
> +#define GPCMD_PLAY_AUDIO_MSF                0x47
> +#define GPCMD_PLAY_AUDIO_TI                 0x48
> +#define GPCMD_PLAY_CD                       0xbc
>   #define GPCMD_PREVENT_ALLOW_MEDIUM_REMOVAL  0x1e
> -#define GPCMD_READ_10			    0x28
> -#define GPCMD_READ_12			    0xa8
> -#define GPCMD_READ_CDVD_CAPACITY	    0x25
> -#define GPCMD_READ_CD			    0xbe
> -#define GPCMD_READ_CD_MSF		    0xb9
> -#define GPCMD_READ_DISC_INFO		    0x51
> -#define GPCMD_READ_DVD_STRUCTURE	    0xad
> -#define GPCMD_READ_FORMAT_CAPACITIES	    0x23
> -#define GPCMD_READ_HEADER		    0x44
> -#define GPCMD_READ_TRACK_RZONE_INFO	    0x52
> -#define GPCMD_READ_SUBCHANNEL		    0x42
> -#define GPCMD_READ_TOC_PMA_ATIP		    0x43
> -#define GPCMD_REPAIR_RZONE_TRACK	    0x58
> -#define GPCMD_REPORT_KEY		    0xa4
> -#define GPCMD_REQUEST_SENSE		    0x03
> -#define GPCMD_RESERVE_RZONE_TRACK	    0x53
> -#define GPCMD_SCAN			    0xba
> -#define GPCMD_SEEK			    0x2b
> -#define GPCMD_SEND_DVD_STRUCTURE	    0xad
> -#define GPCMD_SEND_EVENT		    0xa2
> -#define GPCMD_SEND_KEY			    0xa3
> -#define GPCMD_SEND_OPC			    0x54
> -#define GPCMD_SET_READ_AHEAD		    0xa7
> -#define GPCMD_SET_STREAMING		    0xb6
> -#define GPCMD_START_STOP_UNIT		    0x1b
> -#define GPCMD_STOP_PLAY_SCAN		    0x4e
> -#define GPCMD_TEST_UNIT_READY		    0x00
> -#define GPCMD_VERIFY_10			    0x2f
> -#define GPCMD_WRITE_10			    0x2a
> -#define GPCMD_WRITE_AND_VERIFY_10	    0x2e
> +#define GPCMD_READ_10                       0x28
> +#define GPCMD_READ_12                       0xa8
> +#define GPCMD_READ_CDVD_CAPACITY            0x25
> +#define GPCMD_READ_CD                       0xbe
> +#define GPCMD_READ_CD_MSF                   0xb9
> +#define GPCMD_READ_DISC_INFO                0x51
> +#define GPCMD_READ_DVD_STRUCTURE            0xad
> +#define GPCMD_READ_FORMAT_CAPACITIES        0x23
> +#define GPCMD_READ_HEADER                   0x44
> +#define GPCMD_READ_TRACK_RZONE_INFO         0x52
> +#define GPCMD_READ_SUBCHANNEL               0x42
> +#define GPCMD_READ_TOC_PMA_ATIP             0x43
> +#define GPCMD_REPAIR_RZONE_TRACK            0x58
> +#define GPCMD_REPORT_KEY                    0xa4
> +#define GPCMD_REQUEST_SENSE                 0x03
> +#define GPCMD_RESERVE_RZONE_TRACK           0x53
> +#define GPCMD_SCAN                          0xba
> +#define GPCMD_SEEK                          0x2b
> +#define GPCMD_SEND_DVD_STRUCTURE            0xad
> +#define GPCMD_SEND_EVENT                    0xa2
> +#define GPCMD_SEND_KEY                      0xa3
> +#define GPCMD_SEND_OPC                      0x54
> +#define GPCMD_SET_READ_AHEAD                0xa7
> +#define GPCMD_SET_STREAMING                 0xb6
> +#define GPCMD_START_STOP_UNIT               0x1b
> +#define GPCMD_STOP_PLAY_SCAN                0x4e
> +#define GPCMD_TEST_UNIT_READY               0x00
> +#define GPCMD_VERIFY_10                     0x2f
> +#define GPCMD_WRITE_10                      0x2a
> +#define GPCMD_WRITE_AND_VERIFY_10           0x2e
>   /* This is listed as optional in ATAPI 2.6, but is (curiously)
>    * missing from Mt. Fuji, Table 57.  It _is_ mentioned in Mt. Fuji
>    * Table 377 as an MMC command for SCSi devices though...  Most ATAPI
>    * drives support it. */
> -#define GPCMD_SET_SPEED			    0xbb
> +#define GPCMD_SET_SPEED                     0xbb
>   /* This seems to be a SCSI specific CD-ROM opcode
>    * to play data at track/index */
> -#define GPCMD_PLAYAUDIO_TI		    0x48
> +#define GPCMD_PLAYAUDIO_TI                  0x48
>   /*
>    * From MS Media Status Notification Support Specification. For
>    * older drives only.
>    */
> -#define GPCMD_GET_MEDIA_STATUS		    0xda
> -#define GPCMD_MODE_SENSE_6		    0x1a
> +#define GPCMD_GET_MEDIA_STATUS              0xda
> +#define GPCMD_MODE_SENSE_6                  0x1a
>   
>   #define ATAPI_INT_REASON_CD             0x01 /* 0 = data transfer */
>   #define ATAPI_INT_REASON_IO             0x02 /* 1 = transfer to the host */


