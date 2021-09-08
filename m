Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE234032D3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 05:09:57 +0200 (CEST)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNnyG-0006bn-Bj
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 23:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNnxQ-0005vq-1v
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 23:09:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNnxM-0006Oi-NM
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 23:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631070539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VxcvDZDQTtjzduoHzMYVen39WiFESyfmjWNdlKL6K3o=;
 b=LrBEQgIMB3M/KCmTFiShCjFDQledlKopNEhJe8Al6vuwmnvnFEjjiF49AaXxc82pT2Jdo2
 5ku8PrTjcInsGqENJGYUkd2eoDhVbu3hH+x4H+QubEV7tWJP5/bNqe2qo/hyTWga6bcGBs
 lQL29LfIVsf2UojZHQ/Eu2z2dirb+Ag=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13--VaVuezVOSK5CAfWizGqUg-1; Tue, 07 Sep 2021 23:08:58 -0400
X-MC-Unique: -VaVuezVOSK5CAfWizGqUg-1
Received: by mail-pf1-f199.google.com with SMTP id
 v65-20020a627a44000000b003f286b054cbso531799pfc.11
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 20:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VxcvDZDQTtjzduoHzMYVen39WiFESyfmjWNdlKL6K3o=;
 b=eXWdBRjs+eS6P9oGBQrTfJB9CcRFKdsJj6FViySHaRZQ/yxYCPFy5gUh5vL1Pw1Aoa
 liAsJXOeamNAl0J8wxDsARBP+WhFSI08BbE6VRHNTd6zex9pr3h1cG/2gxewzJyFkcbC
 YBwOGfV/kc/ME2vUSCbFUyjUXjDBINNWQ8y5azWdmRIFL5Yz9yXTRrVb3emuGYGeEAM5
 II2UvubAz3e+nOMC1qwxf7c7oj6TFHxQKpJk2n2JpZEwk60SnHlH6TFy4qqYGSC5lPtQ
 spfd4RM9K1NIfVmqdjJX9BdJCbfw7+9X7ehDt1NW152OXJ/0xMJN7kGyDPXfm3X+EXgH
 KwWQ==
X-Gm-Message-State: AOAM5338kmFw8damFMPmhMdFk7ic+iklzyEMkKhAGzoE9TAva2w2Z+6h
 3D/pwUw+5phboSZwyJqqLz18GqLy4yjEQOJdxJzPpKwb1vpeCer0/1hTEDARaek9WK51cCqtRDs
 dHoB13QE6q+qrS2E=
X-Received: by 2002:a65:51c8:: with SMTP id i8mr1482513pgq.451.1631070537455; 
 Tue, 07 Sep 2021 20:08:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybaoEfC1arT9WWC5cuqANMVwcpWbyhiJPeLCniuUvKyuTNxWJyOtjfWD1zIJIJ0pKC4oOV+g==
X-Received: by 2002:a65:51c8:: with SMTP id i8mr1482489pgq.451.1631070537108; 
 Tue, 07 Sep 2021 20:08:57 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x10sm414937pfj.174.2021.09.07.20.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 20:08:56 -0700 (PDT)
Subject: Re: [PATCH] ebpf: only include in system emulators
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210907104512.129103-1-pbonzini@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8b500aeb-b4e2-dcee-24f8-825ae6327acf@redhat.com>
Date: Wed, 8 Sep 2021 11:08:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907104512.129103-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: yuri.benditovich@daynix.com, andrew@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/9/7 ÏÂÎç6:45, Paolo Bonzini Ð´µÀ:
> eBPF files are being included in system emulators, which is useless


I think it should work since it's an independent feature. The current 
use case is to offload the RSS from Qemu to kernel TAP.


>   and
> also breaks compilation because ebpf/trace-events is only processed
> if a system emulator is included in the build.


Andrew, any way to fix this?

Thanks


>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/566
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   ebpf/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/ebpf/meson.build b/ebpf/meson.build
> index 9cd0635370..2dd0fd8948 100644
> --- a/ebpf/meson.build
> +++ b/ebpf/meson.build
> @@ -1 +1 @@
> -common_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
> +softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))


