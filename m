Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C459444A88
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 22:54:45 +0100 (CET)
Received: from localhost ([::1]:42880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miODU-0004As-8R
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 17:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1miNmk-0007k4-KG
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:27:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1miNmh-0000hR-Tm
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635974822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GgsHjONU022LyE4m1na2gyqpTJ/1Eng5yCczEDXW2M8=;
 b=QHUHVE829Og0+oF8PpUPIqlSRmtHQp4464cEqoC9hMQrfzKpnVyC/8fF48Dad2sqjXHTZv
 hIFhTRd9bl1oe3sPMa3Efxy5gNLt4avpEJt61y/5obcxMwFsprxuUyNxZZ6fcVTvPgGJ/K
 7E5jOfr4zQ4Ge1Ze3xsIUyCO3xINTUA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-s8txLKNbMDOYPmGqy3oJsQ-1; Wed, 03 Nov 2021 17:27:01 -0400
X-MC-Unique: s8txLKNbMDOYPmGqy3oJsQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so1638860wmb.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 14:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GgsHjONU022LyE4m1na2gyqpTJ/1Eng5yCczEDXW2M8=;
 b=XjPRtyKppg8+jY4oTBXd7gho8QjuARJQyKHmEYZRdPIguGhEm9RYFashU1pcFmbvBW
 ShIoHkSn3rf8oCkLhYNO8/MCG1JdTwdkOw5AQmYmQuHi3hOMWYGPD7F6oFsnq2VtOjX7
 u9+elySeSNEtlnCA/mLO0Z08sOW0vqUQ+SP/opKki6LwRqBQrlJaAdRCRXsSC/aWc2Qs
 +qMaRPKRCbV496dNR7krAluKRgK+z3Dx3jRDaTv64s+FM569ycrAo5h9n2BC7nCT+K83
 An/+nz1RtjMAmDFYdDks3CrB4FLaGyq67gutScfeRp9Lw5pFypiWXLSE1mwuPdxEMnvW
 taJA==
X-Gm-Message-State: AOAM530iWqNZQqe24nv7moCYdLqNE+NKrSu8IWQYp3NeOO8IFQmHesvD
 Ol0gy3Hq3PMpuGomAvI50QVojbO6bliqCfijTDT1MHSTTHGtNKA+wh+2GDNm8jiK3rJ/hO4hhDF
 qgnKTis5KjfwQFLU=
X-Received: by 2002:adf:ef52:: with SMTP id c18mr39170749wrp.162.1635974820309; 
 Wed, 03 Nov 2021 14:27:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfZMxqVXii0p6sOsXlgOkTUOtA/SYuOki1POUvluH/tCV/aEg1VDCVZ1j/q/pqnvMYL4PuSQ==
X-Received: by 2002:adf:ef52:: with SMTP id c18mr39170727wrp.162.1635974820097; 
 Wed, 03 Nov 2021 14:27:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id f18sm3079211wre.7.2021.11.03.14.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 14:26:59 -0700 (PDT)
Message-ID: <8e630c96-5d2c-d214-e594-6162356990b0@redhat.com>
Date: Wed, 3 Nov 2021 22:26:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 00/12] QOM/QAPI integration part 1
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211103173002.209906-1-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211103173002.209906-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.528, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: eblake@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 18:29, Kevin Wolf wrote:
> This series adds QOM class definitions to the QAPI schema, introduces
> a new TypeInfo.instance_config() callback that configures the object at
> creation time (instead of setting properties individually) and is
> separate from runtime property setters (which often used to be not
> really tested for runtime use), and finally generates a marshalling
> function for .instance_config() from the QAPI schema that makes this a
> natural C interface rather than a visitor based one.

That's pretty cool!

Just one question: why not always use boxed configuration?  It should 
not make the instance_config types any larger, and it avoids unwieldy 
argument lists.

Also, for the obligatory bikeshedding remark, do you have any other 
plans or ideas for the colon-separated auto generated typenames?  Having 
both the "namespace" (qom) and the more specific use (config) before the 
classname is a bit weird, compared to the existing structs like 
RngRandomProperties.  Especially if boxed config is more used (or 
becomes the only possibility), it might be that qom:class-name:config, 
or even just class-name:config, make for nicer code in the object 
implementation.

Paolo


