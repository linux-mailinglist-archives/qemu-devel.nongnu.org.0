Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401EA49FCC0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:26:35 +0100 (CET)
Received: from localhost ([::1]:49432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDT90-0002st-B1
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:26:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDT37-0007ME-U0
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:20:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDT32-0004cf-8P
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643383202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VCpQ6G8EbZVUlEEObPH7XuBaFcUOrkC12+weEu9U2yU=;
 b=ipR0h2Qd0f1HEgjMOB9Dd9fp8v/Z+dycDlxmlNIt3QPp5iGr5uL9/wZjnuielDzBi67kkw
 t8826ftALdvgmkkWhrQiGZYVtkVUIKb8vT48uNUJxkhzRsuaeoXa3GuteNjF4B8o3788fF
 1JKVx9CoG3oO0qi3xMwKDSyfkh0r0qg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-2GV9DZLRM2eVcOWq4PvASQ-1; Fri, 28 Jan 2022 10:20:01 -0500
X-MC-Unique: 2GV9DZLRM2eVcOWq4PvASQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 w5-20020a1cf605000000b0034b8cb1f55eso6055593wmc.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VCpQ6G8EbZVUlEEObPH7XuBaFcUOrkC12+weEu9U2yU=;
 b=WKLtcOaDHXxs27w9Xh8DQNdhO5Kr/tIgcDVQKrDYJMzsaqJWNWUP1iOdoGfh8cawkt
 Wk4Kha6CTF/8k9skQpuDgngqVWXQm8qCp0MJbr/O1edEHE7XFMh420u79fFdKLgWsLuS
 T94Q7/IlmuZdTHj8YaET9jZ1Stpfzjv1i7uv/nZrYZvbCoDhav+5I/jc9N/uUK4k1mta
 xlvLgdk3KOhylgoiMDI2u1cjBgltsZNnj4AqaPqNKoI/3qSdc10sgJw/d9linMR5mmg0
 YpN0l3tBTm5pXljHNzSxn2SOSOvsdolmAflcRz2mBRDkbbrrJz93QSRAQxD8LJaUA200
 fxKw==
X-Gm-Message-State: AOAM531ndUozCa8tTfWkvD3K3ndVmacT/i7Bv1hSwaYLPO+UFE/Fp3m8
 7h8D52XAqFl+kK8EfqM4Fd6XfGxcJiS5AiKTYt3ZXRV/OnCHpTsxtIHJoYEtP0GXUtr5DhH46zM
 svjUpeUyKysZCth8=
X-Received: by 2002:a5d:6603:: with SMTP id n3mr7256602wru.20.1643383200161;
 Fri, 28 Jan 2022 07:20:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTFXMecEuiDsa+wWVyFRPTjhNx3Rnt9oysgJjiRWYV+91Ab+ffRtdCeEr/ywNoxZuj4ooMyQ==
X-Received: by 2002:a5d:6603:: with SMTP id n3mr7256564wru.20.1643383199889;
 Fri, 28 Jan 2022 07:19:59 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id o6sm5880545wrc.65.2022.01.28.07.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 07:19:59 -0800 (PST)
Message-ID: <dfd3932e-ced4-c2db-441f-df7bb991415b@redhat.com>
Date: Fri, 28 Jan 2022 16:19:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 29/33] job.h: assertions in the callers of JobDriver
 funcion pointers
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-30-eesposit@redhat.com>
 <daa2d5d6-8f57-672a-2ce8-41e8d163d821@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <daa2d5d6-8f57-672a-2ce8-41e8d163d821@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 26/01/2022 15:13, Hanna Reitz wrote:
> On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   job.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
> 
> Just curious, why did you remove the assertion in job_co_entry()?
> (Looking at it again, it might have been nicer to swap it with the
> assertion below it, so that `job != NULL` is asserted first, but other
> than that...)
> 
I think it's useless, job_co_entry runs in a coroutine in
job->aio_context created and entered in job_start (its only caller), so
there is no way that we are in a different aiocontext.

Same as assert(job), I don't think the opaque pointer can ever be NULL.

Thank you,
Emanuele

> (And since I’m already replying to this patch, might as well point out
> s/funcion/function/ in the subject)
> 
> Hanna
> 


