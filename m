Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A161268BE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 19:12:05 +0100 (CET)
Received: from localhost ([::1]:46166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii0HM-0007Ud-M0
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 13:12:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56809)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ii0G2-0005wB-RY
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:10:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ii0G0-0002sA-IJ
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:10:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56054
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ii0G0-0002ku-Cm
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576779039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzEByMi4tIV7d+EWC/NSDK2KoRbKB9bl/Y2skZdThl8=;
 b=dBALEtnWRSG+89X6ipsWuSLPOgVCyRaPIykldhAo+XlDcfc0o6VOftiKyXqMK5nKFelO5x
 SBu32e8NhIg3dVW87fta+/Ht2oLA2nBsitqIDvAvBdeGtE1LMAKhCemBe+rxnsNHsUi2Gp
 c6LlsJnKJTM4UEChC5J4ozbR9dm6IhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-6YfwAe5VO_u0q0vwHtdk6w-1; Thu, 19 Dec 2019 13:10:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81EC5107B286;
 Thu, 19 Dec 2019 18:10:29 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B2B75D9E2;
 Thu, 19 Dec 2019 18:10:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] Memory: Only call ramblock_ptr when needed in
 qemu_ram_writeback
In-Reply-To: <20191219154323.325255-1-anthony.perard@citrix.com> (Anthony
 PERARD's message of "Thu, 19 Dec 2019 15:43:22 +0000")
References: <20191219154214.GE1267@perard.uk.xensource.com>
 <20191219154323.325255-1-anthony.perard@citrix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Thu, 19 Dec 2019 19:10:24 +0100
Message-ID: <87immc190v.fsf@trasno.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 6YfwAe5VO_u0q0vwHtdk6w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
Reply-To: quintela@redhat.com
Cc: Beata Michalska <beata.michalska@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Anthony PERARD <anthony.perard@citrix.com> wrote:
> It is possible that a ramblock doesn't have memory that QEMU can
> access, this is the case with the Xen hypervisor.
>
> In order to avoid to trigger an assert, only call ramblock_ptr() when
> needed in qemu_ram_writeback(). This should fix migration of Xen
> guests that was broken with bd108a44bc29 ("migration: ram: Switch to
> ram block writeback").
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

This is exec.c, nothing related to migration.

Paolo, are you taking this one?
It could even go through the trivial one.

Thanks, Juan.


