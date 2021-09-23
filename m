Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE1C416021
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 15:38:29 +0200 (CEST)
Received: from localhost ([::1]:48378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTOvk-00085o-Ay
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 09:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTOto-0006Yx-5x
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTOtj-0000ki-Ax
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632404181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BhP0jMNZvguZ2zXFiPgplmpsCZ4iaSShiL51nud58qA=;
 b=WqIfK1QdMUv1Rnz7XTroaHAezp8zl/IC7L3/wHT8HYFD3KwPl9Bpy8joV7bqCxUVqjBs0u
 VyNgE9krJytTkSv1Wsr7cYm0ifITTRg2w/Oq667/yG0tN7+2jeVFVmVm1+sx2CfSTt/XZL
 QiqH6woj4sQyBqo2N1ZDWu6sUQuV3FU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-windbexMMte1-Iz2qRWP_w-1; Thu, 23 Sep 2021 09:36:19 -0400
X-MC-Unique: windbexMMte1-Iz2qRWP_w-1
Received: by mail-wr1-f70.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so5221024wrh.0
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 06:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BhP0jMNZvguZ2zXFiPgplmpsCZ4iaSShiL51nud58qA=;
 b=0VoJNLXqSzS3AmeXsDfHA6u99JsGD0UYL7w7Q8+GWxFVfTxRDs/S+DFa42PYoDH9eQ
 i+brjDG8/8TYkqlMLlSA63LthtVG4VgLoGErsnvm1kfQG9kqhosWUvhx76eOYha31i8Y
 yE6Mo/Ytaq+e8ATwRyvP1hxFaDUHYSxiD3Kpz2TnN/l8VnKGYd8zHBVz4oppbFMbhi26
 V/FJG1N+tFZprT2FnFNIfzSdzBf2Wz5LPhJC1yZfeUMRh5h3S7FVJVfMv9g8AWE4keS/
 FmG+3Wa8QAwt1o+8GqAE+jCaLRaNq5l3ISpc/WeZpbIMZ7fLBJIgyoePxQKHuaxIxqVS
 h3Fw==
X-Gm-Message-State: AOAM533WKuVMv62YEFp1Pio61LqiBiEvSr1YyhwxcWHu82TzzIU+tYzO
 b1r/eBHF+ufICnMKme+HJszsVcpCHK9nfosiGi/t3XIwrqWKa7ExwwuBbJv+/V3QXZnA7svgzSn
 PWs0+cCuG0Et0uGM=
X-Received: by 2002:a05:6000:3:: with SMTP id h3mr5208616wrx.408.1632404178536; 
 Thu, 23 Sep 2021 06:36:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuGpTn5B3RsOA04W5lkfrXFNmoDbZijkFwtlHlWo0jsIIkiPLs70Z/LCDbMpIsB1B/YNSMMw==
X-Received: by 2002:a05:6000:3:: with SMTP id h3mr5208577wrx.408.1632404178290; 
 Thu, 23 Sep 2021 06:36:18 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z17sm5485990wrr.49.2021.09.23.06.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 06:36:17 -0700 (PDT)
Message-ID: <1702cda3-cc83-2026-89b4-a9eb6d7a8cd5@redhat.com>
Date: Thu, 23 Sep 2021 15:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/6] Improve consistency of bus init function names
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210923121153.23754-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210923121153.23754-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.034,
 DKIMWL_WL_HIGH=-1.473, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alberto Garcia <berto@igalia.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 14:11, Peter Maydell wrote:
> Currently we have a bit of a mishmash of different function
> names for bus creation. There are two basic patterns: you
> can have a function that allocates and returns a new bus
> object; or you can have a function that takes a pointer to
> a bus object and initializes it in-place. We have to some
> extent a convention for those: the allocate-and-return
> function is 'foo_new()', and the 'init in-place' function
> is 'foo_init()'. However many of our bus creation functions
> don't follow that; some use 'foo_new' vs 'foo_new_inplace';
> some use 'foo_new' for the in-place init version; and
> the bottom level qbus functions are 'qbus_create' vs
> 'qbus_create_inplace'. This series tries to bring at least
> scsi, ipack, pci, ide, and qbus into line with the
> _new-vs-_init naming convention.
> 
> The other issue with bus creation functions is that some
> of them take a 'name' argument which can be NULL, and some
> do not. Generally "pass in a specific name" should be the
> rare case, but our API design here is easy to misuse, and
> so a lot of callsites (especially for i2c, sd, ssi) pass
> in names when they should not. Untangling that mess is
> going to be tricky (see other thread for more), but as
> a first step, this series proposes a split between
> foo_bus_new() and foo_bus_new_named() where the latter
> takes a name parameter and the former does not. I do
> this only for scsi (and implicitly ide, whose ide_bus_new
> function already doesn't take a name argument) for the
> moment, as the other bus types have more of a mess of
> "pass name when they should not" callsites, so I didn't
> want to put in too much work before finding out if we
> had agreement on this as a naming convention.
> 
> There are definitely more buses that can be cleaned up
> to follow the init vs new convention, but this series is
> already touching 70 files and trying to do every bus in
> one series seems like a recipe for merge conflicts.
> So this seemed like enough to be going on with...
> 
> thanks
> -- PMM
> 
> Peter Maydell (6):
>    scsi: Replace scsi_bus_new() with scsi_bus_init(),
>      scsi_bus_init_named()
>    ipack: Rename ipack_bus_new_inplace() to ipack_bus_init()
>    pci: Rename pci_root_bus_new_inplace() to pci_root_bus_init()
>    qbus: Rename qbus_create_inplace() to qbus_init()
>    qbus: Rename qbus_create() to qbus_new()
>    ide: Rename ide_bus_new() to ide_bus_init()

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


