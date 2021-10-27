Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8819943C284
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:03:44 +0200 (CEST)
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfc2J-0002ou-Iq
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfbzZ-0000tf-H9
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:00:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfbzX-0005zr-Td
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635314451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OZQFYuGIPBC4oJhglHjU7+NaveBeZY9LywY3SrfxbJA=;
 b=UTzVj+ssNYnUZ9Vm90gZRva1rNxT5jTsTvvI8p2lZxAchNKg4FUYDnKY5q/FQHzWL6mFIM
 mhQLT7XkTpELOqfbk4VeA4fP0Flu8JYQAJP17UhCnUncfJkID08RZFjDVZFaT0imLzIpEa
 e0Ht7V72fBCxjI14+iP1YQ1q46hDlJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-9sbMaqjPPj2qOlMrwgO5Tw-1; Wed, 27 Oct 2021 02:00:49 -0400
X-MC-Unique: 9sbMaqjPPj2qOlMrwgO5Tw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC905802B7E;
 Wed, 27 Oct 2021 06:00:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DD8E69CBF;
 Wed, 27 Oct 2021 06:00:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C936A11380A7; Wed, 27 Oct 2021 08:00:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] qapi: Improve input_type_enum()'s error message
References: <20211011131558.3273255-1-armbru@redhat.com>
 <YWVsheOBwyx+3QOM@redhat.com> <87r1cq78hs.fsf@dusky.pond.sub.org>
 <CAFn=p-ZOE+KgYE8FoAeCpW+FL3cRgM1HKzAQFy8TBYigZQb6HQ@mail.gmail.com>
Date: Wed, 27 Oct 2021 08:00:33 +0200
In-Reply-To: <CAFn=p-ZOE+KgYE8FoAeCpW+FL3cRgM1HKzAQFy8TBYigZQb6HQ@mail.gmail.com>
 (John Snow's message of "Tue, 26 Oct 2021 15:18:07 -0400")
Message-ID: <874k93c8hq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> This likely fixes https://gitlab.com/qemu-project/qemu/-/issues/608 and you
> could include that in your commit message if it isn't too late.

It's not.

Have you verified it fixes the bug, or is it just an educated guess?


