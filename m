Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9E61E1AAB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 07:20:19 +0200 (CEST)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdS0g-0005UE-56
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 01:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jdRzv-0004zF-Tj
 for qemu-devel@nongnu.org; Tue, 26 May 2020 01:19:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34429
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jdRzv-0000BN-99
 for qemu-devel@nongnu.org; Tue, 26 May 2020 01:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590470370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/01/U1RuUagSf4zwH15n/UZO/8xpH4maUPi9HAgyTF0=;
 b=Pbv9QURDMJtnEWiUIdNTPvXyrStRRwqAP/diWM2Y4Z1VEpja0vbfpMLgEcHFulXQhpzHJm
 WcYJf0K8hJEEInqzc+8JKJLPB7UKW4CjybPA2AtpShnY5NHCeTq4iKSLHRn5kJuHZDjs/F
 TXWGnLR3zNYVv32EWT7du0vXChFDzVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-3qZ22RCoM3yTXGE-LzB29Q-1; Tue, 26 May 2020 01:19:25 -0400
X-MC-Unique: 3qZ22RCoM3yTXGE-LzB29Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AD6A18FF664;
 Tue, 26 May 2020 05:19:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 286CC2B4AA;
 Tue, 26 May 2020 05:19:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A5975113864A; Tue, 26 May 2020 07:19:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 06/24] armv7m: Bury unwanted "ARM,bitband-memory" devices
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-7-armbru@redhat.com>
 <CAFEAcA9UampZxo-4Z=6+LKkC9HLrdGYT5AcLyiGVYvgU5VE+cA@mail.gmail.com>
 <878shgh8be.fsf@dusky.pond.sub.org>
 <3ebe626e-0373-0eee-6a54-27a88d656122@redhat.com>
 <CAFEAcA_ddMMCJm+ykRdBxW5BpyMQHbZLAELr=fAGfs3H4TYXyw@mail.gmail.com>
Date: Tue, 26 May 2020 07:19:22 +0200
In-Reply-To: <CAFEAcA_ddMMCJm+ykRdBxW5BpyMQHbZLAELr=fAGfs3H4TYXyw@mail.gmail.com>
 (Peter Maydell's message of "Mon, 25 May 2020 13:49:53 +0100")
Message-ID: <87tv039sth.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 01:14:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 25 May 2020 at 13:32, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 25/05/20 07:50, Markus Armbruster wrote:
>> > Peter Maydell <peter.maydell@linaro.org> writes:
>> >
>> >> On Mon, 18 May 2020 at 06:04, Markus Armbruster <armbru@redhat.com> wrote:
>> >>> These devices are optional, and enabled by property "enable-bitband".
>> >>> armv7m_instance_init() creates them unconditionally, because the
>> >>> property has not been set then.  armv7m_realize() realizes them only
>> >>> when the property is true.  Works, although it leaves unrealized
>> >>> devices hanging around in the QOM composition tree.  Affects machines
>> >>> microbit, mps2-an505, mps2-an521, musca-a, and musca-b1.
>> >>>
>> >>> Bury the unwanted devices by making armv7m_realize() unparent them.
>> >>> Visible in "info qom-tree"; here's the change for microbit:
>> >>
>> >> What does "bury" mean here? To me it implies "they still
>> >> exist but we've stuck them in a hole somewhere and covered
>> >> them up", but the qom-tree delta suggests we've actually
>> >> really deleted them?
>> >
>> > We really delete them now.
>> >
>> > "They've been lying dead in the streets; give them a decent burial".
>> >
>> > Would you like me to s/Bury/Delete/?
>>
>> "Bury unwanted" -> "Dispose of unused"?
>
> Yeah, delete or dispose of would be clearer I think.

Okay, the subjects are short enough to accomodate a change to 'Delete
unused "..." devices'.

Thanks!


