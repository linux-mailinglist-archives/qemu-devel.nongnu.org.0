Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F6C3B5A7F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 10:30:00 +0200 (CEST)
Received: from localhost ([::1]:49774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxmeW-0002M1-0J
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 04:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lxmdF-0000ws-Hu
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 04:28:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lxmdB-0005oj-Ni
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 04:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624868915;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfQbcYa5ybsj0gF8dKU0dZCYNXvN7/FYlsHFmsFwtDk=;
 b=G0y/pMp51sPUBkPdu2zPZn4o6BhtwRl/U5Y0kK8jMM8ZZgFxoSwuIPnkGd6/nclItTmQpc
 gP1HAybJlyeyciFXlUAvIMCaGWqN80H/J0bnUqxDmm+WWw2uzc6iv5uxFejhR/FYJMm5fB
 N5q9dZuUjmIJnOFlLI9dPBruaJ2GkFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-fkVRglQzPiG7Im7aIlHBUA-1; Mon, 28 Jun 2021 04:28:25 -0400
X-MC-Unique: fkVRglQzPiG7Im7aIlHBUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAD3350754;
 Mon, 28 Jun 2021 08:28:23 +0000 (UTC)
Received: from redhat.com (ovpn-115-35.ams2.redhat.com [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A1DA5C1CF;
 Mon, 28 Jun 2021 08:28:13 +0000 (UTC)
Date: Mon, 28 Jun 2021 09:28:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/3] ci: use cirrus-run to utilize Cirrus CI from GitLab CI
Message-ID: <YNmIG8IXBFn41sq/@redhat.com>
References: <20210625172211.451010-1-berrange@redhat.com>
 <37c78715-0819-3961-93ea-5c5d95a2791a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <37c78715-0819-3961-93ea-5c5d95a2791a@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.696,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Ed Maste <emaste@freebsd.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 09:34:41AM +0200, Thomas Huth wrote:
> On 25/06/2021 19.22, Daniel P. Berrangé wrote:
> [...]
> > The MSys Windows job still remains in the .cirrus.yml file. This
> > can be addressed to, if we extend libvirt-ci to have package
> > mapping information for MSys.
> 
> I think gitlab-CI offers shared Windows runners, too, see e.g.:
> 
>  https://about.gitlab.com/blog/2020/01/21/windows-shared-runner-beta/
> 
> So I think we likely should rather convert that job to a shared gitlab-CI
> Windows runner instead?

There's quite a few caveats listed there, but agree it is worth looking
at it. We could start with having it 'allow_failure: true' and monitor
how reliable it is for a few months, before considering whether to let
it be gating. We can keep Cirrus CI job until we're comfortable with it.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


