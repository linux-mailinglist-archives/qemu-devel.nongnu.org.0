Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB6260D1C5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:45:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMuT-00044y-Sv; Tue, 25 Oct 2022 12:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1onMuQ-0003y6-Ms
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:36:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1onMuP-0000ss-8Z
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666715767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ht2+bWy82miV3dprdSF117Uwzp5Kq753QvY1UQolKqc=;
 b=Fv1ei0jEiN3vPiz3LonR+/1hF78VywHtazWe1bLA2GorOMLwLmNky3jujJaV3VyUUJaOYg
 nsVDAj6lHbc/JCg/LlZBWjOlKf+NHNQfO1K90WcAoqLRkvOwcBc9JmZz7e1tWyIzDF/lag
 vrYb0i8RjC340oFiHGWW3tLmQS00QgM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-n0XZKG3hMBS6RN5PhCi21A-1; Tue, 25 Oct 2022 12:36:05 -0400
X-MC-Unique: n0XZKG3hMBS6RN5PhCi21A-1
Received: by mail-qv1-f72.google.com with SMTP id
 g1-20020ad45101000000b004bb5eb9913fso4369407qvp.16
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ht2+bWy82miV3dprdSF117Uwzp5Kq753QvY1UQolKqc=;
 b=YntWCpDWvEIksO+sL0nNkVkEeMYiAWpFPslN+XvN+QuNsAGTUeNiGzJOxDOgSVTWKH
 9RGogceJE9FlPy+VcB94R7eOuby8oszjbVtan+pY8XmZQyKMz0eVS2gwEWs4ZPlBr25E
 42HkxUbS1tC41IfUNaADzs406VVUzlhiLE2/9hvfTd0EPHv7qb4N7rmcpmBccmDZqHoe
 9YbASqkYQMvo4GYq7hzRvniGG4PV7ozxl+UGEjZuCuJXeNpKG5CuAYy19lRuNgeb3Kh6
 W4qPHULhu4ckitIs4yAIsB8Lk1+d/luhmkNYYKBC8qEGsBt9D5HE7uKjTtMf4kg2fscZ
 8s+g==
X-Gm-Message-State: ACrzQf1syqzFCjxlAjTnmC0qyOHHa2fhY59XrJBGICcAPCnn5w/ikofv
 pmrqA1APdYHEipDab6FrWvSxbCVcUUS0g2/f/crGWZ0xiF4iBH2Xl+GvsmqSbh9T/dfg0MuRpBg
 kxfAu3fhbBXOUYi4=
X-Received: by 2002:ac8:6f09:0:b0:39c:d3ab:eb84 with SMTP id
 bs9-20020ac86f09000000b0039cd3abeb84mr32869197qtb.267.1666715765382; 
 Tue, 25 Oct 2022 09:36:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM63Y0aNEqqemmmDiSFO/VdS7S3dJT37mLz2Wa0uQpp3SoEUdS5k7q8H4YfHRnp5GSUQjio2Jw==
X-Received: by 2002:ac8:6f09:0:b0:39c:d3ab:eb84 with SMTP id
 bs9-20020ac86f09000000b0039cd3abeb84mr32869163qtb.267.1666715765119; 
 Tue, 25 Oct 2022 09:36:05 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05620a409200b006ce515196a7sm2371498qko.8.2022.10.25.09.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:36:04 -0700 (PDT)
Date: Tue, 25 Oct 2022 12:36:03 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/4] MultiFD zero-copy improvements
Message-ID: <Y1gQc5LkDptoq2cq@x1n>
References: <20221025044730.319941-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221025044730.319941-1-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 01:47:27AM -0300, Leonardo Bras wrote:
> It all works fine in my tests, but maybe I missed some cornercase.
> Please provide any feedback you find fit.

Personally I very much like the whole series. :)

I just want to make sure it won't start to fail users when switching to
this new version of qemu due to vmlocked restrictions which I expect to
grow.  But I see that there're discussions on patch 4 for further
optimizations of lockvm and let's keep the discussion there for this.

The other thing is since it's a patchset for performance optimization only,
it'll always be nice to attach performance numbers.  If on slow networks it
won't show a difference worth mentioning that.  And ultimately I believe
anyone would be interested to know in which case (e.g. 100g nic?) would
this start to benefit.

Thanks!

-- 
Peter Xu


