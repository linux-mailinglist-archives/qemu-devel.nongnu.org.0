Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3D06256DD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 10:30:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otQMB-0000kv-7Y; Fri, 11 Nov 2022 04:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1otQM9-0000eO-3a
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:29:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1otQM7-00027t-7r
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668158978;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TL/vAwuOA7FqPis8Bcz0JMeVvs9Oh14b6AjyxWqLuh8=;
 b=BmSQqPnIgfJot+ALVBB5lBLW4bkdTIu/3sjH7cuzDst56lLpkEhRwFPqgY8N6ZXs1McCCt
 Ejp131h8/tic+daKn5rk2KsVsRsVMUPpWtlpyBLBlqnoZgyDfAW9ooVTjxBiAz0lpGY005
 qMjcI3LpK+yIdiad+/m+u41+n0HojWU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-DnfIOJVxO1GUMD1Cu4QndQ-1; Fri, 11 Nov 2022 04:29:35 -0500
X-MC-Unique: DnfIOJVxO1GUMD1Cu4QndQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C555885A5A6;
 Fri, 11 Nov 2022 09:29:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A25E840E9783;
 Fri, 11 Nov 2022 09:29:32 +0000 (UTC)
Date: Fri, 11 Nov 2022 09:29:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/19] osdep.h: Introduce a QEMU file descriptor type
Message-ID: <Y24V+dXU9x9+CIOl@redhat.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-5-bin.meng@windriver.com>
 <Y24QzpMDpcLnAsPH@redhat.com>
 <CAEUhbmXpeiEGuVXJUStCyOr5otYuGvifN9iFJjnh-GgHx9G6pA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEUhbmXpeiEGuVXJUStCyOr5otYuGvifN9iFJjnh-GgHx9G6pA@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 11, 2022 at 05:23:58PM +0800, Bin Meng wrote:
> Hi Daniel,
> 
> On Fri, Nov 11, 2022 at 5:08 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Fri, Nov 11, 2022 at 12:22:10PM +0800, Bin Meng wrote:
> > > Introduce a new QemuFd_t type to represent a file descriptor for
> > > different platforms. On POSIX platforms, this is a file descriptor
> > > On Windows, this is a file handle.
> >
> > Can we not use  _open_osfhandle() to obtain a C runtime
> > file descriptor from the Windows HANDLE.  We do this in
> > QEMU's socket code, so we don't have to work wit different
> > types and APIs on Windows, and I think that's much nicer
> > in general.
> >
> 
> I am sorry I don't understand your suggestion. I checked
> qemu-sockets.c and did not see how sockets connect to this change.
> 
> This change is required to make 9pfs Windows support much easier.

I'm just using it as an example to show that we can continue to
use a plain 'int fd' everywhere, and not invent a QemuFd_t type
abstraction

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


