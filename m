Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861233C79A6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:29:02 +0200 (CEST)
Received: from localhost ([::1]:34966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qth-000465-Fs
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3Qdj-0002xh-73
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:12:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3Qdh-0000uN-Hq
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKwwNbY4NuniIy0MPpIN4PwYHLrbAHgSybZvkUvM/cw=;
 b=OFfYHA1zuSKWnK7wWObK+IgaVWJOPUNykXLxLSFKy4HDze4iAn+ygSmeNu1FZxt/lKdumV
 IJP5kZ98d2FQt3HWfZR4FUpgHfcaz8z52T5FBG8+zW8b8svtTDOgEuxy4hFAMzDQGDWPhk
 7ygmguPKsvHeCOmQtURH/0Ui5H8hEww=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-bpQy69ItOfOcP844Ac7V3g-1; Tue, 13 Jul 2021 18:12:27 -0400
X-MC-Unique: bpQy69ItOfOcP844Ac7V3g-1
Received: by mail-wr1-f72.google.com with SMTP id
 z6-20020a5d4c860000b029013a10564614so318524wrs.15
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MKwwNbY4NuniIy0MPpIN4PwYHLrbAHgSybZvkUvM/cw=;
 b=myThfxbHN9art9j7TMRwA8ZMkcafO8fyuyJLeGb3T34utI8WoQuRWVLyc5VcZadovp
 GBKod1lH3CPbOLWddAH0jqluTnijpHtz3MmdX18AFM+YaAnA+cZlWEbaw4zTGCK3lY14
 8NSI+SlxYNmq7G/AmekacRHyz7CH5xP838XuqVxHtqH+mBNHcqgxyaZpUSnGHqpAh4Zh
 7fimapuQhFFIYEumgiqnHQaGxgke34zse6PHdqIHQ6iDsTbt3rWqEhYvrwa0ppQbk0QP
 r7vk1JvxANb5OlfSGN+bohJnRowvGpc4en1fSROZZNDP106f+LxBvLKsI/6o0b6E5LzX
 fqQQ==
X-Gm-Message-State: AOAM53252zDttLjguGoX9S1Kr3LVRi/RaTWVgym3/of4JN5GDNc3nN/u
 SIfz3aOEWaNxiyjEM08OZiIS4b29aBYRhBtYNV5/lr1lQpC6sDSxYG7yd+pBxahypsyv1NQNFRE
 hjN0co0ir+ySxhNA=
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr8368488wrn.329.1626214346492; 
 Tue, 13 Jul 2021 15:12:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzawu8mxE+/ou0kAwHAoGZJ0GWgFYCzqGG4kNL6oYLjuCU1aXvgaNusQcpeTUl8VpdDLnOVjQ==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr8368469wrn.329.1626214346326; 
 Tue, 13 Jul 2021 15:12:26 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id o3sm155931wrm.5.2021.07.13.15.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 15:12:25 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] hw/nvme: use symbolic names for registers
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210713192428.950160-1-its@irrelevant.dk>
 <20210713192428.950160-3-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <306b8373-079f-5000-e70c-041ab18c320f@redhat.com>
Date: Wed, 14 Jul 2021 00:12:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713192428.950160-3-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 9:24 PM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add the NvmeBarRegs enum and use these instead of explicit register
> offsets.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  include/block/nvme.h | 27 +++++++++++++++++++++++++++
>  hw/nvme/ctrl.c       | 44 ++++++++++++++++++++++----------------------
>  2 files changed, 49 insertions(+), 22 deletions(-)
> 
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 84053b68b987..082d4bddbf9f 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -31,6 +31,33 @@ typedef struct QEMU_PACKED NvmeBar {
>      uint8_t     css[484];
>  } NvmeBar;
>  
> +enum NvmeBarRegs {
> +    NVME_REG_CAP     = 0x0,
> +    NVME_REG_VS      = 0x8,
> +    NVME_REG_INTMS   = 0xc,
> +    NVME_REG_INTMC   = 0x10,
> +    NVME_REG_CC      = 0x14,
> +    NVME_REG_CSTS    = 0x1c,
> +    NVME_REG_NSSR    = 0x20,
> +    NVME_REG_AQA     = 0x24,
> +    NVME_REG_ASQ     = 0x28,
> +    NVME_REG_ACQ     = 0x30,
> +    NVME_REG_CMBLOC  = 0x38,
> +    NVME_REG_CMBSZ   = 0x3c,
> +    NVME_REG_BPINFO  = 0x40,
> +    NVME_REG_BPRSEL  = 0x44,
> +    NVME_REG_BPMBL   = 0x48,
> +    NVME_REG_CMBMSC  = 0x50,
> +    NVME_REG_CMBSTS  = 0x58,
> +    NVME_REG_PMRCAP  = 0xe00,
> +    NVME_REG_PMRCTL  = 0xe04,
> +    NVME_REG_PMRSTS  = 0xe08,
> +    NVME_REG_PMREBS  = 0xe0c,
> +    NVME_REG_PMRSWTP = 0xe10,
> +    NVME_REG_PMRMSCL = 0xe14,
> +    NVME_REG_PMRMSCU = 0xe18,
> +};
> +
>  enum NvmeCapShift {
>      CAP_MQES_SHIFT     = 0,
>      CAP_CQR_SHIFT      = 16,
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 28299c6f3764..8c305315f41c 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -5740,7 +5740,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>      }
>  
>      switch (offset) {
> -    case 0xc:   /* INTMS */
> +    case NVME_REG_INTMS:

What about using offsetof(NvmeBar, intms) instead?


