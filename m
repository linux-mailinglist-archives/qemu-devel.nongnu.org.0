Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED22733D7BA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:38:03 +0100 (CET)
Received: from localhost ([::1]:49454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBlj-0006wT-16
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMBiv-0005JH-Mi
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMBir-0001xC-SU
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615908904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X1vpemZxII3szaSwVPhq1eqRc5551xSIgKnLTByQpJk=;
 b=c08G7OSVZ5MSAI1evma04C/c8wwrjPmdHEr2CD1IbNCsnGuhx1a633uooHBHqhDT8iVdyG
 cXk+JSgQ5I0m2w4sY8e2Uxjf5aPYH506yK1D63Tmb5l0gjANu8Da1MSdmcCbR0c3tzTyWp
 KgbN0olPf8uhAXoUfnjxtwRVAXa8YVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-CRYBv1n4N1aEzd-md-e5sw-1; Tue, 16 Mar 2021 11:35:02 -0400
X-MC-Unique: CRYBv1n4N1aEzd-md-e5sw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BBB4801817;
 Tue, 16 Mar 2021 15:35:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD93B60C0F;
 Tue, 16 Mar 2021 15:35:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1CD381132C12; Tue, 16 Mar 2021 16:34:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] yank: Avoid linking into executables that don't want it
References: <20210316135907.3646901-1-armbru@redhat.com>
 <9b906931-f664-cc4e-6498-9a6282eec215@redhat.com>
Date: Tue, 16 Mar 2021 16:34:59 +0100
In-Reply-To: <9b906931-f664-cc4e-6498-9a6282eec215@redhat.com> (Eric Blake's
 message of "Tue, 16 Mar 2021 09:06:06 -0500")
Message-ID: <871rcfi02k.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
>
> This sentence no verb.

To fix this, move the non-stub ...

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
>> 
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


