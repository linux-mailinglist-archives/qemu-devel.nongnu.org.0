Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B8193FD3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 14:34:17 +0100 (CET)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHSeG-0007vA-J3
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 09:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55841)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1jHSc6-0005ik-0u
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 09:32:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1jHSc4-0006cF-5O
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 09:32:00 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:46910)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1jHSc4-0006c5-1g
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 09:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585229519;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qB3q79SjCXNd2DckK7e6yMus6n/KhMIZNALvcIJT6F4=;
 b=hbkiOdb6Q3LRg210ePiwo4qMLRkvrpxDCeyLAIIDXx5hkq1rfedRnKuDa5aSMBcbY010bY
 JYYUyJRwr8BKEpnxPMhhIH75TminNDl2VGXGXlPGDK/gEcgzVcaC4F/tkKIt/lawLq298p
 J213idK/FmALZ0wyvZL6679/ep6Iemc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-3NugR-YHNluvkARiXE_btw-1; Thu, 26 Mar 2020 09:31:56 -0400
X-MC-Unique: 3NugR-YHNluvkARiXE_btw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05E72800EBD;
 Thu, 26 Mar 2020 13:31:55 +0000 (UTC)
Received: from redhat.com (ovpn-115-135.ams2.redhat.com [10.36.115.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D21C55E005;
 Thu, 26 Mar 2020 13:31:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v6 7/7] virtio-net: add migration support for RSS and hash
 report
In-Reply-To: <20200320115751.19446-8-yuri.benditovich@daynix.com> (Yuri
 Benditovich's message of "Fri, 20 Mar 2020 13:57:51 +0200")
References: <20200320115751.19446-1-yuri.benditovich@daynix.com>
 <20200320115751.19446-8-yuri.benditovich@daynix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Thu, 26 Mar 2020 14:31:48 +0100
Message-ID: <87d08z6y4b.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: yan@daynix.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yuri Benditovich <yuri.benditovich@daynix.com> wrote:
> Save and restore RSS/hash report configuration.
>
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

sorry, hadn't seen it.

vmstate parts are right.


