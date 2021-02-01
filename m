Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661E030A3FF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 10:07:05 +0100 (CET)
Received: from localhost ([::1]:50268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6VAl-0000Cu-VU
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 04:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6V8V-0007WD-B8
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 04:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6V8N-0001ti-1U
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 04:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612170273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rA4Poahqcvs3hugJ0Vxd7mWcAdH0y65GCIo8X7bZcfI=;
 b=YgTsmRCDBD74tdTkMzIx8H1eDCiZHwr8uLFRxTshV+2P6zjAeTOrs+fjjgvtAXXgc5TyYO
 7YsY18EeXYdBVyupbQ4w0k3YyZOC1Vxp7FpWWqZaNHBmUgRQWc5YZa8rYzZo5qY4oP80Be
 tX7PGNRpcTyx6RAeVRuSA4YggG4EWiA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-Rq7d7is0MUWjAb2phcGxUA-1; Mon, 01 Feb 2021 04:04:31 -0500
X-MC-Unique: Rq7d7is0MUWjAb2phcGxUA-1
Received: by mail-ej1-f71.google.com with SMTP id le12so7967631ejb.13
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 01:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rA4Poahqcvs3hugJ0Vxd7mWcAdH0y65GCIo8X7bZcfI=;
 b=hJ8E2PFzgRaeVR+gfJeu2LcInDztAm04iEUdZ2DEUj5Y837TqfZml6IA3bzn7zQcIB
 0GWZP2iUjW3JIrMhgET1hl5aTnlblxHtNSoP+o+uB4oxohd67PLXEc+VFLxfeUcFj3Hs
 bE/M2cLhfCCJP7KL6fMWcOIGqQhXpgzxZE9ckpkdfnliq4DkappdlLO8u4WxVPPhNNF8
 BTCXqqvZ7vj5/GyOFD76k/aTpg3iUDyX/8nEBqP/Lmgkuw6nYb0QewmdCby77pCjFi/K
 ed7hAN7Pvg/MTNn58ov9GQEVIlKRfi6Ne8yfo/hJ4InBowgmdpxaof5y5ezRzBeGdNU7
 2XkA==
X-Gm-Message-State: AOAM531l6snS9zM9oqLS97HwKxtyzWJg6K9x93Pd4QBRaizTLx1NA/R0
 8yd4clqwNrLmmD1tcI1J+5zA9auc3AKhE22Tm6YYFqFzDfWJzDAKIvJurI3gKcbpqsJNZK+gFWJ
 ONuICe4xUJ/mgDrw=
X-Received: by 2002:a17:906:2a8b:: with SMTP id
 l11mr16672190eje.1.1612170269693; 
 Mon, 01 Feb 2021 01:04:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqCXEmg1ZoGdWyAMxWRH0h+ys6RVqCzPEqFaq5IKFs2JUihx2DDYvJaSlamEf+9VSxwvZ9Dw==
X-Received: by 2002:a17:906:2a8b:: with SMTP id
 l11mr16672146eje.1.1612170269483; 
 Mon, 01 Feb 2021 01:04:29 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bm2sm607291ejb.87.2021.02.01.01.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 01:04:28 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Luc Michel <luc@lmichel.fr>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
 <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
 <337e9fe1-3d84-83a7-20b1-d64aa5125e7c@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2e21d938-20e3-1595-b1aa-6fc2eff087e8@redhat.com>
Date: Mon, 1 Feb 2021 10:04:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <337e9fe1-3d84-83a7-20b1-d64aa5125e7c@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/02/21 09:46, Philippe Mathieu-Daudé wrote:
>>> +#ifdef CONFIG_TCG
>> I'm not sure it's enough. TCG and KVM can be enabled in the same
>> binary. You'll have to perform a runtime check here I think.
> If TCG is enabled, all SoC are built in (regardless of KVM enabled).
> If only KVM is enabled, the TCG part is not built in (only ARMv8
> based SoC left).
> 
> The problem is when QOM types are registered, we can not know
> yet if the accelerator is enabled, because accelerators are also
> QOM types and are realized later. So at this point runtime check
> is not possible. See this post:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777761.html
> 

The check should be done on the CPU type, not on the accelerator.

On top of that you could add a "depends on TCG" to the hw/arm/Kconfig 
file, but Luc is correct that it would be just a nice-to-have and not 
the real fix.

Paolo


