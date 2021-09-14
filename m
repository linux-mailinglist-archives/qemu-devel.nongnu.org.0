Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F6240A58C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 06:47:24 +0200 (CEST)
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ0Lr-0007cF-1r
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 00:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ0Kp-0006qe-6b
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 00:46:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ0Km-0007gz-3G
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 00:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631594774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVJMesSpRSdH1NjrS+Vl/mju568sXQNgsemTdPBmaOc=;
 b=X7ESZwURw6K/i5DP7BDDe/ZAgQ76FbJu6LKJQCyqmaDPGeVVvEcHYLD/WNRpMs4fqZN2VT
 B9gWVgDGTRzIuBw89pnJTnew7IGkVUfN/r/zp3jE/mOKVYWkGbTWIIIxeDoWCaofGGMGNl
 8evpEz+qJCbeYMpbePz8ldEnqFwqzx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-ke1B7q55NauYTRCmrZtbrA-1; Tue, 14 Sep 2021 00:46:13 -0400
X-MC-Unique: ke1B7q55NauYTRCmrZtbrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 674511808304
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 04:46:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08D395C1D1;
 Tue, 14 Sep 2021 04:46:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7C15C113865F; Tue, 14 Sep 2021 06:46:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] qapi: define cleanup function for g_autoptr(Error)
References: <20210912124834.503032-1-pbonzini@redhat.com>
 <87fsu959rr.fsf@dusky.pond.sub.org>
 <7337ee08-cc7d-4ef1-dcc4-3b0facc8b7b1@redhat.com>
 <87tuio3jq8.fsf@dusky.pond.sub.org>
 <87tuiomxlj.fsf@dusky.pond.sub.org>
 <5b8f6bc5-c331-45ac-01c4-96cf9a87ebbb@redhat.com>
Date: Tue, 14 Sep 2021 06:46:07 +0200
In-Reply-To: <5b8f6bc5-c331-45ac-01c4-96cf9a87ebbb@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 13 Sep 2021 17:09:54
 +0200")
Message-ID: <87a6kfhii8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 9/13/21 3:08 PM, Markus Armbruster wrote:
>> Markus Armbruster <armbru@redhat.com> writes:

[...]

>> As is, reporting errors doesn't play well with g_autoptr().  Example:
>>=20
>>     Error *err =3D NULL;
>>=20
>>     ... code that may set @err ...
>>=20
>>     if (error is serious) {
>>         error_report_err(err);
>>     } else {
>>         error_free(err);
>>     }
>
> error_report_err() seems always called within an if()
> statement, so an alternative is to refactor this pattern as:
>
>   void error_report_err_cond(bool condition, Error *err);

It's rarely the only thing done when the condition is true, so it needs
to return it.


