Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2901D49E053
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:11:43 +0100 (CET)
Received: from localhost ([::1]:55164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2gm-0005BX-Ly
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:11:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD2TQ-00055n-KS
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 05:57:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD2TN-00047c-BS
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 05:57:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643281068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vMnZ1oanJS5h85jOPuzucdkXoIhYXkZSQTi0y+pFx+c=;
 b=C2uA5im5qTrPumJmn8x8KgTubQlx8y8K4FGQb6ORY9H6XTag1PoFVMAelmebm5U6JD0NLh
 BSgCZEhE5SUrqSkPJduFsLzNoo8KPM5DQBsFaEXINlcewcTW/NEuMKmb9KzYLfCPIvCV76
 IoIFoGbTz6LrgHfSCVlhDtP72+n4moA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-x83QWWCCOB6mi4Jq8OxxdA-1; Thu, 27 Jan 2022 05:57:43 -0500
X-MC-Unique: x83QWWCCOB6mi4Jq8OxxdA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 778A685EE60;
 Thu, 27 Jan 2022 10:57:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 759B6752DC;
 Thu, 27 Jan 2022 10:56:56 +0000 (UTC)
Date: Thu, 27 Jan 2022 11:56:54 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v6 01/33] main-loop.h: introduce qemu_in_main_thread()
Message-ID: <YfJ6dsVcmB4Uc2rO@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-2-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220121170544.2049944-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.01.2022 um 18:05 hat Emanuele Giuseppe Esposito geschrieben:
> When invoked from the main loop, this function is the same
> as qemu_mutex_iothread_locked, and returns true if the BQL is held.

So its name is misleading because it doesn't answer the question whether
we're in the main thread, but whethere we're holding the BQL (which is
mostly equivalent to holding an AioContext lock, not being in the home
thread of that AioContext).

> When invoked from iothreads or tests, it returns true only
> if the current AioContext is the Main Loop.
> 
> This essentially just extends qemu_mutex_iothread_locked to work
> also in unit tests or other users like storage-daemon, that run
> in the Main Loop but end up using the implementation in
> stubs/iothread-lock.c.
> 
> Using qemu_mutex_iothread_locked in unit tests defaults to false
> because they use the implementation in stubs/iothread-lock,
> making all assertions added in next patches fail despite the
> AioContext is still the main loop.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

This adds a new function that is almost the same as an existing
function, but the documentation is unclear when I should use one or the
other.

What are the use cases for the existing qemu_mutex_iothread_locked()
stub where we rely on false being returned?

If there aren't any, then maybe we should change the stub for that one
instead of adding a new function that behaves the same in the system
emulator and different only when it's stubbed out?

Kevin


