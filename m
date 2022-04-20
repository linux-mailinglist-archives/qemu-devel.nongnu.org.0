Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0739509164
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:28:16 +0200 (CEST)
Received: from localhost ([::1]:45862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGvu-0002kv-Lb
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhGVx-0003n0-Uu
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:01:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhGVu-0002JS-D1
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650484880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hcIp/QTMyvqoOMGZfVK9puIhxtI1F5YGCEkGqy/pWdU=;
 b=XH2eDUmZmLob3/fBQbDX+c/DeXp+S8++dKM7y0bTFH6ZC6Tw4LlGxWiYykIfONBQj9yMz5
 o4syplX53AH0macU1JUwSld2bRtXiflSXZpHLNa5lqrsfBOG9NgkynzcSWD3+Az5Fmo4eG
 oQdNwt/G7Y4SwWmHIeHfP2p1RtYJ5ws=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-uMM5kVQxN3uTZJyAO3OdHQ-1; Wed, 20 Apr 2022 16:01:19 -0400
X-MC-Unique: uMM5kVQxN3uTZJyAO3OdHQ-1
Received: by mail-il1-f197.google.com with SMTP id
 j5-20020a056e020ee500b002cbc90840ecso1501434ilk.23
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hcIp/QTMyvqoOMGZfVK9puIhxtI1F5YGCEkGqy/pWdU=;
 b=Xeit513j7qH2ThhnN5Kwd8FPiFTFYZi2BfQY0IYK6+YIbfUfPa/obKeFJr/JXEQ6IZ
 N8s1Dw3SyyPCQo6jsGF0UJfcazofGaBWKWObi2BucJslKOxubfJlFS6ijeIhUDGPeTHo
 XNxLEgDtlbn5cCMfiC7aRkLHOOejbp8LBP2SHyz+oGczyzuelwg9L5RtlSicZtpDU3ME
 OD8sdxkFO8w8KgAASWPoD8hGG2VmJ0JJUOlcnakYNM5T4PJYiSyUY6hdvw/CiwEryOYl
 cK0vTHDKfNYlS7w1mV+52/zu8FNQbedIa04iTtgnpiUhVDoMWJ9anvJecdEPOjum+udl
 xfPQ==
X-Gm-Message-State: AOAM533onac9rSmkZt9kC7P7hRMLOeXNhxhyc8IjNrZv1r2ys0L48g/0
 c5QulHGdBTsiAgGS5ekCUWWXZq0MUB/m9rNyZZ6M8p0xfImbOfJUchomrDwn9T8Fa5gm2VtsqBV
 hvnz2ruAqaorBwo4=
X-Received: by 2002:a05:6e02:1445:b0:2cc:4b0a:5457 with SMTP id
 p5-20020a056e02144500b002cc4b0a5457mr4340475ilo.243.1650484878787; 
 Wed, 20 Apr 2022 13:01:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfg5J5gjBN2a+ThKx2OR4jRSm+YRF67dBoLt20wIwNG99xfU2ALGPaYk9jCJplG3bMZjDy3w==
X-Received: by 2002:a05:6e02:1445:b0:2cc:4b0a:5457 with SMTP id
 p5-20020a056e02144500b002cc4b0a5457mr4340464ilo.243.1650484878596; 
 Wed, 20 Apr 2022 13:01:18 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a92cbcc000000b002bd04428740sm11190227ilq.80.2022.04.20.13.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 13:01:18 -0700 (PDT)
Date: Wed, 20 Apr 2022 16:01:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 15/19] migration: Export tls-[creds|hostname|authz]
 params to cmdline too
Message-ID: <YmBmisrlDpQEFnRc@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-16-peterx@redhat.com>
 <Yl/qw5ogeSjgrnuX@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/qw5ogeSjgrnuX@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 12:13:07PM +0100, Daniel P. Berrangé wrote:
> On Thu, Mar 31, 2022 at 11:08:53AM -0400, Peter Xu wrote:
> > It's useful for specifying tls credentials all in the cmdline (along with
> > the -object tls-creds-*), especially for debugging purpose.
> > 
> > The trick here is we must remember to not free these fields again in the
> > finalize() function of migration object, otherwise it'll cause double-free.
> > 
> > The thing is when destroying an object, we'll first destroy the properties
> > that bound to the object, then the object itself.  To be explicit, when
> > destroy the object in object_finalize() we have such sequence of
> > operations:
> > 
> >     object_property_del_all(obj);
> >     object_deinit(obj, ti);
> > 
> > So after this change the two fields are properly released already even
> > before reaching the finalize() function but in object_property_del_all(),
> > hence we don't need to free them anymore in finalize() or it's double-free.
> 
> 
> I believe this is also fixing a small memory leak

Yes I think so.

I didn't even mention it since it's one global tiny variable and IIUC QEMU
does have other similar cases of keeping vars around. As long as it'll not
grow dynamically, then doesn't sound like a huge problem.

But yeah, doing proper free is still ideal.  So I'll add one more sentence
to the commit message in next version.

Thanks,

-- 
Peter Xu


