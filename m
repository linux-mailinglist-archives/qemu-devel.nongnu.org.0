Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4223A42ED7E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:22:04 +0200 (CEST)
Received: from localhost ([::1]:51548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJPf-00035Z-AD
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbJBi-0005K1-Gf
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbJBg-0001Ou-0H
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634288854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dh/DdeiIIi+QKQ4vQK/+WvhPVT7hMh7GiuVUQRO7x+A=;
 b=dqcZGHo93oV9eK4MYw5JE37ataPoGor80COk0KxD3vvQd3BYQV1vYgLIQjLiTIwRXpqshS
 y+SKxbb5Qqa1wPBLB7pfPRvjNERniTKEgQ/OsdXGN3d5gkIHKrGW5tmGEftlIVZ3nu9kox
 PH7jCOfOIN4+bXr9zmwMspYlyFLW/0U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-Jh95jpvyOu2WxNuoJWpbOQ-1; Fri, 15 Oct 2021 05:07:33 -0400
X-MC-Unique: Jh95jpvyOu2WxNuoJWpbOQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 s22-20020a1ca916000000b0030dcdcd37c5so632139wme.8
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 02:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Dh/DdeiIIi+QKQ4vQK/+WvhPVT7hMh7GiuVUQRO7x+A=;
 b=RoiCNGkOe8EzI9R7nRdXYssUtvpuChPUDAirnrRgwEdRbHi8pcSYuD46QOQpOa2liz
 NwV3ueGB4o6nrCMQpYDQiE4mCEbEMjq5dQFtB7+jTy4fl5idBxc22aRnXLLe4T/EkJiX
 EdRBTzVm/GE1mnKZZpEFQ677P6SPLXrKEuhvtHijzIG0itRrB9XXekCkOaZ32zf1rXfy
 n1Wv0ULgoxbr7mezGB9TiDJAbbAsvoLNovgZGgeU1Vx1weW2ot/GSS4MICTtqvBskITM
 wPsSTpk5S1pNPA+reCArJ0OZ04ep5kA4R+8qyAAkccDJKy1auveWfCpZ3DB0258hAwM2
 t8Cw==
X-Gm-Message-State: AOAM531UgMJi8z6vMC3bPNKAhweKpl/3RySiNGHAYfinkxoqCVulDV4r
 67jDXBhAVaRV0d1OckHsdiervxVwrHJWjdtCsba8u1R4R2U8QIAFTtkcDR1aLIUVTDr+FX8GqcB
 /tgj60msCAgXV7UE=
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr24617032wmq.25.1634288852535; 
 Fri, 15 Oct 2021 02:07:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA44fJ1xO+yEBAodej1cXvWJstpTMZei3zjs6BlST0V6BHQpB+9eQky8qUvB672IPsIsBs0w==
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr24617007wmq.25.1634288852327; 
 Fri, 15 Oct 2021 02:07:32 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id t4sm4263792wro.1.2021.10.15.02.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 02:07:31 -0700 (PDT)
Message-ID: <70d31ba1-e8fd-7efe-4fae-dc86c179a9a8@redhat.com>
Date: Fri, 15 Oct 2021 11:07:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] tests/acceptance: Add a test for the bamboo ppc board
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211015090008.1299609-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211015090008.1299609-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-ppc@nongnu.org, clg@kaod.org,
 Cleber Rosa <crosa@redhat.com>, edgar.iglesias@gmail.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 11:00, Thomas Huth wrote:
> The kernel and initrd from the "Aboriginal Linux" project can be
> used to run some tests on the bamboo ppc machine.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS                    |  1 +
>  tests/acceptance/ppc_bamboo.py | 39 ++++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 tests/acceptance/ppc_bamboo.py

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


