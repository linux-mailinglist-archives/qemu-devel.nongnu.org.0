Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9AF2C63E0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 12:23:57 +0100 (CET)
Received: from localhost ([::1]:51628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kibr2-0003Uw-HS
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 06:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kibpQ-0002XO-VT
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:22:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kibpP-0004uP-BB
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606476134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uytEnzd5RnLqkxyG99LgfZKGByo+m6u1C1WcR0r6ujg=;
 b=Mn/xB5LHWMySoU7rhHcgQ+JAa+1Dz4btJ3PHfOJRlj2ifnckOTVvj/ObRXQTpBaCArE7Fd
 WIx+md/Frcw+0mmBg14Bfnlm1yn3tmGnHo/H9oS9C9knKIgqKm9r9H0T11sd48I/anEQA3
 JN3pUXLud976JuAQvmiQESZIxZoLrSI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-r4M_ayKIOcujERtUpkFzLw-1; Fri, 27 Nov 2020 06:22:12 -0500
X-MC-Unique: r4M_ayKIOcujERtUpkFzLw-1
Received: by mail-ed1-f69.google.com with SMTP id d3so2305862eds.3
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 03:22:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uytEnzd5RnLqkxyG99LgfZKGByo+m6u1C1WcR0r6ujg=;
 b=uB2254rERsp71EB2V7qBQjhirUVlJ5wqb8eZVQ33qdkqfgj3oms09ldfiR4RTeAa13
 SdoqzuadtWeSrnb/v+ddW4w12OvpzgYG7LC9SRkvFoBM0nU3ns6LtDKz+EHU4Dmen62I
 7icx0JcpNqAIWFekkvh4HmfC3UQ5UYxnuHra9sfD+fjNjmPXl8DXHCXdx0G5iHIOkwnd
 EucBqlXO0weV3v66ekVs8T7GOsG9jgpCmrkYUwQnEAofe936827F/vLXJLtWD/IVWpBz
 QDC4Z6QScF4GSWnY+NE+awY0snhzhUwJGkjlDe2NgefWTocSvnu04d5sLD9rNnZ1XaG8
 MNOw==
X-Gm-Message-State: AOAM532iqrM4sp/VDJ+25SJnr0WTEVmblSeIOWZPsDWKr8g+PNdIETtK
 Jtc5K260mn8Xpi47VnQIbrdVWCgntY5PkuiPooJfvIkZG6rymnM4KUnmPh9EooPO6TdVfW4HrHy
 Nz0clWe/w336ajUI=
X-Received: by 2002:a17:906:46d2:: with SMTP id
 k18mr6869822ejs.33.1606476129615; 
 Fri, 27 Nov 2020 03:22:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGPyVxU4ttRJU+Jyd4/6Z08niTTLcJWmAIE7dHc8VrcgpUKLMiIQyVFCxUnJT7GkcWUDGIhQ==
X-Received: by 2002:a17:906:46d2:: with SMTP id
 k18mr6869074ejs.33.1606476117002; 
 Fri, 27 Nov 2020 03:21:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id pk19sm2403616ejb.32.2020.11.27.03.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 03:21:53 -0800 (PST)
Subject: Re: [PATCH 4/8] arm: Synchronize CPU on PSCI on
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-5-agraf@csgraf.de>
 <CAFEAcA_XZu07Fg3G05VWYDYTJfMSAzOH5yyd=rFLJVa73juDtw@mail.gmail.com>
 <785c216b-d4b5-b65f-1ddf-4c6374b72ece@csgraf.de>
 <CAFEAcA9QUfBQpmH=8_A+xDm53GkkOgFEDnkTDXOX_1A-bFg0Ng@mail.gmail.com>
 <284d0cd2-268b-b937-3a6e-d074ce28baee@csgraf.de>
 <3594db71-c72f-2946-ffa5-47da737900c6@redhat.com>
 <bfbf4660-5e34-5fda-e71d-b88670d6dad7@csgraf.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6260c875-bda1-35f3-20fa-a1c05396250d@redhat.com>
Date: Fri, 27 Nov 2020 12:21:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <bfbf4660-5e34-5fda-e71d-b88670d6dad7@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/20 11:58, Alexander Graf wrote:
> Mostly because there is a lot of super fragile logic all over resets 
> atm. Init setts dirty, post-init clears it. Then the arch reset handlers 
> assume that state is not dirty and fiddle with KVM reset ioctls and KVM 
> register modification ioctls directly. Mostly because KVM for the most 
> part implements its own reset logic.
> 
> I'm fairy sure I'd break someone unintentionally if I just throw this 
> into the common reset handler.
> 
> However, if we're happy to fix the fallout when it arises, I'm happy to 
> do so.

I'll decline the offer. ;)

Paolo


