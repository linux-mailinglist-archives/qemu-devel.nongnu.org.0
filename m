Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBBD2DEE06
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 10:44:52 +0100 (CET)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqYnD-00015k-5X
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 04:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqYmN-0000g4-UA
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 04:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqYmL-0008FF-0g
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 04:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608371034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jo2obE62LhYbRbqfBYt3IjXyGT/F9y0i/VwS4Bgu0W8=;
 b=BLJ/a1zpUrJC/Fsp5cuvDHiBEX/fKJEgOjSzaZmMaE43vSHryZScX+ObD2pGMG09pX2IWX
 X8qOHOj9XT2VLhT1tG+Oj5BxDliiVhlnMF46kVX4FWtsAwHGPfFjXlZbapdnXR2KSiXFBx
 7xMDzv23FZ/wuwmshmm8JhnEvG4VLkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-v0a2qw9hP2KUAbC_H6waqw-1; Sat, 19 Dec 2020 04:43:52 -0500
X-MC-Unique: v0a2qw9hP2KUAbC_H6waqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 109F3800D53
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 09:43:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D68766E51F;
 Sat, 19 Dec 2020 09:43:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5353D1130358; Sat, 19 Dec 2020 10:43:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 0/7] Common macros for QAPI list growth
References: <20201113011340.463563-1-eblake@redhat.com>
 <871rgpelvw.fsf@dusky.pond.sub.org>
Date: Sat, 19 Dec 2020 10:43:49 +0100
In-Reply-To: <871rgpelvw.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Thu, 19 Nov 2020 10:28:19 +0100")
Message-ID: <87y2hugmga.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Markus Armbruster <armbru@redhat.com> writes:

> Eric Blake <eblake@redhat.com> writes:
>
>> v1, as such, was here:
>> https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg08003.html
>> (v6 11/11 qapi: Use QAPI_LIST_ADD() where possible)
>>
>> since then, I've rebased that patch (upstream went with PREPEND
>> instead of ADD), split things out for easier review, added
>> QAPI_LIST_APPEND, caught a lot more places that can use PREPEND, and
>> even fixed a years-old memory leak that might be worth having in 5.2.
>> But patches 2-7 are 6.0 material.
> [...]
>>  55 files changed, 431 insertions(+), 1007 deletions(-)
>
> Lovely.  These two macros are obviously overdue.

I'm queuing PATCH 2-4.  We concluced PATCH 1 isn't necessary.  PATCH 7
needs work, and I gather you'd like to improve PATCH 5 (parenthesis in
macro expansion) and 6 (use the opportunity to improve variable naming).

> Series needs a rebase.

The conflicts are due to

    a8aa94b5f8 qga: update schema for guest-get-disks 'dependents' field
    a10b453a52 target/mips: Move mips_cpu_add_definition() from helper.c to cpu.c

and easy enough to resolve for me.

Thanks!


