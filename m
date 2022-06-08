Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D711C54382D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:57:39 +0200 (CEST)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyy3u-0002NS-TN
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyy1F-0000wR-41
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyy1D-0007lt-Ga
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654703690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtYXAya6ud65ttRBoOWWrlc1MbmNiiop6K/KIFml8PI=;
 b=PFTnALQ9pnR7eXSQUU6KJpIz1zAouzbbMsRf7ruJMSIfSJKZMYIqzWcZltTPcNSkF+nILb
 KThUYSSLxAvKjDcAUGkMnspGO6A0C/6NJMMPVmCr7xB+bySz0uASVKGeOMQ6Nsf5rzU9/u
 9kuCjOYs8nBy7HUdPc/DV3+m0EBFCHA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-hdgAwbHaOiurzD3cVaSmGQ-1; Wed, 08 Jun 2022 11:54:49 -0400
X-MC-Unique: hdgAwbHaOiurzD3cVaSmGQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 p7-20020a170906614700b006f87f866117so9612191ejl.21
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 08:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QtYXAya6ud65ttRBoOWWrlc1MbmNiiop6K/KIFml8PI=;
 b=aSaa7DaMZkqlFruxVeUhFbavyk0uDrFHh3LR9zsDehnDEUjt/nrLdw5V6xif9hPtw9
 mg2zzygmujFKnBS7hXLhOtSnDS2qW1pW9rYtg6qCk4/fRKARt/WUT3ktU2Ybm6rKihRy
 FZIS55UcIFroh96lxmiq/zSPRPHNE6GDrWQNXG77MMg22K8/z/iUM1hg5z7Ii7iz4/Sh
 IUzzWiYZkKbBTJpOdL7AmDIbToOqVqzrFS3fPk9q6j0GNiJwbTY2treIpHM0yzCdLlDl
 G2KlzQkKNKdHQXRyixG2u6uBkNrOPBVRBw6xbgIYTLC9hErlFgec4dM304MOzjOdvend
 oX8w==
X-Gm-Message-State: AOAM533S23L49tiDdi0Rqzx/+asClpld/2RmCV3ioxTvE3Gq0q5GGczQ
 DM3a30dvXQB8A2nK3tuuygUGLP07wjpuYl9JMqSvsaUuyP0GcJ5ynawfvW74X6mCr154ylilFwN
 ZKVtKk3VqdOGh/w4=
X-Received: by 2002:a50:fc10:0:b0:42d:cbd2:4477 with SMTP id
 i16-20020a50fc10000000b0042dcbd24477mr39759342edr.363.1654703688384; 
 Wed, 08 Jun 2022 08:54:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyxmNUM8s6u48hXHHo7+AH8mu58M58N6lizd254YPLCEpezsTByxJwfuRfldRC7sTAZvAxEg==
X-Received: by 2002:a50:fc10:0:b0:42d:cbd2:4477 with SMTP id
 i16-20020a50fc10000000b0042dcbd24477mr39759330edr.363.1654703688156; 
 Wed, 08 Jun 2022 08:54:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 u17-20020a056402111100b004316f94ec4esm4758387edv.66.2022.06.08.08.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 08:54:47 -0700 (PDT)
Message-ID: <2f19b91a-e641-9d20-0158-c7bb71693ad5@redhat.com>
Date: Wed, 8 Jun 2022 17:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] configure: ignore --make
Content-Language: en-US
To: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220607104908.1263321-2-pbonzini@redhat.com>
 <75ed39ec-ed5c-a9b6-c51e-94e26a333316@eldorado.org.br>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <75ed39ec-ed5c-a9b6-c51e-94e26a333316@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/22 16:21, Matheus Kowalczuk Ferst wrote:
> On a clean build on FreeBSD with this patch, I got:
> 
> ../meson.build:3641:0: ERROR: Key MAKE is not in dict
> 
> So it seems that we need to remove the use of MAKE in meson.build too.

Oops, yes.  That's the typical "forget git commit --amend before sending 
out" mistake for me.

> Also, we will not have this error at configure-time anymore, but I 
> suppose that *BSD users will identify the problem if they try to build 
> with non-gnu make.

Yeah, my guess was that "try ./configure && make" with GNU Make 
installed is the more common failure mode, since QEMU is certainly not 
the only package that requires GNU Make.

Alternatively, I can leave in the check for GNU Make, or move it to 
meson as a "now type "make" to build QEMU" kind of message, and still 
remove the unused --make option.

Paolo


