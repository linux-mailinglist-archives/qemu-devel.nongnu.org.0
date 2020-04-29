Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E191BD589
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 09:17:38 +0200 (CEST)
Received: from localhost ([::1]:45938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTgyP-0006g6-HR
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 03:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45448)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTgwN-0005A5-Tn
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:15:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTgwN-0000Pw-By
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:15:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27118
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jTgwM-0000M3-T5
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588144530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWH7awxwVaX22oadePK61UFCjxJ9QL514b7y8dOpwi8=;
 b=MzJGE3Fxrs1tiqXdxteH/TwyRoyXDITe21txTlYQTzO8dD94wwjqxp/3csHZ2k7Bzm2KCC
 3cxdU2uYopHbdBh+iWZ4a2ZoJHeV0MkGbNpzJ3EfOuhULVMl/efavhnqEDWgqlWoa/WWZ7
 KfFbxPrhWrteQoKdt6dBoOg9Mh6Ufic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-Y8Pa_GSMObeu7VC-pnEtZg-1; Wed, 29 Apr 2020 03:15:26 -0400
X-MC-Unique: Y8Pa_GSMObeu7VC-pnEtZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41D131895A29;
 Wed, 29 Apr 2020 07:15:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACA8D648C8;
 Wed, 29 Apr 2020 07:15:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25E8211358BC; Wed, 29 Apr 2020 09:15:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] fuzz: Probably there is a better way to do this
References: <20200424071142.3525-1-armbru@redhat.com>
Date: Wed, 29 Apr 2020 09:15:18 +0200
In-Reply-To: <20200424071142.3525-1-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 24 Apr 2020 09:11:39 +0200")
Message-ID: <87mu6usqyh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:18:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: lvivier@redhat.com, thuth@redhat.com, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> ... the comment next to qos_set_machines_devices_available() wonders.
> Yup, there is!

Queued.


