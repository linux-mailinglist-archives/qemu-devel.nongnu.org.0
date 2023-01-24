Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F7A6791AC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 08:13:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKDTM-0002D6-I3; Tue, 24 Jan 2023 02:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKDTA-0002CM-9s
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:11:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKDT8-0002gh-04
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674544304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=An2gLI6S7uV1DOI4/kWIKH3QMzfjNaXK1dgaYR1RvUE=;
 b=SoIiesTJB+G/lq7W3ayeyZeo7yKcoe/XMAQijSC2+IgIQpPv3Vbeu2fe0LP9rqKiPJiEsh
 /dM8uqohvohkZsLXsg1zMaeTnsR8YRf6jYthxinBsaLkMjOYeDhiLPZQEHLn/erCIeOROs
 of08tYurxz3WkaiRcEw1KmBpmxC4Ddc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-281-PPdlqhM9Plek-baXnXtm1w-1; Tue, 24 Jan 2023 02:11:42 -0500
X-MC-Unique: PPdlqhM9Plek-baXnXtm1w-1
Received: by mail-qv1-f71.google.com with SMTP id
 x6-20020a0cc506000000b005349c8b39d6so7135557qvi.2
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 23:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=An2gLI6S7uV1DOI4/kWIKH3QMzfjNaXK1dgaYR1RvUE=;
 b=25F9zGIJrWvt4bpb930m4I9SNdXNcmPhr0amW5wjJf+/MOCpAX9TyYAuTB7P6YddI1
 Iibg3V/OljXWsBQ0zhRfXbVaas2ZKevRrlGUCL3MYM0GKygQTx+PybN27zA4y70pzGHw
 7jhF/mFNKnEKtivyqS5k1qzqxu8Y2PI3fi7Q3861+7rYiy0lDPTgaE3qKJIIcIN+p2VT
 jmfUnAgQE7RNbU8o9ec0Ts6AkFqeMkrtu8GES1HwcrNiycSuyTRQg/S3ij1Kq57eEWlF
 +75xk2jehavdznoB4+yT+KchCBFA0OEN5IsepkccNa4p20ffSQVwIecypL+QgMlY1PGn
 1ulA==
X-Gm-Message-State: AFqh2krBV9HD45l4SEuvIGdv972/eRvht0hQAFFggcGnPqSzGIBVV/GO
 Ozk9K4v+s2E+AsF+yqo80fxwzswi/Q9e7iGhENxPAvDI5YmRMW+OZg5LBLlWm3P+6aRsDFKCi15
 9kO0a9MzdOpgajaU=
X-Received: by 2002:ac8:75cd:0:b0:3b6:340b:fb27 with SMTP id
 z13-20020ac875cd000000b003b6340bfb27mr39913425qtq.8.1674544302494; 
 Mon, 23 Jan 2023 23:11:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXscvfWgMwyeD8laVE2kOMouxncj0ymO4hnFdQ3hw65ODMvj9NUXMXcVuAO+RwfJ0pxR7WnvcQ==
X-Received: by 2002:ac8:75cd:0:b0:3b6:340b:fb27 with SMTP id
 z13-20020ac875cd000000b003b6340bfb27mr39913403qtq.8.1674544302282; 
 Mon, 23 Jan 2023 23:11:42 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-158.web.vodafone.de.
 [109.43.179.158]) by smtp.gmail.com with ESMTPSA id
 m2-20020ac807c2000000b003a7e4129f83sm730368qth.85.2023.01.23.23.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 23:11:41 -0800 (PST)
Message-ID: <0801a7ae-ad51-4726-ad8e-3d688e8475c2@redhat.com>
Date: Tue, 24 Jan 2023 08:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 26/26] MAINTAINERS: Add e1000e test files
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
 <20230124043143.5515-27-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230124043143.5515-27-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 24/01/2023 05.31, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 958915f227..3b648a89d7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2218,6 +2218,8 @@ R: Akihiko Odaki <akihiko.odaki@daynix.com>
>   S: Maintained
>   F: hw/net/e1000e*
>   F: tests/qtest/fuzz-e1000e-test.c
> +F: tests/qtest/e1000e-test.c
> +F: tests/qtest/libqos/e1000e.c

I'd suggest to use tests/qtest/libqos/e1000e.* in the last line to include 
the header file, too.

Anyway:
Acked-by: Thomas Huth <thuth@redhat.com>

>   
>   eepro100
>   M: Stefan Weil <sw@weilnetz.de>


