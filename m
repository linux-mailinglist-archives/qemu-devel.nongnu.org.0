Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2692C5A3B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:10:14 +0100 (CET)
Received: from localhost ([::1]:43802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiKmb-0003B5-8b
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kiKlm-0002eq-Ht
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:09:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kiKlk-0002Ia-Up
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606410560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F9gCIpcYzVxNAzonX30wnbTQ1/bm3O7UjCnIoHGkYUQ=;
 b=dnZJpiGq+wPBOXhWMZWKbulA7Rz9EOW9nXZDJX+OAQgDAJFxzQrHDHdt7NVQEI4o5kasPZ
 P0XS8nOq12UtV+Gqnhu37PbOmNs/NKjB3Jwdo7oYHPaQkLrF/bCB5rtbu8mC/TgonOUrj2
 iz9TwP5zKwc0wenm6bOr9bhHfA9c3kM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-KbIvVCFoOSyn2wqbK8IQ1g-1; Thu, 26 Nov 2020 12:09:18 -0500
X-MC-Unique: KbIvVCFoOSyn2wqbK8IQ1g-1
Received: by mail-wm1-f71.google.com with SMTP id o203so1454661wmo.3
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 09:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F9gCIpcYzVxNAzonX30wnbTQ1/bm3O7UjCnIoHGkYUQ=;
 b=BeFUnPd9n0YUGJc+OvYIYNe8w9yDtw4UUZOA16atqbTjQNir8TTPav4ogCDBKVbvId
 5sOEHsD2rMOx7OqzzY+vTcxvI90f9imgHqUm9UzAJYzOccXsmL2CPZ2lR15VLVO4Os3h
 UsJRZBMab3dEPelYeIaOnU7jzKyYAR319cE9g+dDamV/lRcf1Fq4qgwk9wMAsxDZf48O
 kGAb759bloXa/LL8OC6vjNt/6qV2enbPoElgEeypKf3bIE0yV/cKpJ8cUUpEO1r3MKA7
 wbFpZWxyqoZu1H49DzhlQ2aKZfQJ/H4YF8TkG4nH1eLlvyaL7EGpFUSvGO0ijjdDyqkx
 aMXg==
X-Gm-Message-State: AOAM532of6O1fjGz0+JM5mZsk/HoRLWHNkgXnpfLp/SkkTy/3w7+wXqY
 JaXm5r/GGjIoOu0IbKofcrpuUNQMZQByoTfwy5Um+/4srTpPnA2Dg2Rwgl0PKQxTgVKoBlvYZBl
 VXuePh+pCr7PlN6I=
X-Received: by 2002:a7b:c1d8:: with SMTP id a24mr4311609wmj.112.1606410557227; 
 Thu, 26 Nov 2020 09:09:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZ5COysCKCHSMl8NOFalaCBOxeUxVDi4ecxIj6dZBfaXKL4pd6iLbd5oZhRo5E6+89nfXBtQ==
X-Received: by 2002:a7b:c1d8:: with SMTP id a24mr4311590wmj.112.1606410557022; 
 Thu, 26 Nov 2020 09:09:17 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d16sm10771553wrw.17.2020.11.26.09.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 09:09:16 -0800 (PST)
Date: Thu, 26 Nov 2020 12:09:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Antoine Damhet <antoine.damhet@blade-group.com>
Subject: Re: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields
 to be set.
Message-ID: <20201126120701-mutt-send-email-mst@kernel.org>
References: <20201125132711.jqb7znxu5jpoanwi@tartarus>
 <20201125133251.GI30079@redhat.com>
 <20201125110221-mutt-send-email-mst@kernel.org>
 <20201125201322.urze5b7vwaa2t5sy@tartarus>
 <20201126051838-mutt-send-email-mst@kernel.org>
 <20201126125012.x6yzsou5rmlxagli@tartarus>
 <20201126082606-mutt-send-email-mst@kernel.org>
 <20201126163450.knb55wh2u7k2qgbb@tartarus>
MIME-Version: 1.0
In-Reply-To: <20201126163450.knb55wh2u7k2qgbb@tartarus>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, lersek@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 05:34:50PM +0100, Antoine Damhet wrote:
> On Thu, Nov 26, 2020 at 08:29:41AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Nov 26, 2020 at 01:50:12PM +0100, Antoine Damhet wrote:
> > > On Thu, Nov 26, 2020 at 06:09:11AM -0500, Michael S. Tsirkin wrote:
> > > > On Wed, Nov 25, 2020 at 09:13:22PM +0100, Antoine Damhet wrote:
> > > > > On Wed, Nov 25, 2020 at 11:04:55AM -0500, Michael S. Tsirkin wrote:
> > > > > > On Wed, Nov 25, 2020 at 01:32:51PM +0000, Richard W.M. Jones wrote:
> > > > > > > On Wed, Nov 25, 2020 at 02:27:11PM +0100, Antoine Damhet wrote:
> 
> [...]
> 
> > Exactly so I ask myself whether it's worth it, their next version
> > will check CPUID and then where are we?
> 
> Then I guess they will have to admit that they are purposefully blocking
> VM use and it's not our problem anymore.
> 
> > But maybe it's time we just changed all these IDs to e.g. QEMU.
> > We are very far from bochs generated tables by now.
> 
> That's a good idea, but I still think they should be user override-able
> (unless you think it would be a heavy maintenance burden, in that case
> you are king in your castle :D )

Fundamentally there's a chance that if you get unlucky
with your OEM ID some software somewhere will look for
it and try to activate some vendor specific behaviour.
So giving users full control here isn't all that safe ...

Question btw, are you also supplying a SLIC table?


> > Question is will this cause annoyances with e.g. windows guests?
> 
> Windows 10 guests seems unaffected, I cannot say for the other
> versions/servers editions.
> 
> > Igor what's your experience with this?
> 
> [...]
> 
> -- 
> Antoine 'xdbob' Damhet


