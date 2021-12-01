Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C662D464C45
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 12:02:04 +0100 (CET)
Received: from localhost ([::1]:52528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msNND-0002S5-1v
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 06:02:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1msNKU-0000x8-CG
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 05:59:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1msNKM-0004mW-VS
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 05:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638356345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/if6yi0WL+uHavZl4RTq/fuekfctUyfHo0gLcy6D0m4=;
 b=WrywV0XU4lu/jG4Nx8v8RqzYYr2zf/3p4Y/eIlBe43zi+bBwHH/HPt1vrrM2eAZXWZztVD
 Ultl4g/P5nx1/1JlubyoJipGWqTJpwT+Bnp0Kni1CdVzxz7dZj1a8UwQlXrF07G5JIywG4
 jmF93Z7V6i47I9tUKMV84LdDuBYEHxo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-yWzt8HeVMYaYwu9LtOXUKQ-1; Wed, 01 Dec 2021 05:59:04 -0500
X-MC-Unique: yWzt8HeVMYaYwu9LtOXUKQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c8-20020a7bc848000000b0033bf856f0easo15547123wml.1
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 02:59:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/if6yi0WL+uHavZl4RTq/fuekfctUyfHo0gLcy6D0m4=;
 b=ZHAk3NaMME9jaWfLxYsXHP05Q7oCqU5C99Jjfs5GL2BvCh3kDE5GbUy4hPxDGMNPHM
 5Bi6vZCGnzB6K0hg4iy1o6LAtFpjUktV8a9RDWyrs0Ad1SDPKIpnTp+1IeUjON7GSE28
 1hmrnz6+w6ljEaisYff/HX9f5ZI3SbWvSmcwPDt+N0PE0rVvWrc19aiXIa4maJCntVFt
 CtSJTEL8ugxTbV5xJejoUsIatOXikRa6RTrChq8I7b5scbicZPEa55WfS44pQxSEl2Tq
 miGKHdFDUxG8PtJ4a5mG2fto25+WfUbBDTaDcvRMwYjGp+iuH2mvurny/BZqcCCi4aUb
 wL8g==
X-Gm-Message-State: AOAM530TtJgvN2So42VlK2K54nQcCjNJhu2QoqlkC9ggeKBjXRn/a7ss
 3wNfyYcqRirSgAB/sZV2QMGCCj05gCaQdd+og8XoX4R2uLX4PnpDX3fZY6/YaW56hEjjNbBH43R
 L58SZFV+PD5i8XZo=
X-Received: by 2002:a05:600c:378b:: with SMTP id
 o11mr6124087wmr.157.1638356343325; 
 Wed, 01 Dec 2021 02:59:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwi07a1GpC8KGRCG791L4dm1tLD3cmuVTcR8hP0zQQW9ECeLYEPdrAOCgSyItYxUtXMWOL+GQ==
X-Received: by 2002:a05:600c:378b:: with SMTP id
 o11mr6124046wmr.157.1638356343036; 
 Wed, 01 Dec 2021 02:59:03 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o4sm771558wmq.31.2021.12.01.02.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 02:59:02 -0800 (PST)
Date: Wed, 1 Dec 2021 10:59:00 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 17/23] multifd: Use normal pages array on the send side
Message-ID: <YadVdPNLr4gpbmXC@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-18-quintela@redhat.com>
 <YaYB7sSHKoVZgJ6q@work-vm> <87czmhhmyh.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87czmhhmyh.fsf@secure.mitica>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > * Juan Quintela (quintela@redhat.com) wrote:
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >
> > Can you explain a bit more what's going on here?
> 
> Sorry.
> 
> Until patch 20, we have what we had always have:
> 
> pages that are sent through multifd (non zero pages).  We are going to
> call it normal pages.  So right now, we use the array of pages that we
> are passed in directly on the multifd send methods.
> 
> But when we introduce zero pages handling around patch 20, we end having
> two types of pages sent through multifd:
> - normal pages (a.k.a. non-zero pages)
> - zero pages
> 
> So the options are:
> - we rename the fields before we introduce the zero page code, and then
>   we introduce the zero page code.
> - we rename at the same time that we introduce the zero page code.
> 
> I decided to go with the 1st option.
> 
> The other thing that we do here is that we introduce the normal array
> pages, so right now we do:
> 
> for (i = 0; i < pages->num; i++) {
>     p->narmal[p->normal_num] = pages->offset[i];
>     p->normal_num++:
> }
> 
> 
> Why?
> 
> Because then patch 20 becomes:
> 
> for (i = 0; i < pages->num; i++) {
>     if (buffer_is_zero(page->offset[i])) {
>         p->zerol[p->zero_num] = pages->offset[i];
>         p->zeronum++:
>     } else {
>         p->narmal[p->normal_num] = pages->offset[i];
>         p->normal_num++:
>     }
> }
> 
> i.e. don't have to touch the handling of normal pages at all, only this
> for loop.
> 
> As an added benefit, after this patch, multifd methods don't need to
> know about the pages array, only about the params array (that will allow
> me to drop the locking earlier).
> 
> I hope this helps.

OK, so the code is OK, but it needs a commit message that explains all
that a bit more concisely.

Dave

> Later, Juan.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


