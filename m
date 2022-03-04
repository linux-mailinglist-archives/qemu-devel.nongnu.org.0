Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9102C4CDB81
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:58:37 +0100 (CET)
Received: from localhost ([::1]:50640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCCK-0003PL-J8
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:58:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQBpU-0006RR-5W
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:35:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQBpR-0002GI-2j
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646415295;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6f9ze1MbVrEePtTvDkm8kV3KLQeekRwor5Mvl8ZyF8=;
 b=BjJb/n5p1kFV3mfK4EX2bJn+4sc/Dlf3QeccFG3YLqgMyCMFA3JPDbtVYOX1V7en4cqKvJ
 gC8CRtMldIIGjdOWeQ5KQEuMBemmwDlU5vHb9s3WmQM2XDQ8M1l9u7+UbzzFDUHTkpY5jx
 OIycDRmzAcz1v508tsNkPHqTqGqe6lU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-FlAzkoQsNf-x9XtGScfxEg-1; Fri, 04 Mar 2022 12:34:51 -0500
X-MC-Unique: FlAzkoQsNf-x9XtGScfxEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C4EF801AFE;
 Fri,  4 Mar 2022 17:34:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C9FE804C0;
 Fri,  4 Mar 2022 17:34:48 +0000 (UTC)
Date: Fri, 4 Mar 2022 17:34:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 01/10] python/aqmp: add _session_guard()
Message-ID: <YiJNtfWjVBQRttwN@redhat.com>
References: <20220225205948.3693480-1-jsnow@redhat.com>
 <20220225205948.3693480-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225205948.3693480-2-jsnow@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 03:59:39PM -0500, John Snow wrote:
> In _new_session, there's a fairly complex except clause that's used to
> give semantic errors to callers of accept() and connect(). We need to
> create a new two-step replacement for accept(), so factoring out this
> piece of logic will be useful.
> 
> Bolster the comments and docstring here to try and demystify what's
> going on in this fairly delicate piece of Python magic.
> 
> (If we were using Python 3.7+, this would be an @asynccontextmanager. We
> don't have that very nice piece of magic, however, so this must take an
> Awaitable to manage the Exception contexts properly. We pay the price
> for platform compatibility.)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/protocol.py | 89 +++++++++++++++++++++++++-----------
>  1 file changed, 62 insertions(+), 27 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


