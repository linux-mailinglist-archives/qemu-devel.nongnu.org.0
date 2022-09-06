Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83815AE1B7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:59:01 +0200 (CEST)
Received: from localhost ([::1]:37656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTU4-0000e0-I3
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVTQm-0007Lr-ON
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVTQh-0006iN-4p
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662450928;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ql9XwwrWLDS7RmWpcHHnQgu9yt6jlgMh3hC6bc8bOkA=;
 b=IaFyW689E6aA/HJfvnkCto1lDEamjnbHwaPO34ItECz9e6qjqrVen+s6708+BhdBCOSPHD
 aoEOXZBepK7t8A7f7USAu0vM9N2i1ZiG34yP7twPwuj1wP0CtZya+noTDct6J91+f6/3+M
 fUIXX8gKM1tcU0i0czemXlQAjrr+p9I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-PlrfeUv7PmixKMDZazLnQg-1; Tue, 06 Sep 2022 03:55:25 -0400
X-MC-Unique: PlrfeUv7PmixKMDZazLnQg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D50D83C0F360;
 Tue,  6 Sep 2022 07:55:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 240E940B40C9;
 Tue,  6 Sep 2022 07:55:24 +0000 (UTC)
Date: Tue, 6 Sep 2022 08:55:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: sphinx-build is really slow, any way to improve that?
Message-ID: <Yxb86Fz8XVW3uW1p@redhat.com>
References: <53b94520-f02b-aef5-b372-0460531b566f@suse.de>
 <CAFEAcA_ed-ny6eodA=9fK6Y5WpUaRO0jPfbKHYCB6uLikiyiHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA_ed-ny6eodA=9fK6Y5WpUaRO0jPfbKHYCB6uLikiyiHQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 05, 2022 at 10:21:55PM +0100, Peter Maydell wrote:
> On Mon, 5 Sept 2022 at 20:51, Claudio Fontana <cfontana@suse.de> wrote:
> > when I build qemu, there is a lot of time spent at the end of the build where one cpu goes 100% on sphinx-build.
> >
> > Is there some way to parallelize that? It seems it is the current bottleneck for rebuilds for me..
> 
> It's a big fat python program, so I suspect not, but
> maybe I'm wrong.

It annoys me too and I've had a look at what it is doing in the past and
failed to find an obvious way to improve it. I fear this could be an
inherant limitation of the way we use sphinx to build the docs as a
complete manual, as compared to say treating each docs source file as
a distinct standalone web page.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


