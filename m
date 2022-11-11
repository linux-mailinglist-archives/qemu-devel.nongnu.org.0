Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ADE625B0C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:15:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otTsG-00019H-CW; Fri, 11 Nov 2022 08:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otTsD-00017Q-5T
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:15:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otTsB-0003sb-HI
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:15:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668172506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LHJUAfxmBH81MrQrVwdQNyDIovUe0mwG0MIyfRKwM3g=;
 b=Tn/ENnOM53GgllAcMcJwYVzCGhU3Y8jnXVI3ZjaNnkxz26QpzLw64t0YLDdIWsbCXHNUn1
 sqQ0neMgZsS90dVLJoO8gkKqA3ExCCANAz91Rm1Mj8mcYUQDjANsrksxUwTRWsBHAJ/MqY
 NWr27vDbaFI48RUGPQ0jv2H8onwQY54=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-59-IZDE6wG5OJOpcdifPoZcZA-1; Fri, 11 Nov 2022 08:15:01 -0500
X-MC-Unique: IZDE6wG5OJOpcdifPoZcZA-1
Received: by mail-wm1-f71.google.com with SMTP id
 186-20020a1c02c3000000b003cfab28cbe0so4387730wmc.9
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 05:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LHJUAfxmBH81MrQrVwdQNyDIovUe0mwG0MIyfRKwM3g=;
 b=HfiZv2OsFZSpdOK9OUO44QmuBnLKdOJas315L4ONkep4DJrmeWlsJPMKBpN2oPuSTD
 WjKQ6XPMAheq9dxT4L7ftbQs5IiasU33JPfBlNUElAUeFiBK1srBaE8YtpMZ2EWswuuT
 bgSv0pS/lonPPvilbK/JhK41cjCRQn3MTJ/oLTAJ+rq0E+N6JRB6hcOMzbFyYGcgmV0P
 kvHAPG9Kf92jVTsL9VQ5KOgm5tBeNPSJJMG6Qs2ah1Z9UsBgzVDvH7PQKtqr17Kd4To7
 TEOOdh/G9UvGueTvhCQ4vbNC7sPbjKP9zrKAfCVWDwqDq3mXTMl3K0NClym4kIk8+4YJ
 JXeA==
X-Gm-Message-State: ANoB5pk3ER6vC9Vr5ALnfhLaRMsgTRPtIZsmLDs9Dg5ia8nbjOPjd4+r
 3PXot7tzgWa9Qv3jvhNNgV04ZtSuEzNhlkq9HsMEHdHDU8tVzA79Kj/VmA7KyBeXVYySIhSqfQU
 IHVExybfzBCKJSjc=
X-Received: by 2002:a1c:4b0f:0:b0:3cf:4d14:5705 with SMTP id
 y15-20020a1c4b0f000000b003cf4d145705mr1252778wma.35.1668172500485; 
 Fri, 11 Nov 2022 05:15:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf736S1moUpXi9HqmcoSVfspKFoZRXkzz4ghtMy5bgqdAPTY9aAyAmuDJyJ12bZEHPY129oNlw==
X-Received: by 2002:a1c:4b0f:0:b0:3cf:4d14:5705 with SMTP id
 y15-20020a1c4b0f000000b003cf4d145705mr1252762wma.35.1668172500282; 
 Fri, 11 Nov 2022 05:15:00 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 r7-20020a05600c458700b003c7087f6c9asm8957300wmo.32.2022.11.11.05.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 05:14:59 -0800 (PST)
Message-ID: <99a89e48-768c-4cc2-ead4-d2014aec7d44@redhat.com>
Date: Fri, 11 Nov 2022 14:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: should ioapic_service really be modelling cpu writes?
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Xu <peterx@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu-daude@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <874jv6enct.fsf@linaro.org> <87zgcyd70g.fsf@linaro.org>
 <Y21+VFqKpF6LGz2C@x1n> <87r0y9d623.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87r0y9d623.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 11/11/22 13:26, Alex Bennée wrote:
>       if (addr > 0xfff || !index) {
>           switch (attrs.requester_type) {
>           }
>           MSIMessage msi = { .address = addr, .data = val };
>           apic_send_msi(&msi);
>           return MEMTX_OK;
>       }


> which at least gets things booting properly. Does this seem like a
> better modelling of the APIC behaviour?

Yes and you don't even need the "if", just do MTRT_CPU vs everything else.

Paolo


