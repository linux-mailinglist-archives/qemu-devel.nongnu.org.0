Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602A32C9795
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 07:35:15 +0100 (CET)
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjzFq-0004wH-8A
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 01:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kjzEE-0004SB-Op
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 01:33:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kjzE6-00044s-MH
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 01:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606804404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Rk90cApcGG7Y+YrMudYlvuhdMVpjYOaZPYU2TYewD4=;
 b=POzRFduAjNPfgFimd3Beo7Dv2CLd+L+2LaYX+2idh2Xwfhr/irW5QwoZxsl41faPHZGSjc
 0Wpo0MOym/9O02CX0AjOcsyJcljZ/aUeLr0ZMBDV+PR4s+NI3XGvYKu9zmsZ86zns5KyQ/
 B/2FKZU1f218SH5VjAJrCJ69SxSFRao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-5XQNPHfbO4O011cBeIynNg-1; Tue, 01 Dec 2020 01:33:21 -0500
X-MC-Unique: 5XQNPHfbO4O011cBeIynNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2055805BE0;
 Tue,  1 Dec 2020 06:33:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EA5460BE2;
 Tue,  1 Dec 2020 06:33:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E9717113864E; Tue,  1 Dec 2020 07:33:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] python 3.5 compatibility
References: <20201127183619.8958-1-info@metux.net>
 <CAFEAcA_KQ3q-=AG=b77WDbtrBRXCUKDoMkn9en12Bz48B-GjgQ@mail.gmail.com>
 <b04a421d-9844-70b7-9c5e-3a302ca94da9@metux.net>
Date: Tue, 01 Dec 2020 07:33:18 +0100
In-Reply-To: <b04a421d-9844-70b7-9c5e-3a302ca94da9@metux.net> (Enrico
 Weigelt's message of "Mon, 30 Nov 2020 19:27:03 +0100")
Message-ID: <87r1oa9gsx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Enrico Weigelt, metux IT consult" <lkml@metux.net> writes:

> On 27.11.20 20:15, Peter Maydell wrote:
>
> Hi,
>
>> Could you say which "stable distros" you have in mind, and whether
>> they are covered by our "supported build platforms" policy
>> https://www.qemu.org/docs/master/system/build-platforms.html  ?
>
> I'm running on Devuan Ascii.

Which has oldstable status.  Good for running the old and stable
software packaged by it (such as QEMU 2.8), and old (and hopefully
stable) software of similar vintage.

Devian ASCII appears to be a derivative of Debian 9 Stretch, which we no
longer support, because it's EOL.  docs/system/build-platforms.rst:

    For distributions with long-lifetime releases, the project will aim to
    support the most recent major version at all times. Support for the
    previous major version will be dropped 2 years after the new major
    version is released, or when it reaches "end of life". For the purposes
    of identifying supported software versions, the project will look at
    RHEL, Debian, Ubuntu LTS, and SLES distros. Other long-lifetime distros
    will be assumed to ship similar software versions.

This policy balances cost and benefit of keeping bleeding-edge QEMU work
on a wide variety of hosts.  Years of balancing.

> And packaging python-3.6 just for a few pieces of one application (qemu)
> is far too much work.

Have you considered upgrading to stable?


