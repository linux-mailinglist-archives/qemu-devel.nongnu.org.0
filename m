Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C832549FE9A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:03:40 +0100 (CET)
Received: from localhost ([::1]:53454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUex-00062i-9Q
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:03:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nDUL0-0006JD-3m
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:43:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nDUKj-0000HL-El
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643388164;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxL71PRuU7pSsDEneSmrgDtznhdWzzAiMTXPAGRM5oU=;
 b=NGNlg2GC87MmxeSNgdQQUZkDgsCp0X73GUd1K94xV76mxkt0TkQvT3YiWKQTdBYA7vV0B3
 ozu7JJfTzwtJehu3sPoQfgHM8Fjnv+v84xBkEgCjY2cyNqo98Jj6L/efXSsbMnm+LvLjh/
 6tEt08fmKCGijhaMDMZjnVHSAFcAefg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-MzViDK_tMFmsSNah73X7Bw-1; Fri, 28 Jan 2022 11:42:34 -0500
X-MC-Unique: MzViDK_tMFmsSNah73X7Bw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F1C918B9F0C;
 Fri, 28 Jan 2022 16:42:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF1A884A3F;
 Fri, 28 Jan 2022 16:42:04 +0000 (UTC)
Date: Fri, 28 Jan 2022 16:42:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v8 01/11] util: add helper APIs for dealing
 with inotify in portable manner
Message-ID: <YfQc2nEvP1IgFKJt@redhat.com>
References: <20190215155709.15777-1-berrange@redhat.com>
 <20190215155709.15777-2-berrange@redhat.com>
 <CAFEAcA-hKkN-f+85zNwXZwgXWtZ=mEX+P-Pm13rh-G=bCeHzcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-hKkN-f+85zNwXZwgXWtZ=mEX+P-Pm13rh-G=bCeHzcw@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 04:17:32PM +0000, Peter Maydell wrote:
> On Fri, 15 Feb 2019 at 16:06, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > The inotify userspace API for reading events is quite horrible, so it is
> > useful to wrap it in a more friendly API to avoid duplicating code
> > across many users in QEMU. Wrapping it also allows introduction of a
> > platform portability layer, so that we can add impls for non-Linux based
> > equivalents in future.
> 
> Hi; Coverity has suddenly decided to complain about this 3-year-old
> code (in CID 1469132). It reports an "untrusted loop bound" because
> in the 'loop over events in the buffer' we use the data we just read
> from the filedescriptor (specifically ev->len) as part of the
> calculation of our loop termination condition.
> 
> Is there actually anything to change here, or is this a false
> positive because we actually trust the data we're getting on this fd?

I think its false positive. The inotify API between kernel and
userspace requires that you work in this manner. The data on
this FD is strictly emitted by the kernel, not any untrusted
application, so I don't think there's a risk here.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


