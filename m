Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AAC1BD584
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 09:16:15 +0200 (CEST)
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTgx4-00058q-KP
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 03:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTgvm-0004F3-8A
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:14:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTgvl-0006qA-S2
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:14:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27146
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jTgvl-0006mk-Ev
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588144492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVNsNEcw8TGjgHwfI+qgun3dMWws0fEf5O1ZWqWd+rI=;
 b=WtSIxTmYYnK1xtS6fXDkAyJKPmFq7z2aSR6yUQe3nE+iP7v04kvy0YFKPqtGiTIEcRkDCe
 iGw51LpYzF++UzdzxjzwhCO68XDLeH3bygs0o7PTBqvFsBCcbllYS1jXqw9VG/z9wuu7ec
 EpAcIi4KqWbBDRdyIc0XTqgS2YCg2Po=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-YJfb7SrVMzqlI7fDdKCx7Q-1; Wed, 29 Apr 2020 03:14:51 -0400
X-MC-Unique: YJfb7SrVMzqlI7fDdKCx7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC2661895A29;
 Wed, 29 Apr 2020 07:14:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B91F5D9E5;
 Wed, 29 Apr 2020 07:14:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC89911358BC; Wed, 29 Apr 2020 09:14:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/4] smbus: SPD fixes
References: <20200422134815.1584-1-armbru@redhat.com>
Date: Wed, 29 Apr 2020 09:14:47 +0200
In-Reply-To: <20200422134815.1584-1-armbru@redhat.com> (Markus Armbruster's
 message of "Wed, 22 Apr 2020 15:48:11 +0200")
Message-ID: <87r1w6sqzc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:42:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued.


