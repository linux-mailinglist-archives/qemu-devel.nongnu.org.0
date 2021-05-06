Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C406C37552D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:53:59 +0200 (CEST)
Received: from localhost ([::1]:38752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeRy-00018N-Sr
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeQr-0008LI-Qp
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeQq-0008Ko-1M
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620309167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6IZalKvFxUNTD1dgLCEsHfySBg/CutxX4/OXgudQzHg=;
 b=eHdHhuWZbDCmFhiFBN5lmtZAlYwE44cLVQ8bGZPASQFd/mIEVREK4l4dApL8IvlfBpencG
 kQ2VD93qayHwY386kJAwzFIYuLPjdwhboLpEa7ck8QjSBZqZnIGl+510VmmdAd5kBPGp0s
 TZY7KlmafO/VvjYOD45pZGs5PggQ4c8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-83HPl3zvPUqB1uARObgmaw-1; Thu, 06 May 2021 09:52:43 -0400
X-MC-Unique: 83HPl3zvPUqB1uARObgmaw-1
Received: by mail-wm1-f71.google.com with SMTP id
 t7-20020a1cc3070000b029014131bbe82eso2694294wmf.3
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6IZalKvFxUNTD1dgLCEsHfySBg/CutxX4/OXgudQzHg=;
 b=cvmBKA7+qeMvClU/frabiUG0DpdoUMnkfZWEXD9jeAfVpzmIVzGHCK1DJieZ7935Gy
 O+eTK7K6cyezE7fdrYfk95yfDLYx8CMLY0Dxkikrm/CRnZwQkgQkDGwL74HnZ5KQr0oI
 eNddRsMZStkJJUZiI+/uEhaZ9/mClUsXs1+5C7SLni25qzHMLY7qwMBHq6knp6XDxPTZ
 vPhJBwPNYJnXyCBRJF6KmYQ/5UGoBRwKflcesX6o61BRWHCYq0EKudVh0IhlXFMZbKrs
 KQcRfds8kQdMe6H8YQpcjEqe1TnyJePgq68iHd7za4B0kbrzerRd8Z6Lyn304ZbhvPGB
 PIpQ==
X-Gm-Message-State: AOAM531VT+bbhGDqn8yO9cLfxYlz3IBiEw56B/Qh0QtK+EWXRLvvBfCX
 S4ncy+HmUl1kfw56fe1alSZeku0QGLsdpRlsPic2PbS93XX9oeDPOuD5bJvmo47x9hIK/kARUsW
 ZqV3ciSxYX0BQYn0=
X-Received: by 2002:a7b:cb85:: with SMTP id m5mr14983585wmi.53.1620309162336; 
 Thu, 06 May 2021 06:52:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2kify+MSzppFiGQmagSRH5BhYWwJgj9nVDfPSYl2Vy5dlkIxtRT6AAvWGfayv7K+b1XFC2g==
X-Received: by 2002:a7b:cb85:: with SMTP id m5mr14983560wmi.53.1620309162153; 
 Thu, 06 May 2021 06:52:42 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id k16sm3617414wmi.44.2021.05.06.06.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 06:52:41 -0700 (PDT)
Subject: Re: [PATCH 11/23] hw/intc/xics: Avoid dynamic stack allocation
To: Greg Kurz <groug@kaod.org>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-12-philmd@redhat.com>
 <20210506102256.1284c2e8@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <08ce19d2-7af1-766c-9ffe-b6f4a5ad2dcf@redhat.com>
Date: Thu, 6 May 2021 15:52:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506102256.1284c2e8@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 10:22 AM, Greg Kurz wrote:
> On Wed,  5 May 2021 23:10:35 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Use autofree heap allocation instead of variable-length
>> array on the stack.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/intc/xics.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)

>> +    g_autofree uint8_t *flags = g_malloc(ics->nr_irqs);
> 
> I would have made it g_new(uint8_t, ics->nr_irqs) so that changes
> in the type of 'flags' that could potentially change the allocated
> size are safely detected.

OK, will update.

> This is unlikely though, so:
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks!


