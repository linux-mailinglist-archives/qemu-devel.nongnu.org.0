Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73984188FCB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 21:54:22 +0100 (CET)
Received: from localhost ([::1]:41216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEJED-0008Cz-Ia
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 16:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44621)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEJDU-0007n5-MD
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:53:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEJDT-0006uY-MY
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:53:36 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:58913)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEJDT-0006tb-JV
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584478415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OUmcpaeNWRKxUgs2tBoReEqEYvPuEHMo4Vz3HjoZRJw=;
 b=VTNZSTl5sGcoUOuEdVfPZYaVx5m92+5Kd9/2H+1ruj5nNaSVhEDNErmmnyUzGIZLMg1M0T
 0Ikg8aV+ZulnbPhCu8lPjBGNra4uFwgH9ot8/ccr9+orrs/SuuSENtWeSX8ZiXM4u/JLwl
 Zu0ATc4bREIMZtqa1Z6mhyrU3YSmZE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-58oSzuUlNv2yKmv0CJ7Xiw-1; Tue, 17 Mar 2020 16:53:33 -0400
X-MC-Unique: 58oSzuUlNv2yKmv0CJ7Xiw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31D70800D50;
 Tue, 17 Mar 2020 20:53:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3AD56E3EE;
 Tue, 17 Mar 2020 20:53:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7A77D1138404; Tue, 17 Mar 2020 21:53:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 0/2] netdev qapification
References: <20200317201711.322764-1-eblake@redhat.com>
Date: Tue, 17 Mar 2020 21:53:30 +0100
In-Reply-To: <20200317201711.322764-1-eblake@redhat.com> (Eric Blake's message
 of "Tue, 17 Mar 2020 15:17:09 -0500")
Message-ID: <87o8suityt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: lekiravi@yandex-team.ru, jasowang@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> In v2:
> - patch 1 contents unchanged, but commit message improved [Markus]
> - patch 2 is new

Queued, thanks!


