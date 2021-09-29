Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B960041C701
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:41:09 +0200 (CEST)
Received: from localhost ([::1]:39914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mValg-0005a8-RN
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mVajO-00039u-K8
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:38:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mVajN-0003N9-6E
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632926324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VHOqifya4sK2klQSyY/VDUTq1lVM/gXqENpKHyQVMs0=;
 b=UzCXsmp3Gly+g/qHEFcW/ZGt/68RP7Lhovdz5UhfrtrxdT26AVddKSLtcCzmc+ADwy7v5+
 k58Fs5BqeByIKhVQcA6QSGRauHP0wmoGdsU+nhTL+DsNg9LTXRzVAPZgNet/BPw//PDYKz
 49Kwc9DkX5QyKuCTle9zAyk032fX6t4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-hKiRNpmDMguydepXawHxIw-1; Wed, 29 Sep 2021 10:38:42 -0400
X-MC-Unique: hKiRNpmDMguydepXawHxIw-1
Received: by mail-ed1-f70.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso2586406edj.20
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 07:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VHOqifya4sK2klQSyY/VDUTq1lVM/gXqENpKHyQVMs0=;
 b=JBblQNMy8Og6sYpK+Q5/5CGolorZyYyCeQ6MaKZ15q50m0ozxG5tYu2MQ3l6QBjeZt
 XO9h0ujoTOQPd5kGED/pVKEsHeYj4kjfqRZEBiDF6fQllmZnRP2mhxGQspHLg5vJFhsP
 aq7QAapbyWwEO6dyd1sI6vC/qXTlc1DDH675cfAIxkJjqVI79Atey2m+IgXfqQDtpkCj
 Rrpw5a+AEzKbR9EE5Yw/iqk2CdMj6QlMMz8N/Uz3GkxphnDfOY+uks9XDtktm/yrqcAn
 zT5nXGQHP28VOWNOgCZK+PEibY6LH7KBY26Js+lW3YCnNT2Vt67R+sufDz85Z+gIxdi9
 W+jw==
X-Gm-Message-State: AOAM533wXrwbN4pZuUF23KLNqIEEjBFBxKvzLDEUcZUEt0HBjUEAuQkT
 26QbK3stxcWisHQy7I+frH9pRobKSgiyzulvahzIi1BgGTFk8P6ay6oU6DCjOmw+OqBWWjxuwbD
 GZ7hbpBSYtzr744g=
X-Received: by 2002:a17:906:a59:: with SMTP id x25mr50015ejf.33.1632926321052; 
 Wed, 29 Sep 2021 07:38:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXjmN1uWDy1Ejunn+EHCR+ZvV2W8nQCegz8Z6Ul/R142Mep78/BmTKUWkT5EgFOO8i1mxnqg==
X-Received: by 2002:a17:906:a59:: with SMTP id x25mr49995ejf.33.1632926320877; 
 Wed, 29 Sep 2021 07:38:40 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id b2sm8781ejj.124.2021.09.29.07.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:38:40 -0700 (PDT)
Date: Wed, 29 Sep 2021 16:38:38 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 2/2] qemu-options: Add missing "sockets=2,maxcpus=2"
 to CLI "-smp 2"
Message-ID: <20210929143838.ppxvide4jfdt5rd6@gator.home>
References: <20210928121134.21064-1-wangyanan55@huawei.com>
 <20210928121134.21064-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928121134.21064-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-trivial@nongnu.org, wanghaibin.wang@huawei.com,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 08:11:34PM +0800, Yanan Wang wrote:
> There is one numa config example in qemu-options.hx currently
> using "-smp 2" and assuming that there will be 2 sockets and
> 2 cpus totally. However now the actual calculation logic of
> missing sockets and cores is not immutable and is considered
> liable to change. Although we will get maxcpus=2 finally based
> on current parser, it's always stable to specify it explicitly.
> 
> So "-smp 2,sockets=2,maxcpus=2" will be optimal when we expect
> multiple sockets and 2 cpus totally.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dcd9595650..ff8917c5e1 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -395,7 +395,7 @@ SRST
>          -m 2G \
>          -object memory-backend-ram,size=1G,id=m0 \
>          -object memory-backend-ram,size=1G,id=m1 \
> -        -smp 2 \
> +        -smp 2,sockets=2,maxcpus=2 \
>          -numa node,nodeid=0,memdev=m0 \
>          -numa node,nodeid=1,memdev=m1,initiator=0 \
>          -numa cpu,node-id=0,socket-id=0 \
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


