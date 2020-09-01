Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C2B258738
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 07:01:27 +0200 (CEST)
Received: from localhost ([::1]:47764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCyQA-0004p7-V3
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 01:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kCyPS-0004O3-LE
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 01:00:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46511
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kCyPR-0000pR-4O
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 01:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598936440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BFWDzasM1imPzj146/YYgkl92/6mYTw3tqWnZ9y9SY8=;
 b=RUHtiG6DOHMqP+JpfWnCkFRpsGoXbH3Cmd1n9rFlGuurrAPvZJowAG3IuJPe0aYIdgcPEK
 Mfz2GjPmJXycdw/rJrQ8jsXSVv4Hu+c3HCND6l/Bdqfqc7p3n5h+nzWN1mKlG/oBTB782c
 n1OFYKQYMNrVK/gD1g7VEg1ruxZa9Fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-eD7xPCvGMs2M6pw50Mikkw-1; Tue, 01 Sep 2020 01:00:39 -0400
X-MC-Unique: eD7xPCvGMs2M6pw50Mikkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 283DC10ABDAB
 for <qemu-devel@nongnu.org>; Tue,  1 Sep 2020 05:00:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC4497DA45;
 Tue,  1 Sep 2020 05:00:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 04B6F991; Tue,  1 Sep 2020 07:00:37 +0200 (CEST)
Date: Tue, 1 Sep 2020 07:00:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: use pkg-config method to find dependencies
Message-ID: <20200901050036.wozkbgggv6pufji5@sirius.home.kraxel.org>
References: <20200831102819.24334-1-pbonzini@redhat.com>
 <20200831110655.uj6f2hq3yyygqqox@sirius.home.kraxel.org>
 <0e111925-dded-3866-cfd7-6de152f7e95c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0e111925-dded-3866-cfd7-6de152f7e95c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:57:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 31, 2020 at 02:15:23PM +0200, Paolo Bonzini wrote:
> On 31/08/20 13:06, Gerd Hoffmann wrote:
> > 
> >> Keep "auto" for SDL so that it tries using
> >> sdl-config too.
> >> -  sdl = dependency('sdl2',
> >> -                   required: get_option('sdl'),
> >> +  sdl = dependency('sdl2', required: get_option('sdl'),
> >> +                   method: 'pkg-config',
> > code and commit message mismatch here.
> 
> That's docs/devel/build-system.rst,

Oops, missed that, sorry.

> I wanted to keep the "method" so
> that people can cut-and-paste correctly.
> 
> Would you prefer if I switched from sdl2 to something else (for example
> pixman which has a "version" keyword argument as well)?

Sounds like a good idea to me.

take care,
  Gerd


