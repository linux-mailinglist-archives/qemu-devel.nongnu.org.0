Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DD638753C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:33:55 +0200 (CEST)
Received: from localhost ([::1]:41156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liw6s-0001UR-I5
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livnr-0002rD-Qg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:14:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livnk-0000PE-Oj
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9nE8X0Dl/+hcGksc1DdM/J9mmK8lFp/uHwNii5psrLg=;
 b=RL9FJgMyFKT2E+WnY7KZ0ObwgmuWjeN1g2tB+EEWjQ6S1pJyYB7OxYIZLWoaGeUaNJWAgm
 4Hi6w7TjWOoLBQna7UX1JR7bPPFurr7V5FJBGfmFbRw4Sge5EjR9y0lEtOpHQUdUJjb1RB
 WJxVY+NvdL6a4yWHg6ibsbVsIDlDmf4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-eJ_qsnSJOqWBDEucH9Zzqw-1; Tue, 18 May 2021 05:14:03 -0400
X-MC-Unique: eJ_qsnSJOqWBDEucH9Zzqw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d12-20020adfc3cc0000b029011166e2f1a7so4335178wrg.19
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9nE8X0Dl/+hcGksc1DdM/J9mmK8lFp/uHwNii5psrLg=;
 b=UhwP8sI+UutG1E1VEqDqG0GFr70CHugv+6CUrlw+/8aCb8frIidvwMguqCLnDSGXia
 lfBeGHn2khfu0Bk1xsUtdPtqQ5VVO6aQVe3230Ee3AcKw2e8Bwyio2n4nRQBJi5y9YvV
 dfi1LjNC2XBJM+SMMPbtEsuL/aCA52kLf7oLJvTyKmwaExkg02NWv0Tscb17fAn1GLVT
 kOhTQyu8HnlSkcXJMFTYHgahsPYOhf3p1PjHngULN8qmmZajWkuOlka/mDlaOaODT3Tt
 MQ/lBtu6vcisR5hVV1lru0WbjxhUFMSL/bMq+KjFiKGi+IWcuuVgUld3jDLkpEHZjVIs
 ZNXw==
X-Gm-Message-State: AOAM532wzboCKGYq9vFvOYdQZXzFnEg0L1+VwdPn5XvJGweF7Thik31R
 +X4gxUXHE43hPlHsXdob790IW963XBUaJXoUQFTc9Oxqax9BE74nAlmx6VXgKxk3F5UqCc2DRwH
 tAY+DaFImjxuhbOo=
X-Received: by 2002:adf:fb46:: with SMTP id c6mr5532205wrs.123.1621329242662; 
 Tue, 18 May 2021 02:14:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy54va0iwx5tGazFKAmZFt08FF0mvq0RZ/6flIRT6Mvpxt2c7qCa+dE63Ip+wB8m9p+Y0Vw4A==
X-Received: by 2002:adf:fb46:: with SMTP id c6mr5532177wrs.123.1621329242458; 
 Tue, 18 May 2021 02:14:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i11sm20974449wrq.26.2021.05.18.02.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:14:01 -0700 (PDT)
Subject: Re: [PATCH v2 05/50] target/i386: Split out check_iopl
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-6-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fd3a823f-36dc-182f-0b07-55a39b6a5462@redhat.com>
Date: Tue, 18 May 2021 11:14:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-6-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:12, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 28 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 15 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


