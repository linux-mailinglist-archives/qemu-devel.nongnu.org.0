Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956371280AF
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 17:30:59 +0100 (CET)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiLB4-0004ZV-4O
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 11:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34452)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iiL9v-0003f8-PJ
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 11:29:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iiL9t-0005UO-EH
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 11:29:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28764
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iiL9t-0005SZ-6B
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 11:29:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576859384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=9KQWkC7u/r+Ge5VWofWspVvn0pZbHgMnzh1SQlJF00Q=;
 b=DcsG9QHC0OQcFMdZaSv6e/ZJZVl+FJjAxkqmSHBp6GFMLS7yl+SIllBtr2/i4jnZiyuzJC
 m997gjeU806VRjNeLU56X1Nf8ik3ZE9uvNbylGHABWKgjlMkZjfra0Y+gSBG1yRe/KnF1Y
 S1oiiTEgvwT1r59MrMJGsnRO52ElhYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-hE7-EDYzNRCJM6c_jMrbGA-1; Fri, 20 Dec 2019 11:29:42 -0500
X-MC-Unique: hE7-EDYzNRCJM6c_jMrbGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38C95800D4E;
 Fri, 20 Dec 2019 16:29:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 315626FDCF;
 Fri, 20 Dec 2019 16:29:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5DEA411386A7; Fri, 20 Dec 2019 17:29:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Can we retire Python 2 now?
Date: Fri, 20 Dec 2019 17:29:30 +0100
Message-ID: <8736dfdkph.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, KONRAD Frederic <frederic.konrad@adacore.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?utf-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Python 2 EOL is only a few days away[*].  We made configure bitch about
it in commit e5abf59eae "Deprecate Python 2 support", 2019-07-01.  Any
objections to retiring it now, i.e. in 5.0?

Cc'ing everyone who appears to be maintaining something that looks like
a Python script.

[*] https://pythonclock.org/


