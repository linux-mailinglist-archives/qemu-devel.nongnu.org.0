Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A573024D882
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 17:27:40 +0200 (CEST)
Received: from localhost ([::1]:46150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k98x9-00057Z-O0
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 11:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k98wG-0004eY-5Z
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 11:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k98wD-0005oB-N3
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 11:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598023599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xq+4VSz+UXzBvLQGWhYmTH8XKh4Q84XXk20TfEGwXlw=;
 b=Xsy9Nba6zQqWFwVAuwaeFbqrBe868sXwh1LB2o4t2eAtGlKvXPLlsr130L1nln8vtsrIhz
 3l7zE0r0MJVIvyuIS/3ghKUbe03ynA3t2AKtZQBuomB3gnMXiGynN7hh4of2+clqHX9mkB
 lfR+UUxS60KUs6W/qTsn9vhTrawmiQI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-XunYmF-kOty49URVDZEs3g-1; Fri, 21 Aug 2020 11:26:34 -0400
X-MC-Unique: XunYmF-kOty49URVDZEs3g-1
Received: by mail-wm1-f69.google.com with SMTP id z1so1124870wmk.1
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 08:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xq+4VSz+UXzBvLQGWhYmTH8XKh4Q84XXk20TfEGwXlw=;
 b=AEZkANA53x874ARcnuKPgRnkTyIQiAPl4AqCxUKXVMOxKWfE/A2w6b3habulGkkH87
 WdQb0+Sh1/G4UDObcHDNDbgJClw/xMsbbOgfzlAaobtMOiWorhu1rUDYE1AVqjO/RFbc
 SciLXxliBhG2rbp+w9tYUfoPA0kMI9mY3X6jkFXTKzXFHR9/7Lv3pcbV+yJFGNODfkDQ
 g3lp36bqh1cZc0C8TU3X86W0b3GZVJ/C9F1Ut5YoR0fdvajyfrKz0FH7ipeHIE6Cp32Z
 mJUO1oA+ZjrP32CuphcwzSiQaL9uRUQHDmycv/7QQj6C2HDzflj/5WetVibv9RICmp38
 IdjQ==
X-Gm-Message-State: AOAM530guYIsfJrsat44h+JiKiDNt9PBWn8vm8IEtnbsLRNg//5wsR5q
 nd/9XPb37gHdi2Y/IcZaYPPrzuSoqaPwp4XRUXWoBDCCWYVSp2yNuf5EA0bSGyGW2BGo3Hb8dum
 H8qI4k3VGJvjOkfc=
X-Received: by 2002:a1c:a984:: with SMTP id s126mr3927533wme.163.1598023592639; 
 Fri, 21 Aug 2020 08:26:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdAe8QkTPfJh1GrxPSB1ESIBY+TjwGNh+0FfvpBw2ZAxqPrrCWWo5QNoyOU1BTL4XHmk+fUw==
X-Received: by 2002:a1c:a984:: with SMTP id s126mr3927504wme.163.1598023592359; 
 Fri, 21 Aug 2020 08:26:32 -0700 (PDT)
Received: from steredhat (host-79-33-191-244.retail.telecomitalia.it.
 [79.33.191.244])
 by smtp.gmail.com with ESMTPSA id b65sm6619368wmd.0.2020.08.21.08.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:26:31 -0700 (PDT)
Date: Fri, 21 Aug 2020 17:26:27 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] configure: silence 'shift' error message in version_ge()
Message-ID: <20200821152627.trreokf3ly24thrs@steredhat>
References: <20200821150014.42461-1-sgarzare@redhat.com>
 <CAFEAcA9zUDeig8TB4JDd_48v2AXcr7HGyjGq6r7KVx=sQyrjXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9zUDeig8TB4JDd_48v2AXcr7HGyjGq6r7KVx=sQyrjXA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:26:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 21, 2020 at 04:21:10PM +0100, Peter Maydell wrote:
> On Fri, 21 Aug 2020 at 16:00, Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > If there are less than 2 arguments in version_ge(), the second shift
> > prints this error:
> >     ../configure: line 232: shift: shift count out of range
> >
> > Let's shut it up, since we're expecting this situation.
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  configure | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/configure b/configure
> > index 4e5fe33211..de4bd0df36 100755
> > --- a/configure
> > +++ b/configure
> > @@ -229,7 +229,7 @@ version_ge () {
> >          set x $local_ver1
> >          local_first=${2-0}
> >          # shift 2 does nothing if there are less than 2 arguments
> > -        shift; shift
> > +        shift; shift 2>/dev/null
> 
> POSIX says
> https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#shift
> 
> "If the n operand is invalid or is greater than "$#", this may be
> considered a syntax error and a non-interactive shell may exit"
> 
> so I think that we need to actually avoid the excess shift,

Maybe something like this:

diff --git a/configure b/configure
index de4bd0df36..5f5f370e2c 100755
--- a/configure
+++ b/configure
@@ -229,7 +229,7 @@ version_ge () {
         set x $local_ver1
         local_first=${2-0}
         # shift 2 does nothing if there are less than 2 arguments
-        shift; shift
+        shift; test $# -gt 0 && shift
         local_ver1=$*
         set x $local_ver2
         # the second argument finished, the first must be greater or equal

> not just suppress any warning it might print. (I'm not sure
> Philippe's "shift || shift" patch can work for that, though,
> as the exit status doesn't distinguish "valid shift but don't
> do it again" from "valid shift and more args to come".)

I tried and also if I have meson 0.55.0, with the Philippe's patch
applied it tries to download our internal meson, so maybe it is not
working as expected.

Thanks,
Stefano


