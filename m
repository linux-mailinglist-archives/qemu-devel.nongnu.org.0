Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700BC40004C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:13:14 +0200 (CEST)
Received: from localhost ([::1]:34974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM90L-0005Nz-Dp
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vq-00073K-NA
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vo-0001Kg-O0
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TGvshjwvvhq6HYLAfmA8mwwMdcfwa7SpoCUH3te3SGg=;
 b=FzPnOvuaXBtoDPpfiOVFUPfhqPTA4oSi9dunUJ4DvslCK6GgGHPUkDh/SAdkQp67l4Rf7I
 oRTPNABS9r0nAxhGQ5LnhhbqeKwuwfKRj3qGLSMBhQXWBg14kCWN2mr/4b8+Yz7YoY0O/N
 kSwV3PME26Bx7CHAAxMiNgWE/Dg+WLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-UQnkng49OpqAP4CHXV5j6Q-1; Fri, 03 Sep 2021 09:08:30 -0400
X-MC-Unique: UQnkng49OpqAP4CHXV5j6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D3726D5C2;
 Fri,  3 Sep 2021 13:08:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01E1517A98;
 Fri,  3 Sep 2021 13:08:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 65D7F11380BC; Wed,  1 Sep 2021 15:20:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 0/7] DEVICE_UNPLUG_GUEST_ERROR QAPI event
References: <20210825004835.472919-1-danielhb413@gmail.com>
Date: Wed, 01 Sep 2021 15:20:34 +0200
In-Reply-To: <20210825004835.472919-1-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Tue, 24 Aug 2021 21:48:28 -0300")
Message-ID: <87pmtsa0v1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> Hi,
>
> In this version the event was renamed and the optional 'msg'
> attribute was removed. It also contains smaller changes based
> on Markus' comments in v6.

Looks neat now, thanks!

Series
Reviewed-by: Markus Armbruster <armbru@redhat.com>


