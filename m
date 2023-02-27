Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDEE6A49ED
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 19:39:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWiOj-0006Tz-E4; Mon, 27 Feb 2023 13:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWiOg-0006OD-W4
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 13:38:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWiOf-0005VB-80
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 13:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677523128;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SWMomstYXFyZNSPGsc1edKoA4SVgbmaaZjlg916u2cs=;
 b=XrN6BQFh5BuTy8DO4dCwSWuYL7/mCWC6gmEw7tpA9rLX5TqE2MrZSji/USw7iq/RTpA+yG
 hexdHKjQ0VC+PbhewM3H8Etf7vpeBRpYi15dabvRKRgXsj+YfOhbm57TMIVlLOhWEImhJc
 qx6sAvQXLX1+KFUy/lqFo0Tz30pucvE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-ZBZqiBNHN0mYplCPChLFgg-1; Mon, 27 Feb 2023 13:38:45 -0500
X-MC-Unique: ZBZqiBNHN0mYplCPChLFgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF4533823A02;
 Mon, 27 Feb 2023 18:38:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 464B5C15BAD;
 Mon, 27 Feb 2023 18:38:42 +0000 (UTC)
Date: Mon, 27 Feb 2023 18:38:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Message-ID: <Y/z4rwv09Ckhbtfp@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230227111050.54083-1-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

On Mon, Feb 27, 2023 at 12:10:48PM +0100, Thomas Huth wrote:
> We're struggling quite badly with our CI minutes on the shared
> gitlab runners, so we urgently need to think of ways to cut down
> our supported build and target environments. qemu-system-i386 and
> qemu-system-arm are not really required anymore, since nobody uses
> KVM on the corresponding systems for production anymore, and the
> -x86_64 and -arch64 variants are a proper superset of those binaries.
> So it's time to deprecate them and the corresponding 32-bit host
> environments now.
> 
> This is a follow-up patch series from the previous discussion here:
> 
>  https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
> 
> where people still mentioned that there is still interest in certain
> support for 32-bit host hardware. But as far as I could see, there is
> no real need for 32-bit host support for system emulation on x86 and
> arm anymore, so it should be fine if we drop these host environments
> now (these are also the two architectures that contribute the most to
> the long test times in our CI, so we would benefit a lot by dropping
> those).

Your description here is a little ambiguous about what's being
proposed. When you say dropping 32-bit host support do you mean
just for the system emulator binaries, or for QEMU entirely ?

And when the deprecation period is passed, are you proposing
to actively prevent 32-bit builds, or merely stopping CI testing
and leave 32-bit builds still working if people want them ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


