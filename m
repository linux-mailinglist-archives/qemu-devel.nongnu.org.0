Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D97349609
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:49:37 +0100 (CET)
Received: from localhost ([::1]:49218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPSEp-0006kt-SY
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPSCD-000574-Fr
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPSCA-0004Gj-5O
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616687208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nBz2uWjdKOBCzs4wKcsYA+tpVpf6MhExp+bn1ckeG2o=;
 b=jWa+X0mf7ix94flQE/bd+sLqgvD9w72RjTYhpQtp0iTy9WDgS1PfjGIrGahlTscDGMnlmP
 fj40zEG/NHbMRBYuMqTBwnot4XKN5BJJx1AN1JzLXOmJ5d+1VaEK1uI13C7GniEttD19mR
 ZdYVmjs1yVJcCSN/Tzwryfy6uFp3B9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-lJ6xe6ayN4uicE2Lz8L23g-1; Thu, 25 Mar 2021 11:46:46 -0400
X-MC-Unique: lJ6xe6ayN4uicE2Lz8L23g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A5081007472;
 Thu, 25 Mar 2021 15:46:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A2ED1972B;
 Thu, 25 Mar 2021 15:46:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C4BD411327E1; Thu, 25 Mar 2021 16:46:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 00/19] qapi: static typing conversion, pt3
References: <20210325060356.4040114-1-jsnow@redhat.com>
Date: Thu, 25 Mar 2021 16:46:43 +0100
In-Reply-To: <20210325060356.4040114-1-jsnow@redhat.com> (John Snow's message
 of "Thu, 25 Mar 2021 02:03:37 -0400")
Message-ID: <877dlvme1o.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Hi, this series adds static types to the QAPI module.
> This is part three, and it focuses on expr.py.
>
> Environment:
> - Python >= 3.6, <= 3.8 *
> - mypy >= 0.770
> - pylint >= 2.6.0
> - flake8
> - isort
>
> Every commit should pass with (from ./scripts/):
>  - flake8 qapi/
>  - pylint --rcfile=qapi/pylintrc qapi/
>  - mypy --config-file=qapi/mypy.ini qapi/
>  - pushd qapi && isort -c . && popd
>
> V4:
>
> Patch 2 is exploratory.
> Patch 8 is broken and should be merged into Patch 9.
> Patches 17-19 are optional and I'd sooner you drop them than have to respin.
[...]
> - Add test patch to demonstrate 72col docstring enforcement. (Not a fan.)
> - Changed MutableMapping type to regular ol' dict.
> - Added tests for alternate and union to see what happens when we pass a list
>   for 'data' instead. (It crashes.)
> - Rewrote a bunch of the docstrings.
> - Updated type hints for rc0
> - Rebased on latest master, incorporating latest qapi changes.
> - Addressed most feedback, some exceptions;
>   - Kept isinstance check for dict; it is strictly more convenient to me and it
>     does not cause breakages. It won't cause breakages.
[...]

I skipped PATCH 2+16+18+19.  I figure these are independent enough to
let me come back to it later.  In case of PATCH 16, I better come back
quickly, since to go and lose your doc strings would be a shame.

On the other patches, I have a few questions and suggestions.  So far it
looks like no respin will be needed.


