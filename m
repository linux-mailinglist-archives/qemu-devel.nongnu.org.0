Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E1345A179
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 12:28:54 +0100 (CET)
Received: from localhost ([::1]:42486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTyk-0002Hz-17
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 06:28:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mpTwC-0000j3-HQ
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 06:26:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mpTw7-00079L-Bf
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 06:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637666766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aiajhWk7gt2TxluBD6BBF5mVBijfwwRB9m0rkUMH6hc=;
 b=cZhOJrjLxP4wvADRlg5irZdVi2MFqFtq2gHmsHmRiWYG+XOwDA4y4isoycZTaNGp/27U9F
 lZN4tEACxK0krpzRcwWTPlRIl/nO+B/lYKZcX7c7ENdnJtOflTEMDl4X3Dg5YO+/q2N5Sp
 BqjiQ/zZyPKBdXEEEcBnfbwsnXIcp90=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-NnPZ1elUO1KfOl1wwXdVFQ-1; Tue, 23 Nov 2021 06:26:04 -0500
X-MC-Unique: NnPZ1elUO1KfOl1wwXdVFQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 x17-20020a5d6511000000b0019838caab88so310838wru.6
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 03:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aiajhWk7gt2TxluBD6BBF5mVBijfwwRB9m0rkUMH6hc=;
 b=hvnj50S9Fx33u7KBmjoR4TnnrPfava9eW7h9JDKnZsBbuZOCJdMq9sDDZ0iHJxDwif
 QGYHtwkIj/iGExZqFL3IR+jpzgjyCN2gGKU5PMfKDvR5F+qmQvo6Dz9okLXLPGeaHuJ5
 A6jI9kSAjtrJh8QGntFIbaxCtMBQ+aNGj9hqU0+QtxkfyLTnEVjcaiO81eEl+O1I/2nz
 LGcPzJ3MKTV6k8iIk6cVpZwfYdYgMijh0pVQrj1MOeRTntU7zow2PLApCjgxUMLUQvov
 k8Jdco7ke8QGC41sUH59Tv0vMJnbhx//H6AB5ssKT6+0mhJN/EZPtcM2FFKo6WJACv2u
 eaMw==
X-Gm-Message-State: AOAM532LoQQ6nJeGF+/OQ99+ivFVCUotoarhWlhDs4CIw1Akirv35WiG
 id333lpRdOB6SGG+t2Cuz8d5+8CucvcRmpqdG6+PSMX/VLfzxJ5EokW+7wpF4kElCxy39vmqbh2
 /dPdVTyBGZ2Y+MbA=
X-Received: by 2002:a7b:c2f7:: with SMTP id e23mr2184026wmk.92.1637666763712; 
 Tue, 23 Nov 2021 03:26:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxq5ZQ6rMpTNyuVoV4RZEbIIM0MmuwioiZnlIIj9/mz1NUsGTDB5J/exvz/wWYb8XAwptX1vw==
X-Received: by 2002:a7b:c2f7:: with SMTP id e23mr2183982wmk.92.1637666763480; 
 Tue, 23 Nov 2021 03:26:03 -0800 (PST)
Received: from [192.168.100.42] ([82.142.2.234])
 by smtp.gmail.com with ESMTPSA id x4sm812695wmi.3.2021.11.23.03.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 03:26:03 -0800 (PST)
Message-ID: <7cf21573-2116-e19b-e6ef-906830f1694f@redhat.com>
Date: Tue, 23 Nov 2021 12:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 1/2] hw/scsi/lsi53c895a: Do not abort when DMA
 requested and no data queued
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211123111732.83137-1-philmd@redhat.com>
 <20211123111732.83137-2-philmd@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211123111732.83137-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Cheolwoo Myung <cwmyung@snu.ac.kr>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-stable@nongnu.org,
 Ruhr-University <bugs-syssec@rub.de>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>,
 =?UTF-8?B?SsOpcsO0bWUgUG91bGlu?= <jeromepoulin@gmail.com>,
 Vadim Rozenfeld <vrozenfe@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/11/2021 12:17, Philippe Mathieu-Daudé wrote:
> If asked for DMA request and no data is available, simply wait
> for data to be queued, do not abort. This fixes:
> 
>    $ cat << EOF | \
>      qemu-system-i386 -nographic -M q35,accel=qtest -serial none \
>        -monitor none -qtest stdio -trace lsi* \
>        -drive if=none,id=drive0,file=null-co://,file.read-zeroes=on,format=raw \
>        -device lsi53c895a,id=scsi0 -device scsi-hd,drive=drive0,bus=scsi0.0,channel=0,scsi-id=0,lun=0
>    lsi_reset Reset
>    lsi_reg_write Write reg DSP2 0x2e = 0xff
>    lsi_reg_write Write reg DSP3 0x2f = 0xff
>    lsi_execute_script SCRIPTS dsp=0xffff0000 opcode 0x184a3900 arg 0x4a8b2d75
>    qemu-system-i386: hw/scsi/lsi53c895a.c:624: lsi_do_dma: Assertion `s->current' failed.
> 
>    (gdb) bt
>    #5  0x00007ffff4e8a3a6 in __GI___assert_fail
>        (assertion=0x5555560accbc "s->current", file=0x5555560acc28 "hw/scsi/lsi53c895a.c", line=624, function=0x5555560adb18 "lsi_do_dma") at assert.c:101
>    #6  0x0000555555aa33b9 in lsi_do_dma (s=0x555557805ac0, out=1) at hw/scsi/lsi53c895a.c:624
>    #7  0x0000555555aa5042 in lsi_execute_script (s=0x555557805ac0) at hw/scsi/lsi53c895a.c:1250
>    #8  0x0000555555aa757a in lsi_reg_writeb (s=0x555557805ac0, offset=47, val=255 '\377') at hw/scsi/lsi53c895a.c:1984
>    #9  0x0000555555aa875b in lsi_mmio_write (opaque=0x555557805ac0, addr=47, val=255, size=1) at hw/scsi/lsi53c895a.c:2095
> 
> Cc: qemu-stable@nongnu.org
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vadim Rozenfeld <vrozenfe@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Reported-by: Jérôme Poulin <jeromepoulin@gmail.com>
> Reported-by: Ruhr-University <bugs-syssec@rub.de>
> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> Fixes: b96a0da06bd ("lsi: move dma_len+dma_buf into lsi_request")
> BugLink: https://bugs.launchpad.net/qemu/+bug/697510
> BugLink: https://bugs.launchpad.net/qemu/+bug/1905521
> BugLink: https://bugs.launchpad.net/qemu/+bug/1908515
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/84
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/305
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/552
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/scsi/lsi53c895a.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index 85e907a7854..4c431adb774 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -621,8 +621,7 @@ static void lsi_do_dma(LSIState *s, int out)
>       dma_addr_t addr;
>       SCSIDevice *dev;
>   
> -    assert(s->current);
> -    if (!s->current->dma_len) {
> +    if (!s->current || !s->current->dma_len) {
>           /* Wait until data is available.  */
>           trace_lsi_do_dma_unavailable();
>           return;
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


