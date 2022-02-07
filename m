Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8134AC8A3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 19:34:51 +0100 (CET)
Received: from localhost ([::1]:33848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8qg-0006ei-Hk
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 13:34:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH8mn-0003Jj-65
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 13:30:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH8mi-0001Dz-FF
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 13:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644258642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bMNvUat/he8tiCYXcc93Hk/6G2Y/4xFPBTLUKjPB5u0=;
 b=QQ2XVfMy2mMrCZCD82R7EBiTzbrRZvNVtRyj1LV12i1jgRzKLH4LTnDePtdVdwxMySF/dL
 N3XUjr/82qlXZQPk+0LCKE5EcAfl6d09YjCrudg1O0Q9/dKseTE2zkE2g1AKPzf5Ky5OL6
 lBxiTjUD7OpI1vjQQ+VxQkewgNWPMsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-n2P02sTxMbKlBPjc7wNDzw-1; Mon, 07 Feb 2022 13:30:39 -0500
X-MC-Unique: n2P02sTxMbKlBPjc7wNDzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B1031091DB9;
 Mon,  7 Feb 2022 18:30:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B50D8798D3;
 Mon,  7 Feb 2022 18:30:28 +0000 (UTC)
Date: Mon, 7 Feb 2022 19:30:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v6 00/33] block layer: split block APIs in global state
 and I/O
Message-ID: <YgFlQrmGXcOO9P/4@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220121170544.2049944-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> Each function in the GS API will have an assertion, checking
> that it is always running under BQL.
> I/O functions are instead thread safe (or so should be), meaning
> that they *can* run under BQL, but also in an iothread in another
> AioContext. Therefore they do not provide any assertion, and
> need to be audited manually to verify the correctness.

I wonder if we could actually do something to catch at least some kinds
of bugs. The first conclusion from thinking about it is that we probably
shouldn't open-code assert(qemu_in_main_thread()) everywhere, but have a
macro or inline function for each category to be called in each function.

So an IO_CODE() macro could increase a counter in the coroutine object
(that is decreased again at the end of the function with g_auto), and
then GLOBAL_STATE_CODE() could not only assert that we're holding the
BQL, but also that the counter is still 0, i.e. it is not (indirectly)
called by an I/O function.

We may want to enable this only in debug builds, but maybe still worth a
thought anyway?

Kevin


