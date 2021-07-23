Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30DE3D3703
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:48:04 +0200 (CEST)
Received: from localhost ([::1]:44574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qqh-0002jh-PL
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m6qpj-0001RK-Ax
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:47:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m6qph-0007D7-3S
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627030019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IA8M+lWNy6vT32LSTQkcrq08A+Vp+2FiwlLs3ftyh3g=;
 b=X/iAk6olvSYDzTuG0BoqLA0liB+sN+jzEXJHIyCtQqloOwvZHa3Sm5rqEJetRiGfz3QIH1
 yk/zDL0ACaExtkfRfSHUjkbnwzhSfjGLWIp4byDMyPm5LxZroPr50VUTkCs0XVRNeNo3rH
 sJqBTDA+zkm8Qvu9kUG4WXvgKzImuGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-2ad4NTtYNYypdMosakEmng-1; Fri, 23 Jul 2021 04:46:58 -0400
X-MC-Unique: 2ad4NTtYNYypdMosakEmng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36040801A92;
 Fri, 23 Jul 2021 08:46:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9FAC60853;
 Fri, 23 Jul 2021 08:46:56 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH for-6.1 v2] machine: Disallow specifying topology
 parameters as zero
In-Reply-To: <553158b7-3705-8570-d3b8-e772ae49ed2c@huawei.com>
Organization: Red Hat GmbH
References: <20210722154326.1464-1-wangyanan55@huawei.com>
 <20210722154326.1464-2-wangyanan55@huawei.com>
 <YPmWTutShepWX32R@redhat.com> <87o8atcva4.fsf@dusky.pond.sub.org>
 <553158b7-3705-8570-d3b8-e772ae49ed2c@huawei.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 23 Jul 2021 10:46:55 +0200
Message-ID: <87zgud5se8.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23 2021, "wangyanan (Y)" <wangyanan55@huawei.com> wrote:

> On 2021/7/23 16:02, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>
>>> On Thu, Jul 22, 2021 at 11:43:26PM +0800, Yanan Wang wrote:
>>>> +    /*
>>>> +     * The topology parameters must be specified equal to or great th=
an one
>>>> +     * or just omitted, explicit configuration like "cpus=3D0" is not=
 allowed.
>>>> +     */
>>>> +    if ((config->has_cpus && config->cpus =3D=3D 0) ||
>>>> +        (config->has_sockets && config->sockets =3D=3D 0) ||
>>>> +        (config->has_dies && config->dies =3D=3D 0) ||
>>>> +        (config->has_cores && config->cores =3D=3D 0) ||
>>>> +        (config->has_threads && config->threads =3D=3D 0) ||
>>>> +        (config->has_maxcpus && config->maxcpus =3D=3D 0)) {
>>>> +        error_setg(errp, "parameters must be equal to or greater than=
 one if provided");
>>> I'd suggest a slight tweak since when seen it lacks context:
>>>
>>> $ ./qemu-system-x86_64 -smp 4,cores=3D0,sockets=3D2
>>> qemu-system-x86_64: parameters must be equal to or greater than one if =
provided
>>>
>>>
>>>      error_setg(errp, "CPU topology parameters must be equal to or grea=
ter than one if provided");
>> Let's scratch "if provided".
>>
>> I'd replace "must be equal to or greater than one" by "must be
>> positive", or maybe "must be greater than zero".
> How about we use "must be greater than zero" ?
> After a grep search of these two sentences in QEMU, they both show up
> in several places. "must be positive" always reports an invalid value tha=
t
> is "< 0". While the check in this patch actually reject an invalid zero=
=20
> value.

Of the two, I'd prefer "greater than zero".


