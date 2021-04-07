Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C19D356830
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 11:40:10 +0200 (CEST)
Received: from localhost ([::1]:33590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU4fR-0001Hf-47
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 05:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lU4du-0000kn-1U
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 05:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lU4dr-0002yY-Ix
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 05:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617788311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qpotlGIW3mqQI3FEBnmZ54cNCoR6w/cYWfWw4QcNT0=;
 b=ImuDJ1cvmfRCCdE2wrqYV2GqnBv7LMU5BORix9Ynt7MZfJ8SXftqUW/TtJ5Ek0z3+yHrq7
 aH2pIBL/8CRIZxBeXvXzzO261L2OoEJ0+MDfRMPjy0RZ2D/K5OcySXg4/Vgjzgx0+Ssphh
 D2GIU7xDwrfmBPuHJgAXigXkf5jetNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-tkwTZWr4OZGZWGWfFmMhJQ-1; Wed, 07 Apr 2021 05:38:27 -0400
X-MC-Unique: tkwTZWr4OZGZWGWfFmMhJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40E8E10054F6;
 Wed,  7 Apr 2021 09:38:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F4515D9CA;
 Wed,  7 Apr 2021 09:38:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 71479113865F; Wed,  7 Apr 2021 11:38:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 0/2] block/rbd: fix memory leaks
References: <20210329150129.121182-1-sgarzare@redhat.com>
 <b6c205ab-356a-ed3c-0442-105668db19d9@redhat.com>
Date: Wed, 07 Apr 2021 11:38:17 +0200
In-Reply-To: <b6c205ab-356a-ed3c-0442-105668db19d9@redhat.com> (Max Reitz's
 message of "Tue, 6 Apr 2021 19:06:35 +0200")
Message-ID: <87y2duzb7a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Florian Florensa <fflorensa@online.net>, Jason Dillaman <dillaman@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Max Reitz <mreitz@redhat.com> writes:

> On 29.03.21 17:01, Stefano Garzarella wrote:
>> This series fixes two memory leaks, found through valgrind, in the
>> rbd driver.
>> Stefano Garzarella (2):
>>    block/rbd: fix memory leak in qemu_rbd_connect()
>>    block/rbd: fix memory leak in qemu_rbd_co_create_opts()
>>   block/rbd.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
>
> I=E2=80=99m not quite sure whether this is fit for 6.0...  I think it=E2=
=80=99s too
> late for rc2, so I don=E2=80=99t know.

This the maintainers' call to make.

* PATCH 1:

  CON: Old bug, probably 2.9, i.e. four years

  PRO: The fix is straightforward

* PATCH 2:

  NEUTRAL: Not recent from upstream's point of view (5.0), but
  downstreams may have different ideas

  PRO: The fix is trivial

I encourage you to take at least PATCH 2.


