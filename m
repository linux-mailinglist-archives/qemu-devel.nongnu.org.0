Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7949C134467
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 14:58:03 +0100 (CET)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipBqU-0005hB-Ij
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 08:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55490)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipBow-0004c6-LF
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 08:56:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipBov-0004Wf-By
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 08:56:26 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60108
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipBov-0004Vh-8t
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 08:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578491784;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2OSov3CHzbNzTS7zkdvQw8L9o0wKQU0ewXPRcBjPZY=;
 b=Yxdx7V6ycw8w7dJT9mzRLJesUUDhb4pTzxDI8zZxZHF67KDnGyXDMHyWRBjLtPWTHaet1b
 VXmsicSXSr7xNlNFJhwsf9fda/YSgdTePI8dX/VnGM46lC8vsl+oTOY691q2nlZ6fdrhkl
 dHlQLuEWaxE1CC77TNvI8sSy0UCqPG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-VVLu8VI5PoupAM8DeFTx3w-1; Wed, 08 Jan 2020 08:56:20 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FD7910CE784;
 Wed,  8 Jan 2020 13:56:19 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D52E1001B28;
 Wed,  8 Jan 2020 13:56:17 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Yury Kotov <yury-kotov@yandex-team.ru>
Subject: Re: [PATCH] migration: Fix the re-run check of the migrate-incoming
 command
In-Reply-To: <20191113175325.29765-1-yury-kotov@yandex-team.ru> (Yury Kotov's
 message of "Wed, 13 Nov 2019 20:53:25 +0300")
References: <20191113175325.29765-1-yury-kotov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 08 Jan 2020 14:56:13 +0100
Message-ID: <87v9pmf3wi.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: VVLu8VI5PoupAM8DeFTx3w-1
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, yc-core@yandex-team.ru,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yury Kotov <yury-kotov@yandex-team.ru> wrote:
> The current check sets an error but doesn't fail the command.
> This may cause a problem if new connection attempt by the same URI
> affects the first connection.
>
> Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


