Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAAE4D50E3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:52:04 +0100 (CET)
Received: from localhost ([::1]:42112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMxH-0001Tz-UV
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:52:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nSMvN-0000Zc-Q3
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:50:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nSMvK-0008HX-3o
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646934597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=edUbd8/9sXM5WXruEFNWLeKNdadzwBGnlPtiCxQ4P7I=;
 b=Z9Lwz8IyGaWwRkIrtyr8GZb9JtCUD+jxHoWqwYuc+rLCQvXlqHElQvbq7MwK0jncpa1SBs
 1biRLvy4AApDjGdDPocbMnyVzZlkB0xXtyKS9+PoFoE3z1GPqOJFVk8sKIL2WbtFV2uBrk
 viSPVXpg2dBaX+7mwOflEKTFcorFZUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-DOcRlAPeNQ-q05vZtRKMoQ-1; Thu, 10 Mar 2022 12:49:54 -0500
X-MC-Unique: DOcRlAPeNQ-q05vZtRKMoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BF221006AA5;
 Thu, 10 Mar 2022 17:49:53 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org (unknown
 [10.22.32.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C521877D52;
 Thu, 10 Mar 2022 17:49:36 +0000 (UTC)
References: <20220228114325.818294-1-thuth@redhat.com>
User-agent: mu4e 1.6.6; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/avocado: Cancel BootLinux tests in case there is
 no free port
Date: Thu, 10 Mar 2022 10:28:41 -0500
In-reply-to: <20220228114325.818294-1-thuth@redhat.com>
Message-ID: <87wnh1puj7.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> The BootLinux tests are currently failing with an ugly python
> stack trace on my RHEL8 system since they cannot get a free port
> (likely due to the firewall settings on my system). Let's properly
> check the return value of find_free_port() instead and cancel the
> test gracefully if it cannot get a free port.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Unfortunately, it still takes > 70 seconds for each and every
>  tests from tests/avocado/boot_linux.py to get canceled, so
>  tests/avocado/boot_linux.py still renders "make check-avocado"
>  for me pretty unusable... looking at the implementation of
>  find_free_port() in Avocado, I wonder whether there isn't a
>  better way to get a free port number in Python? Brute-forcing
>  all ports between 1024 and 65536 seems just quite cumbersome
>  to me...
>
>  tests/avocado/avocado_qemu/__init__.py | 2 ++
>  1 file changed, 2 insertions(+)
>

LGTM, despite  the root issue is being addressed in Avocado.

Reviewed-by: Cleber Rosa <crosa@redhat.com>


