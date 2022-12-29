Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B47B658B0B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:32:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pApAV-0005qc-Js; Thu, 29 Dec 2022 04:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApA5-0005i1-Kr
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:25:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApA4-0003Bb-9W
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672305915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=47RxPCSdRO9s7aj4uFJyxhMP2NaEViyClyTmYZ5nqP8=;
 b=IW7OsVwDD8c8ZxWvesTnlAjbN2UPYckv1wx7uxS1kdsx8Y2k/ZHNW4PGmY7glkcXljpqeV
 Z7J77ehaSXb47YDDJ8xEvVlP2b6OtcYBS9ntnVYaag1f9qCk1Esex0L3ZnrCCt+87r/3zN
 NPcRsbUjqj1bqwJxO+uaCGgLsVt6wLA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-uiSaoIw7PmO5NJYJaA8nVQ-1; Thu, 29 Dec 2022 04:25:13 -0500
X-MC-Unique: uiSaoIw7PmO5NJYJaA8nVQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p34-20020a05600c1da200b003d990064285so3255454wms.8
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 01:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=47RxPCSdRO9s7aj4uFJyxhMP2NaEViyClyTmYZ5nqP8=;
 b=Fun9oPlfsaG2WQm78rtRlkKbIl20eeRhzLrf127kgw7L7xp3G9YFP55cX3MaVFaUbp
 RNEoPjzkZl/pslfOAzwVCI4UdnmnJSCZ3wHyGTlfAfy0YfRj6XqoidBuTFGaWetJJVxo
 fwsxUqH/rlyC5A68EJT8f8j770cg64Ypgn9PhFYaiHmh8Mvy3N6fcV6YJLSKNOzN+pn9
 oOuo+XLHXCGK0RhfDOfkLqMtjfw/KzcBlLJRpZ66qjPLkgQhj3C8QGL+JD41D9Yc3fb/
 qCjv5IBHRtmamFsaBhSdPnbkgnKJhBypH59nl4lKdMaWRRB0bU2t/6h1hFsp7opsXfx4
 ib+g==
X-Gm-Message-State: AFqh2koHMXBRDx/8LeyZDVnoKDq3c8zOuTSwV13dMQ020VqaNu2LbrMX
 X2sB7b1WWS1hXEp0CSte84CS0YwA+krWv/yvi38gaBUv9EMIsyFXisbxQBqyR2dv18a6nhKdasE
 EjBJLPmWiBZIp3fI=
X-Received: by 2002:a05:600c:3d8a:b0:3d3:4406:8a37 with SMTP id
 bi10-20020a05600c3d8a00b003d344068a37mr19542156wmb.41.1672305912194; 
 Thu, 29 Dec 2022 01:25:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvB8OkXgujxR9aDZdBR8q4/Nk/Fp6FZjo0qtWaLyPKq46vBEQrYth6uJs8+bp5p2U3QOFXCGA==
X-Received: by 2002:a05:600c:3d8a:b0:3d3:4406:8a37 with SMTP id
 bi10-20020a05600c3d8a00b003d344068a37mr19542140wmb.41.1672305911991; 
 Thu, 29 Dec 2022 01:25:11 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c4e5000b003c21ba7d7d6sm24283401wmq.44.2022.12.29.01.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 01:25:11 -0800 (PST)
Message-ID: <294d5d60-e5bd-03ad-3f13-918dd05d99ff@redhat.com>
Date: Thu, 29 Dec 2022 10:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/5] hw/s390x/pv: Restrict Protected Virtualization to
 sysemu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221217152454.96388-1-philmd@linaro.org>
 <20221217152454.96388-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221217152454.96388-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17/12/2022 16.24, Philippe Mathieu-Daudé wrote:
> Protected Virtualization is irrelevant in user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/cpu_features.c | 4 ++++
>   target/s390x/cpu_models.c   | 4 +++-
>   2 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



