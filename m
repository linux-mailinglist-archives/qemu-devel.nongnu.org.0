Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C5469841A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:06:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSN6M-0006Jy-3P; Wed, 15 Feb 2023 14:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSN6G-00069B-59
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:05:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSN6E-00020M-Jw
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676487950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MN9dBOOLo+E3KoSM0vJ7qbb5wq7ml4tBB651AIvTXlE=;
 b=gS8jiLvKoWHJX5GIu1wlue+6zvw1k2l2Y42W08Yf21pAAxeEO/EP1CZ6WDsM56AWATsArG
 crQBp9PVcUBE9Qq2KYnsBxnyYLtc2KxJ3XGCFoW8v7QjGJ00KKBpOMYT9FS95q8zmbtFX8
 LexaXveFi0PjiYXcM/BHFR4DRmnzWBU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-sa7iXC7JNaq8tzvH0kj_hA-1; Wed, 15 Feb 2023 14:05:46 -0500
X-MC-Unique: sa7iXC7JNaq8tzvH0kj_hA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 193028588E3;
 Wed, 15 Feb 2023 19:05:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1C632026D4B;
 Wed, 15 Feb 2023 19:05:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5FFAD21E6A1F; Wed, 15 Feb 2023 20:05:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Thomas Huth <thuth@redhat.com>,  Daniel Berrange
 <berrange@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org,  Hanna Reitz <hreitz@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
References: <20230210003147.1309376-1-jsnow@redhat.com>
Date: Wed, 15 Feb 2023 20:05:44 +0100
In-Reply-To: <20230210003147.1309376-1-jsnow@redhat.com> (John Snow's message
 of "Thu, 9 Feb 2023 19:31:40 -0500")
Message-ID: <87v8k2ycjb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The discussion under PATCH 6 makes me think there's a bit of confusion
about the actual impact of dropping support for Python 3.6.  Possibly
because it's spelled out in the commit message of PATCH 7.  Let me
summarize it in one sentence:

    *** All supported host systems continue to work ***

Evidence: CI remains green.

On some supported host systems, different packages need to be installed.
On CentOS 8, for instance, we need to install Python 3.8.13 or 3.9.16
instead of 3.6.8.  Let me stress again: same repository, different
package.  No downsides I can see.

The *one* exception is Sphinx on CentOS 8.  CentOS 8 does not ship a
version of Sphinx that works with Python 3.7 or newer.  This series
proposes to simply stop building the docs there, unless the user
provides a suitable version of Sphinx (which is easy enough with pip).
That's PATCH 7.

Paolo thinks we could also stay on 3.6 just for Sphinx, with a bit of
care.  That's constructive patch review.

All the angst about CentOS falling off the end of our "supported build
platforms" list is not actually warranted by this series :)

Some of the discussion is valuable regardless.  For instance, the points
Daniel made about traditional distro dependencies (still used with C
tool chains), and distro-agnostic dependencies baked into modern tool
chains.  This series is not (and does not try to be) the final answer to
the question how to handle Python dependencies in QEMU.


