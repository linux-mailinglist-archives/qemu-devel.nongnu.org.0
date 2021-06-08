Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EB439F74A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:05:32 +0200 (CEST)
Received: from localhost ([::1]:36890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbQA-0008JS-Hm
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqbOd-0007Rz-HJ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqbOb-000209-8y
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623157432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1P3E+1SFe+knHstUP96mLqp7mIZlytc/2mavrUy9NyE=;
 b=ianVQaHRzZwTN8v1hTQPSClCOh1KFyisFMQ2zwSAD5sbwzWFloH8tge7WXbJ9QjNZCYIYl
 FsVpOePLxmGfQhBDwBI/EYlFkSyQARnt6UwVodRtOlRq1HES7086B1ZAmO3NOELBkLt1/M
 KfmbHutWlprZTgKQsdS5bCPw67aUtrA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-Mkls8AzyOgaqNwxpEiv0IQ-1; Tue, 08 Jun 2021 09:03:50 -0400
X-MC-Unique: Mkls8AzyOgaqNwxpEiv0IQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 e11-20020a056000178bb0290119c11bd29eso4556052wrg.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 06:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1P3E+1SFe+knHstUP96mLqp7mIZlytc/2mavrUy9NyE=;
 b=pXYOt37Cv7UKIzpJE8bBuU4VvWzPIZVtlirfcYJJWjUk8QalDeZT32viUV1P2vd4ZP
 05eYLyUcd2U4MTS8U9Nsk/Fskv8rsYwHdk0u7lVl/ibGc0Q705SNU4qquvwm0+06A8Df
 NwfiaXq4Ts4Og+NY2AoKGQeCqzT4cGqxjwmSNtigUjTPlrINOhqX/woMjZ0dOhrwo/AU
 q58XNaFU6zOPH4JYGV+HgZo0d+KGs71iLexcpmmauP//4FXZ5R1wxhFpQBUqhTpR/5qq
 VLWbqAcuz5CEChRn6xF8ZWnVfcpSoKPmobVe8GGTvt++ZQj2w93ri+yc3GI09/KJEtZX
 KIKA==
X-Gm-Message-State: AOAM532Ozj1QUmrUBHZeli5RnuP98wBIpQHop898LoO/HomxkfOh47N5
 eqp5NkBTk7TS/UUNwKPw3SiInwptYifro1UpoRmvMD8ircHBGLgAuk3qOgMRwHGF58c6oHeNxCd
 kvD1h2c6ToH+F0/4=
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr22668237wrr.71.1623157429711; 
 Tue, 08 Jun 2021 06:03:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7ynvRY8NAU1J/IqPtLr+r8h2B+8WJ4myC93+S5g/Bn09eGSM+RWG1jH7Iq3MfAqc3Xf+IzQ==
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr22668212wrr.71.1623157429529; 
 Tue, 08 Jun 2021 06:03:49 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id k5sm21397738wrv.85.2021.06.08.06.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 06:03:48 -0700 (PDT)
Subject: Re: [PATCH v16 98/99] configure: allow the overriding of
 default-config in the build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-99-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9ca40566-0390-e807-0cd5-2f21c897c35e@redhat.com>
Date: Tue, 8 Jun 2021 15:03:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-99-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 5:53 PM, Alex Bennée wrote:
> While the default config works well enough it does end up enabling a
> lot of stuff. For more minimal builds we can pass a slimmed down list
> of devices and let Kconfig work out what we want. For example:
> 
>   ../../configure --without-default-features \
>     --target-list=arm-softmmu,aarch64-softmmu \
>     --with-devices-aarch64=(pwd)/../../configs/aarch64-softmmu/64bit-only.mak
> 
> will override the aarch64-softmmu default devices to one of our own
> choosing. Currently there are two configs provided:
> 
>   - 64bit-only, to build without any 32 bit boards at all
>   - virt, even more minimal set for --disable-tcg builds
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20210528163116.31902-1-alex.bennee@linaro.org>
> 
> ---
> v2
>   - remove extraneous cc
>   - dropped pathname from config
>   - add virt.mak config
>   - drop ZYNQMP from the 64bit only build
>   - test -f the --with-devices-FOO file
> ---
>  configure                              | 20 ++++++++++++++++++++
>  configs/aarch64-softmmu/64bit-only.mak | 10 ++++++++++
>  configs/aarch64-softmmu/virt-only.mak  |  8 ++++++++
>  meson.build                            |  3 ++-
>  4 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 configs/aarch64-softmmu/64bit-only.mak
>  create mode 100644 configs/aarch64-softmmu/virt-only.mak

Shouldn't we also move default-configs/devices/X.mak to
configs/X/default.mak and adapt ./configure (instead of having
configurations spreads in multiple directories)?


