Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E4A45C81C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:57:19 +0100 (CET)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpti2-0008AK-41
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:57:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mptgp-0006ys-Qu
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:56:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mptgn-0004Kx-Ts
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637765760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Loe5pRV6JgcWAkFhbvRgEgE28QVtDVSQAfYH9NxT2hA=;
 b=b0y60Tv3mZrEWzMgqorjZwJBpK5CaaUYXouDCohhN2cBVaq4hM9n492nV8yQTKJb22pjWl
 nFVNWMZWIWZ+7jhHFcxbRmnf09pZAPnoskz9qz185Ag7Wws43uIuNFwM6i/8pkR+smjsyl
 1/hprcxagdc9NUW/Gv2wLuLsH5594mc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-OE0BJiwmO7-vPv3xZNoxqw-1; Wed, 24 Nov 2021 09:55:58 -0500
X-MC-Unique: OE0BJiwmO7-vPv3xZNoxqw-1
Received: by mail-wr1-f72.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so555829wro.21
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 06:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Loe5pRV6JgcWAkFhbvRgEgE28QVtDVSQAfYH9NxT2hA=;
 b=k/hhuq5fsfBfntm1WClZkAfqB2Y80c8uj3DbjgDCptKLNLaizP4w1f+wrexdKE+Nxl
 NrQWbznZd50QqJEAAK9SYclWuqFf/K/fw1cLPHek9L7/hHhrnO4L+8wKIE51rEN+1u2J
 fkm81uP16qatPYR7uVNSC19U0JaKZ6Qq7qnxND4uTL9VGC80ePN30zuBGPp3pbS0drTn
 ONo43cgvtKi11Nm8EwqxIhWt3XR+HLEYjZLGMOx8pW9a7Yi9GnjChyqVKG6h7xmTQrTC
 tViuHmV58Lpt6VA22NAJ34+QOW+KFJVg9QfDTg4PYwXP/r21WLs0q2W7oOui5nw1xHNE
 cZ3w==
X-Gm-Message-State: AOAM533SpoZSudrIkapB02TSG0jY5t3J+GyNfb3yhsBx6uZKsnwfDmA/
 FiXOUhk5N+c+9zKydkctjCtHX4YfrkW0075Peuw3bswX9tB2CJ1pEzWbqnMtLMkXkZco9hVCEPy
 u5KFqpzwQ9thUNP8=
X-Received: by 2002:a5d:4084:: with SMTP id o4mr20411172wrp.47.1637765757008; 
 Wed, 24 Nov 2021 06:55:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqx6Ohf9bD+0ms4aL2A824uJXDWlDpqke4N4bANbSXjdctw4T9nSJHNmq8qVI8qQad5ZIHWw==
X-Received: by 2002:a5d:4084:: with SMTP id o4mr20411138wrp.47.1637765756810; 
 Wed, 24 Nov 2021 06:55:56 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id q26sm58376wrc.39.2021.11.24.06.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 06:55:56 -0800 (PST)
Message-ID: <cc136013-2632-c149-d258-e2e7f964b07f@redhat.com>
Date: Wed, 24 Nov 2021 15:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Give the fosshost.org VM a purpose or a retirement
To: Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <CA+bd_6JS0t_COHiw2Y3Ej1gAeOGVTScNoS-=Seo+7udAe5wqZw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CA+bd_6JS0t_COHiw2Y3Ej1gAeOGVTScNoS-=Seo+7udAe5wqZw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 15:16, Cleber Rosa wrote:
> Hi,
> 
> Fosshost.org was kind enough to supply the QEMU project with a public
> VM hosted by them.  The original use case we anticipated was to set up
> a GitLab CI runner, because we assumed the VM was KVM capable, but
> that turned out not to be the case.
> 
> So, at this point, adding it as a GitLab CI runner would not add any
> significant improvement over the shared runners already provided, and
> it would require more maintenance effort.
> 
> If there are any ideas for making use of this resource, and volunteers
> to configure and maintain it, please let me know.
> 
> Otherwise, it seems fair to relinquish the resource back to Fosshost.org.

Cc'ing Warner, since for FreeBSD testing we use Cirrus-CI (via
libvirt-ci and have sometime hit GitLab timeout). Series [*]
provides most of what is required to register a FreeBSD runner.
It could be useful to run the user-mode tests.


