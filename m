Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995F3DB944
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 15:23:23 +0200 (CEST)
Received: from localhost ([::1]:53394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9STy-00008s-DE
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 09:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9SSW-00075p-KN
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:21:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9SSU-0005gt-Tz
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627651310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14vhNycF9afXoUDc28Sm69WCIZQBjpihKh/QD3r0cN0=;
 b=RgsIhZwaeeCDpQoBosctLfCJxemFCx91G6FIwab3cCr2swCil0q7dBiMmsnLo4RLybPEUC
 kGgH0PYUjnZp5F11oMmQlDujnc3R/Nn6nomO2ItjNXRheSXFYDuCjH4/ShrNsKX0kVXqS5
 DqjdowXvtP2aMIla8OtzWqBC6a1DosI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-XaEJINM8Mue53cmWKCT4Zg-1; Fri, 30 Jul 2021 09:21:49 -0400
X-MC-Unique: XaEJINM8Mue53cmWKCT4Zg-1
Received: by mail-wm1-f71.google.com with SMTP id
 a1-20020a7bc1c10000b0290225338d8f53so3257928wmj.8
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=14vhNycF9afXoUDc28Sm69WCIZQBjpihKh/QD3r0cN0=;
 b=k/5nxfBEdN61X2s2cYMw45fHWZjm4214XDYya0pZ5Dj7lPs4fidWRIoSjRXy2qmsNq
 T8QmD1OOKM4f6MJ34xkHS7glGn2gxn1uT3Y55vbB+3gu18FN+9pG3m+C0t1p1A7mhO59
 WBkwgbWFpXsHS+rRmmpD/OAFvOFbz43RLoDFREt9jwoUOduvSq4sEExMu4/HyiALuILh
 gew/XTXEeKYXMN/yCIJ9aSPqRRRQwUXPjEjLiJ5KK6N8W16QLGYa4aQ4XePKVzA4JPKf
 B6ughs1o7LQl50lTSHa9t/nr2PpQrf6sfkyC1NJwuaPQRNjQE/+2x3Sgtcn+npuaQ4es
 SiVg==
X-Gm-Message-State: AOAM5324uXCXAs9gFy9e6aaBmtuXJAXiheTdoansIZguCW1B/SOvi4Xs
 fZOuEHKPihtdSOz+dUM31s3iq3d+p/QMC8RIKThvYDFKewVk7gRWOGCfMduiHbO39aa0e4WstyP
 Iry8kgsp6HRZtDkQ=
X-Received: by 2002:a1c:2904:: with SMTP id p4mr2875717wmp.178.1627651308078; 
 Fri, 30 Jul 2021 06:21:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR0TNkyrHGVqekz/1N4GTbyaFYFDknynQr9Krx7hOZUEGzt9M6rJzO3Y03JWgVbxSE8Vx9AQ==
X-Received: by 2002:a1c:2904:: with SMTP id p4mr2875702wmp.178.1627651307967; 
 Fri, 30 Jul 2021 06:21:47 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id 19sm1945660wmj.2.2021.07.30.06.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 06:21:47 -0700 (PDT)
Subject: Re: [PATCH for-6.2 7/8] arch_init.h: Don't include arch_init.h
 unnecessarily
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <79ea0418-d943-f1ba-ab35-4f917fdab6df@redhat.com>
Date: Fri, 30 Jul 2021 15:21:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730105947.28215-8-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 12:59 PM, Peter Maydell wrote:
> arch_init.h only defines the QEMU_ARCH_* enumeration and the
> arch_type global. Don't include it in files that don't use those.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  blockdev.c                | 1 -
>  hw/i386/pc.c              | 1 -
>  hw/i386/pc_piix.c         | 1 -
>  hw/i386/pc_q35.c          | 1 -
>  hw/mips/jazz.c            | 1 -
>  hw/mips/malta.c           | 1 -
>  hw/ppc/prep.c             | 1 -
>  hw/riscv/sifive_e.c       | 1 -
>  hw/riscv/sifive_u.c       | 1 -
>  hw/riscv/spike.c          | 1 -
>  hw/riscv/virt.c           | 1 -
>  monitor/qmp-cmds.c        | 1 -
>  target/ppc/cpu_init.c     | 1 -
>  target/s390x/cpu-sysemu.c | 1 -
>  14 files changed, 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


