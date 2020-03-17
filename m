Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2983188AF2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 17:46:05 +0100 (CET)
Received: from localhost ([::1]:36760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEFLw-0006wp-TQ
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 12:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33193)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEFAX-0007YO-0t
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 12:34:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEFAW-0007Qt-2c
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 12:34:16 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:24245)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEFAV-00079H-UE
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 12:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584462853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TK/vhIGdxIvLqaIceNpOl5JfNt4FqS8vV77/NGVCkhg=;
 b=iCGJ0dc3lp9QJoL6Cubx82rJgSbCoiSflPPWrqWMR5K59B0WOgz4RtPiPso0eJCuF3/6Iw
 dxJvX0AX2OUP2vc4K+B3fRjn03r+33YdfcsgO3gNht2rpTTytN6wNIQrwT/uFbtHGmqVkZ
 jMqrlnbEZgXf9pZVU6zUz+mo3PS6wtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-7LO241__NYyhiIqmJGfTow-1; Tue, 17 Mar 2020 12:34:11 -0400
X-MC-Unique: 7LO241__NYyhiIqmJGfTow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E062218A5502;
 Tue, 17 Mar 2020 16:34:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9111210016EB;
 Tue, 17 Mar 2020 16:34:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 611E61138404; Tue, 17 Mar 2020 17:34:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 0/3] Minor error handling cleanups
References: <20200313170517.22480-1-armbru@redhat.com>
Date: Tue, 17 Mar 2020 17:34:08 +0100
In-Reply-To: <20200313170517.22480-1-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 13 Mar 2020 18:05:14 +0100")
Message-ID: <87h7yn54an.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 alxndr@bu.edu, paul.durrant@citrix.com, ashijeetacharya@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, including Vladimir's PATCH 4/3.  Thanks!


