Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC0C367A95
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:08:50 +0200 (CEST)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTSD-0004Eg-HJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZTR1-0003O8-Qu
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:07:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZTQy-00075c-DN
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619075250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qWs5e1N7kI17CFXltAtU0DZoBIHvu4qntUGbkkpRtPM=;
 b=EpQNgAP0uya6SpPGrtQ9+Cvj/pCWemZCKuuVlRNoSS68l0gyzeo6CODPvc84BCU7cQ/QQv
 YJuG8zhRISA4IqfyKXqSh4T4MxZivbJ1aAZ0+5BzeQ0ngfk3TuFvjJcxIEWaITpHblj4Bt
 E6EmpuZu9F6iVoYI7NQ7VQ42lcA0E4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-UIOBiKQsP3m3SjL7qN7xnQ-1; Thu, 22 Apr 2021 03:07:27 -0400
X-MC-Unique: UIOBiKQsP3m3SjL7qN7xnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8510D18397A5;
 Thu, 22 Apr 2021 07:07:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EB5C29246;
 Thu, 22 Apr 2021 07:07:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B72FD113525D; Thu, 22 Apr 2021 09:07:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 00/17] qapi: static typing conversion, pt3
References: <20210421182032.3521476-1-jsnow@redhat.com>
Date: Thu, 22 Apr 2021 09:07:24 +0200
In-Reply-To: <20210421182032.3521476-1-jsnow@redhat.com> (John Snow's message
 of "Wed, 21 Apr 2021 14:20:15 -0400")
Message-ID: <87pmymyez7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Series
Reviewed-by: Markus Armbruster <armbru@redhat.com>
and queued.  Thanks!


