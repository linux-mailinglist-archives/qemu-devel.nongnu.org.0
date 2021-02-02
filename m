Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3235D30BAC9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 10:20:08 +0100 (CET)
Received: from localhost ([::1]:47266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6rqx-0002Mv-8l
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 04:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6roB-0000H3-QK
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:17:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6ro9-0004oc-Or
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612257431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e8utbZlWVl+wcJV9ndUGvbGc1X7OxwnsxQgTN3gTf9M=;
 b=cuKzwoND04aEuauCdTvAgJ0HO1IBVGd7zLiLmGwJZ7V/03I4NpxYHSo4h9MPEcv8ZjCo2/
 TxH9KzY6BF6QKlFXAG+LXYfSC3ix6flk8OILRNxaeSVXaG6nFISWF9u5gVgQ2xt6HRb4cY
 9rT+bLJpaW5VXN49eFY+Kf0MeYQASmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-d-0gf46pOdGNF9AZuuftkw-1; Tue, 02 Feb 2021 04:17:08 -0500
X-MC-Unique: d-0gf46pOdGNF9AZuuftkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A944801AC0;
 Tue,  2 Feb 2021 09:17:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C3C6614FC;
 Tue,  2 Feb 2021 09:17:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F322A113865F; Tue,  2 Feb 2021 10:17:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 00/16] qapi: static typing conversion, pt1.5
References: <20210201193747.2169670-1-jsnow@redhat.com>
Date: Tue, 02 Feb 2021 10:17:02 +0100
In-Reply-To: <20210201193747.2169670-1-jsnow@redhat.com> (John Snow's message
 of "Mon, 1 Feb 2021 14:37:31 -0500")
Message-ID: <87o8h2g775.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Hi, this patchset enables strict optional checking in mypy for
> everything we have typed so far.
>
> In general, this patchset seeks to clarify Optional[T] vs T and lift the
> no-strict-optional restriction in mypy.
>
> Ironing out these issues allows us to be even stricter with our type
> checking, which improves consistency in subclass interface types and
> should make review a little nicer.
>
> This series is based on (but does not require) the 'qapi: sphinx-autodoc
> for qapi module' series.

Series
Reviewed-by: Markus Armbruster <armbru@redhat.com>


