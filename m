Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D164241C4E7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 14:42:54 +0200 (CEST)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVYvF-00061v-UU
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 08:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVYtX-0004id-Lf
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 08:41:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVYtU-0000sL-9q
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 08:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632919263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pQJs0hOhB+y8OMulthfV/YjlTJ4YHCE4BkDKzyOnb4c=;
 b=gYWOlAA9gfCHrr5NHAJWyxD7+8pyqF8qBBQlN82XtGTYkPO8cpcqQUF52cYcOmFoGmQFf1
 OVArvX9SqHgBjlDEneupDuwhQOjzPuyunTuOgc9YuqTepJxR8U4POybDSGbzVB7zzQ0tAM
 b85tCK7YL5NCeXy8Z8Aa8Njdtz6RDXs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-ZK1UFYE5O0aO9JBOgrOmQg-1; Wed, 29 Sep 2021 08:41:00 -0400
X-MC-Unique: ZK1UFYE5O0aO9JBOgrOmQg-1
Received: by mail-ed1-f71.google.com with SMTP id
 h15-20020aa7de0f000000b003d02f9592d6so2233841edv.17
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 05:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pQJs0hOhB+y8OMulthfV/YjlTJ4YHCE4BkDKzyOnb4c=;
 b=B7qE+jzr13fpOWlLtUsqx9JEBNu9+mIv5BPM41OHSkapXtb2bw03zvjrTF8JPZj4cl
 mL7fymmxiZGQabSQJJLtV3ikMu8BerwSytAfldYmAJ7y+XHNI0kfpU60k6KJm6Caac0I
 Bxzg0CnaWngJRXMl+3m91NGLL1niVJa5dAEx7OKfxGWRVcp+rDW/WnY74oU6QS+v1fkS
 vT7gaGlmzEG/4fOKKpWWPuIoDvAI950upJ67YW8at5TMNRC7RJWMmcsbMbodkkjQVcuX
 atT8c+ObU2L/TY9UuM4sRjjf9nDUefElPObZkHBpcoecXTDo3978rhrewXGDwK2Ft8XP
 yhWw==
X-Gm-Message-State: AOAM531fF89oaOM6mtdvCkXshZ2YXPssjuhl13PMfRj9vKt48WJdiLIW
 MxGay6TZ17NevVd7PuIIeo4QfwEccX4ElHvanQE1c5SHNHDkYCVuMRO5TshpyP0KrcdXeheL8Lc
 WRid7tw+LwjMG9z4=
X-Received: by 2002:a17:907:869e:: with SMTP id
 qa30mr8019713ejc.249.1632919259258; 
 Wed, 29 Sep 2021 05:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTWaFiM6lGZT8QdExE08i8J0Zc7Xn0A82QTUSOpg8uCcEpQKnZN1Meshq6fofvFskIiiSs4A==
X-Received: by 2002:a17:907:869e:: with SMTP id
 qa30mr8019698ejc.249.1632919259090; 
 Wed, 29 Sep 2021 05:40:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u16sm1363713ejy.14.2021.09.29.05.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 05:40:58 -0700 (PDT)
Message-ID: <97e67c45-21f9-2630-7173-991d01871116@redhat.com>
Date: Wed, 29 Sep 2021 14:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 00/20] NBD patches through 2021-09-27
To: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
 <CAFEAcA9P_xzSce_3bVKO95HOdhbf1aqVJ-eiXOkJ09Hj4ow+bg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA9P_xzSce_3bVKO95HOdhbf1aqVJ-eiXOkJ09Hj4ow+bg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/09/21 10:59, Peter Maydell wrote:
> This seems to break the gitlab cross-i386-system build,
> which now fails to link qemu-nbd because it is trying
> to link the x86-64 libselinux.so into a 32-bit binary:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/1630661323
> 
> cc -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o -Wl,--as-needed
> -Wl,--no-undefined -pie -Wl,--whole-archive libblockdev.fa libblock.fa
> libcrypto.fa libauthz.fa libqom.fa libio.fa -Wl,--no-whole-archive
> -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m32 -m32
> -fstack-protector-strong -Wl,--start-group libqemuutil.a
> libblockdev.fa libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa
> @block.syms /usr/lib/libgnutls.so /usr/lib64/libselinux.so -lutil
> -L/usr/lib -lgio-2.0 -lgobject-2.0 -lglib-2.0 -L/usr/lib -lgio-2.0
> -lgobject-2.0 -lglib-2.0 -lm -pthread -L/usr/lib -lgmodule-2.0
> -lglib-2.0 /usr/lib/libpixman-1.so /usr/lib/libzstd.so
> /usr/lib/libz.so -Wl,--end-group
> /usr/bin/ld: /usr/lib64/libselinux.so: error adding symbols: file in
> wrong format
> collect2: error: ld returned 1 exit status

Missing libselinux-devel.i686 in 
tests/docker/dockerfiles/fedora-i386-cross.docker, I think?

Paolo


