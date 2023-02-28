Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B4D6A53E7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 08:49:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWujf-0008Qw-0h; Tue, 28 Feb 2023 02:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWujd-0008Qo-PB
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 02:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWujb-0000ge-Tb
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 02:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677570554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZiUfsADUzruFZXpDB4J4uXPtM0A/YxNLYWsjw+1AOZ4=;
 b=AqMs+jXASDuvRsYLsm9vBqXOpqG+VFdEHzoQWsyAx9ppo20el6MZPJi2oqcm5zOHvklxTJ
 JR1DwG/YdOGeblzPz+bTZG8Tr7ioz5y6C4unb237VaoNBsqbmwDJ121XAsUpX3b2brnbQi
 yOp/YY9d1h7FLuQVvueYPO3CVNHHqYE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-110-Q5vNHdEiOrCcvIzRUdPDFQ-1; Tue, 28 Feb 2023 02:49:12 -0500
X-MC-Unique: Q5vNHdEiOrCcvIzRUdPDFQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j32-20020a05600c1c2000b003e9bdf02c9fso6538529wms.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 23:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZiUfsADUzruFZXpDB4J4uXPtM0A/YxNLYWsjw+1AOZ4=;
 b=mBD9omYfZjmuF5mVUwGriH6VbegFTtlj66hpzDVx9QaFsT67+9Mxpwro2G5VpBq0ro
 PHYldxIEYAB9HAlNQcq7fDr74Io3mchOmn9ZgW+GC5EkF9gSSeBiT7ldeV14Ii35XQfQ
 T2lhNmbqEzzdIhKUQKHvKGC+V/lYaVMS04jO1be5s3SyF3h127AOGx74ZHrsqxQme7ag
 8F28hbfM5jK4QMFL0VGPEqohb4LuVUu+x56wVIKQjLUSP52v77OM87LVJKzYNQk1iTj3
 /yR+yfoWeWF0lKpo2LFO+t66omItr+08xRJ6+msbZ1J4jEceaZZLkK6YmWdZj3UqYxJu
 oBAw==
X-Gm-Message-State: AO0yUKXxt1qH9h7HCzNQEeJ5SJm5gMPfuTOGqfk+0kNe7RQM4vsIucG9
 HsfzpMP1UlRwRc+GTa0H3l4pVCJSbxgEsu8bkoh/YWWqUYVhLdUZ+OL9F1yicVqlIJBb0kb5l4u
 8j30ZhWXePB5+WAo=
X-Received: by 2002:a05:600c:3b26:b0:3ea:f05b:50cc with SMTP id
 m38-20020a05600c3b2600b003eaf05b50ccmr1675996wms.8.1677570551834; 
 Mon, 27 Feb 2023 23:49:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9+Lj7WQrfp82VEPq525cyJkv1tNUqBhsPtcg5W6a+r1jgDEKuIymCq/mXAXSpAaDp6fX67sQ==
X-Received: by 2002:a05:600c:3b26:b0:3ea:f05b:50cc with SMTP id
 m38-20020a05600c3b2600b003eaf05b50ccmr1675985wms.8.1677570551536; 
 Mon, 27 Feb 2023 23:49:11 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de.
 [109.43.177.75]) by smtp.gmail.com with ESMTPSA id
 l16-20020a5d6690000000b002c559626a50sm8844011wru.13.2023.02.27.23.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 23:49:10 -0800 (PST)
Message-ID: <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
Date: Tue, 28 Feb 2023 08:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230227150858-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>> I feel like we should have separate deprecation entries for the
>> i686 host support, and for qemu-system-i386 emulator binary, as
>> although they're related they are independant features with
>> differing impact. eg removing qemu-system-i386 affects all
>> host architectures, not merely 32-bit x86 host, so I think we
>> can explain the impact more clearly if we separate them.
> 
> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> a superset.
> 
> Removing support for building on 32 bit systems seems like a pity - it's
> one of a small number of ways to run 64 bit binaries on 32 bit systems,
> and the maintainance overhead is quite small.

Note: We're talking about 32-bit *x86* hosts here. Do you really think that 
someone is still using QEMU usermode emulation
to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!

> In fact, keeping this support around forces correct use of
> posix APIs such as e.g. PRIx64 which makes the code base
> more future-proof.

If you're concerned about PRIx64 and friends: We still continue to do 
compile testing with 32-bit MIPS cross-compilers and Windows 32-bit 
cross-compilers for now. The only thing we'd lose is the 32-bit "make check" 
run in the CI.

  Thomas


