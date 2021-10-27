Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E654A43C2CA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:17:46 +0200 (CEST)
Received: from localhost ([::1]:47410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfcFt-0008Or-Qn
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfcDn-0007XB-41
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:15:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfcDj-0007ww-Ju
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635315329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8YBrMndQHW9XDYC7w/hLuyvTg8+isdGB+roo06OItrc=;
 b=gP+QGUxt4lkHR7lfoJEQ2MT1bIFMge1pihOIlkW8BWasKoVMvhOZaw6M7w1Ovj4tNDqQyK
 iJDyEiVU3ziPOA9XaSulqgmxpilRTyEA9sJ5uxv90qnAFAU1RMIHVOLvLA6D3+aRD7LJnn
 vKBycqharLgwjgyTerhimneXIzr9quk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-t4pwOanvPHir2TP2t9gtWg-1; Wed, 27 Oct 2021 02:15:28 -0400
X-MC-Unique: t4pwOanvPHir2TP2t9gtWg-1
Received: by mail-pj1-f72.google.com with SMTP id
 nk11-20020a17090b194b00b001a22ed4a912so692808pjb.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 23:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8YBrMndQHW9XDYC7w/hLuyvTg8+isdGB+roo06OItrc=;
 b=Kr7KTUfM6mZIhrfac2NU8IJ+I5mfZY6wkcPLHd0kukKbu9a6v4RTgCq6j+6fdWOHQ/
 VZq/bmBOOllcYmneij+SrVeN6Q63Q+r/ZqNklq+vV21IsEyFL7b7WMXV1glT4Un8V7NS
 +bVzAeIkMhZkQ5u1aSvSv9OIKXfne9lDZHbxI6j2B38GhlW+CES4kXxCve33PW2RKDTg
 wmFQSRC7wvnaZbYqlC7oBnQ9aV9REHVOAo8qemzX6TNMs3zq2DYpbH7KNhwGv1xDG7ya
 eXJ6xdtMuhbb/w8xRyWQcvMU2vS9wXJlLm/iK6QNm2jchYWGvmebBihUk2A5LTh1QMQc
 svpw==
X-Gm-Message-State: AOAM532yOh/9tKl0s+82AJps5aq3ZdkWTb0X8GuFIHeoF4+kP3CIU9TN
 XqNubn1gGf5g6ZOoN3A4V7M2txIwJd1dP/RjOLZv1Ek3w0OYGHrsNA2nKz+1jn6lMxd5UKze6L5
 xSpEEDglqxg86phk=
X-Received: by 2002:a17:90b:17c3:: with SMTP id
 me3mr3713872pjb.243.1635315327298; 
 Tue, 26 Oct 2021 23:15:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/hejBJd57fiSqkwfJ5//VRwV7ql6zwdKmZSQ/lL4QOo1c2tWFq3oQabgRNT7Si81p5CGxAw==
X-Received: by 2002:a17:90b:17c3:: with SMTP id
 me3mr3713853pjb.243.1635315326946; 
 Tue, 26 Oct 2021 23:15:26 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id c4sm28392180pfv.144.2021.10.26.23.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 23:15:26 -0700 (PDT)
Date: Wed, 27 Oct 2021 14:15:21 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v4 1/3] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
Message-ID: <YXjueV6ixuFVgn/7@xz-m1.local>
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-2-leobras@redhat.com>
 <YWZ3kbsbUmCyr6Ot@t490s> <YWZ9lWKsU83JCZxS@t490s>
 <CAJ6HWG4pvP7dJ1=kgHKGAa8r=bgOcLT+YsZtSum0SnSLBNc3fg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG4pvP7dJ1=kgHKGAa8r=bgOcLT+YsZtSum0SnSLBNc3fg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 03:07:13AM -0300, Leonardo Bras Soares Passos wrote:
> > >
> > >            if (flags & ZEROCOPY) {
> > >                assert(fds == NULL && nfds == 0);
> 
> Quick question: Why is this assert needed?

Not required I think; just want to make sure no one passes in the fds when
using zero copy mode.

Thanks,

-- 
Peter Xu


