Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C77E41F9F0
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 07:28:05 +0200 (CEST)
Received: from localhost ([::1]:39718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWXZ6-0000aE-3W
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 01:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWXXv-0007jL-Qu
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 01:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWXXs-0005Ba-H3
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 01:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633152406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2V/f0qutokajm2zgKzaPiLwaSKGgpNtTKcUsTEMTJ5o=;
 b=bWDKV0GUy62/k4pW5QIJjeCkQOxogWkQxnCaXzBsC5aQxMAFmvpktan2DPucKGCfvFyzSs
 kDj95zht3dJIOvxbORfk6+Gf8waVN0S05eTZZE8m0lSiQYb5FW202uGbXfT8y3BbxNc36D
 X8M8JnZYgVEntzcqbrdT/SZ9s27aCOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-KAyH7OIVP-2V47fmjOzlIQ-1; Sat, 02 Oct 2021 01:26:44 -0400
X-MC-Unique: KAyH7OIVP-2V47fmjOzlIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F6F55074C;
 Sat,  2 Oct 2021 05:26:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9A3A652A4;
 Sat,  2 Oct 2021 05:26:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4501F113865F; Sat,  2 Oct 2021 07:26:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
 <0343d17f-bb46-a266-7ba4-20bdf30631d0@redhat.com>
 <YVdCRYvRHIio6MZe@redhat.com>
Date: Sat, 02 Oct 2021 07:26:37 +0200
In-Reply-To: <YVdCRYvRHIio6MZe@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 1 Oct 2021 18:15:49 +0100")
Message-ID: <87ilygq9o2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Oct 01, 2021 at 07:08:51PM +0200, Paolo Bonzini wrote:
>> On 29/09/21 04:58, Yanan Wang wrote:
>> > @@ -933,8 +935,7 @@ static void machine_set_smp(Object *obj, Visitor *=
v, const char *name,
>> >           return;
>> >       }
>> > -    smp_parse(ms, config, errp);
>> > -    if (*errp) {
>> > +    if (!smp_parse(ms, config, errp)) {
>> >           qapi_free_SMPConfiguration(config);
>> >       }
>> >   }
>> >=20
>>=20
>> This is actually a leak, so I'm replacing this patch with
>
> This patch isn't adding a leak, as there's no change in
> control flow / exit paths.  AFAICT, the leak was introduced
> in patch 15 instead, so the code below shoudl be squashed
> into that, and this patch left as-is.

Concur.


