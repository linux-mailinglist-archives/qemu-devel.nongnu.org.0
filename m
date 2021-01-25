Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F7C3026D8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 16:26:33 +0100 (CET)
Received: from localhost ([::1]:45026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43l9-0002pk-R7
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 10:26:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l43jD-0001s2-2H
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:24:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l43jA-0004C6-Vb
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611588267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0swa4/7u1CHRHz2EnzUMxOWbEqicwF3SgvBtLym0aE0=;
 b=Hpk9vRNejJmeyXEBsdUuzIfuRZObkdf/d2xc6tJHk58EQjhK3xFXv7SUdAY5UyZoGmiWCK
 yC664NeHlm04GEU19WsTcNI7MGvyklvw7ZpWp/laigLPwObuGuRVwZIgsxKfS5ExZxKprP
 sajpW2lyVqOdn/KZrlNCspyWqn/Mhu4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-2ohpmOZOP7iCdH0Gp7syKA-1; Mon, 25 Jan 2021 10:24:25 -0500
X-MC-Unique: 2ohpmOZOP7iCdH0Gp7syKA-1
Received: by mail-ed1-f70.google.com with SMTP id j11so6848819edy.20
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 07:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0swa4/7u1CHRHz2EnzUMxOWbEqicwF3SgvBtLym0aE0=;
 b=JbRo4qBxGMQI68cTzg03T+wFN/Frda5G54ciExeW0+e1cjf8NIFZwBZCDZi+E7zuZI
 pFZvY8AIN0CuVMJJcR/IA5YC2+Z7sQsjypIOOB0dfIKNFHxu/bJEJojfaReUpXhZwbth
 KlLqBoLsUeAIfzmwCaD+HZzxCo1DgqFtP4qyA/QD9Q5Ji8VVbSboFS2LeK1ci2dokKSS
 LcfU2sy9spH7FGy54RzKtrzwjfugVush0tPRmtlKGmKoFgFW6a/ThcXEcrcfqFaIlIZt
 ka8E6MVAPXF6tbW0LO1w5/7AK69p6T3tGvuVXOclS2x58mCL9JQ9Kal3FrK5eyBxqh6r
 RDUw==
X-Gm-Message-State: AOAM530FSr5NfuapE9CKtxE3I6GM9RCEWeImd1EYy95I3t7kDJLKMaIF
 7mxQMilu4DyKuiP60iX6zXHJ/7BM6paQUf1QVahOG33GQX0kmho6K88I1eZBAQEgNafEiLgHz7w
 D8JTQFJuL9/xlTig=
X-Received: by 2002:aa7:cb42:: with SMTP id w2mr904986edt.21.1611588264077;
 Mon, 25 Jan 2021 07:24:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2nb/V/tfKwIu0mMqYRRd99NarwWcxzxegC5GM+V/Oud3UrcJ2uxGuzAfa9JByshNUwcbIZQ==
X-Received: by 2002:aa7:cb42:: with SMTP id w2mr904975edt.21.1611588263881;
 Mon, 25 Jan 2021 07:24:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b17sm410503edv.56.2021.01.25.07.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 07:24:23 -0800 (PST)
Subject: Re: configure does not detect librados or librbd since the switch to
 meson
To: Peter Lieven <pl@kamp.de>, dillaman@redhat.com,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, philmd@redhat.com
References: <23268a39-078d-ed13-6bb4-590ce1292662@kamp.de>
 <b8dff207-21d9-ce8f-63b3-f877d29d90c6@kamp.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bb07c231-6584-0d4d-959b-46948c9ab9bc@redhat.com>
Date: Mon, 25 Jan 2021 16:24:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b8dff207-21d9-ce8f-63b3-f877d29d90c6@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 15:31, Peter Lieven wrote:
> on Dedian / Ubuntu configure does no longer detect librbd / librados
> since the switch to meson.
> 
> I need to add dirs: ['/usr/lib'] to the cc.find_library for librados
> and librbd. But I am not familiar with meson
> 
> and can't say if thats the appropriate fix.

Can you include the meson-logs/meson-log.txt output?

> Further issue: if I specify configure --enable-rbd and cc.links fails
> the configure command succeeds and rbd support is disabled.

That's a separate bug.

Paolo


