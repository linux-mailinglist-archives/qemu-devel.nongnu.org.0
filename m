Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6484CFCA2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:23:04 +0100 (CET)
Received: from localhost ([::1]:33380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBSB-0007Xs-Ei
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:23:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRAM3-0003V8-PC
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRAM2-0004Km-91
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W198XCKyrEiFvXIDRqf0EdVpQ1H108txwr8Pw29Sh2A=;
 b=eCzqtkB0/Q5tH0rF3h7zx4MiTzYkvqx3y464ppSttpxeX++KHNsV8gXHjILmQEwQ0JIA92
 Qd1M8TCsvoLEpK1Tef3GbBrltz16iCI0aJQokBloS7U5dio/9dUEstWBvFPdyu9DckwkhS
 5fqFsI9DdbalIP3OecE8Hu4MBMTLW9E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-UeJL6Fj9Nb2TUc8NNzKnAg-1; Mon, 07 Mar 2022 05:12:35 -0500
X-MC-Unique: UeJL6Fj9Nb2TUc8NNzKnAg-1
Received: by mail-wr1-f69.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so4353911wri.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W198XCKyrEiFvXIDRqf0EdVpQ1H108txwr8Pw29Sh2A=;
 b=aOfLoZYqJkDuUQ5hMyz25bsG+6xaL3Xd0ci/kFBgH3UC+7m7myPGlyK+vgbW8Kpfvg
 iE5s5w9wn0EyT0i2elJwYeJ/Fsjdj3p9E9IgFu4lmjEhCyiY89H/eJdjW8g9lm76IPy0
 wX2l3tTxf9FcRx9sfd/mU1kIWtYG+FJzqIKgbK8kEmJQgjsV2n/7MBEb/sW5UapEyNmp
 uNKnJSZ7pAgH2SNfwijwzJPDAHPcJ8dWacPCx/0RKMiEs/McLFVKiiw6LNbv686q/X9f
 /TYEvrrDnrMkQL0DT+LrVdljIK9AQj0UN5LdrHE+ngpaSuegYhd1dMS5B2ty598VCJCm
 LYrg==
X-Gm-Message-State: AOAM530HwVAvuF8lEsU+lyjc84XV30Lgd9y0GwN9s3JpqvWF/y4MkGRY
 Ev+Z/3GJVx6k7aCAiF0nsUafxlkLba15BH7KWyE6OIBIEWvyTNuXYJzGB2mNCouVR94pPBEULOE
 A5vkuoPxumdd6AXY=
X-Received: by 2002:a05:600c:4615:b0:386:9f67:8c63 with SMTP id
 m21-20020a05600c461500b003869f678c63mr17637972wmo.12.1646647954570; 
 Mon, 07 Mar 2022 02:12:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxW85DSIM6D9YSpU20v6+ndkJDMc4hp5a7YROzTtfSawHlyvbQXfe5kDTLaxTN+zhWL2j3azA==
X-Received: by 2002:a05:600c:4615:b0:386:9f67:8c63 with SMTP id
 m21-20020a05600c461500b003869f678c63mr17637959wmo.12.1646647954389; 
 Mon, 07 Mar 2022 02:12:34 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c1d1000b003816edb5711sm19955037wms.26.2022.03.07.02.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:12:33 -0800 (PST)
Message-ID: <87bded92-530f-7cbe-eefe-2aefd5457957@redhat.com>
Date: Mon, 7 Mar 2022 11:12:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 12/18] tests: add migration tests of TLS with PSK
 credentials
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-13-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220302174932.2692378-13-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/2022 18.49, Daniel P. Berrangé wrote:
> This validates that we correctly handle migration success and failure
> scenarios when using TLS with pre shared keys.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   roms/seabios                        |   2 +-
>   tests/qtest/meson.build             |   7 +-
>   tests/qtest/migration-test.c        | 180 ++++++++++++++++++++++++++--
>   tests/unit/crypto-tls-psk-helpers.c |  18 ++-
>   tests/unit/crypto-tls-psk-helpers.h |   1 +
>   5 files changed, 190 insertions(+), 18 deletions(-)
> 
> diff --git a/roms/seabios b/roms/seabios
> index 2dd4b9b3f8..6a62e0cb0d 160000
> --- a/roms/seabios
> +++ b/roms/seabios
> @@ -1 +1 @@
> -Subproject commit 2dd4b9b3f84019668719344b40dba79d681be41c
> +Subproject commit 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9

Ah, here is the revert - so the previous change was by accident, indeed!

  Thomas



