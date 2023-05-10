Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F96FE22F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:13:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmQ0-0000zS-Jk; Wed, 10 May 2023 12:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmPy-0000yr-M0
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:11:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmPx-0000Rg-4P
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683735111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I21tCj36kKMBU5rs1ic5xn+ovfJxqszx4szx7lKUw1k=;
 b=O1ZtL4n8ErvpVPmOQXWFFvdBj6C0QkLz1UrD11WmrawjvJVG+cRLY/For3bUOWU4J6y3zD
 ELOadjHgX+S1LwynNbu8oAa51qAaroXaS/tdNQSzVbhFDswXHvRfFX07zNtCfak3OnY2ZU
 1m9zJn4Qaf9BDTq8qnRbn3jQC8Z3UGc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-20nYCszINoCNzWcW9Re_wA-1; Wed, 10 May 2023 12:11:50 -0400
X-MC-Unique: 20nYCszINoCNzWcW9Re_wA-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50a094d5876so8434297a12.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683735109; x=1686327109;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I21tCj36kKMBU5rs1ic5xn+ovfJxqszx4szx7lKUw1k=;
 b=SxBn2rYMeu7j5NfLAbV6g2VcjfYbeLJiS3B6GWI11R6i9/DEav+h7TUTF4M2+Kx6uu
 sMdwFRK/Ep3d4wSaO3EwTFGMZRnWSZJcjkcNZWjUMA0sfCClvsxgR7pVS0YtaGk8sO0j
 hc/Z8K7M8x9O8EzReXI0yKQZCbOyOO8sVSNRbSUJpcSfOv3pgMv+w/BdkL1oujAok9Vq
 l32yuQYohGmkqLsH8hT1CmkVhvicYj/dHDF9/2+smOti4cByYnsFFVhRZW5Loe4kLwtD
 6OiwSkvf7vfFlbiTlzu/QwVGYTeZHe9QzTFJxPQDewMYJ9uALGRTsPZCQX6asLsSQHyB
 arYw==
X-Gm-Message-State: AC+VfDx+3ViCDiPHyePZRdiYVsb4FwO2MKjgew7Kgd53g5YUcp1yoZyb
 cNaadp5JRYWnI8yY7m3lNoIgeG+C992t90U/zOy+lgGk2msZjd0tOklG0EKA4s6hFm0W/hD+BEB
 FJjFUBaY/m837j90=
X-Received: by 2002:a17:907:98e:b0:962:9ffa:be02 with SMTP id
 bf14-20020a170907098e00b009629ffabe02mr16700106ejc.36.1683735106961; 
 Wed, 10 May 2023 09:11:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5go029Rh9uQJapbSbqckffLD2vkEGiHZ4zy/U6SUkM14u0mTWUVVBpSjX7O3JTHX1hh9eaOw==
X-Received: by 2002:a17:907:98e:b0:962:9ffa:be02 with SMTP id
 bf14-20020a170907098e00b009629ffabe02mr16699852ejc.36.1683735101588; 
 Wed, 10 May 2023 09:11:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 p8-20020a170906a00800b009658264076asm2831964ejy.45.2023.05.10.09.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 09:11:40 -0700 (PDT)
Message-ID: <62e34905-91fc-6498-d228-faa37b26fd60@redhat.com>
Date: Wed, 10 May 2023 18:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] scsi: check inquiry buffer length to prevent crash
Content-Language: en-US
To: =?UTF-8?Q?Th=c3=a9o_Maillart?= <tmaillart@freebox.fr>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20230426133747.403945-1-tmaillart@freebox.fr>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230426133747.403945-1-tmaillart@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.251, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/26/23 15:37, Théo Maillart wrote:
> --- a/hw/scsi/scsi-generic.c
> +++ b/hw/scsi/scsi-generic.c
> @@ -191,7 +191,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
>       if ((s->type == TYPE_DISK || s->type == TYPE_ZBC) &&
>           (r->req.cmd.buf[1] & 0x01)) {
>           page = r->req.cmd.buf[2];
> -        if (page == 0xb0) {
> +        if (page == 0xb0 && r->buflen >= 12) {
>               uint64_t max_transfer = calculate_max_transfer(s);
>               stl_be_p(&r->buf[8], max_transfer);
>               /* Also take care of the opt xfer len. */
> -- 

This is not enough because right below there is a store of bytes 12..15.

The best thing to do is to:

1) do the stores in an "uint8_t buf[8]" on the stack, followed by a 
memcpy to r->buf + 8.

2) add "&& r->buflen > 8" to the condition similar to what you've done 
above.

Paolo


