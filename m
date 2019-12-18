Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE93712493B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 15:16:54 +0100 (CET)
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iha8D-00061U-JE
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 09:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iha6r-0005Zz-3C
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 09:15:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iha6p-0008Kk-LB
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 09:15:28 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36563
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iha6p-0008FW-D7
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 09:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576678526;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZtLAyY9zwU6x49MZ+YT1PiIrR6T9jScI9jO/ESMIGE=;
 b=QK6KLqpdnYGhyicqYmIKbroL+LaJ5DKq9m2itYtwNP7RXacJGJkZQB6vb9Tyf1ZvYwm7x2
 wSz35pinm1kZW7yDGesaZfLpqfglMDdPJGvtdvkbxvn0Fm4W+Dib/HuksyopC5JaDpCCeZ
 sHkOjV1ThNIrzyx8TYWAu3QeCsEn8BM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-4DpM_8FbOu62a_v6Exu-5Q-1; Wed, 18 Dec 2019 09:15:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37C86101F4E2
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 14:15:23 +0000 (UTC)
Received: from redhat.com (ovpn-117-244.ams2.redhat.com [10.36.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4E2F5D9E2;
 Wed, 18 Dec 2019 14:15:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 2/4] multifd: Make sure that we don't do any IO after an
 error
In-Reply-To: <20191218135754.GG3707@work-vm> (David Alan Gilbert's message of
 "Wed, 18 Dec 2019 13:57:54 +0000")
References: <20191218050439.5989-1-quintela@redhat.com>
 <20191218050439.5989-3-quintela@redhat.com>
 <20191218135754.GG3707@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 18 Dec 2019 15:15:19 +0100
Message-ID: <87h81x67pk.fsf@trasno.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 4DpM_8FbOu62a_v6Exu-5Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> I wonder if the fflush's should happen anyway?

No, that is the problem that I am really trying to fix.  We tried to do
a write() after we knew that we have closed it (due to error or
cancel).  And we get a nice error message on the screen:

Unable to write to socket()

And everybody gets scared about that message.  When we really know that
we don't want it.

In an ideal world, we would just remove ->last_error() and make every
function return errors and check return codes.  But this is qemu.  This
is migration.  And we don't do it.  Sniff.


