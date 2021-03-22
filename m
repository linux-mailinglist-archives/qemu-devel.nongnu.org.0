Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85A334447A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:03:08 +0100 (CET)
Received: from localhost ([::1]:47438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKD5-00017b-Bt
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOKAg-00080g-Uj
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:00:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOKAX-0001UC-HG
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616418028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uh9+YbVwwU4LVXMrG96CwoVaO0AeFcShL/Xud0h7E50=;
 b=C/DiYfeSWr4nRoCV8zP02sK04xPhlaowSG5GdjQHbUaVhf7G4GIqWHq7VxsC3IEye/xD2D
 AbPVGIhAlk4yhU473b+2rG+9/Xync1cH6XbpbUsPS1VhvlWtZdSuffODWrvpEgyz/RYODM
 PwTlKoyAjrFQteyKoTE4U7FYxcTNWwQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-dxFu6uLqPTiHkE0WH5XSxA-1; Mon, 22 Mar 2021 09:00:24 -0400
X-MC-Unique: dxFu6uLqPTiHkE0WH5XSxA-1
Received: by mail-wm1-f72.google.com with SMTP id r18so14975992wmq.5
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uh9+YbVwwU4LVXMrG96CwoVaO0AeFcShL/Xud0h7E50=;
 b=qzfnSLqd7yF4QYM972UAH6ZCCI2E9QRStSpy6VzUBO6grJ1DAam9LflA05IkOiXki6
 0ypbgt0fbjVsK2zneb4KJff5x82tR/+S4xJZqoNhA0wurpsC5fx9fvZjhrvG9VLclnFd
 800ySepR1c5zdNK+VG+T3DSOXphdDCXsptshdavJuBbUWBCXRvVqSANwCF6G2FZ5QOH6
 auRpvodRoFY2NyHlF+eavyZEDPQ8WOsHQ4GhJRRnGeZujzz/lvhRmJnwXKYNxm8TEC1b
 EF48w5aJzxQnAFWSRDl6ZtW+FYf7RQR/p69/6gOs3z+/y9zybko2aRKWMvf26pX6hRUM
 mLDg==
X-Gm-Message-State: AOAM532VKWaoSrAyJE8+lNkTawmAo84BJpkOu3+K/LLDcCy6INjBzeue
 N3nuQ5Ol/Z/RJxgQzNPh4x0lY+vltEELp+i091WUha1j9bv5WFXBXZ+g1wONY2wkgbG+3GK+6yO
 DRxBxgrDLjIOVW7M=
X-Received: by 2002:a05:600c:4292:: with SMTP id
 v18mr15865513wmc.23.1616418023174; 
 Mon, 22 Mar 2021 06:00:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXBkWhMYD/iSnRrijMK5sGXceb97+Xrq/QGF205RoI/lSWa1FvisVyKxSzB014zscfk4v1Og==
X-Received: by 2002:a05:600c:4292:: with SMTP id
 v18mr15865494wmc.23.1616418022964; 
 Mon, 22 Mar 2021 06:00:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b15sm18949708wmd.41.2021.03.22.06.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 06:00:22 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] exec: Build page-vary-common.c with -fno-lto
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210322112427.4045204-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a0a7f1e2-2266-79e3-11f0-8fb6ef6ddc32@redhat.com>
Date: Mon, 22 Mar 2021 14:00:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210322112427.4045204-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/21 12:24, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> While reviewing Richard's original patch, I split it in 3
> to make it more digestible to my review taste. I then simply
> filled the patch descriptions. Feel free to keep Richard's v1
> if this isn't worth it.
> 
> What is still missing is adding the new files to a MAINTAINERS
> section.

Both versions look good, thanks (the split is indeed more digestible)! 
Richard, are you going to queue one of them?

Paolo

> Regards,
> 
> Phil.
> 
> Supersedes: <20210321211534.2101231-1-richard.henderson@linaro.org>
> 
> Richard Henderson (3):
>    exec: Rename exec-vary.c as page-vary.c
>    exec: Extract 'page-vary.h' header
>    exec: Build page-vary-common.c with -fno-lto
> 
>   configure                |  19 -------
>   meson.build              |  18 ++++++-
>   include/exec/cpu-all.h   |  15 ++----
>   include/exec/page-vary.h |  34 ++++++++++++
>   exec-vary.c              | 108 ---------------------------------------
>   page-vary-common.c       |  54 ++++++++++++++++++++
>   page-vary.c              |  41 +++++++++++++++
>   7 files changed, 150 insertions(+), 139 deletions(-)
>   create mode 100644 include/exec/page-vary.h
>   delete mode 100644 exec-vary.c
>   create mode 100644 page-vary-common.c
>   create mode 100644 page-vary.c
> 


