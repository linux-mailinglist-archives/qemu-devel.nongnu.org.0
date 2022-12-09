Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EA9648675
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 17:23:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3g85-0002O0-BS; Fri, 09 Dec 2022 11:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3g82-0002MC-B7
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:21:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3g80-0006LE-Fy
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670602895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=whtmpT+rZKKgfpRcuQqfZPsdFISH0CuO0IAkFSN0fik=;
 b=IrMsDFm75UZ7lH/a0tkPbAdOrLtbKks+qiShVKkICFXYteQHHfA4zw7r8tkijXv2CxKLsU
 0U4cdG9XrD1sOjsaEW219gAH2610LzxXEdg6HLMbuivQAd1VNXx8EZVKZ+aCXV8frYRqv+
 +cdI060t+ZYHTB0Nc4hYseKb1CtYbFY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-220-x8nJ9oxGOvuv60ivdUO8ww-1; Fri, 09 Dec 2022 11:21:32 -0500
X-MC-Unique: x8nJ9oxGOvuv60ivdUO8ww-1
Received: by mail-ej1-f72.google.com with SMTP id
 sc5-20020a1709078a0500b007c0ca93c161so3360051ejc.7
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 08:21:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=whtmpT+rZKKgfpRcuQqfZPsdFISH0CuO0IAkFSN0fik=;
 b=pj4eF90pi29DeTzMMPp0d2xyV2DEDq/KC9vD3A51USrj3pw6UHVTLa2IAQQ4UOpTU3
 o7bbVZrblek3+pRrMH/8k9Ll8rX/JkOZIPfuCNAzPicPcWReGddSTdbG6ZV6OfMLX9WW
 Uf1UYUq79JpaeOEmdvEFPZAS+DHBQw58B0pGj+Bp0/LS0HdXkmxygkvmrgbAJTejz/EO
 Nzt0oaCnYdorfwJz/0cHTpDhQcFUtGFZB9CCBYQ9SpwSkMr1pXsgD/aZweYZ4nm+QWJ3
 cNWj4ap/xHu0oTq0sUlMzTl984wt8ysIoajWQVssYg1U4X7UaTEHinlH+r8aIJ17lL69
 MAQQ==
X-Gm-Message-State: ANoB5plyAuob4d/lxZWZhGoccWoC+aqqO8O554gDkrVkg+TiWUMLMW6W
 AoFnQb5cyk0RstK2yFVIaLkjV53bDjJvm0+2BOGNwksOgSdrOSU8lYWe43HzF6PGeq1Gz/zFmmK
 +EpWX9OcTjZNq08o=
X-Received: by 2002:a17:906:917:b0:78d:f455:b5de with SMTP id
 i23-20020a170906091700b0078df455b5demr6020554ejd.30.1670602891795; 
 Fri, 09 Dec 2022 08:21:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4nO+b+CkcD1wA0ZmpxEFw7iwl1KYUoF4hWX6RL4KpUB3PzM7oorSpYdF8b1O5QoRGQOg9b6w==
X-Received: by 2002:a17:906:917:b0:78d:f455:b5de with SMTP id
 i23-20020a170906091700b0078df455b5demr6020545ejd.30.1670602891544; 
 Fri, 09 Dec 2022 08:21:31 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 f17-20020a17090631d100b007add62dafbasm73949ejf.157.2022.12.09.08.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 08:21:31 -0800 (PST)
Message-ID: <c08a945c-d06a-8fba-0d1b-cb00a84e7419@redhat.com>
Date: Fri, 9 Dec 2022 17:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 27/30] build: move compiler version check to meson
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-28-pbonzini@redhat.com>
 <CAFEAcA_9wJy47nUpfkuonB_Fcu74MoC-14dj8dwi8i9HggWQKg@mail.gmail.com>
 <af52a8d4-839e-cb0e-abb1-a15782fb071c@redhat.com>
 <CAFEAcA-3koo6XksOObkxcUT+jjHbqqiUm31h62cho-GJv25C0A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA-3koo6XksOObkxcUT+jjHbqqiUm31h62cho-GJv25C0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/9/22 15:19, Peter Maydell wrote:
> I think really I just don't want a check that is "we happen to
> know that this particular option switch is supported only
> from these versions onward", because as soon as we say
> "OK, we can move forward to a clang 7 baseline" we either
> need to search around for an equivalent clever trick, or
> else we need to get rid of all this code anyway and have
> the version number check. So I don't mind how we do this
> as long as there's a straightforward bit of code that
> currently has "6 "and "10" in it and where we can change it to
> "7" and "11 "in future and it does what we intend.

No problem, I will keep the version number logic.

Paolo


