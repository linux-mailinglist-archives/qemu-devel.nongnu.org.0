Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B5E400296
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:49:41 +0200 (CEST)
Received: from localhost ([::1]:48342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBRk-0004q0-Kt
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMBQN-00047D-3P
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:48:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMBQK-0002Fv-IY
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630684091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjlyhuFZ7nJnpwZtr4YvQhzpyisAGUIeriRQThDeg/0=;
 b=hUWBvmZsv/hqGI43K0Fe10aVvBNDzpWMjbSjKKjhzJW8afileTir9T8KsvEFQdslSz2Op+
 Xs3tl5gMAsAAGy73EI/yzxa2Ca3H43JOYzlUQ6c4jezkne6kgOl2ZR6wA5PQz6SPH9LvUR
 pf5nc3VM5OFryOUGEaOZtNyk6g69y8A=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-lmIVrj2oMqm7NlwGiKex5A-1; Fri, 03 Sep 2021 11:48:10 -0400
X-MC-Unique: lmIVrj2oMqm7NlwGiKex5A-1
Received: by mail-qt1-f199.google.com with SMTP id
 l22-20020a05622a175600b0029d63a970f6so5412059qtk.23
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HjlyhuFZ7nJnpwZtr4YvQhzpyisAGUIeriRQThDeg/0=;
 b=k07cY7OhBeqiinLXB+8no785hQ3ZAU3SJJb8jOqpflr5ghsA2AbTRqnQrcWJL2I4LD
 IMKg8dycMFAYlLpRy2iuemDbpDN7ClMtXkjNhRkqlCvpl296reZs+xPjP4EoJerUiKRq
 nnq5+lwOPL1ZjgoNtfiNZJo+mNKtnsBnCF5xDBUGdpDdmXkhGy7i9K82CDOXQyz7l7UY
 cN627qGoqgj2pJpC2cQdVVjDi0flprCeMutB96F3SzsGnWNy8O9mgcS8gvpoMyeVfvCx
 KK06WKCvsf4cfZ4Ticx6P+kmLDlmlbMBRX46Qqz7c7cp9uX4K49MY/xykYVJbPink6Mr
 1WNA==
X-Gm-Message-State: AOAM5320C/fFy5a/tLTMVwHtmOoHsl5ZR3Pe/5RavIye0UiSfGQcXmRr
 gwYxapI231E0aKBHPh+7RVMc5dj2QjtlXkI6yalqSlROuoEBR+/er+Gk1T8ehgr/De3/mafeuk6
 0P+HIfrT2ankhPxo=
X-Received: by 2002:a37:9f4d:: with SMTP id i74mr4034049qke.196.1630684089755; 
 Fri, 03 Sep 2021 08:48:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvZniYWsgTy/SbPGveOZH1r4oAxR6tsTzE185rx/aLy/ZsOLUaVz2+bJb3ejc4cAO4Q+H43g==
X-Received: by 2002:a37:9f4d:: with SMTP id i74mr4034034qke.196.1630684089538; 
 Fri, 03 Sep 2021 08:48:09 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id a9sm4022832qkk.82.2021.09.03.08.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 08:48:08 -0700 (PDT)
Date: Fri, 3 Sep 2021 11:48:07 -0400
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YTJDt7XP+cBC7Un2@t490s>
References: <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
 <YS0rXQXwqKjhr4TA@t490s> <20210902102616.1b596104@redhat.com>
 <YTDVh9/MVAfCdkeu@t490s> <YTDXPB/t22lzRS/H@redhat.com>
 <YTDd31TI0fW83ND2@t490s> <87ilzj81q7.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ilzj81q7.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 04:57:04PM +0200, Markus Armbruster wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
> > Hi, Dan,
> >
> > On Thu, Sep 02, 2021 at 02:53:00PM +0100, Daniel P. Berrangé wrote:
> >> The correct ordering of devices/backends is generally pretty obvious
> >> for libvirt to determine. Most of the problems we've had related to
> >> ordering are on the QEMU side, because the ARGV given to QEMU made
> >> correct sense if parsed left-to-right, but QEMU didn't actually process
> >> them in that order. We've patched QEMU to hack around its inability to
> >> honour the CLI order repeatedly.
> >
> > Is there a pointer to the problem?
> 
> Just an example:
> 
> 9ea18ed25a "vl: Fix -drive / -blockdev persistent reservation management
> cda4aa9a5a "vl: Create block backends before setting machine properties"

Thanks, same to Dan.

> 
> >> Being completely self-ordering on the QEMU side using a topological
> >> sort would be neat from a conceptual purity POV, but that is quite a
> >> challenge to implement and I'm not convinced it is worth it, compared
> >> to other problems we want to spend time on.
> >
> > I just noticed there can also be dependency between the buses; that cannot be
> > fixed by ordering of classes indeed as either proposed in this series, or
> > introduce a new priority.
> 
> --verbose?

Please ignore it - I just started to realize what kind of a rabbit hole I'm
digging, and I am already prepared to run away. :)

-- 
Peter Xu


