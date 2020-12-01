Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57422C99AF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:39:03 +0100 (CET)
Received: from localhost ([::1]:45760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk1Be-0001Fk-TH
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kk19Y-0007tk-Lh
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:36:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kk19W-0003rD-HP
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606811809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJJynQFf2iGdJ3mdXFtsSW5QkyoHhzS3cB4AAL0khQQ=;
 b=HaJrODYADoUqmdm84O52ToMGMVrkTUc0tx29n7vfzxOfMtP/0lyUKduBCX0Czz48r2zy3w
 LibFncyQ6pf76mYCcPn8apk1oYpW3ZdSi6oU61qanfOQrAgsqAtrTUdum30Q8mYguiLMFb
 q7alMBTPdNtan3ORTtUyTBBKX4XN5Jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-8fdZ2DI6OZ6Y2wFff-sbGQ-1; Tue, 01 Dec 2020 03:36:47 -0500
X-MC-Unique: 8fdZ2DI6OZ6Y2wFff-sbGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 893EC805BE4;
 Tue,  1 Dec 2020 08:36:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEA4C5C1A3;
 Tue,  1 Dec 2020 08:36:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 72CA1113864E; Tue,  1 Dec 2020 09:36:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130153051.GG2039965@redhat.com>
 <62faf2d5-96a5-8fce-d2ed-f0d095882e70@redhat.com>
Date: Tue, 01 Dec 2020 09:36:38 +0100
In-Reply-To: <62faf2d5-96a5-8fce-d2ed-f0d095882e70@redhat.com> (Paolo
 Bonzini's message of "Mon, 30 Nov 2020 17:32:09 +0100")
Message-ID: <87mtyxapnt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 30/11/20 16:30, Daniel P. Berrang=C3=A9 wrote:
>> { 'struct': 'QCryptoSecretCommon',
>>    'base': 'Object',
>>    'state': { 'rawdata': '*uint8_t',
>>               'rawlen': 'size_t' },
>>    'data': { '*format': 'QCryptoSecretFormat',
>>              '*keyid': 'str',
>>              '*iv': 'str' } }
>> { 'struct': 'QCryptoSecret',
>>    'base': 'QCryptoSecretCommon',
>>    'data': { '*data': 'str',
>>              '*file': 'str' } }
>
> No, please don't do this.  I want to keep writing C code, not a weird
> JSON syntax for C.
>
> I'd much rather have a FooOptions field in my struct so that I can
> just do visit_FooOptions in the UserCreatable.complete() method,
> that's feasible.

It should be, because it's what we've done elsewhere, isn't it?

Yes, we can extend QAPI to let us embed opaques outside the QAPI
schema's scope ("state"), along with means to create, destroy, and
clone.  This is new.

But we can also invert: put the QAPI-generated C type ("config") in a
handwritten C type that marries it to "state".

Code to create and destroy is handwritten, and uses QAPI-generated code
for the "config" part.

A generic interface to handwritten creation is possible: Take the
QAPI-generated "config" type as argument, extract enough information to
call the appropriate constructor, return its value.

Generic destruction is also possible: all it needs is a map from
instance to destructor function.

None of this is new in QEMU.


