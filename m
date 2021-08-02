Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D793DDD7E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:22:00 +0200 (CEST)
Received: from localhost ([::1]:56182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAahT-0006cT-Qn
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mAaga-0005Dp-Ru
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mAagY-0001uI-G8
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627921260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LirXEM4kKWGIwAglQIxnq9vDBtQ5zLpM0jbFnt+X1fM=;
 b=MaooT7ldYJR8A/XWUcKgNHH9YQM74GMjvWWGgm+Y2KSqVOjRtJ4i103AlunZixHzkH+dOR
 Uj78LrMuY6yRFXuZokL2aKEOnPfF1Fr69GfKg6CnftT78XvI9epQbmZ4Gr2sjTHEAfQ+Gr
 6IW7AC1AkX0qbgDPOgQEVuIZUguHF7k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-3CwCexd5PRimnHpXD9UjoQ-1; Mon, 02 Aug 2021 12:20:58 -0400
X-MC-Unique: 3CwCexd5PRimnHpXD9UjoQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 a9-20020a0560000509b029015485b95d0cso1076283wrf.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 09:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LirXEM4kKWGIwAglQIxnq9vDBtQ5zLpM0jbFnt+X1fM=;
 b=J7iv3qZUqmRqqo/uuq5mA4IoCh36JQPjSVYFcrV30VMgOdvblnkw1SVAkG4M2x6L1A
 ukv9zHpqRa0wrvc2JQBPj6fRHkp4APkdGuDAgUrswlNHfFhhQfz2XaUCfsbcPnVeovSe
 935TPEX+XYDdjKnfylttAXCJSRklICqJFjz5QoG0FmqPRhLyoRuzAcLAfhId/ndJfJ+m
 SmrXbsC50t7w2SbQFfOCkcxPcDmcoF6GMwkHx2pMQ02yo0RPmHUNQQuA9muRqOd45qKw
 nTBWvImHMHe6LqepopFip5QXJMr3PpOh9JGkQ9Fkz67CKNFaDUicJiaPIOE0MMVp6HRo
 SHVA==
X-Gm-Message-State: AOAM5306Ay7tht64sdqPwDlqB7BKM6/WMvQQZFnujTveEZ3EyJ3BSVXJ
 68/Nr0pmX6vQdTAvEjYdcpYorpHXaQQglFibKWxtgf7qQSWOsI3LhWlqkqT1lr4kquSZh4WcX6V
 Ot8fGQINGcq6tEEx9mWuCpuAPaIz3zMBCkf3iGjUrrcrIYjH50K/DtGU11KNj38I8AlI=
X-Received: by 2002:a1c:4e01:: with SMTP id g1mr11188506wmh.106.1627921257246; 
 Mon, 02 Aug 2021 09:20:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYGWm9mwDNwdZcggBT0IazkCnM4b1bu6yHjWG4yrpJGiNPzrJH41rgIU2FIDkA2yEEbXm9qg==
X-Received: by 2002:a1c:4e01:: with SMTP id g1mr11188481wmh.106.1627921256942; 
 Mon, 02 Aug 2021 09:20:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j2sm11945112wrd.14.2021.08.02.09.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 09:20:56 -0700 (PDT)
Subject: Re: [PATCH 4/6] coverity-model: clean up the models for array
 allocation functions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210731062741.301102-1-pbonzini@redhat.com>
 <20210731062741.301102-5-pbonzini@redhat.com>
 <CAFEAcA95XPt-2oeKM1gCCRDOjAyf4m0vkoQNGwLZk4swo4gDAA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a0cf06ce-55ae-fe35-64ef-f3d66c2708c0@redhat.com>
Date: Mon, 2 Aug 2021 18:20:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA95XPt-2oeKM1gCCRDOjAyf4m0vkoQNGwLZk4swo4gDAA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/08/21 14:36, Peter Maydell wrote:
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> 
> The real g_malloc_n() returns failure if the multiplication
> would overflow; I guess Coverity currently doesn't have any
> warnings it generates as a result of assuming overflow
> might happen?

I couldn't find any Coverity-specific way to detect overflow, but making 
nmemb a tainted sink could be an interesting way to ensure that 
untrusted data does not end up causing such a failure.

Likewise, we should try making __bufwrite taint the buffer it is writing 
to; there's already a TODO for that but I never followed up on it.

Paolo


