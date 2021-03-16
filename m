Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D14933D7D0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:41:00 +0100 (CET)
Received: from localhost ([::1]:53776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBoZ-0000Q7-9U
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMBkZ-0006Gy-Ox
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMBkY-00035P-3E
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615909009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jb3dbyyS6w8j/Wbz0Uaq0tWJtgULTJqn54EuPlB7Msw=;
 b=CwyXssYySWJlH6Hcn9EMERK6K6dtFWiXY2igKtOyufWfUGdU6d1/JdaPEQiOjMAqsUh6RT
 LeONZsXRPR7Ix8hyl92TrgDVxSyb8DT7kmnS/fPQttbcOY3+WsGdAwmmBj+GjRCR3hB/lJ
 v91FIH+ey8t5EsXUPm63lC4+d7tsGxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-QwLQvSxZNtGnYZdA_C25qg-1; Tue, 16 Mar 2021 11:36:47 -0400
X-MC-Unique: QwLQvSxZNtGnYZdA_C25qg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BDFD1934100;
 Tue, 16 Mar 2021 15:36:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B79060875;
 Tue, 16 Mar 2021 15:36:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7B96D1132C12; Tue, 16 Mar 2021 16:36:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] yank: Avoid linking into executables that don't want it
References: <20210316135907.3646901-1-armbru@redhat.com>
 <cfda2d65-eb0a-b18c-f6a8-80ad1652cf42@redhat.com>
Date: Tue, 16 Mar 2021 16:36:44 +0100
In-Reply-To: <cfda2d65-eb0a-b18c-f6a8-80ad1652cf42@redhat.com> (Eric Blake's
 message of "Tue, 16 Mar 2021 09:07:45 -0500")
Message-ID: <87wnu7glf7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, lukasstraub2@web.de,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 3/16/21 8:59 AM, Markus Armbruster wrote:
>> util/yank.c and stubs/yank.c are both in libqemuutil.a, even though
>> their external symbols conflict.  The linker happens to pick the
>> former.  This links a bunch of unneeded code into the executables that
>> actually want the latter: qemu-io, qemu-img, qemu-nbd, and several
>> tests.  Amazingly, none of them fails to link.
>> 
>> To fix this, the non-stub yank.c from sourceset util_ss to sourceset
>> qmp_ss.  This requires moving it from util/ to monitor/.
>> 
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  {util => monitor}/yank.c | 0
>>  MAINTAINERS              | 2 +-
>>  monitor/meson.build      | 1 +
>>  util/meson.build         | 1 -
>>  4 files changed, 2 insertions(+), 2 deletions(-)
>>  rename {util => monitor}/yank.c (100%)
>
> I'm still determining if I need an NBD pull request for soft freeze
> today; if so, I'm happy to include this one if it doesn't make it into
> the tree elsewhere first.  I also consider it to be a build issue and
> therefore suitable for inclusion in -rc1 if it misses the boat today.

It's not urgent, just something I spotted when I looked for buddies of
another bug that bit me.


