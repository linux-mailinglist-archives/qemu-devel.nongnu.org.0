Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E803A402D19
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:47:47 +0200 (CEST)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNeGA-0006ey-Cu
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNeDU-00057r-7T
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:45:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNeDS-0005Wm-41
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631033096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z6X1zXM+V3pfaHLneJgq0/QpNFsX88nqrIUCzsyp6qY=;
 b=DjOcsYY0uy8o1MS+0ymDTtsEHTn6VQCr4CD0aOI1xxz4sbJVD7CLKOYPLrXO0RslEUIv6r
 6RaQFJCnpdrhsLAM3hjSl9ZDMuyFLW6MuhAxpITU0tSP6kyGNVS1l795mfRVhAYGBdvCL6
 HeWObOlA9qWcMpDD9LC7EF9yFJv8hKE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-BmFnhkHiOtWw338cJqnSjw-1; Tue, 07 Sep 2021 12:44:55 -0400
X-MC-Unique: BmFnhkHiOtWw338cJqnSjw-1
Received: by mail-qt1-f197.google.com with SMTP id
 c22-20020ac80096000000b0029f6809300eso15287287qtg.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 09:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z6X1zXM+V3pfaHLneJgq0/QpNFsX88nqrIUCzsyp6qY=;
 b=T35vj5xNSWuHbS26dKLRNrwUmL1/sUSyKjfGsJsKF96IwprWMW1Z5PCeZnfrelqpbO
 h2JO92e4UAyELi53DumF1ysb5DgH4HFo+AGuW/BCVxdPOgrsrUewP7D5b4XcySRqI46R
 aL4JFryuR0yXrPil3yoD6sykSMTP7oFpyn0J0r9YdFdyKK8UcrLO03ztZETi8ojKS330
 yU8EsdQb+75GZtXkzmkCtNUQ0jOotbe33nlQlrxy+TP+nIb+mWO3Mhux5BqCE7UEOQSj
 LB2hiPdzz78tGD7xVdDvJriIqIlHKhh49dDiiigD3bBo7o5WjzXPECV1FsQZqvfAqpwX
 kNhw==
X-Gm-Message-State: AOAM532WGSx9RNtkdFShqVokXFhs2LF7AI3UHPon2QaCShr4J8n4bnuj
 ZGEcw1XZ/oSp7Wdi/9Tgn3rog02Q70viOfMm97ZhWefz7qVD9K2moFV1GAob42qJ54sCRUGz39Y
 REKZNlZTb+bXrRaU=
X-Received: by 2002:a05:620a:4411:: with SMTP id
 v17mr16374582qkp.367.1631033095339; 
 Tue, 07 Sep 2021 09:44:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3nlyNVSl5Gfxx0zWNqEhZb6+rlnQIs3JKFOdqPA5lc+JgFcipw+ibtareEX2/kQ2TGpW0cQ==
X-Received: by 2002:a05:620a:4411:: with SMTP id
 v17mr16374548qkp.367.1631033095055; 
 Tue, 07 Sep 2021 09:44:55 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id j6sm7542648qtp.97.2021.09.07.09.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 09:44:54 -0700 (PDT)
Date: Tue, 7 Sep 2021 12:44:52 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTeXBCAUOpy0HagV@t490s>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com> <YS6QmOrN4qr055vR@t490s>
 <CAJ6HWG72311UK9Nvh+JDw-zo1Days0u8N_QHbeGGdfKR+hALCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG72311UK9Nvh+JDw-zo1Days0u8N_QHbeGGdfKR+hALCA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 03:59:25AM -0300, Leonardo Bras Soares Passos wrote:
> I also suggested something like that, but I thought it could be good if we could
> fall back to io_writev() if we didn't have the zerocopy feature (or
> the async feature).
> 
> What do you think?

That fallback looks safe and ok, I'm just not sure whether it'll be of great
help.  E.g. if we provide an QIO api that allows both sync write and zero-copy
write (then we do the fallback when necessary), it means the buffer implication
applies too to this api, so it's easier to me to just detect the zero copy
capability and use one alternative.  Thanks,

-- 
Peter Xu


