Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2837053640F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 16:29:24 +0200 (CEST)
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuaxv-0004gF-0g
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 10:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nuatw-0001gX-0t
 for qemu-devel@nongnu.org; Fri, 27 May 2022 10:25:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nuatt-00063b-RK
 for qemu-devel@nongnu.org; Fri, 27 May 2022 10:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653661513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+3/+W/9eruN4evs+r4IG/20o3DUGUaVZfa391XjM5P0=;
 b=HsKLrvl0LzJpZAZ+bVVYFHnl1BYPxskUsLvAtVxQwNLEZkEoBnc3GzcWIlaFd2vUAOVC7t
 g2LMAKrziCqftl+ajznqJIIkKNEmMo0qqHDJ8G80msXGaMbgkgKQmVqWoXupQJTveD/ySX
 383lNuEgYDxFZ739EF5wOvZ9p1UXg08=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-wHiph-Y8Ox-2MfUlC_DL4w-1; Fri, 27 May 2022 10:25:09 -0400
X-MC-Unique: wHiph-Y8Ox-2MfUlC_DL4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49DBF858EED;
 Fri, 27 May 2022 14:25:09 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C46A40CFD0A;
 Fri, 27 May 2022 14:25:08 +0000 (UTC)
Date: Fri, 27 May 2022 09:25:06 -0500
From: Eric Blake <eblake@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Fam Zheng <fam@euphon.net>, Ari Sundholm <ari@tuxera.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 07/10] block: Implement
 bdrv_{pread,pwrite,pwrite_zeroes}() using generated_co_wrapper
Message-ID: <20220527142506.wkl2al5vtle45qji@redhat.com>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-8-afaria@redhat.com>
 <Yo9AhsmzrQlzIr/z@stefanha-x1.localdomain>
 <CAELaAXy-Pp75sdkEDiaUEfg-SL5FF1LKTJ7ntajNcz75+FpiaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAELaAXy-Pp75sdkEDiaUEfg-SL5FF1LKTJ7ntajNcz75+FpiaQ@mail.gmail.com>
User-Agent: NeoMutt/20220429-77-e284d5
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 26, 2022 at 08:23:02PM +0100, Alberto Faria wrote:
> On Thu, May 26, 2022 at 9:55 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > The bdrv_pread()/bdrv_pwrite() errno for negative bytes changes from
> > EINVAL to EIO. Did you audit the code to see if it matters?
> 
> I don't believe I had, but I checked all calls now. There's ~140 of
> them, so the probability of me having overlooked something isn't
> exactly low, but it seems callers either cannot pass in negative
> values or don't care about the particular error code returned.
> 
> Another option is to make bdrv_co_pread() and bdrv_co_pwrite() (which
> have much fewer callers) fail with -EINVAL when bytes is negative, but
> perhaps just getting rid of this final inconsistency between
> bdrv_[co_]{pread,pwrite}[v]() now will be worth it in the long run.

Failing with -EINVAL for negative bytes makes more sense at
identifying a programming error (whereas EIO tends to mean hardware
failure), so making that sort of cleanup seems reasonable.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


