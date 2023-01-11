Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304DC66571D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 10:15:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFXBc-0005nz-UN; Wed, 11 Jan 2023 04:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFXBa-0005nk-Dd
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFXBY-0002oZ-W4
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673428456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nL1kNrVogHzn5JGBYsghMRc5W86ytEWKNTqU9m31qkE=;
 b=JkvxdBaPslE6HxgiI2U7RgGYyWp3FqFz2DGAJYciaKEPIutxok0L+34yDEEiZRLfJVhyN4
 et28cH99H/hDA7irRcw90CSjayU37kOEREQcgJgDI25XGGLisyGe5/4S00et3hB4yYaWvr
 K+zDZI+IDGI98newZQQXUC2xGvqyC8k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-GeARH5AEN-eehBfsNL2IxA-1; Wed, 11 Jan 2023 04:14:14 -0500
X-MC-Unique: GeARH5AEN-eehBfsNL2IxA-1
Received: by mail-wm1-f70.google.com with SMTP id
 fm25-20020a05600c0c1900b003d9702a11e5so7531056wmb.0
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 01:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nL1kNrVogHzn5JGBYsghMRc5W86ytEWKNTqU9m31qkE=;
 b=mbmkwjM7P4Z4Ezq+DMovRDmElhgICjCu6fAKKr8blVMjJFsgOEaRRm4jOPRpPOYm6f
 b3GLOYdPWLMQQQWEFNCqo1z/FruLeh5qbJjFu3WVgkvMfOeLnhEFk6IkcfC5Mzcopx4B
 7q8+YVrMAvLgobSRwciG2Fjr4IV1uAXh4ywBpAY9Twsb24rxkU+0txOqK5506UYQv7JK
 Opk9hDKf26EQmSIbgEV7DMr6GSxPv6xuKuJuiiSMjvUz9QnYFMBzqGNEH9ZfVWWGn6+a
 u0jTWCKFh0RO480/MuKt6SrhBQQpUviXuKLGKCaQGqRj1gSmgR593LWanVFqrucLss0i
 dmlA==
X-Gm-Message-State: AFqh2kpOhNd2FiER+3ilxZysd5SfeA+DloKWQnMjYCbPUel9HMNhOo3Q
 zV8aY96zDqHrBQbfr+4WoX1yZFTOSeAu8Y9PPThxRSKDog0cJE36D3VeixAzukS+aKeFYNx5Brt
 ET7hWMLPnY2K/cHw=
X-Received: by 2002:adf:b651:0:b0:2ba:c946:868b with SMTP id
 i17-20020adfb651000000b002bac946868bmr11381004wre.23.1673428453309; 
 Wed, 11 Jan 2023 01:14:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvE5/BX6ohxp1uxc3K1aB5+IGGa1K1vYD63q9kpbMsXoj8K9d2cKX0pKYbn2DEm7MGtDLWsDA==
X-Received: by 2002:adf:b651:0:b0:2ba:c946:868b with SMTP id
 i17-20020adfb651000000b002bac946868bmr11380995wre.23.1673428453035; 
 Wed, 11 Jan 2023 01:14:13 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 j11-20020adfd20b000000b0024207478de3sm13243286wrh.93.2023.01.11.01.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 01:14:12 -0800 (PST)
Message-ID: <08ae1223-2721-b10c-ff2b-91a62bd83070@redhat.com>
Date: Wed, 11 Jan 2023 10:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] remove unnecessary extern "C" blocks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230110084946.299480-1-pbonzini@redhat.com>
 <CAFEAcA9VCBqarUPzRrTx5ZXXFV8bdijge6zi=YUSrcirtv6bWA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA9VCBqarUPzRrTx5ZXXFV8bdijge6zi=YUSrcirtv6bWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 1/10/23 11:53, Peter Maydell wrote:
> On Tue, 10 Jan 2023 at 09:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> A handful of header files in QEMU are wrapped with extern "C" blocks.
>> These are not necessary: there are C++ source files anymore in QEMU,
>> and even where there were some, they did not include most of these
>> files anyway.
> 
> Any reason not to also take out the extern "C" block in osdep.h
> and the uses of QEMU_EXTERN_C ?

qemu/osdep.h is still included by the C++ sources in qga/vss-win32.

Paolo


