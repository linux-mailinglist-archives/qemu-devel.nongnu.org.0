Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2653474616
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:12:07 +0100 (CET)
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9TK-0000JI-OQ
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:12:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mx9Rq-0005zN-JE
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:10:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mx9Rn-0002aZ-M1
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639494630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UELiAFa06bqfv3MYs61cRJQVlzvTiqq6BAXaN/4l6zg=;
 b=ecUPHb6VLP556tIX0IB/zWiZkC/6cvuX6USGaYwCiGdiR9QjbB1w4Os2B4TmMY9XnS4h3v
 XVHV32wRtU1l0j0ogoA+eOGEU3fD3kjmoJ0KVrCaNcvCm+RuGFxWth/tiHCBGLlPEajhEG
 QZ9l5NYjl22WQLjQf5HOWv9UzTqcr70=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-N9pfDExpNJWHDkHeAap04g-1; Tue, 14 Dec 2021 10:10:29 -0500
X-MC-Unique: N9pfDExpNJWHDkHeAap04g-1
Received: by mail-wm1-f71.google.com with SMTP id
 201-20020a1c04d2000000b003335bf8075fso11443054wme.0
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 07:10:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UELiAFa06bqfv3MYs61cRJQVlzvTiqq6BAXaN/4l6zg=;
 b=I4rh9TkVpyGecqmj86gneTD/q9QCQArJjtT3XV32X3S0Eg0ou61mVXZJ/B+yM5K0aL
 V56AgDP5QqEU6eu8gAdzk/aYA1VmtnrZbibYbyRcLnwFeLodjeeiG4cXmQ83rUtG4jaR
 sAxvAo9ArN1b19gJIhbDKOea7Da87S/dSF/YGWSXqmurHSrIqj1PkqaxVOC7FRf95Q1q
 f+VXetNBLSozwGPqYZbwOyycWsnUP8njbcisaOMUIMezMJYYSYYhBbb0LpYCa0Eb2fK5
 nU+ZphrnpNAoEcLemsj0AeJFhtyRtWgOzWMj40gQj58XP+BDcwYYA6Wyf5RbhTsPRms3
 Msdw==
X-Gm-Message-State: AOAM533SY0byyY7k41WRrFJImRX1OK+76LIGx3eXIGtmFJpJYEd/Cz84
 CmeQo/DRWa3j97JIXxGNRuEPcXUxIx5ktfqXlIYuNg0oKbFFI+TAXD9xMOQJbC9LsT0EnQSUnud
 CZgTBeI/Tv8CImAo=
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr7610382wmh.18.1639494627926; 
 Tue, 14 Dec 2021 07:10:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxztKAzfcTFcfYtt+oNUBUt/vAZ8WLzmHfx4Ak40gupQbwiwIkxpYpnzGmbg7nT6yjAiMzasQ==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr7610334wmh.18.1639494627626; 
 Tue, 14 Dec 2021 07:10:27 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id q1sm127858wra.82.2021.12.14.07.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 07:10:27 -0800 (PST)
Message-ID: <5e98f893-d69f-06e2-cb20-65a770058d9a@redhat.com>
Date: Tue, 14 Dec 2021 16:10:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0] hw: Add compat machines for 7.0
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20211208170241.110551-1-cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211208170241.110551-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.962, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/21 18:02, Cornelia Huck wrote:
> Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)

This is a good idea to add all new compat machines
as a single patch.


