Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD01A07F9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 09:11:28 +0200 (CEST)
Received: from localhost ([::1]:42326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLiON-0002QY-Tw
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 03:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1jLiNY-0001xx-TP
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 03:10:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1jLiNX-0004rD-ET
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 03:10:36 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23450
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1jLiNX-0004qq-AQ
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 03:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586243434;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQ9S4LMw9YVlAY6vBKu8phdzOBWc8NyfHJrlHIzm2f4=;
 b=YZoMtfYxtodh9yapRXx/64hfR3/40VYNWKRsfQo4JfjYpWWApS7im3Xs1BmTfRk8z5eGRJ
 m2F34dN3wwsKkqgqhGB+5S3gHHzxviesGB+yPM74eafa51RMqlqAGiHsioRcS1f3G8heEc
 6kQbG7FVG9RlBNKo8LCVnrYISIK53WQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-r6af-ut6MlybJu_mMoErBA-1; Tue, 07 Apr 2020 03:10:31 -0400
X-MC-Unique: r6af-ut6MlybJu_mMoErBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F3578024D3;
 Tue,  7 Apr 2020 07:10:30 +0000 (UTC)
Received: from redhat.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41DD55D9C5;
 Tue,  7 Apr 2020 07:10:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 v2 51/54] migration/colo: Add missing
 error-propagation code
In-Reply-To: <20200406174743.16956-52-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 6 Apr 2020 19:47:40
 +0200")
References: <20200406174743.16956-1-f4bug@amsat.org>
 <20200406174743.16956-52-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 07 Apr 2020 09:10:28 +0200
Message-ID: <87eeszu5y3.fsf@secure.mitica>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> Running the coccinelle script produced:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/find-missing-error_propagate.cocci \
>     --keep-comments --smpl-spacing --dir .
>   HANDLING: ./migration/colo.c
>   [[manual check required: error_propagate() might be missing in migrate_=
set_block_enabled() ./migration/colo.c:439:4]]
>
> Add the missing error_propagate() after review.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Once there, all other uses of local_error on that file looks correct,
and rest of calls to migrate_set_block_enabled() in the rest of qemu
looks right.

Thanks, Juan.


