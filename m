Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2755145DBC9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 14:59:48 +0100 (CET)
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqFHu-0003j9-Nq
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 08:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqFDH-0005TI-PG
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:54:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqFDG-0000eV-Al
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637848497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9yHuFNDd4oowf01R0LqG9SxN1O+JarU5JDwTj3NVTA=;
 b=WWMYMGCb7KrqPk4GNWzmOcxrBSmId3Akv/DgHk1CRy5u1IwjcbYi71FvJFh+cCf3wcW1FW
 eiAIqNHVoKm38jviTZ3RiwX6OwKQF2zlT4wxHEjwd5rjChY6UikCKY0Kp/Q1Yannv3In3P
 0N2gYNYscbV2d+t6sT9z2XNrK62an74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-mioNgeWrM6GzELNv9guGfw-1; Thu, 25 Nov 2021 08:54:56 -0500
X-MC-Unique: mioNgeWrM6GzELNv9guGfw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77698801B0E;
 Thu, 25 Nov 2021 13:54:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3326E1972E;
 Thu, 25 Nov 2021 13:54:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7BD6C11380A7; Thu, 25 Nov 2021 14:54:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v5 3/3] cpus-common: implement dirty limit on vCPU
References: <cover.1637759139.git.huangy81@chinatelecom.cn>
 <cover.1637759139.git.huangy81@chinatelecom.cn>
 <5b05962093b000b2e9d417d9de41d2cd6f272073.1637759139.git.huangy81@chinatelecom.cn>
 <87r1b5tvom.fsf@dusky.pond.sub.org>
 <6d07f6a4-8ec8-706c-45b1-35aefabb7ad3@chinatelecom.cn>
Date: Thu, 25 Nov 2021 14:54:35 +0100
In-Reply-To: <6d07f6a4-8ec8-706c-45b1-35aefabb7ad3@chinatelecom.cn> (Hyman
 Huang's message of "Thu, 25 Nov 2021 20:31:11 +0800")
Message-ID: <87a6hsgx2c.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hyman Huang <huangy81@chinatelecom.cn> writes:

> =E5=9C=A8 2021/11/24 23:33, Markus Armbruster =E5=86=99=E9=81=93:
>> huangy81@chinatelecom.cn writes:
>>=20
>>> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>>>
>>> Implement dirtyrate calculation periodically basing on
>>> dirty-ring and throttle vCPU until it reachs the quota
>>> dirtyrate given by user.
>>>
>>> Introduce qmp commands set-dirty-limit/cancel-dirty-limit to
>>> set/cancel dirty limit on vCPU.
>>>
>>> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.c=
n>

[...]

>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>> index bbfd48c..42b260e 100644
>>> --- a/qapi/migration.json
>>> +++ b/qapi/migration.json
>>> @@ -1850,6 +1850,49 @@
>>>   { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
>>>     ##
>>> +# @set-dirty-limit:
>>> +#
>>> +# Set the upper limit of dirty page rate for the interested vCPU.
>> "for a vCPU"
>>=20
>>> +#
>>> +# This command could be used to cap the vCPU memory load, which is als=
o
>>> +# refered as "dirty page rate". Users can use set-dirty-limit uncondit=
ionally,
>>> +# but if one want to know which vCPU is in high memory load and which =
vCPU
>>> +# should be limited, "calc-dirty-rate" with "dirty-ring" mode maybe an
>>> +# availiable method.
>> I think you should mention that the command fails unless dirty ring
>> is
>> enabled, and a pointer to its documentation.
>>=20
> Emm, it seems that there's no documentation about dirty ring in qemu=EF=
=BC=8C
> should i metion the commit b4420f19 "KVM: Dirty ring support" for
> dirty-ring?

I think the best you can do then is something like 'Property
"dirty-ring-size" of accelerator object "kvm" must be set.'

[...]


