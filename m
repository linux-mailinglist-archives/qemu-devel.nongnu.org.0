Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B8A41BA95
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 00:52:28 +0200 (CEST)
Received: from localhost ([::1]:36898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVLxY-0007Ud-S9
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 18:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVLwF-0006oH-Ga
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 18:51:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVLwD-0005ef-1M
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 18:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632869460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=el6WGsq/rzaDDa+0C6xD1xoKNLX5HzZZXuUHLsi9Vz8=;
 b=cSEf1QJd+L4CQkRHxVRw+7P6BKN+QqqmjULq0Fdk/YnHRyds3d87MxkNH7nmXZ/6+kB9ow
 bdy+L0TEzOOksnQBW8kIiQPAjHOvz26iGipJlV6H9gNeEv7/qNik0WNY7URHKJ4vElldSI
 rX6gaa9ZCOILfN7f/oTfg0huNlHK3MU=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-11AIV8aRNyWIghZN1-F1yw-1; Tue, 28 Sep 2021 18:50:58 -0400
X-MC-Unique: 11AIV8aRNyWIghZN1-F1yw-1
Received: by mail-il1-f200.google.com with SMTP id
 n13-20020a92d9cd000000b0025872f0c828so567354ilq.19
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 15:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=el6WGsq/rzaDDa+0C6xD1xoKNLX5HzZZXuUHLsi9Vz8=;
 b=e+nAhQYf9SjUfgg9xGOvX1RlCjUx4lT5qYHsNil98Z6ML+1X73ASfNhel7Hixz1Bjq
 NTqlJSAl+4m4CZNsEAkMhZpJH2xGUQ6BzzkMqJeMNlI+BOeAwmjPRYjRLw4/Nb147nfJ
 siRl9wFZQI116BTgvD+Zex2I5wTfIO4ggVmjk3VtAwI3TJeABk5K1/DBACoSsChk9rP8
 IPgQuL0VgAdR4O6G2gsQ+L23dIFDcq2G984as13usuSns6C9aOMki7i4d4ltWLlwHT3Q
 jOoozmuK/5DiFjfGQL9672RDdR7t3ewAQLcVHV+YUaKisiuGs461Mx6GHes+v+q5Scnj
 /aKA==
X-Gm-Message-State: AOAM5328pIWlSfwQ9sDi4tD7IhmmTKzZxL9jNxMyPehW2r/w/Ja2xX9o
 zdpHyqUFvRsqLuEt+l5yRBnTaSnr43p+8gnR6BUWvYR3j4Q2rPbkvB0tcCjQbp2A6tYdD9lp2xM
 Z86zTWHaSc6DycG4=
X-Received: by 2002:a05:6638:1606:: with SMTP id
 x6mr6777447jas.59.1632869458060; 
 Tue, 28 Sep 2021 15:50:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkk+6L+M2Zs3L93oaGYlz0vYoZo9C0kQtxAHkXU0lFAtmCMG/Me4s2v9wz2jF7l16gDr5XUQ==
X-Received: by 2002:a05:6638:1606:: with SMTP id
 x6mr6777438jas.59.1632869457911; 
 Tue, 28 Sep 2021 15:50:57 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id a12sm213581ilb.66.2021.09.28.15.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 15:50:57 -0700 (PDT)
Date: Tue, 28 Sep 2021 18:50:55 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v3 0/3] QIOChannel async_write & async_flush +
 MSG_ZEROCOPY + multifd
Message-ID: <YVOcT0qv0Sv72BmS@t490s>
References: <20210922222423.644444-1-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210922222423.644444-1-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 07:24:20PM -0300, Leonardo Bras wrote:
> This patch series intends to enable MSG_ZEROCOPY in QIOChannel, and make
> use of it for multifd migration performance improvement.
> 
> Patch #1 creates new callbacks for QIOChannel, allowing the implementation
> of asynchronous writing.
> 
> Patch #2 implements async_write and async_flush on QIOChannelSocket,
> 
> Patch #3 Makes use of async_write + async_flush to enable MSG_ZEROCOPY
> for migration using multifd nocomp.
> 
> Results:
> So far, the resource usage of __sys_sendmsg() reduced 15 times, and the
> overall migration took 13-18% less time, based in synthetic workload.
> 
> The objective is to reduce migration time in hosts with heavy cpu usage.

My previous memory is that we'll add a capability bit for migration, so it'll
not be enabled until user specified it.  Plan to do it in the next version?

It'll still be okay if you want to separate the work of (1) qio channel
zero-copy support on sockets, and (2) apply zero copy to migration, then that
can be done in part 2.  Your call. :)

Thanks,

-- 
Peter Xu


