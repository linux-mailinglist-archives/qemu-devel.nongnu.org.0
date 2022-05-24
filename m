Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744725323F3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 09:20:14 +0200 (CEST)
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntOpx-0005o9-57
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 03:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntOej-0000DS-Hb
 for qemu-devel@nongnu.org; Tue, 24 May 2022 03:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntOeh-0007cq-2W
 for qemu-devel@nongnu.org; Tue, 24 May 2022 03:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653376114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2X5Y3hFnT3J19C8lSNPmTl4yqmNb7XFavu5IJO4xQDY=;
 b=gS8J69xzmYhL2Xf8PPZfpQS9S/9iRhfAe8l8UcXYcZuFdAro73PaMZrlhjO2z4Ar9eyXI/
 HPcF6r9bEeptxr7u/P/ESzxUQBqnYjaTseiEbd9SEsVdva6YgK5kHUByUnT5evwIViPen8
 +9vcfGQ/3rtKISbqmklpgHrZX9zGrSM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-5P3sLZUON4KvOTQqF03d2w-1; Tue, 24 May 2022 03:08:32 -0400
X-MC-Unique: 5P3sLZUON4KvOTQqF03d2w-1
Received: by mail-ej1-f72.google.com with SMTP id
 gf24-20020a170906e21800b006fe8e7f8783so6898828ejb.2
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 00:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2X5Y3hFnT3J19C8lSNPmTl4yqmNb7XFavu5IJO4xQDY=;
 b=Ch8Tqwe1xnZ1zyL5vev1OtCSOLulSs/Jf6GnX0bdp9lZ4fIJQzDccW3Fl7cZDEu3J8
 BwqjwaQ4d7da65WjV2FpS72QQG1JRUP6IcL81Epwas9HTfNZBXQaxXU1IQDU3mvpbVAm
 +IorTX3J69JASqwJXXYXitI765JQB5zUQk4hVmVNzapiEubGV1AuVmvPRWHoV1IzpBT5
 qc2UXl5dOf7S/9Fv5zsk+Qj3TBMGqatvi4ABa6G4fbmpddmy3qh9TRYWojwIe4GKnKXc
 EZ/yPoAtCkyjX6oggUe03jjIfMpa+BZWD6GaF1xTTXRx1pWVpmYyzAnNfh28H0pr6Ms2
 bFzg==
X-Gm-Message-State: AOAM532NtRJ/equdfflWRF+eUx+8WeIJumI3aJ+JAH13TfWXnqx9xEB9
 ksePT1iJYpSagkX0orpGsiszR0c9XpdfLKUG8mDfif06Bg5VtiNiMiybMm1avTZcK1hHcw9AR3O
 oDa2unWDqWKgZOpU=
X-Received: by 2002:a17:906:5204:b0:6fe:902a:da93 with SMTP id
 g4-20020a170906520400b006fe902ada93mr24735888ejm.155.1653376111279; 
 Tue, 24 May 2022 00:08:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi+yTXsORHOypve47mIulnmbAkPDWEDePD0zDngMSSeIXR8DB8zTQCn9rJWfpRN06/pVfpSw==
X-Received: by 2002:a17:906:5204:b0:6fe:902a:da93 with SMTP id
 g4-20020a170906520400b006fe902ada93mr24735864ejm.155.1653376110989; 
 Tue, 24 May 2022 00:08:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 cy23-20020a0564021c9700b0042617ba63c8sm9210229edb.82.2022.05.24.00.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 00:08:30 -0700 (PDT)
Message-ID: <a774787e-46ac-36e0-8573-8adc114df784@redhat.com>
Date: Tue, 24 May 2022 09:08:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: aio_wait_bh_oneshot() thread-safety question
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 hreitz@redhat.com, Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <5dacced9-5434-5d05-a826-c7acb9fcb2ed@yandex-team.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <5dacced9-5434-5d05-a826-c7acb9fcb2ed@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/23/22 18:04, Vladimir Sementsov-Ogievskiy wrote:
> 
> I have a doubt about how aio_wait_bh_oneshot() works. Exactly, I see 
> that data->done is not accessed atomically, and doesn't have any barrier 
> protecting it..
> 
> Is following possible:
> 
> main-loop                           iothread
>                                  |
> aio_wait_bh_oneshot()           |
>      aio_bh_schedule_oneshot()   |
>                                  |  handle bh:
>                                  | 1. set data->done = true
>                                  | 2. call aio_wait_kick(), inserting the
>                                  | dummy bh into main context
>                                  |
>   ... in AIO_WAIT_WHILE():
>     handle dummy bh, go to next
>     iteration, but still read
>     data->done=false due to some
>     processor data reordering,
>     go to next iteration of polling
>     and hang
Yes, barriers are missing:

https://lore.kernel.org/qemu-devel/You6FburTi7gVyxy@stefanha-x1.localdomain/T/#md97146c6eae1fce2ddd687fdc3f2215eee03f6f4

It seems like the issue was never observed, at least on x86.

Paolo


