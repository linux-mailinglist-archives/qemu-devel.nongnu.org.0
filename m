Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2A43B3F64
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:34:49 +0200 (CEST)
Received: from localhost ([::1]:44786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhIW-0007ED-R2
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwhEX-0002vj-FL
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:30:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwhET-0002LA-L2
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624609837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKQTwWHS1TmuuiZBcD0yw7A5RfEwSXHuifEid/2qxt0=;
 b=VHr5TUV5HMHdA0KuWYNFBzPrSFGb72LlZMYdsxYRCVn3+oCTFQbPJUSeONq7lVQEj8AHDx
 8OnmtkD+XUoVsRCu51XQKz4B3K7MWUGTj+ngWzr0gaO7yQU/yjVKukajYOJLUE8iQhuT90
 L05aDUaaJOJqjkea9WWwC7eOuNSP1B4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-fSHhRz_xMCOg-e5hcWCFkQ-1; Fri, 25 Jun 2021 04:30:35 -0400
X-MC-Unique: fSHhRz_xMCOg-e5hcWCFkQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 q14-20020a1709066aceb029049fa6bee56fso2814023ejs.21
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=AKQTwWHS1TmuuiZBcD0yw7A5RfEwSXHuifEid/2qxt0=;
 b=C0fSMyYOMTX0c8DjOPiMkvkPhxiQyQcx9mcjgpp7zOYSH1oj60N9uc2q1LZh/IJRLr
 GXO8IxOdHucrj1I6szdkF9t+yFgH+f/zWe91YXN9u1ic9aMrwfwz2vkJ8R4r+r5Cd8IT
 /+WvPY9fuvqLyihrCdCxiwZZFUY1ZTPKE0zdYU9wV0d18bQN9Szcv0eoII/c4hC45jFi
 JIUZyVQ5MyZYyCDn3tO934dc6LM2EsByHpdNhCIOW8ijRvtF5ObL9zFd25yI5/J7ICqu
 BWZJWNuKoeTdJmjuh1PMiLju3ZPP1Rqt/kTJJN7sQShxAw0ue0fj2QuPb3PtXmOtCgZk
 qrFg==
X-Gm-Message-State: AOAM5319kAI8FTJoIsagUmdGkLl9ZqFr+859fSLBfQIPHpjGM3zbwRGu
 HI5VO0OCIEjgLQP1thtQwfLyA81Qen4lnVuj4SbYEl1px4YXh++c5x/5gp3LAXZr2dsHs8V2OOY
 mXDxZ6xFfI8PUhSA=
X-Received: by 2002:aa7:da88:: with SMTP id q8mr13012697eds.345.1624609833868; 
 Fri, 25 Jun 2021 01:30:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfmnOIY1udmqaPkstbIM7wNo9LM4LNbyCVqNcSmLurQiKWJtAtbthPaS77y+WBeUevdjXf8Q==
X-Received: by 2002:aa7:da88:: with SMTP id q8mr13012684eds.345.1624609833764; 
 Fri, 25 Jun 2021 01:30:33 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 f14sm3316065edd.69.2021.06.25.01.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:30:33 -0700 (PDT)
Subject: Re: [PATCH 10/11] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210624180423.1322165-1-pbonzini@redhat.com>
 <20210624180423.1322165-11-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <4e70ab2b-a6f6-92ae-2dd0-a439d0d841c4@redhat.com>
Date: Fri, 25 Jun 2021 10:30:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624180423.1322165-11-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Warner Losh <imp@bsdimp.com>, Joelle van Dyne <j@getutm.app>,
 qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.21 20:04, Paolo Bonzini wrote:
> From: Joelle van Dyne <j@getutm.app>
>
> iOS hosts do not have these defined so we fallback to the
> default behaviour.
>
> Co-authored-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


