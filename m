Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1ED209E9E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 14:42:17 +0200 (CEST)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joRCq-0002uJ-Vm
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 08:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joRA3-00087M-OU
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:39:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44379
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joRA2-0004ma-6h
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593088761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9du+9KTeV24qowd+qS9SJ0ghRfj18BXnkG91PdgS5FA=;
 b=L4ye9C/4rswHwtk6yM/ZoMD1VuadRNZIG8D72SNmmAZPxTkyZmnHZIS2tjVpIfOtUgwY0v
 b55qhfgTJoTKxMzz24YAHrC8/xJbVyOK67vcEeROjGTUy/bcG2zoUy5LtlYC4gtLrfGX1G
 HIz33qcopBdAIVJv+Dss9BCXEpu2BA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-jtI07SXLOE6EySp1zDXevw-1; Thu, 25 Jun 2020 08:39:17 -0400
X-MC-Unique: jtI07SXLOE6EySp1zDXevw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D207804001;
 Thu, 25 Jun 2020 12:39:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B7E55D9C5;
 Thu, 25 Jun 2020 12:39:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EEB0111384D4; Thu, 25 Jun 2020 14:39:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 03/46] qdev: Smooth error checking of qdev_realize() &
 friends
References: <20200624164344.3778251-1-armbru@redhat.com>
 <20200624164344.3778251-4-armbru@redhat.com>
Date: Thu, 25 Jun 2020 14:39:14 +0200
In-Reply-To: <20200624164344.3778251-4-armbru@redhat.com> (Markus Armbruster's
 message of "Wed, 24 Jun 2020 18:43:01 +0200")
Message-ID: <87o8p71frh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Convert
>
>     foo(..., &err);
>     if (err) {
>         ...
>     }
>
> to
>
>     if (!foo(..., &err)) {
>         ...
>     }
>
> for qdev_realize(), qdev_realize_and_unref(), qbus_realize() and their
> wrappers isa_realize_and_unref(), pci_realize_and_unref(),
> sysbus_realize(), sysbus_realize_and_unref(), usb_realize_and_unref().
> Coccinelle script:
>
>     @@
>     identifier fun = {isa_realize_and_unref, pci_realize_and_unref, qbus_realize, qdev_realize, qdev_realize_and_unref, sysbus_realize, sysbus_realize_and_unref, usb_realize_and_unref};
>     expression list args, args2;
>     typedef Error;
>     Error *err;
>     identifier errp;
>     @@
>     -      fun(args, &err, args2);
>     -      if (err) {
>     +      if (!fun(args, errp, args2)) {
> 	       ... when != err
>     -	   error_propagate(errp, err);
> 	       ...
> 	   }

Note that this rule is unsound: if err is read later on, we're screwed.
I checked manually it's not, but neglected to mention it in the commit
message.  I'll do that in v2.

The manual checking isn't that bad, most of the time we immediately
return.

>
>     @@
>     identifier fun = {isa_realize_and_unref, pci_realize_and_unref, qbus_realize, qdev_realize, qdev_realize_and_unref, sysbus_realize, sysbus_realize_and_unref, usb_realize_and_unref};
>     expression list args, args2;
>     typedef Error;
>     Error *err;
>     @@
>     -      fun(args, &err, args2);
>     -      if (err) {
>     +      if (!fun(args, &err, args2)) {
> 	       ...
> 	   }
>
> Fails to convert hw/arm/armsse.c, because Coccinelle gets confused by
> ARMSSE being used both as typedef and function-like macro there.
> Convert manually.
>
> Eliminate error_propagate() that are now unnecessary.  Delete @err
> that are now unused.  Clean up whitespace.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


