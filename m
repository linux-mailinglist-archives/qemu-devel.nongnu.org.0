Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2E247BF09
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:36:54 +0100 (CET)
Received: from localhost ([::1]:50864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzdRt-0001QB-FR
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:36:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzdOA-0006aX-Tw
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:33:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzdO9-0000XU-Dp
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640086380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mk0wEJ1Qb1e+vvnfQCDJKaEUvlJWeZuNi9hTqvtOhZY=;
 b=CudU4Mj+GBxEXiLco6/OYyFygWyFmIEOmeWFr/MkumQ4UFbV0tgVD4lC6HmYF/SeFpM3Bz
 JGW3I7W3J8xXusKYf6KHuS31E2t29Ik4zdSqx9SFWPwguiJfl6HBrs42tQNg5ALd5XPEF2
 EMwS62g11ZL+2sQPgn6zQFTiJgNQQQw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-cRNt5LWNMXCFKeJf3kY6WQ-1; Tue, 21 Dec 2021 06:32:59 -0500
X-MC-Unique: cRNt5LWNMXCFKeJf3kY6WQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 w10-20020a50d78a000000b003f82342a95aso8091589edi.22
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mk0wEJ1Qb1e+vvnfQCDJKaEUvlJWeZuNi9hTqvtOhZY=;
 b=0IEyiIDTYOPWJQoe9hWX+iG5czhzWobyQWiNF8MBG+dIkKsKPns9Pui5hpxx1KsRSl
 fHIip6G40oqIwik6xRO5WA1Rq1rhpr3u3B3wjBn45fGi6ztTKEO86+f9/B/Z5qcn6P8X
 XadIWC1j4QPgmLjHpIalV8Hm5agROwxVqxzpZMTHkD+WoX0q+ub9o1+DGttKClurY6nO
 4UhTRuPZuE6xcMHjpMy8xOaszL6qnmI8f1z0Xtqa9wsp0CkprTNG2mRKi3SbLeNtMsux
 ewIbEtoZu8CMUtit9ejOrloHUkmHI39JJZYRUUuee51BS+HMmjmdOe+n4dSp7ZLU8Hdl
 9DQA==
X-Gm-Message-State: AOAM532S9AhgHN6hUn2QXKoa88KCUlVI8dofabdtP4SXSUuKAKe8sRmb
 iK3L17R4dznPOsU3xoZXYrlgXumAPNP4pbtbXLs5uc864aK9G5ntZzVV/Bv5fZDgrMDXU7Bgolc
 u0Rb2B8kn/yDH+G0=
X-Received: by 2002:a17:906:d552:: with SMTP id
 cr18mr2264790ejc.260.1640086378130; 
 Tue, 21 Dec 2021 03:32:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWeW8J17trsiOrRd2byxnNn0yjR1Sz8YfOcdyGeeNI7P7o72WfvIahNgLo79mN/d4Ooyv09A==
X-Received: by 2002:a17:906:d552:: with SMTP id
 cr18mr2264778ejc.260.1640086377975; 
 Tue, 21 Dec 2021 03:32:57 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id dt13sm5153391ejc.157.2021.12.21.03.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 03:32:57 -0800 (PST)
Message-ID: <8901ca47-b169-6a79-1f40-1b96a9f8a292@redhat.com>
Date: Tue, 21 Dec 2021 12:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 6/8] meson: build contrib/ executables after generated
 headers
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221110526.351709-1-pbonzini@redhat.com>
 <20211221110526.351709-7-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211221110526.351709-7-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 12:05, Paolo Bonzini wrote:
> This will be needed as soon as config-poison.h moves from configure to
> a meson custom_target (which is built at "ninja" time).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  contrib/elf2dmp/meson.build        | 2 +-
>  contrib/ivshmem-client/meson.build | 2 +-
>  contrib/ivshmem-server/meson.build | 2 +-
>  contrib/rdmacm-mux/meson.build     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


