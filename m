Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375513B09F6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 18:09:08 +0200 (CEST)
Received: from localhost ([::1]:50054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvixX-00074Z-9M
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 12:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lviu2-0008BR-E2
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 12:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lviu0-0006qU-KL
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 12:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624377928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BvuA4K5URdUlqc31Q2O9LRG/4aqlhQ1KN4ZORXbimp0=;
 b=OYch/AunxT/wEV0CRja3cjCocBJTnkwX/0IoC342fUh3t24fASeSbgHkio/jHm+WiEpZGZ
 xEoSYNqFmnAJlwHhpcREE8WH35b4RyTCNVkCNfk32XO2fHmQng2s45nWoNvYJKjC+rsLIB
 XIIuEqmBmabX6cWOcGifamTFDgc/Zik=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-SUUhVLBiNC2DtgW80GlJTA-1; Tue, 22 Jun 2021 12:05:26 -0400
X-MC-Unique: SUUhVLBiNC2DtgW80GlJTA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k3-20020a5d62830000b029011a69a4d069so9726215wru.21
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 09:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BvuA4K5URdUlqc31Q2O9LRG/4aqlhQ1KN4ZORXbimp0=;
 b=WMmD8ndKjQLcljoyvpzoqOv0NNDAtcFCj5a5SMMjBIqtj17uMscbvu81hZkH7UHRyr
 3906rAtfXL1DhOKzbrT3+/6r0OxjaAnHAwgtX+VM0+4AsyeGv8DgwoMKYQUfsU1Crxhs
 tBmcQKmy4mFAJYJG20p2IRXvOAA8lidfdGwT+bco7pAp0DxMv5Ax/ae2TkehZNtNs95N
 lRtMVRAkO8ndfOsnMEvdLSi1oANH5QpMRBMsD5vd/csQryMDjTE4PcZQdW2OKxEodVQS
 rNqVg8J3w51PTujaOIP1046sVoug91IjjRDjF7dTAq716HPghldoDoOpmLjHV5LC0cXy
 kSFA==
X-Gm-Message-State: AOAM530xx6rdKzAPaLMbPpjFlSmgXgBfRJv76aZybFWgwRKd83d55Xwm
 a28kRwzBtAMh3WUbeB8Zik6DUKSJdUTUiFGlOC/FIfUGjz3+oFgBuMDgc4FEAAOfRE2dE41VsvJ
 NUYMf65g7pBNmKhA=
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr5864345wrr.162.1624377925738; 
 Tue, 22 Jun 2021 09:05:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCt3xmVg8ZgO77DEFRc+YSCQ9DQ1yFCv1TqcmV6F9Yv546tfBlW4dXqpqOHgVIc3pZJ7ETlg==
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr5864324wrr.162.1624377925524; 
 Tue, 22 Jun 2021 09:05:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w9sm16154006wru.3.2021.06.22.09.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 09:05:24 -0700 (PDT)
Subject: Re: [PATCH 0/4] modules: update developer documentation
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210622125110.262843-1-kraxel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1510692a-9f1f-46d7-a113-6cafeee04a38@redhat.com>
Date: Tue, 22 Jun 2021 18:05:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210622125110.262843-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/06/21 14:51, Gerd Hoffmann wrote:
> Depends on the "modules: add meta-data database" patch series.
> 
> Gerd Hoffmann (4):
>    modules: add documentation for module sourcesets
>    modules: add module_obj() note to QOM docs
>    modules: module.h kerneldoc annotations
>    modules: hook up modules.h to docs build
> 
>   include/qemu/module.h       | 59 ++++++++++++++++++++++++++++---------
>   docs/devel/build-system.rst | 17 +++++++++++
>   docs/devel/index.rst        |  1 +
>   docs/devel/modules.rst      |  5 ++++
>   docs/devel/qom.rst          |  8 +++++
>   5 files changed, 76 insertions(+), 14 deletions(-)
>   create mode 100644 docs/devel/modules.rst
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Thank you very much!

Paolo


