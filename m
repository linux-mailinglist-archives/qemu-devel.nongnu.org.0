Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4379A3FE002
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:35:09 +0200 (CEST)
Received: from localhost ([::1]:51456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTCe-0006fv-CB
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLSgM-0004rN-FA
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:01:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLSg8-0005hj-BJ
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630512091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlIGAZvR60K8KfEyVet+GBVvZwSvJEFZQe5BG9TqS1o=;
 b=WxID/Yo0m1vCL2hVSjOrmD1GQsaD2hPjOeGlIfU61UwCLOQqSs/r6KSNb5398ENF5gk27N
 yM5uUG4HqKv4s6Go429H/S1KG9Ha3QA6XTttqFEv4X7pS2kLPjqGAVK/ZpUgAQSA9c3O1x
 gYWh6hVTtvd6woGxdB+mj0lUcdiZM78=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-_N8BvxtHOoyGxspu44LJdg-1; Wed, 01 Sep 2021 12:01:30 -0400
X-MC-Unique: _N8BvxtHOoyGxspu44LJdg-1
Received: by mail-qk1-f199.google.com with SMTP id
 d202-20020a3768d3000000b003d30722c98fso3431016qkc.10
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 09:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BlIGAZvR60K8KfEyVet+GBVvZwSvJEFZQe5BG9TqS1o=;
 b=SeWf7xLTGz/RCtC7X5YMg4o7heDhVYuEKybGZgFxq2BuIP+BAWu1ZQbQxWAM6l3t5I
 xGI/T1SLhSWVqNmO5s8FaoOodIHDKQkCQcdGmbv7XOUtB3NFCCq6Nhsn+iPM7FwB97n1
 atijfKP7Yg8gkGKfgFw45yIoeP4ouBqsd71AqRXoK6r3p7KI9s96R+18mShFzCy8rahb
 jBuoeOJnRcoTNFdI33VlAeRzp8bHjGq4I7Qgb9Zfctsy4rwrJMr1bw3F6aCkOisJO1LI
 J6TcBl10vyk7XwJKpKlA8Kyzo89o+5aq7lXWgIi64AUbOc473bgY9HnrNvuZnEMmtXwp
 BZqA==
X-Gm-Message-State: AOAM531qLkBmZWc+UjaEt497cMRUvP99XyQo7DVx5FaL0ESXYZMJlTU9
 UIUpaUG9R6v7pki6zCTQzQ0HzD0yjBkFkB4mzpWWu0GA5RhNQRfRjhDEyTAMFZhbqBMYUW0pBq5
 DiX+LDWso8g+9WPw=
X-Received: by 2002:ac8:7f83:: with SMTP id z3mr111745qtj.346.1630512084067;
 Wed, 01 Sep 2021 09:01:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFaGOY1i09WU3O40IccyT7NIh9Hcn/UFvOtbsB2eyfR67DVohiLFh2xrpT9KJnnKb5+JzeMQ==
X-Received: by 2002:ac8:7f83:: with SMTP id z3mr111624qtj.346.1630512082852;
 Wed, 01 Sep 2021 09:01:22 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id n11sm96297qtx.45.2021.09.01.09.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 09:01:22 -0700 (PDT)
Date: Wed, 1 Sep 2021 12:01:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Message-ID: <YS+j0LTKe/FRQRqg@t490s>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com> <YS6RFcQnZEhE8XpG@t490s>
 <YS8/cxTtiC7QIxTD@redhat.com> <YS+dxUBrhogJQkEY@t490s>
 <YS+f3rgBLMdR2ELE@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YS+f3rgBLMdR2ELE@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 04:44:30PM +0100, Daniel P. Berrangé wrote:
> QEMU has mptcp support already:
> 
>   commit 8bd1078aebcec5eac196a83ef1a7e74be0ba67b7
>   Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
>   Date:   Wed Apr 21 12:28:34 2021 +0100
> 
>     sockets: Support multipath TCP
>     
>     Multipath TCP allows combining multiple interfaces/routes into a single
>     socket, with very little work for the user/admin.
>     
>     It's enabled by 'mptcp' on most socket addresses:
>     
>        ./qemu-system-x86_64 -nographic -incoming tcp:0:4444,mptcp

Oops, I totally forgot about that, sorry!

> 
> > KTLS may be implicitly included by a new gnutls, but we need to mark TLS and
> > ZEROCOPY mutual exclusive anyway because at least the userspace TLS code of
> > gnutls won't has a way to maintain the tls buffers used by zerocopy.  So at
> > least we need some knob to detect whether kTLS is enabled in gnutls.
> 
> It isn't possible for gnutls to transparently enable KTLS, because
> GNUTLS doesn't get to see the actual socket directly - it'll need
> some work in QEMU to enable it.  We know MPTCP and KTLS are currently
> mutually exclusive as they both use the same kernel network hooks
> framework.

Then we may need to at least figure out whether zerocopy needs to mask out
mptcp.

-- 
Peter Xu


