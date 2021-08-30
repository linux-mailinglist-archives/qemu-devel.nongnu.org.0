Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E823FB2A6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 10:43:08 +0200 (CEST)
Received: from localhost ([::1]:43828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKcsb-0000Sm-EY
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 04:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mKcqw-0007FJ-ML
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 04:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mKcqv-00031d-9x
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 04:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630312872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zbGeAHx9mz3GDIOt+owuKfWc210mNj0q8+VSMNPz+Xc=;
 b=CJ+mHrIrokGxR7UVJfKTsG//6Wm9J+OAnqu75LNSf/ZPjvGZN6KtaZk3hoQMzcBfsUm9v4
 R4RbWH3nk/v197DLyOvfuQRzw9qyadGtQTXJk8okSWI3k1Rf2HbVE3YqVY2LHfFri5W6NA
 L8ddUxFT+bACEPGLo3GYO9YNVh8H6zY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-4K5McowjMditv1w3uHzrKA-1; Mon, 30 Aug 2021 04:41:10 -0400
X-MC-Unique: 4K5McowjMditv1w3uHzrKA-1
Received: by mail-ej1-f70.google.com with SMTP id
 q19-20020a1709064cd3b02904c5f93c0124so5314244ejt.14
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 01:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zbGeAHx9mz3GDIOt+owuKfWc210mNj0q8+VSMNPz+Xc=;
 b=jV/dqs1DRtfvrEBIXQitB7xNhQw7k20cyCNlBsV9DXFsMGJtkV92ytnY8LvEx6/1ms
 dqEw9WV4uupeV1EjYsDBNBtJVCj+Y2NR/SWMyyJ0coXH34rKjADfzCZZ25uIeJ7NvEv5
 Vos9VV+EEZKYNDQgJWqNu4PWBd4yYSX6ADG53R7X6s89UrkJd4/9dVgS0dD9PMAi9ocs
 T9E6b157FhbvMAxUHsWOPwULyNsYY95BgjkbXcUsxq+hDUKZRCmkndaq7Icvz48h5Tl6
 jW7lxFJ+r5DgaUkWOIHXMb2F/wcxbE6L7WVWBtFH7BT/yPCVQ9tJz6vTfrdyr3tHO6gu
 ntOA==
X-Gm-Message-State: AOAM530VelczONqYLxd+QNUI+hJBWxoIkIt9di52hdkX0D9d+DNpPARZ
 dGvIIJXONw+ekWYHZ5eEKgsLhAFWyqWW/p4YucBUFVsJGgUAlTE2nXv+Sl5GDNOXaB2fxSc6Oh2
 Hqr80XVhqcWVFL44=
X-Received: by 2002:a50:ed0b:: with SMTP id j11mr22858214eds.97.1630312869394; 
 Mon, 30 Aug 2021 01:41:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLa7HeW8+PI0Y5E6K7aG6j+S7+6V/CgOrUPZveswYfihFDU1Fe+eyPFiD28XK44itMqj/1aA==
X-Received: by 2002:a50:ed0b:: with SMTP id j11mr22858207eds.97.1630312869209; 
 Mon, 30 Aug 2021 01:41:09 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id n23sm7302839eds.41.2021.08.30.01.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:41:08 -0700 (PDT)
Date: Mon, 30 Aug 2021 10:41:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v5 3/3] tests/arm-cpu-features: Add A64FX processor related
Message-ID: <20210830084107.ce43ww5glhtmwor6@gator.home>
References: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
 <20210830082820.2690275-4-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210830082820.2690275-4-ishii.shuuichir@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 30, 2021 at 05:28:20PM +0900, Shuuichirou Ishii wrote:

nit: A commit message would be nice, even if it's just a simple
sentence expanding on the summary.

> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  tests/qtest/arm-cpu-features.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8252b85bb8..90a87f0ea9 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -473,6 +473,19 @@ static void test_query_cpu_model_expansion(const void *data)
>          assert_has_feature_enabled(qts, "cortex-a57", "pmu");
>          assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
>  
> +        assert_has_feature_enabled(qts, "a64fx", "pmu");
> +        assert_has_feature_enabled(qts, "a64fx", "aarch64");
> +        /*
> +         * A64FX does not support any other vector lengths besides those
> +         * that are enabled by default(128bit, 256bits, 512bit).
> +         */
> +        assert_has_feature_enabled(qts, "a64fx", "sve");
> +        assert_sve_vls(qts, "a64fx", 0xb, NULL);
> +        assert_error(qts, "a64fx", "cannot enable sve384",
> +                     "{ 'sve384': true }");
> +        assert_error(qts, "a64fx", "cannot enable sve640",
> +                     "{ 'sve640': true }");
> +
>          sve_tests_default(qts, "max");
>          pauth_tests_default(qts, "max");
>  
> -- 
> 2.27.0
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


