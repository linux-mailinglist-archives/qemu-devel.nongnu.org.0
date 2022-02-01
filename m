Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9224A6261
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:27:55 +0100 (CET)
Received: from localhost ([::1]:54374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwwc-0006cl-6J
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:27:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuzQ-00039s-Qs
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:22:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuzK-0004GL-V5
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:22:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643728934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C9nnif3QiNhHghXWzCIEW6gfKhbL9iBjazfYG4pkUZg=;
 b=icqqnj61c4LqtjeX21YD9Su4lL8kdyBV3zEqSI9bOnUgXwTDVD3IlJSs6lkxwWj/okX9bf
 DK1Z3qAUeNHST6O5nGyLYbHu/mJIVNeeRsqUilrIaG1Hy2vA18Lt503ehRPKALiy6x3IXw
 tJKrX470g/b9rfS6aPlIkkAEffvOsYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-Xa1avtddOGu3L7lv_isIIw-1; Tue, 01 Feb 2022 08:21:12 -0500
X-MC-Unique: Xa1avtddOGu3L7lv_isIIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F9BD1091DA1;
 Tue,  1 Feb 2022 13:21:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BBA87317B;
 Tue,  1 Feb 2022 13:21:06 +0000 (UTC)
Date: Tue, 1 Feb 2022 14:21:05 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 4/4] python/aqmp: add socket bind step to legacy.py
Message-ID: <YfkzwdbIaGF5TcVZ@redhat.com>
References: <20220201041134.1237016-1-jsnow@redhat.com>
 <20220201041134.1237016-5-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220201041134.1237016-5-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.2022 um 05:11 hat John Snow geschrieben:
> The synchronous QMP library would bind to the server address during
> __init__(). The new library delays this to the accept() call, because
> binding occurs inside of the call to start_[unix_]server(), which is an
> async method -- so it cannot happen during __init__ anymore.
> 
> Python 3.7+ adds the ability to create the server (and thus the bind()
> call) and begin the active listening in separate steps, but we don't
> have that functionality in 3.6, our current minimum.
> 
> Therefore ... Add a temporary workaround that allows the synchronous
> version of the client to bind the socket in advance, guaranteeing that
> there will be a UNIX socket in the filesystem ready for the QEMU client
> to connect to without a race condition.
> 
> (Yes, it's a bit ugly. Fixing it more nicely will have to wait until our
> minimum Python version is 3.7+.)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/legacy.py   |  3 +++
>  python/qemu/aqmp/protocol.py | 41 +++++++++++++++++++++++++++++++++---
>  2 files changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> index 0890f95b16..6baa5f3409 100644
> --- a/python/qemu/aqmp/legacy.py
> +++ b/python/qemu/aqmp/legacy.py
> @@ -56,6 +56,9 @@ def __init__(self, address: SocketAddrT,
>          self._address = address
>          self._timeout: Optional[float] = None
>  
> +        if server:
> +            self._aqmp._bind_hack(address)  # pylint: disable=protected-access

I feel that this is the only part that really makes it ugly. Do you
really think this way is so bad that we can't make it an official public
interface in the library?

Kevin


