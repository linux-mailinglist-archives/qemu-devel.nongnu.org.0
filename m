Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497B3E33B3
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 08:06:45 +0200 (CEST)
Received: from localhost ([::1]:50996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCFTo-0002Mi-0s
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 02:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCFT4-0001iO-KR
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 02:05:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCFT0-00042S-Qv
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 02:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628316352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8H/nUpjRlP0Yb0dYoPRPPYSrUxwLQN0jGW+lNSvIUQ=;
 b=ezpj8Cv3bbFJbv1umBhJ5VLEnGyf36ULGaBsJIIJMhGtdxlWbCeGKO6nw7vKsYu4SaNk+T
 z+woNV5wXVSJjNCPU0pcgleh1Wvz0Ir7wkI/HQOO00lBCOaGMgzgZR8ulrb3z5h1gZuzrC
 WLOymOHD4IxSZqPV2927w7QuxiFBmjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-VcTGg7fdOjmi4bnddhB2fw-1; Sat, 07 Aug 2021 02:05:47 -0400
X-MC-Unique: VcTGg7fdOjmi4bnddhB2fw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C410185302F
 for <qemu-devel@nongnu.org>; Sat,  7 Aug 2021 06:05:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 394F927CA9;
 Sat,  7 Aug 2021 06:05:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AC0CE11380A0; Sat,  7 Aug 2021 08:05:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v7 00/10] qapi: untie 'if' conditions from C preprocessor
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
 <87im0j3iaa.fsf@dusky.pond.sub.org>
Date: Sat, 07 Aug 2021 08:05:40 +0200
In-Reply-To: <87im0j3iaa.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Thu, 05 Aug 2021 19:36:45 +0200")
Message-ID: <87eeb5okln.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Markus Armbruster <armbru@redhat.com> writes:

> marcandre.lureau@redhat.com writes:
>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Hi,
>>
>> This series makes the 'if' conditions less liberal, by formalizing a sim=
ple
>> expression tree based on bare boolean logic of configure option identifi=
ers.
>>
>> (this allows to express conditions in Rust in my QAPI-Rust PoC series)
>>
>> thanks
>
> Only a few trivial things left to correct or improve.  I'll take care of
> it in my tree.  Series
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> Thanks!

Queued for 6.2 and pushed to https://repo.or.cz/qemu/armbru.git branch
qapi-not-next.  Thanks!


