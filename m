Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69FB603E28
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 11:11:04 +0200 (CEST)
Received: from localhost ([::1]:49654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol56N-0004W5-9G
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 05:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ol4zw-00084l-4u
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ol4zu-0006pI-JI
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666170260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5vLQNMn7hVRRf1id7QHDGitVEbk5oVSMTQ+LDM09N4=;
 b=fNnBZk49urjiSPVmQpLxrYOZq9APZOmXUc+PSMtZYYbLuiK2FcABCx1PQVuvPiDdDUz1+9
 0Y7POWLnRyeyYGMavRvIkCNB+QoKMMr/GmdUCO9Sbt9mH8jcXZyvrixIXHvDeUNHoKBEtU
 wqTzK7C3MTq08tH93aSuFpnuz7EjB74=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-dFhsFNxkOPClW0zmlqRW8A-1; Wed, 19 Oct 2022 05:04:16 -0400
X-MC-Unique: dFhsFNxkOPClW0zmlqRW8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AB31185A794;
 Wed, 19 Oct 2022 09:04:00 +0000 (UTC)
Received: from localhost (unknown [10.39.195.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14FBE2166B41;
 Wed, 19 Oct 2022 09:03:50 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Pierre Morel
 <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com
Subject: Re: [PATCH v10 6/9] s390x/cpu topology: add topology-disable
 machine property
In-Reply-To: <08bbd6f8-6ae3-4a28-66ed-d5a290c1a30d@kaod.org>
Organization: Red Hat GmbH
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
 <20221012162107.91734-7-pmorel@linux.ibm.com>
 <08bbd6f8-6ae3-4a28-66ed-d5a290c1a30d@kaod.org>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 19 Oct 2022 11:03:47 +0200
Message-ID: <87y1tcjibw.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 18 2022, C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 10/12/22 18:21, Pierre Morel wrote:
>> S390 CPU topology is only allowed for s390-virtio-ccw-7.3 and
>> newer S390 machines.
>> We keep the possibility to disable the topology on these newer
>> machines with the property topology-disable.
>>=20
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   include/hw/boards.h                |  3 ++
>>   include/hw/s390x/cpu-topology.h    | 18 +++++++++-
>>   include/hw/s390x/s390-virtio-ccw.h |  2 ++
>>   hw/core/machine.c                  |  5 +++
>>   hw/s390x/s390-virtio-ccw.c         | 53 +++++++++++++++++++++++++++++-
>>   util/qemu-config.c                 |  4 +++
>>   qemu-options.hx                    |  6 +++-
>>   7 files changed, 88 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 311ed17e18..67147c47bf 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -379,6 +379,9 @@ struct MachineState {
>>       } \
>>       type_init(machine_initfn##_register_types)
>>=20=20=20
>> +extern GlobalProperty hw_compat_7_2[];
>> +extern const size_t hw_compat_7_2_len;
>
> QEMU 7.2 is not out yet.

Yes, and the introduction of the new compat machines needs to go into a
separate patch. I'm usually preparing that patch while QEMU is in
freeze, but feel free to cook up a patch earlier if you need it.

(...)

>> +static void ccw_machine_7_3_instance_options(MachineState *machine)
>> +{
>> +}
>> +
>> +static void ccw_machine_7_3_class_options(MachineClass *mc)
>> +{
>> +}
>> +DEFINE_CCW_MACHINE(7_3, "7.3", true);
>
> That's too early.

Also, the next QEMU version will be 8.0, not 7.3 :)


