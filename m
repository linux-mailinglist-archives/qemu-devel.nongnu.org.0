Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAF147C046
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 14:01:37 +0100 (CET)
Received: from localhost ([::1]:38184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzels-0004DY-Ra
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 08:01:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mzeiw-0001Hm-05
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 07:58:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mzeiu-0004Az-Lw
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 07:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640091512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=71DC15D9TdpqLfr6QZKab6mA9cF5c7fVIdCcUYUlxHU=;
 b=O8mpj96SQVHN0CA1RtAiyQbiph4PeWVzVStu5jzMZUrodZmGSAFqXNsgkhiFpR5ZCOT3jG
 0ACszH5XEPKlww33HeS5gpC5zvZbfpYNBGIiZcgf+kJOAls27OJ6Hd6q25s2ou2xTHJuRh
 1q3uY/q6x9PCatZBfpBWmDTCGuppfiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-s6Te--tuOW-uwdf_ARU0mw-1; Tue, 21 Dec 2021 07:58:29 -0500
X-MC-Unique: s6Te--tuOW-uwdf_ARU0mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3047A911A6;
 Tue, 21 Dec 2021 12:58:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E21485D6CF;
 Tue, 21 Dec 2021 12:58:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 38CF6113865F; Tue, 21 Dec 2021 13:58:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: MkfsSion <mkfssion@mkfssion.com>
Subject: Re: [PATCH] vl: Add -set options to device opts dict when using
 JSON syntax for -device
References: <20211221071818.34731-1-mkfssion@mkfssion.com>
 <877dbyjj0t.fsf@dusky.pond.sub.org>
Date: Tue, 21 Dec 2021 13:58:26 +0100
In-Reply-To: <877dbyjj0t.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 21 Dec 2021 12:26:42 +0100")
Message-ID: <87h7b2i07h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> MkfsSion <mkfssion@mkfssion.com> writes:
>
>> When using JSON syntax for -device, -set option can not find device
>> specified in JSON by id field. The following commandline is an example:
>>
>> $ qemu-system-x86_64 -device '{"id":"foo"}' -set device.foo.bar=1
>> qemu-system-x86_64: -set device.foo.bar=1: there is no device "foo" defined
>
> Is this a regression?  I suspect commit 5dacda5167 "vl: Enable JSON
> syntax for -device" (v6.2.0).

Obviously not a regression: everything that used to work still works.

> I believe any conversion away from QemuOpts loses -set.

[...]


