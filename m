Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341C921AFB8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 08:49:08 +0200 (CEST)
Received: from localhost ([::1]:40976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtmqJ-0005TQ-AG
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 02:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtmpK-00052b-3Y
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 02:48:06 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50935
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtmpI-000125-Mq
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 02:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594363683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+VF2LCI7+TZITOBCLII/uTaDipmII55AuYLUcMrjKv4=;
 b=OWDKx3s4HRuUIIN8dUVJPHpb/lT60pa4sVUO6V2OmNd0ZcKGS7P3JCyr2A3QOPot8OJdIq
 0HSH1s/nYZliUcDZvoDc6mlSu2z2QVtSBit9G33H8zhYEW0q7LakLfScs/Hyvt+5vQBBfA
 An9VM9Y8io3OtH3uEucg/3iYjIILE2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-Tcsj5hcMP5G9IU1TLlXTBw-1; Fri, 10 Jul 2020 02:48:01 -0400
X-MC-Unique: Tcsj5hcMP5G9IU1TLlXTBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDED810059B2;
 Fri, 10 Jul 2020 06:48:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C72635F7D8;
 Fri, 10 Jul 2020 06:47:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 52FB71132FD2; Fri, 10 Jul 2020 08:47:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] Remove VXHS block device
References: <20200709184728.2051009-1-marcandre.lureau@redhat.com>
Date: Fri, 10 Jul 2020 08:47:55 +0200
In-Reply-To: <20200709184728.2051009-1-marcandre.lureau@redhat.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Thu, 9 Jul 2020
 22:47:28 +0400")
Message-ID: <87wo3bq31g.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 22:08:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, ashmit602@gmail.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> The vxhs code doesn't compile since v2.12.0. There's no point in fixing
> and then adding CI for a config that our users have demonstrated that
> they do not use; better to just remove it.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

No compile testing probably because libvxhs doesn't seem to be packaged
in Fedora or Debian.

We should be wary of accepting code we can't even compile easily.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


