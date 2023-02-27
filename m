Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321316A46CA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:12:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWg6d-0004Y9-K3; Mon, 27 Feb 2023 11:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWg6b-0004Qz-J6
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:12:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWg6Z-0000nJ-Vc
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677514319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OdriFUYeeOvWoj/shIseU2RgsOT/aw1VcPMx3doB/u0=;
 b=LbTt6HqP1QFaoNog2i44tgEeTMVLeFOgOGAYZWvh/C3nY8e+qbxKFpu8i2VAl5doMsax7H
 KUec6GKWOA6a8dgvKZTWFttbjbqO/rtY1Nz7YJvZqg2WUEtjZ9Q40MZv19bBNdXm78+w7F
 LO5tgnQyn5Jea5Q/B1+hde5HUvJAaNY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-83-ztiXG869MKegKjbD6MofiA-1; Mon, 27 Feb 2023 11:11:57 -0500
X-MC-Unique: ztiXG869MKegKjbD6MofiA-1
Received: by mail-wr1-f70.google.com with SMTP id
 bx25-20020a5d5b19000000b002c7ce4ce3c3so985657wrb.13
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 08:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OdriFUYeeOvWoj/shIseU2RgsOT/aw1VcPMx3doB/u0=;
 b=ELWF+N46Or/I5qPsZp4XMr+BZp/H7zOCMPJHMOgXpSMZg7FB6qDB4CQloSwrQeZlKi
 RuyDQqV19T0Ng1v/x93M5nX+TWunJXesKi06RPyLcvYh7n/JnIrxyJyd8GevDPSxhPpX
 owhX+rRUvLtDOuWrxq8YP0HoJ5Fz83tZSPIOXe0rD3XblvTSf4u6FG3lQwIhb/NJmUh0
 674Cb9wgMmrNIM7ZBj4iuHo4detaP6VpDkgEoUJ/N1z2F35n7MN5kApOGp99JmAXrZvM
 4Jzpo/lRjQwvO5YsM8csPa00LtAeljmGuZUjiBFeIxNkHeOln875VQ0JejCcuxmfJB6N
 iEoQ==
X-Gm-Message-State: AO0yUKWp8I6N1U28U6RKyQGGwoLc2RktPBoDL6fSpZjtVTbyrL6T30Jy
 Qe7VhEPeIONZpBmRFH4aR9V+RiXXsucO9OznKbIhS338qlil8rJ/YV8J9+3hY4SBCkuZ+t3GJSP
 8uKNr6ZmJ0P2AbuM=
X-Received: by 2002:a05:600c:491f:b0:3eb:3974:aad7 with SMTP id
 f31-20020a05600c491f00b003eb3974aad7mr6352417wmp.24.1677514316533; 
 Mon, 27 Feb 2023 08:11:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/H78MYNd7WkD9btRY9oqgMxTw0R7/a/pKcQSETreroY4l5dzarKNFCeeAyxfosLAaD7slTvg==
X-Received: by 2002:a05:600c:491f:b0:3eb:3974:aad7 with SMTP id
 f31-20020a05600c491f00b003eb3974aad7mr6352404wmp.24.1677514316290; 
 Mon, 27 Feb 2023 08:11:56 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 l9-20020adffe89000000b002c59e001631sm7537288wrr.77.2023.02.27.08.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 08:11:55 -0800 (PST)
Message-ID: <618f8617-8240-4d48-cbd4-6c16695eae1c@redhat.com>
Date: Mon, 27 Feb 2023 17:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [qemu-web PATCH] Announce Google Summer of Code and Outreachy 2023
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20230224011006.1574493-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230224011006.1574493-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/02/2023 02.10, Stefan Hajnoczi wrote:
> QEMU is participating in GSoC and Outreachy again. This blog post will
> draw people's attention to our open source internships and increase the
> number of applicants.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   _posts/2023-02-23-gsoc-outreachy-2023.md | 46 ++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
>   create mode 100644 _posts/2023-02-23-gsoc-outreachy-2023.md

Thanks, pushed!

  Thomas


