Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973954B2785
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 15:07:55 +0100 (CET)
Received: from localhost ([::1]:44646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWaY-0005Vj-OD
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 09:07:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIWKp-0001Fw-5J
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 08:51:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIWKn-0006Pw-1e
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 08:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644587496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xE64NEKlxtwEgpaQOgJM74Rb1eZaFpvOf4XBFHZwJcM=;
 b=GTV5PCCpMdS4LctWYgkAX3Yua/yJFyysQX6aUoV6dEPLAwZLBZwqdFFltkfqQAHbZGq+L2
 XFyeMglm0yk+45XfScBk0N+WXtXveGtR683th7piLTfKNP8DD/lngQHnoEonakRWpcVsLz
 FZn4jlIoVnZvatRB6LMuipslX1CAmMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-F7zxm9ObMW6vR9QoGz0z1A-1; Fri, 11 Feb 2022 08:51:35 -0500
X-MC-Unique: F7zxm9ObMW6vR9QoGz0z1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3C3F81F03E;
 Fri, 11 Feb 2022 13:51:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D48E7B9D8;
 Fri, 11 Feb 2022 13:51:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0039A21E6A00; Fri, 11 Feb 2022 14:51:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 1/3] qmp: Support for querying stats
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
 <20220131194312.1192626-2-mark.kanda@oracle.com>
 <5c635615-e5be-8c3c-6146-cac70c326cf5@redhat.com>
 <YfkTCCFU0vg/PwgQ@redhat.com>
Date: Fri, 11 Feb 2022 14:51:30 +0100
In-Reply-To: <YfkTCCFU0vg/PwgQ@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 1 Feb 2022 11:01:28 +0000")
Message-ID: <87zgmxmrz1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Feb 01, 2022 at 11:51:26AM +0100, Paolo Bonzini wrote:
>> On 1/31/22 20:43, Mark Kanda wrote:
>> >=20
>> > { "execute": "query-stats", "arguments" : { "target": "vm" } }
>> > { "return": {
>> >      "list": [
>> >        { "provider": "kvm",
>> >          "stats": [
>> >            { "name": "max_mmu_page_hash_collisions", "value": 0 },
>> >            { "name": "max_mmu_rmap_size", "value": 0 },
>> >            { "name": "nx_lpage_splits", "value": 131 },
>> >           ...
>> >          ] }
>> >        { "provider": "provider XYZ",
>> >        ...
>> >      ],
>> >      "target": "vm"
>> >    }
>> > }
>>=20
>> Perhaps it's better to have a better name than "list" for clarity, like =
you
>> already did with 'stats':
>>=20
>> { 'struct': 'VCPUResultsEntry',
>>   'data': { 'path': 'str',
>>             'providers': [ 'StatsResultsEntry' ] } }
>>=20
>> { 'struct': 'VCPUStatsResults',
>>   'data': { 'objects': [ 'VCPUResultsEntry' ] } }
>>=20
>>=20
>> { 'struct': 'VMStatsResults',
>>   'data': { 'providers' : [ 'StatsResultsEntry' ] } }
>>=20
>> Also, here:
>>=20
>> > +{ 'alternate': 'StatsValue',
>> > +  'data': { 'scalar': 'uint64',
>> > +            'list': 'StatsValueArray' } }
>>=20
>> is it possible to just do
>>=20
>> { 'alternate': 'StatsValue',
>>   'data': { 'scalar': 'uint64',
>>             'list': ['uint64'] } }
>
> No, the QAPI generator throws its toys out of the pram.
>
> It claims you can have any set of data types which have a
> distinct representation on the wire, so this is valid from
> that POV.  Something about the parser/code generator can't
> cope with this inline array though - it wants a named type
> which means a built-in scalar, or a compound type, but not
> an array :-(

Array is not implemented, simply because we haven't had a use for it.

Should not make you settle for an inferior schema design!  Implementing
array alternates shouldn't be hard.


