Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F3345B99
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 11:03:26 +0100 (CET)
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdsj-0000to-B8
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 06:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdZa-0007Dx-Sg
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdZY-0003kv-EC
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gj6WTSQTfwchTCmvUYHSK6nbsWwOOAPrVx6j6FV/LCM=;
 b=IRpYvhzl67IpoHfUto8B51wo13p3kBSdEDFBfjOIjCo3jFiRyg1cA56y66ylcE79zIcPRy
 ysF1U3APaJGWM8AkjXSo+F0kjTFDROL0bQOGpv2xDUQEf7Fv5HIsnysWcIlO+HNqGc7REc
 dd42HjyCtls1iJtfDwa1KiejXGIAmJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-LfUl-76RNpi0lSEhS55Lnw-1; Tue, 23 Mar 2021 05:43:33 -0400
X-MC-Unique: LfUl-76RNpi0lSEhS55Lnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE021190A7A3;
 Tue, 23 Mar 2021 09:43:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9082159474;
 Tue, 23 Mar 2021 09:43:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3F1E811327E1; Tue, 23 Mar 2021 10:43:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] yank: Avoid linking into executables that don't want it
References: <20210316135907.3646901-1-armbru@redhat.com>
 <9c0e3310-f67b-1999-1725-c44aeae94537@redhat.com>
Date: Tue, 23 Mar 2021 10:43:31 +0100
In-Reply-To: <9c0e3310-f67b-1999-1725-c44aeae94537@redhat.com> (Thomas Huth's
 message of "Tue, 23 Mar 2021 05:54:25 +0100")
Message-ID: <877dlyurwc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
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

Thomas Huth <thuth@redhat.com> writes:

> On 16/03/2021 14.59, Markus Armbruster wrote:
>> util/yank.c and stubs/yank.c are both in libqemuutil.a, even though
>> their external symbols conflict.  The linker happens to pick the
>> former.  This links a bunch of unneeded code into the executables that
>> actually want the latter: qemu-io, qemu-img, qemu-nbd, and several
>> tests.  Amazingly, none of them fails to link.
>> To fix this, the non-stub yank.c from sourceset util_ss to sourceset
>> qmp_ss.  This requires moving it from util/ to monitor/.
>
> In another patch ("tests: Use the normal yank code instead of stubs in
> relevant tests"), Lukas now changed the tests to always explicitly
> link against the real yank.c code. That makes me wonder whether we
> need the yank stubs at all ... it's not that much code after all, and
> it's very much self-contained without references to other files, so I
> think it should also be ok if we simply always keep it in the utils
> library and ditch the stubs?

Any solution that links and doesn't put duplicate symbols in .a is fine
with me.


