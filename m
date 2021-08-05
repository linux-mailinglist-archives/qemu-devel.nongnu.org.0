Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798163E1A8B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 19:37:53 +0200 (CEST)
Received: from localhost ([::1]:47290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBhJY-0004Ja-IX
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 13:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBhId-0003cP-0D
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:36:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBhIb-0002mT-Oz
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628185013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMGRaZBqPyewVLT1BODYVrfqlOoTMickhhRs28eTRVg=;
 b=VGimAQLF+2PiJx/c3djM1aGflce0tPnL04SCmaEHsbyvQY4IAkm+kymeKhABkh4Xv/9FHH
 aCdLSSDnyhIHBs43syir9t4RIh+CXCZevjMq34ig9V6JJwTJGUkSLjTIP1EjjHAbaEGR+j
 dyUMXOC6HSL5eEj7qrWLDXGWa2VEp/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-kgZ92Aw7MViqRe7FqvI0ig-1; Thu, 05 Aug 2021 13:36:51 -0400
X-MC-Unique: kgZ92Aw7MViqRe7FqvI0ig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADB8710066E7
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 17:36:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2EF45D9DD;
 Thu,  5 Aug 2021 17:36:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6AA0A11380A0; Thu,  5 Aug 2021 19:36:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v7 00/10] qapi: untie 'if' conditions from C preprocessor
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
Date: Thu, 05 Aug 2021 19:36:45 +0200
In-Reply-To: <20210804083105.97531-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 4 Aug 2021 12:30:55 +0400")
Message-ID: <87im0j3iaa.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> This series makes the 'if' conditions less liberal, by formalizing a simp=
le
> expression tree based on bare boolean logic of configure option identifie=
rs.
>
> (this allows to express conditions in Rust in my QAPI-Rust PoC series)
>
> thanks

Only a few trivial things left to correct or improve.  I'll take care of
it in my tree.  Series
Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks!


