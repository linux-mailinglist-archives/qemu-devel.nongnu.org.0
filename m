Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBFB456271
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 19:32:57 +0100 (CET)
Received: from localhost ([::1]:43014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnmDQ-0007xK-Ky
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 13:32:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnmC0-0007Ga-KR
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:31:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnmBy-000852-0u
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637260283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXf6YwBXmOYbYc6JSEunqqADiPxXPPMsUGMq2N8WaMg=;
 b=B/Mnj7clWX1lgHt4rTrz9eym8rYAqs87QkMpeHhSAcj54booXYxmyN4fxkdq4zXefIfN79
 MySha5c3gKFUnF29k/OJY63Zq9m+QW6nYmPpvC9sH1uGzBNLhbAjpm21vynhYZXdRHDvrU
 aVC3lGwTjHB61UnNGjZntzBNzvexZGw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-X_3NtDouPk2t1uqJfdvC7w-1; Thu, 18 Nov 2021 13:31:22 -0500
X-MC-Unique: X_3NtDouPk2t1uqJfdvC7w-1
Received: by mail-wr1-f70.google.com with SMTP id
 y10-20020adffa4a000000b0017eea6cb05dso1281709wrr.6
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 10:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FXf6YwBXmOYbYc6JSEunqqADiPxXPPMsUGMq2N8WaMg=;
 b=q0orvI6VOVphjto/WWB0FJbTegx7K9nJnFz0K1P/7hn3BWN2Cms+ny4vBOIxWfFOum
 N3gl+eb+xC6h1WxqRE6WCJQ1+s/5uFOSVf/kM8KBFJs2UQYjp3suSRG4PhmzihELcGgq
 Upww32SD1vC9BA+bawGCIuXehXQ0HGbyc690swDFD5RXtv2CMvaQYxPRA1B/VVnXnsRq
 DTTwe51hqC+6zh3k7e5fugVM3UQOnr92NBrMSFgMfnSC2WTHIuMu9A7/FavIXbdsROdr
 zz4inKOXYqqIYZ/1+Oo81tlXVsdmEGIaNum1noE48pq9VXmJR8VKZvGLhf5CMGIOk/k7
 eW7Q==
X-Gm-Message-State: AOAM532XKWT57k4SuehDGcavitYtt3q5RFFgNbN5t744FDzth6BhF5zC
 DJz4keiksANYg/jVHMT2U6Oic/qHKpifaojDkl/3jNnnkS6pmHNdPaI3nZMY2FM2DBIjRU42sAn
 U1XGJfZqVwN6/Cs0=
X-Received: by 2002:a05:6000:1568:: with SMTP id
 8mr33739811wrz.76.1637260281110; 
 Thu, 18 Nov 2021 10:31:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6sH0p/4kUx1Av/KPBYdOnfQnepgaT1UCpFASoKiVkTym9dcbtKZIjjy5eSx2Ymnjrem3ICg==
X-Received: by 2002:a05:6000:1568:: with SMTP id
 8mr33739769wrz.76.1637260280874; 
 Thu, 18 Nov 2021 10:31:20 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k187sm9366932wme.0.2021.11.18.10.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 10:31:20 -0800 (PST)
Message-ID: <25ca79c9-b08b-741d-43ae-cfe80f6ce588@redhat.com>
Date: Thu, 18 Nov 2021 19:31:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: device-crash-test
To: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <CAFn=p-Z+mfnVdit=0ECS-Gc1tExHvR2X4Pr26b0bGtXxyaCPAQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAFn=p-Z+mfnVdit=0ECS-Gc1tExHvR2X4Pr26b0bGtXxyaCPAQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 18:55, John Snow wrote:
> I finally squashed all of the bugs and got a clean run of
> device-crash-test with a full build of QEMU, over 182,000 individual
> test cases.
> 
> Here's all of the legitimate failures I saw:
> 
> CRITICAL: failed: binary=./qemu-system-x86_64 accel=kvm machine=none
> device=sgx-epc
> CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine none,accel=kvm
> -device sgx-epc
> CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
> Object 0x55b1c9dcad90 is not an instance of type generic-pc-machine
> CRITICAL: exit code: -6
> 
> CRITICAL: failed: binary=./qemu-system-x86_64 accel=kvm machine=x-remote
> device=sgx-epc
> CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine x-remote,accel=kvm
> -device sgx-epc
> CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
> Object 0x559b43269d40 is not an instance of type generic-pc-machine
> CRITICAL: exit code: -6
> 
> CRITICAL: failed: binary=./qemu-system-x86_64 accel=kvm machine=microvm
> device=sgx-epc
> CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine microvm,accel=kvm
> -device sgx-epc
> CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
> Object 0x55760ca941b0 is not an instance of type generic-pc-machine
> CRITICAL: exit code: -6
> 
> CRITICAL: failed: binary=./qemu-system-x86_64 accel=tcg machine=none
> device=sgx-epc
> CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine none,accel=tcg
> -device sgx-epc
> CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
> Object 0x557a52333d90 is not an instance of type generic-pc-machine
> CRITICAL: exit code: -6
> 
> CRITICAL: failed: binary=./qemu-system-x86_64 accel=tcg machine=x-remote
> device=sgx-epc
> CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine x-remote,accel=tcg
> -device sgx-epc
> CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
> Object 0x55bbcd596d40 is not an instance of type generic-pc-machine
> CRITICAL: exit code: -6
> 
> CRITICAL: failed: binary=./qemu-system-x86_64 accel=tcg machine=microvm
> device=sgx-epc
> CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine microvm,accel=tcg
> -device sgx-epc
> CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
> Object 0x55ca35c081b0 is not an instance of type generic-pc-machine
> CRITICAL: exit code: -6
> 
> CRITICAL: failed: binary=./qemu-system-i386 accel=kvm machine=none
> device=sgx-epc
> CRITICAL: cmdline: ./qemu-system-i386 -S -machine none,accel=kvm -device
> sgx-epc
> CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
> Object 0x55d0e0a03d90 is not an instance of type generic-pc-machine
> CRITICAL: exit code: -6
> 
> CRITICAL: failed: binary=./qemu-system-i386 accel=kvm machine=x-remote
> device=sgx-epc
> CRITICAL: cmdline: ./qemu-system-i386 -S -machine x-remote,accel=kvm
> -device sgx-epc
> CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
> Object 0x564648250b30 is not an instance of type generic-pc-machine
> CRITICAL: exit code: -6
> 
> CRITICAL: failed: binary=./qemu-system-i386 accel=kvm machine=microvm
> device=sgx-epc
> CRITICAL: cmdline: ./qemu-system-i386 -S -machine microvm,accel=kvm
> -device sgx-epc
> CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
> Object 0x55bef7a235b0 is not an instance of type generic-pc-machine
> CRITICAL: exit code: -6
> 
> CRITICAL: failed: binary=./qemu-system-i386 accel=tcg machine=none
> device=sgx-epc
> CRITICAL: cmdline: ./qemu-system-i386 -S -machine none,accel=tcg -device
> sgx-epc
> CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
> Object 0x5608b9fecd90 is not an instance of type generic-pc-machine
> CRITICAL: exit code: -6
> 
> CRITICAL: failed: binary=./qemu-system-i386 accel=tcg machine=x-remote
> device=sgx-epc
> CRITICAL: cmdline: ./qemu-system-i386 -S -machine x-remote,accel=tcg
> -device sgx-epc
> CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
> Object 0x558306c9cb30 is not an instance of type generic-pc-machine
> CRITICAL: exit code: -6
> 
> CRITICAL: failed: binary=./qemu-system-i386 accel=tcg machine=microvm
> device=sgx-epc
> CRITICAL: cmdline: ./qemu-system-i386 -S -machine microvm,accel=tcg
> -device sgx-epc
> CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
> Object 0x55e041f465b0 is not an instance of type generic-pc-machine
> CRITICAL: exit code: -6

Aren't these fixed by
https://lore.kernel.org/qemu-devel/20211109175021.17813-1-pbonzini@redhat.com/
?


