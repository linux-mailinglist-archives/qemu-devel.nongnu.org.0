Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F9380360
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 07:30:50 +0200 (CEST)
Received: from localhost ([::1]:53176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhQPR-0005Cd-S0
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 01:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhQOL-0004PC-B7
 for qemu-devel@nongnu.org; Fri, 14 May 2021 01:29:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhQOJ-0002K5-UD
 for qemu-devel@nongnu.org; Fri, 14 May 2021 01:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620970179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKGONbpol1VEkRY/uyitcjdoIi1vR0urzn7CSQDK7XI=;
 b=B7hIbKyDKsD+gN+TY5kUkB1mefV34vZ5aMeXxRSDlYTuhkusqMOT5u7QqlTAT2lMvEJiHV
 946EeRjEPfeqzWyduGTXkMldVf0RGOgfChER1rDctPlVTIOJXZlYRJlc3aRV2YWuXXOsCr
 DssKoExBMmGcLDi9y/zuYiIt+sjy4p8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-DXaKY9SQNm-qhfKTQJ5PQg-1; Fri, 14 May 2021 01:29:28 -0400
X-MC-Unique: DXaKY9SQNm-qhfKTQJ5PQg-1
Received: by mail-ed1-f70.google.com with SMTP id
 x3-20020a50ba830000b029038caed0dd2eso4685096ede.7
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 22:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iKGONbpol1VEkRY/uyitcjdoIi1vR0urzn7CSQDK7XI=;
 b=kZ4+dICNMlTzGGZ0/ybEwfkeQvgGcUInG+qRNzp7InPwLJiU5cGokOr7gX9eMk7VtJ
 Rtpr13rN3BC54IruoF7sJ0n6I1/cpioYx/nTf5W858lqxWoD0sVvGCW//gEbnB2bjum8
 XWEnNxdNTE+vmNBMkLwQm9BoJ4lLXgQJ2WRFFnSBR1oKu9llSKUvgvf1us7KrQYPljN7
 9gM/NQ3kFjv1oVzQI8HQWUcksCYjc07YNauKPcKVp7YU5yv/r/xX+47biGbdjPtgr8IS
 /+5Xka5SyMVpFVLyta6vKsAJKJN8CyptJCrcmXdEjd1gh2aI+Nl9BeQ58s1Erlil4NvF
 JJcg==
X-Gm-Message-State: AOAM533K7VbOJkjO/PFb9cD+SimYzBxjGHLaBd1tFOdLpMwf63I2N1Vk
 UxV95S8Bo/PgaZg0EctsX2WX2B2oG2uCVDKR7aME8yzIaHUd4qpJP9gMYjv6RCiH3MfbKJRd249
 lJ4pUho6WPNmSMXo=
X-Received: by 2002:a17:906:7e51:: with SMTP id
 z17mr47641988ejr.92.1620970167568; 
 Thu, 13 May 2021 22:29:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5bjQy511ZiMnvP2d8sY+gjvWcYMwDNcSldQA42PnTdfKNXAjBTpxCxOfRbHM42QSC5cEjVQ==
X-Received: by 2002:a17:906:7e51:: with SMTP id
 z17mr47641982ejr.92.1620970167416; 
 Thu, 13 May 2021 22:29:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id c5sm3746385eds.94.2021.05.13.22.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 22:29:26 -0700 (PDT)
Subject: Re: [RFC PATCH 4/5] hw/ppc/fdt: Drop dependency on libfdt
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-5-philmd@redhat.com> <YJs938JVdO5SRYSs@yekko>
 <ead2acca-d3da-89e5-52f6-e8ae14f6e85f@redhat.com> <YJyg+h7NC2ktmHSx@yekko>
 <6a06ae7d-1010-69bc-8931-364d2655e850@redhat.com> <YJ23w6xb2HxjWZIE@yekko>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7a910ae3-56b0-9c86-0a3f-7fd3f194c067@redhat.com>
Date: Fri, 14 May 2021 07:29:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJ23w6xb2HxjWZIE@yekko>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 01:35, David Gibson wrote:
>> "FDT" is set by meson.build if the library is available, LIBFDT is set by
>> the board to link with the library.  In other words CONFIG_FDT is per-build,
>> while CONFIG_LIBFDT is per-target.
> Oof... that's highly non-obvious.  Could we call it HAVE_LIBFDT and
> USE_LIBFDT instead?
> 

Certainly okay by me.

Paolo


