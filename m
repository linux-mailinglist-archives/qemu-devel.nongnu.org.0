Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B8B340ED2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 21:06:49 +0100 (CET)
Received: from localhost ([::1]:49988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMyuv-0007Hs-3C
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 16:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMytS-0006dw-AZ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMytJ-00086l-OQ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:05:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616097909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K6FhCpUMabYETFCnNI6Q4JAbaREA4bQvzoGfrHADr4I=;
 b=KevMvqpcZ5DxzgSZ637nYfoDLbGlqQMcLqk/eqUu8rcZRzVnv8wx5RnTbU4E6fC2QUCB/P
 Mumh4boXSsXZRsyeX/lsfYXldl5AcRYJzxpFBsPCHJ7rDAbVfmu2GG2pO5FZGiCXR8Q2Y0
 8xYX1Dw2XVwUvTJQX4xJHBw2t199RyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-bg0q-7wKOSChZtuQBvi_0g-1; Thu, 18 Mar 2021 16:05:05 -0400
X-MC-Unique: bg0q-7wKOSChZtuQBvi_0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 154775B361;
 Thu, 18 Mar 2021 20:05:04 +0000 (UTC)
Received: from work-vm (ovpn-115-13.ams2.redhat.com [10.36.115.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD8736EF48;
 Thu, 18 Mar 2021 20:05:02 +0000 (UTC)
Date: Thu, 18 Mar 2021 20:05:00 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: of AVR target page size
Message-ID: <YFOybOQAk6IXCL0R@work-vm>
References: <YFJjIq45ggSZz0CX@work-vm>
 <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
 <YFMpCPtMJzXUeeIk@work-vm>
 <CAFEAcA_+Yvn5S8P3zwPcsO9HF=0rXCJrfUZKs6RAQWhdyG_-fQ@mail.gmail.com>
 <YFMqmDmwDZwRQviM@work-vm>
 <CAFEAcA825k8uttjmJuwNM=rDa-m7nOWJZEAQzP9Zz3e7yyS9Aw@mail.gmail.com>
 <YFMvO/79vcSFOEix@work-vm>
 <CAFEAcA8+FfNaQ+26cSKYP8X05F-hqZ+0CxF7cS0hj=AW2M6O6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8+FfNaQ+26cSKYP8X05F-hqZ+0CxF7cS0hj=AW2M6O6g@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 18 Mar 2021 at 10:45, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > Also, what does the
> > >  /* 0x80 is reserved in migration.h start with 0x100 next */
> > > comment refer to? migration.h has no instances of "RAM_SAVE"
> > > or 0x80 or 1 << 7...
> >
> > It looks like it got moved to qemu-file.h a few years ago
> > as RAM_SAVE_FLAG_HOOK.
> 
> Could we put the define of RAM_SAVE_FLAG_HOOK in migration.h
> with all the other RAM_SAVE_FLAG defines ? It looks like the two
> places that use it already include migration.h...

Do you mean move the rest of the RAM_SAVE_FLAG_* from migration/ram.c
into migration.h?

We could do - although they're never used by anything else.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


