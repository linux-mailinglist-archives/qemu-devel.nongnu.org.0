Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EF914D737
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 09:03:59 +0100 (CET)
Received: from localhost ([::1]:56990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix4nu-0002fA-PZ
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 03:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51092)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ix4n5-0002Dr-L9
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 03:03:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ix4n4-00011n-I0
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 03:03:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58980
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ix4n4-00011X-Em
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 03:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580371385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bD+xi3Q17dA/0Mdd/xrrPB/fhwRm9Kpds3JmDTXVkjI=;
 b=U5SZWROhnjHnUFINNZELXDISUfyF+qx/QN8KGqd1uNTZER+FldLUXPruT1q7UwUbROU/mq
 bxQfy9rNzbowFy1IJEyFMN0VX5hsMSA8Cr+43ylJwOOqu6HsErKkoPQKJNMazFRApjL3aZ
 UUScvo7UbgCkKtkMhJDhdlIA0rFQPyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-Re9EH0oZPc-EAJHqy2zN4A-1; Thu, 30 Jan 2020 03:03:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 652DE108443D
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 08:03:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A702A89D18;
 Thu, 30 Jan 2020 08:03:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 170471138404; Thu, 30 Jan 2020 09:03:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 4/8] multifd: Add multifd-zlib-level parameter
References: <20200129115655.10414-1-quintela@redhat.com>
 <20200129115655.10414-5-quintela@redhat.com>
Date: Thu, 30 Jan 2020 09:03:00 +0100
In-Reply-To: <20200129115655.10414-5-quintela@redhat.com> (Juan Quintela's
 message of "Wed, 29 Jan 2020 12:56:51 +0100")
Message-ID: <87eevhxtfv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Re9EH0oZPc-EAJHqy2zN4A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> writes:

> It will indicate which level use for compression.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

This is slightly confusing (there is no zlib compression), unless you
peek at the next patch (which adds zlib compression).

Three ways to make it less confusing:

* Squash the two commits

* Swap them: first add zlib compression with level hardcoded to 1, then
  make the level configurable.

* Have the first commit explain itself better.  Something like

    multifd: Add multifd-zlib-level parameter

    This parameter specifies zlib compression level.  The next patch
    will put it to use.

For QAPI:
Acked-by: Markus Armbruster <armbru@redhat.com>


