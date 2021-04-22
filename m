Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C5C367BCD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 10:11:43 +0200 (CEST)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZUR4-0000Xd-De
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 04:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZUPL-00083D-MX
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 04:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZUPJ-0003cZ-6t
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 04:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619078992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dot5XqNP+UhSjGHFHcKDCBWZFvvSJ8iqj9sTGvQrj2M=;
 b=UJCTnXFEJJ+2YR8rOqyFnELbujXdJfb+nv+RxG0o5yjEwWdB1XXLdzcqMBooTgdfMEDRwv
 nnfEwsv5ajUHPpPqMbFCr6bC6rkq1eif6lfEEz1Btf/ZKW1nNn4Xga9hDn1HZwy477N46P
 DrGnDUntii4qpqsFmcS/6/YtQEiheDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-x8TfyliMMT-cqXl8ZaOt0A-1; Thu, 22 Apr 2021 04:09:39 -0400
X-MC-Unique: x8TfyliMMT-cqXl8ZaOt0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7617100729C;
 Thu, 22 Apr 2021 08:09:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64F906091B;
 Thu, 22 Apr 2021 08:09:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF467113525D; Thu, 22 Apr 2021 10:09:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 0/8] qapi: static typing conversion, pt4
References: <20210421192233.3542904-1-jsnow@redhat.com>
Date: Thu, 22 Apr 2021 10:09:36 +0200
In-Reply-To: <20210421192233.3542904-1-jsnow@redhat.com> (John Snow's message
 of "Wed, 21 Apr 2021 15:22:25 -0400")
Message-ID: <87k0ouyc3j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Hi, this series adds static type hints to the QAPI module.
> This is part four, and focuses on error.py.
>
> Part 4: https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt4
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/290152364
>
> Requirements:
> - Python 3.6+
> - mypy >= 0.770
> - pylint >= 2.6.0 (2.7.0+ when using Python 3.9+)
>
> Every commit should pass with:
>  - `isort -c qapi/`
>  - `flake8 qapi/`
>  - `pylint --rcfile=qapi/pylintrc qapi/`
>  - `mypy --config-file=qapi/mypy.ini qapi/`

I doubt PATCH 1 is worth the trouble without an actual concrete
location-less error.  However, arguing about it some more would also not
worth the trouble, so:

Reviewed-by: Markus Armbruster <armbru@redhat.com>

and queued.  Thanks!


