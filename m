Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07776455A73
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 12:32:40 +0100 (CET)
Received: from localhost ([::1]:38590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnfeg-0008Ph-Lh
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 06:32:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnfcb-0007IN-2H
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:30:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnfcP-0006Id-VK
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637235016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEMgR0aPhdmHcz8qCB6c4E5XLzeQH9i5hwNnebT/EK8=;
 b=Ud9Tu1/FWh9otK6r+MU2kjhsVxhZEWs2y8HOPy88l9NCwMu997kk9YePV0Uqe7y+viWUbh
 fQ+L1tN74Fqrrz+8q6yiXsDJVtwGwbV6agDmZdHKVBMngBku0uttxhgB0b0IlbECeaHBhf
 ejdw28129xAbRJO0/yZgmmmL+nW1qNY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-wWFAcLAJM9mXrUab7W0hHw-1; Thu, 18 Nov 2021 06:30:15 -0500
X-MC-Unique: wWFAcLAJM9mXrUab7W0hHw-1
Received: by mail-wm1-f71.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so1725940wma.1
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 03:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KEMgR0aPhdmHcz8qCB6c4E5XLzeQH9i5hwNnebT/EK8=;
 b=ageAoO/DMA9ix6S+AaYmGyuDWqS8WbDQQc/+sSexssDveVeAfKmRZ3EXknN3jKIkX2
 G57h4ZuF3FV090h2jbD0qLq6JRqUKxl+4O+UEWLd689+Fv8dFvXb50Di2VCjnsTPcNvn
 e9OBuYtxzkOb9+9Zt+AMkTyLeQkT456k5LqP6yYmQtlwxuK/DIPU+GmclOS1Y41ZhPXk
 4JVvsN2R4f+KulMz19j/pj7YviIh433f/6TyAM+oMW+GEj14NPCaDp1UhaUXnGdJzeau
 cLnKB96TaFecCrxr1z4jU0UuSa/sewMvUqLM2uP2lmM+Qe6Pt3lv32K2S7pvA1q9nfKn
 TeRA==
X-Gm-Message-State: AOAM531Tuhfeh7DxtP1bMjdj+c07zm0xi7KjogQvLBoTfsgrGaRmjvlY
 iQAVSfcUI85vA/Klp8uTeb7xta8Wh0SemzG+rb3WeWm2bb6JdV1M/pTGEqUa5kHQkNflzLuLHQ3
 FUdLTNBOsGwAFRwc=
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr9145093wmi.139.1637235014259; 
 Thu, 18 Nov 2021 03:30:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwb3oC0f6mx/worR0Q9qLJ+/3hbS2BwDgxndzN7iTN8DTBIeGXtKjbrotaO3SEemJvIKh/Igg==
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr9145061wmi.139.1637235014065; 
 Thu, 18 Nov 2021 03:30:14 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l18sm2839311wrt.81.2021.11.18.03.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 03:30:13 -0800 (PST)
Message-ID: <17121bc4-a2af-4f31-1f23-b512a43dc47a@redhat.com>
Date: Thu, 18 Nov 2021 12:30:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2 1/2] esp: ensure that async_len is reset to 0
 during esp_hard_reset()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, thuth@redhat.com, lvivier@redhat.com, qemu-devel@nongnu.org
References: <20211118100327.29061-1-mark.cave-ayland@ilande.co.uk>
 <20211118100327.29061-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211118100327.29061-2-mark.cave-ayland@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 11:03, Mark Cave-Ayland wrote:
> If a reset command is sent after data has been transferred into the SCSI buffer
> ensure that async_len is reset to 0. Otherwise a subsequent TI command assumes
> the SCSI buffer contains data to be transferred to the device causing it to
> dereference the stale async_buf pointer.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/724
> ---
>  hw/scsi/esp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



