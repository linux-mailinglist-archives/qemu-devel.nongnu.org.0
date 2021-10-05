Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C1B4230D3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:33:15 +0200 (CEST)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXqBe-0006UU-Vo
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXq63-0000DW-2j
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:27:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXq60-0003eN-Ce
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633462043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFYIXMzHYdki8UWUKlBIrzEmda3Dm/+ETqLmP0GmN+E=;
 b=Lq40uo1V32U/4VnE+IigaCdQ4xc8Vdcw4n3qRGELxBl5W90UKzBaxxPS1DFxr8yEeJZbCF
 G6rdBT1VAml3DQlX9e6XziS2Qowlkm33848PDPab94pL5DkJNem++j4K4oXBJX+DaALc4+
 TE7MqS/6oJEJ4RERc0w2EB+A6SDU32Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-KdsJmkx0PfmatfodwCSb3g-1; Tue, 05 Oct 2021 15:27:22 -0400
X-MC-Unique: KdsJmkx0PfmatfodwCSb3g-1
Received: by mail-ed1-f69.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so188911edj.21
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 12:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PFYIXMzHYdki8UWUKlBIrzEmda3Dm/+ETqLmP0GmN+E=;
 b=wNX0ouMny53Jo+11eauiPmQFj2bQeoDVXBhBZJHOUhpPpp+qsVzzGQuYuqH+9h2tQz
 kkagvVpH9fH7E78FGXxCzYF7I2p6dJRGsGr5hqVcnwDzHKO6c6huxND5gLWxSCWMWfYU
 wfHIXL7UKDS3Iwv853V6S6yGJbuAXkFDygGHiRjhZxM/BnIcCYverf0sGfnXDHQbKGOD
 XKI1ya/3DjAMGCfau3YC6EuCzK50f+8LQd7mry2+RjLZfz6cr+rlcCzUEpsBbrQHDOHy
 BP2P36ZrULYpUluIOA+HFcYMLbTUWJW0QFgOIXJmytn/H+5VAVIbHj4EsO5Y3LwnXl1j
 AvvQ==
X-Gm-Message-State: AOAM533/sfNvXkkjd5Oz7EZEGYsQdXX93e35TE6ZDuUsuYM7v9uoJfgU
 uuICnU1ch6i/tfb3p3rxtGJNywG2GI4qXf7SsYcLAbXgPQYh+dubYS6j/8dDu6Ab16VeqbxIT31
 F6TFRUl4jOSGzyeM=
X-Received: by 2002:aa7:c948:: with SMTP id h8mr2872126edt.380.1633462041421; 
 Tue, 05 Oct 2021 12:27:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUo9IW1vrC8lH6wEi8OQImF5pZ7mN3WLnGr8YOn4Kw6ljAlzK4/U8SFtTvSgFPBmLgtSxBKQ==
X-Received: by 2002:aa7:c948:: with SMTP id h8mr2872103edt.380.1633462041249; 
 Tue, 05 Oct 2021 12:27:21 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z19sm1609128ejp.97.2021.10.05.12.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:27:20 -0700 (PDT)
Message-ID: <236eb940-67bd-c1a0-3fa5-d0449c3ee712@redhat.com>
Date: Tue, 5 Oct 2021 21:27:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] meson.build: don't include libbpf in the common
 source set
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211005182443.2954499-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211005182443.2954499-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05/10/21 20:24, Alex Bennée wrote:
> This library is only needed for the softmmu targets and as such
> break static *-user builds where libbpf is detected and it tries to
> link it into the user binaries.
> 
> Fixes: 46627f41b6 ("ebpf: Added eBPF RSS loader.")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 60f4f45165..d8bcf13b21 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2307,7 +2307,7 @@ subdir('bsd-user')
>   subdir('linux-user')
>   subdir('ebpf')
>   
> -common_ss.add(libbpf)
> +softmmu_ss.add(libbpf)

It should not be needed at all, since ebpf/meson.build has

softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: 
files('ebpf_rss-stub.c'))

(which already adds libbpf if needed).

Paolo


