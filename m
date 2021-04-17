Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4D9362F0E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 11:52:05 +0200 (CEST)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXhcQ-0004cb-RA
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 05:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXhav-0003vc-DB
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 05:50:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXhao-0001At-54
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 05:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618653021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkKV2z4impu60l4LwQk/UAbVw5sVWnM6yV1edU1O0g4=;
 b=g/jubEiEFJqC7p09IT4AVPU7zFKFu8dMaEWh0htgFKvUnoTo3spxXsQdERFn7alrSz/wd3
 HNNO9DYVSnRJZMH89gwjNgrGNzbSUX29LSqysWAn/ILud4ukzfcN3YoaX/RL7Ty1FT+lPw
 4wHfzPjIDHyPV91OauqequTYsXtHpUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-Lo4pjNdqOBm1AVqKRC9fOw-1; Sat, 17 Apr 2021 05:50:19 -0400
X-MC-Unique: Lo4pjNdqOBm1AVqKRC9fOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD2E618397A3;
 Sat, 17 Apr 2021 09:50:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EF1F2B3C7;
 Sat, 17 Apr 2021 09:50:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 80D02113525D; Sat, 17 Apr 2021 11:50:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/4] Do not include hw/boards.h if it's not really
 necessary
References: <20210416171314.2074665-1-thuth@redhat.com>
 <20210416171314.2074665-3-thuth@redhat.com>
 <e55a2cf6-2994-5318-0fa5-9a9057457e84@redhat.com>
 <f877e682-7c9b-26d8-1ef5-b22b268bb29e@redhat.com>
Date: Sat, 17 Apr 2021 11:50:11 +0200
In-Reply-To: <f877e682-7c9b-26d8-1ef5-b22b268bb29e@redhat.com> (Thomas Huth's
 message of "Fri, 16 Apr 2021 20:04:48 +0200")
Message-ID: <87o8ed1bqk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 16/04/2021 19.53, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi Thomas,
>> On 4/16/21 7:13 PM, Thomas Huth wrote:
>>> Stop including hw/boards.h in files that don't need it.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   accel/tcg/tcg-accel-ops-icount.c | 1 -
>>>   accel/tcg/tcg-accel-ops-rr.c     | 1 -
>>>   accel/tcg/tcg-accel-ops.c        | 1 -
>>>   hw/acpi/cpu.c                    | 1 -
>>>   hw/acpi/memory_hotplug.c         | 1 -
>>>   hw/alpha/typhoon.c               | 1 -
>>>   hw/arm/aspeed.c                  | 1 -
>> It requires the macros declared by:
>> OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)
>
> "hw/boards.h" is already included in include/hw/arm/aspeed.h, that's
> why it's working ... Hmm, do we have a policy whether a header should
> be included again in the .c file if it's already included by a .h
> file?

I'm not aware of a formal policy.

The most common "method" for dealing with #include is probably "when the
compiler demands declarations, throw #include at it until it shuts up".

This "method" only ever adds, never deletes.  It can easily lead to
including headers many times, and to including headers unnecessarily.

Including many times isn't much of a problem in practice.  A
sufficiently smart C compiler should be able to skip #include of a
"safe" header it has already seen, so redundant #include should not slow
down the build noticeably.  I prefer to avoid / delete obviously
duplicate inclusions anyway.

Including unnecessarily *is* a problem.  A massive one.  But it's not
what you asked about.

[...]


