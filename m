Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3688E14A348
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 12:49:46 +0100 (CET)
Received: from localhost ([::1]:43674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw2tl-0005SC-Av
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 06:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56988)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iw2sh-0004S5-Qe
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 06:48:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iw2sg-0003Ro-UY
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 06:48:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27144
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iw2sg-0003RK-RD
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 06:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580125718;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N5E44Hdp2FnxHUSbbkYd39A738TOKjLOGNAKdY52Hl4=;
 b=ar+yk8jMBZavUg1vWKvRp+ZfyWZJas5VeLm0eh9AYDZ0AUQZB+s9Mfz6cH8alt6T9SOJfP
 ZyFdAojqW8VbMswdSshCaUJaMfdvuJwkRIwYd5hPQyGYuVk0b8t2bWIog/R8MVbQetn3x2
 NwTrZK0guXhfAdpGQpy1m/L1QXIUWcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-mZQc7LUyOiCc4cmlOTqFCQ-1; Mon, 27 Jan 2020 06:48:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E737801E67;
 Mon, 27 Jan 2020 11:48:35 +0000 (UTC)
Received: from redhat.com (ovpn-116-91.ams2.redhat.com [10.36.116.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A155938C;
 Mon, 27 Jan 2020 11:48:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH] migration: Simplify get_qlist
In-Reply-To: <20200125172449.13175-1-eric.auger@redhat.com> (Eric Auger's
 message of "Sat, 25 Jan 2020 18:24:49 +0100")
References: <20200125172449.13175-1-eric.auger@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Mon, 27 Jan 2020 12:48:27 +0100
Message-ID: <87r1zl2k8k.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: mZQc7LUyOiCc4cmlOTqFCQ-1
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
Reply-To: quintela@redhat.com
Cc: peterx@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Auger <eric.auger@redhat.com> wrote:
> Instead of inserting read elements at the head and
> then reversing the list, it is simpler to add
> each element after the previous one. Introduce
> QLIST_RAW_INSERT_AFTER helper and use it in
> get_qlist().
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

It wis really suggested by Dave, I just gave a sample implementation
O:-)

Later, Juan.


