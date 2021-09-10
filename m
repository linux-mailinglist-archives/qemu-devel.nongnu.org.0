Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74968406E84
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:47:49 +0200 (CEST)
Received: from localhost ([::1]:55276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOikm-0001pb-D9
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOiiV-0000J6-K7
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:45:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOiiR-0000Bd-Pz
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631288722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXw020pSt1yagaBLlByGUcRpaeIG3SahWWCoZ7EnWH0=;
 b=RLmgZVWsoh2z3V7HmiMwCiu9XKe356ZyRDyx04Xf8Sa8Lh3n36LJmXvGJrVBYExnRsRAAM
 3fs8/vHwVi/sgfEniHXaFJfKw+JyTJRfsbF+sZgEfP169mjQkAAAzvZ5rPs6heGwkECKYu
 VsMIvKml18afCsVIcZSiTUBF0ZKtNQQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-kfUj0S12OdKbRTG8Z4wloA-1; Fri, 10 Sep 2021 11:45:21 -0400
X-MC-Unique: kfUj0S12OdKbRTG8Z4wloA-1
Received: by mail-wm1-f69.google.com with SMTP id
 u1-20020a05600c210100b002e74fc5af71so1006688wml.1
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 08:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LXw020pSt1yagaBLlByGUcRpaeIG3SahWWCoZ7EnWH0=;
 b=r5pYFj9EVGEtRGXXcaETJGFFhuNRDLSXgiklmLE1/RiJbZwtDikP60lEuS587/NG89
 vl5MLNS5P4KokjLQVs2/VyMKCC9BLAq524Vnp21Zf553Lm22hy8iS/gd3tL5Ydc0rr77
 ecTiuvO+D08fITOO7eW9i28AQEYlkjMhZ5zedAh4UTrB0K6x2tZ87T8YSFB2Gi2iv7tG
 4inIGFAVBhbJEZuKaaBy5KpgA7Q5NSr2gj4TmYfBV8rLCnswjNJMdiz1a1b6inka3Y9f
 qUgagjmhr4L1Y6lXufFApf7lrbZj5OgaELEA1EdhoGyQkXPYbRUUC205nlZ/FBYxHKzE
 5U8w==
X-Gm-Message-State: AOAM531kcVqioBgspf7KYk9UoGK89kVuj1u0bgoNOZNZp/lfw3LRJC7U
 4pEdgrrZhZdDSp3qbatFIHRcXnGMTGZNNDqR46bkXL2Sp3YPjx84XGp78O+FbYHwuNiD/faenjx
 MCKovpWIOCrCQcyUpDGeLX4QT/OLh/MCLWlO40ZvU0EDXOa2Ij6QlA7IZsvHpOKgiB18=
X-Received: by 2002:a7b:c843:: with SMTP id c3mr8962192wml.76.1631288720277;
 Fri, 10 Sep 2021 08:45:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrLMT4URL96JFK6BFnyqXOeFf0CWXlxaorZKYjWlTY9RQ1DNWFJkI7vZarpcabJYot6Wci5A==
X-Received: by 2002:a7b:c843:: with SMTP id c3mr8962172wml.76.1631288719967;
 Fri, 10 Sep 2021 08:45:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id g1sm5424463wrc.65.2021.09.10.08.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 08:45:12 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Fix link to Windows page in Wiki
To: Helge Konetzka <hk@zapateado.de>, qemu-devel@nongnu.org
References: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <af33f36e-e319-e95c-36bc-9c77f4ad81b8@redhat.com>
Date: Fri, 10 Sep 2021 17:44:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/08/21 18:43, Helge Konetzka wrote:
> Furthermore I would like to propose to change the instructions for 
> Native builds with MSYS2 on Wiki Windows page.
> 
> Please remove the section which copies system binaries to match the 
> expected file names!
> 
> Instead define variables for configure (gcc-ar and gcc-ranlib are 
> existing copies of x86_64-w64-mingw32-gcc-ar and 
> x86_64-w64-mingw32-gcc-ranlib) and add strip to enable make install:
> 
> AR=gcc-ar NM=nm OBJCOPY=objcopy RANLIB=gcc-ranlib WINDRES=windres 
> STRIP=strip \
> ./configure --cross-prefix=x86_64-w64-mingw32- --enable-gtk --enable-sdl

Do you even need anything but "./configure"? (possibly AR=gcc-ar NM=nm 
at the beginning)?

I applied the webpage fix in the meanwhile, thanks!

Paolo


