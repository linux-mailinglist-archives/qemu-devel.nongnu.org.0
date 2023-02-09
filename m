Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346AC690E55
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 17:28:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9lg-0006EY-68; Thu, 09 Feb 2023 11:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ9ld-0006Dv-V5
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:27:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ9lc-0004UF-5f
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675960043;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wsy4xSBwmaUF1MHjsVJC/0+4n0N/6JbCEXkL9AKJ5+A=;
 b=ONuYZgwDj2RzL8In5GLuNOeBdqF7cGPqj5LrpjjCza4Q0EfWo35TAghq7onPnwQWp9dfTU
 Kh9gK2Xp1Xb96SpcItCFTBPYkFzH0b3imbGPlU5KzVYF9ZEp1Gc0on457b0swZwbVzCxTJ
 xnS+OG9NKafh3UEYC5juHYZawU1hZ68=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-NvevEL2xP9y2sV0YNQOk9Q-1; Thu, 09 Feb 2023 11:27:20 -0500
X-MC-Unique: NvevEL2xP9y2sV0YNQOk9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FD0C3C1022A;
 Thu,  9 Feb 2023 16:27:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE50E2026D68;
 Thu,  9 Feb 2023 16:27:15 +0000 (UTC)
Date: Thu, 9 Feb 2023 16:27:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 7/7] Python: Drop support for Python 3.6
Message-ID: <Y+Ue2/Xn+ZbOc+B+@redhat.com>
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-8-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230209154034.983044-8-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Thu, Feb 09, 2023 at 10:40:34AM -0500, John Snow wrote:
> Python 3.6 was EOL 2021-12-31. Newer versions of upstream libraries have
> begun dropping support for this version and it is becoming more
> cumbersome to support. Avocado-framework and qemu.qmp each have their
> own reasons for wanting to drop Python 3.6.
>
> Since it is safe to under our supported platform policy, do so.

Upstream EOL dates are essentially irrelevant from our platform
support policy for deciding min versions

QEMU aims to target released OS distributions, and their vendors
may choose to support software for arbitrarily longer periods of
time than upstream. This extended support is one of the key
value adds of OS distributions.

To justify dropping python 3.6, the commit message needs to
illustrate that all our targetted distros are capable of
supporting the new proposed new min version. 

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  docs/conf.py             |  4 ++--
>  configure                |  8 ++++----
>  python/Makefile          | 10 +++++-----
>  python/setup.cfg         |  7 +++----
>  python/tests/minreqs.txt |  2 +-
>  scripts/qapi/mypy.ini    |  2 +-
>  6 files changed, 16 insertions(+), 17 deletions(-)


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


