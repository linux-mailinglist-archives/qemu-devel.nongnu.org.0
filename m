Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18453E1440
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 13:56:39 +0200 (CEST)
Received: from localhost ([::1]:45490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBbzK-0007iv-Qf
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 07:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBbyN-0006iF-EG
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBbyM-0004nw-3G
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628164537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tAFjpJrfRUTFcGXiedMe8LsMPtceZTz0qDkSWN2tD3Y=;
 b=UdJEu6y276nlzyvp1tctWb/gj0BlcUXu+nG19TAQl2Mp0f40BLRtQr19Ry4ERwrcmxNV09
 6/ZVyZhJwhP4ceqUb4AOPH2FkjyNix/2dGwvvmiY9TivwmhySX4ebztC/hRoL4OErRkWSJ
 SwPDM0KnZBFO7U8PxijRoXxcwLyICAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-YiL3Qdc3PqGz9MeLVrLRnQ-1; Thu, 05 Aug 2021 07:55:36 -0400
X-MC-Unique: YiL3Qdc3PqGz9MeLVrLRnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3387F10199AD
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 11:55:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A47460C0F;
 Thu,  5 Aug 2021 11:55:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 210F411380A0; Thu,  5 Aug 2021 13:55:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v7 05/10] qapidoc: introduce QAPISchemaIfCond.docgen()
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
 <20210804083105.97531-6-marcandre.lureau@redhat.com>
Date: Thu, 05 Aug 2021 13:55:30 +0200
In-Reply-To: <20210804083105.97531-6-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 4 Aug 2021 12:31:00 +0400")
Message-ID: <87im0k9kct.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Instead of building the condition documentation from a list of string,
> use the result generated from QAPISchemaIfCond.docgen().
>
> This changes the generated documentation from:
> - COND1, COND2... (where COND1, COND2 are Literal nodes, and ',' is Text)
> to:
> - COND1 and COND2 (the whole string as a Literal node)
>
> This will allow us to generate more complex conditions in the following
> patches, such as "(COND1 and COND2) or COND3".
>
> Adding back the differentiated formatting is left to the wish list.

What about a TODO comment?   you suggest a suitable spot?

>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


