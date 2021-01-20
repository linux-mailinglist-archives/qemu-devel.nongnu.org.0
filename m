Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6080E2FD603
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:51:11 +0100 (CET)
Received: from localhost ([::1]:52972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2GhJ-0005br-O3
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Gd0-00049T-Ux
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:46:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Gcz-0005n7-CE
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611161200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=38BU2hj3lKmHOmv1OLKuPFwoqiOu0rbFIhV6iCZbHh0=;
 b=H2QOsOlVGx8donc8ps11+OsKrD3fFkqDl7LPNXHu8jWMBm4Qkq2zmGQG1+/DEAAQSt8u+X
 buFiPZpDsYWlV6KstCZwUeINufZ98GHiTP+l+W6oYm5jyKppuMynVp35LqYc3UdgJUSQq1
 gl5VV6s85uEgVfzmVgjYR/KyLJtG1BY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-n1VRtmjnMuCPEaL4xqlMWA-1; Wed, 20 Jan 2021 11:46:38 -0500
X-MC-Unique: n1VRtmjnMuCPEaL4xqlMWA-1
Received: by mail-ed1-f71.google.com with SMTP id f19so11314031edq.20
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 08:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=38BU2hj3lKmHOmv1OLKuPFwoqiOu0rbFIhV6iCZbHh0=;
 b=PXx2zKjZyePSuK4lCTsEwB8/4y7pR7lxdZ6x8Kr6Mja8tt8YzQGyvlZnq8OoljnBhc
 qONz4goXEDDEaLzDukRUyjvRX7R24z9AtVH0rGL09gJB3Mp9vJOxO1gwEk1RWmyabMM5
 tmjVKX6iRP1ut4kgj1ZDG3Ub14iEKH2draNt0DYHhheJAh7zL6EhwVw1lM/yBNxdkxj8
 IERhMjkv0N5l8NbKt5iClU2dpfKhnlYgv/gTU+ojqY/IwPenXXFLnai1PLhW/3lyUm6T
 hup5zlHfItlsB7I95nBC1/EDT8dKmXhXXHvHAE+OJzfcRDFlYE216MhhS2N96E+7kqLp
 pkxQ==
X-Gm-Message-State: AOAM532qQlmpfUOT22XqdtKaWHkOquOm7WZVp+dWXTdY4FwCdeeH8Ns+
 Yxu0MQOw+2EMeQww4lG94KTNl6cMoXiWle/T8lCjIY5N2p1KzCGceihV5GitdrEP+XmY57Pa3c6
 xI/Jt3qZ/n6y6alU=
X-Received: by 2002:aa7:dd16:: with SMTP id i22mr7844668edv.215.1611161196612; 
 Wed, 20 Jan 2021 08:46:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaZW8xYPFLjeD+7jq4y2yRPFB3LFGVlSSzsUs4FjyD29WNeXjvYP54RruOVkKVXtKLuoxqbQ==
X-Received: by 2002:aa7:dd16:: with SMTP id i22mr7844657edv.215.1611161196454; 
 Wed, 20 Jan 2021 08:46:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h15sm1120099ejj.43.2021.01.20.08.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 08:46:35 -0800 (PST)
Subject: Re: [PATCH 0/3] configure: Do not build TCG or link with capstone if
 not necessary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210120151916.1167448-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <260346c3-e1c1-5cb0-20d9-fb8a285e38f9@redhat.com>
Date: Wed, 20 Jan 2021 17:46:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120151916.1167448-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/01/21 16:19, Philippe Mathieu-Daudé wrote:
> We do not need TCG and capstone all the times. In some
> configuration we can leave them out.
> 
> Last patch emit a warning when a user explicitly select an
> accelerator that the build with not use.
> 
> Philippe Mathieu-Daudé (3):
>    configure: Do not build TCG if not necessary
>    configure: Do not build/check for capstone when emulation is disabled
>    configure: Emit warning when accelerator requested but not needed
> 
>   configure | 37 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 36 insertions(+), 1 deletion(-)
> 

Nice, but I have some remarks on how the patches are done. :)

For patch 1, which files are not compiled with the patch that were 
compiled without?

For patch 2, I think it's enough to add "build_by_default: false" to 
libcapstone (and while you're at it, to libslirp and libfdt).

Finally, I would prefer patch 3 to be done in Meson, right before the 
summary() call.  You can use config_all to check, like

if get_option('kvm').enabled() and not config_all.has_key('CONFIG_KVM')

etc.  This will also warn for e.g. --enable-kvm 
--target-list=sh4-softmmu, which could be considered an improvement over 
your patch.

Paolo


