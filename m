Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41F2439767
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 15:22:09 +0200 (CEST)
Received: from localhost ([::1]:54746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mezvV-0003rl-01
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 09:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mezY1-0001Zg-HP
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:57:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mezXx-0002Qr-5M
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635166666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CwmfppKT2h/2FCm0HQt9qMvmGiGUyD4/C5l+mi7YRtY=;
 b=IBA9kH9aDtdLWydgKgK+gVqiKDkTLcOibN3q8JAXjdaAWRrR+IpJfkJxVDrRCrPXBGQgRY
 tEDT87BOnWz+/lxHyXqI0BZbt9SS+L0tAd+2i2zT8p8PFQzZ4olx5kHU2hUZtVpPW5XN0u
 6tw+FdE0b/OKYnxd+tuR81h6d5TEYdc=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-1rYoDbejO_OeZArJ2w0jJQ-1; Mon, 25 Oct 2021 08:57:45 -0400
X-MC-Unique: 1rYoDbejO_OeZArJ2w0jJQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 z12-20020a655a4c000000b0029506c80060so6232253pgs.20
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 05:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CwmfppKT2h/2FCm0HQt9qMvmGiGUyD4/C5l+mi7YRtY=;
 b=SGXiSKbL/48lYV9jPw5qgXrfqV7RXGQew8r4GitG98mGIFqQBDL1IjULBPxsC/VTLA
 +3DdmSgCTFixcnNgf4YylGyXqwDlP8nynXEbI2RhQwkTzSjwkqA2PLKGVpkych5I5mYf
 INSa6WTmx2+WMaTOHybA3NzRs59ABTOMcLKpEsdvegE63xk3gPhX6NBJwYorKKILqJue
 lTNkOn/IjkGkRuzjRoNtRaIDE8SWi7MOd8ELB+ZTk97T9G7eTOH2vODjkVT7k9he6xc9
 ymMJ0sBZhDMVROBOySFy7U8OoilSw4OcJrlqwpaUzb2j75uBL4X9J9jzZgPR8qixhMe4
 47mw==
X-Gm-Message-State: AOAM533uaXZWkb2OtvaJ8xMH/vH4fh1ZlOzesXeEUrF8Cci/ifUKOH0c
 CE9cu5N96F1CScs2hODP1jtfOVS+Tirns2IESaFFA3R9LluKZLX3Q8zQLczeSI8uN4j/y3tzDK7
 FIA2l9706/oSd9os=
X-Received: by 2002:a17:90b:4c12:: with SMTP id
 na18mr9662325pjb.103.1635166664342; 
 Mon, 25 Oct 2021 05:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9aXXQ+VYH8QSWRWGBGmsXD8Bq0o7czVdzm1bFcp3EfOV0ihXa2ufi7O0gF5xtAKzC5uASWw==
X-Received: by 2002:a17:90b:4c12:: with SMTP id
 na18mr9662273pjb.103.1635166663873; 
 Mon, 25 Oct 2021 05:57:43 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.70])
 by smtp.gmail.com with ESMTPSA id v12sm18664202pjs.0.2021.10.25.05.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 05:57:43 -0700 (PDT)
Date: Mon, 25 Oct 2021 20:57:36 +0800
From: Peter Xu <peterx@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 7/8] pci: Add pci_for_each_device_all()
Message-ID: <YXapwC46W3Kzq5Qr@xz-m1.local>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-8-peterx@redhat.com>
 <20211021064948-mutt-send-email-mst@kernel.org>
 <YXIi65J4XiVcdYeZ@xz-m1.local>
 <20211022042642-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211022042642-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 22, 2021 at 04:43:43AM -0400, Michael S. Tsirkin wrote:
> On Fri, Oct 22, 2021 at 10:33:15AM +0800, Peter Xu wrote:
> > Hi, Michael,
> > 
> > On Thu, Oct 21, 2021 at 06:54:59AM -0400, Michael S. Tsirkin wrote:
> > > > +typedef struct {
> > > > +    pci_bus_dev_fn fn;
> > > > +    void *opaque;
> > > > +} pci_bus_dev_args;
> > > 
> > > code style violation. CamelCase for structs pls.
> > 
> > OK.
> > 
> > > > +/* Call 'fn' for each pci device on the system */
> > > > +void pci_for_each_device_all(pci_bus_dev_fn fn, void *opaque);
> > > 
> > > Instead of hacking pci making initialization o(N^2),
> > 
> > Why it's O(N^2)?  One vIOMMU walks O(N), and we only have one vIOMMU, or am I
> > wrong?
> 
> What I meant is this is O(N) and if called M times will be O(N * M)
> yes your patches only call once so O(N), still we can do better.

I see.

> 
> > > can't we add a variant of object_resolve_path_type ?
> > 
> > Could you elaborate?  Here what we want to do is to make sure there're no
> > specific PCI devices registered, and potentially it can be more than one type
> > of device in the future.
> > 
> > Thanks,
> 
> All you seem to care about is checking there's no VFIO
> (why - should really be documented in a code comment much more clearly).

Right, Alex asked the same question.  I'll make sure to mention that in the
commit message in the next version.

> Looks like object_resolve_path_type does that with O(1) complexity.
> If we need a variant that checks for multiple types we can add that.

It's still O(N), or am I wrong?  I mean for example there's the loop in
object_resolve_partial_path().

But yeah I can use that too if you prefer, it's just that when we want to
detect more types of pci classes it could be slower iiuc, because we'll need to
call object_resolve_path_type() once for each type.  For pci bus scan it's
always one round because we only have at most one x86 vIOMMU for each guest.

At the meantime, IMHO patch 1-6 are cleanups that should be good even without
patch 7/8. If we prefer object_resolve_path_type() I'd still think it would be
good to propose patch 1-6 separately (with some patch properly squashed as
suggested by reviewers)?

Thanks,

-- 
Peter Xu


