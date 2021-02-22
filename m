Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12213321653
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 13:21:24 +0100 (CET)
Received: from localhost ([::1]:39206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEADL-0005Na-5b
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 07:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEABu-00049O-6S
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 07:19:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEABl-0001UH-NM
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 07:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613996384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tAdubMwKbkCQ2Z1J+up1ogPBHw+moe3OBts2GALVdcw=;
 b=MMUduzw4YFjLpD0Z+fu6O5olUm8waD6DIzOevB6Wy+LEHv4zPoKWOu5YkSrneBfw08ZkOI
 twta3F4HMZqveD5aytmbP+FxllDGcsMoW+NTXONs3zpO4d5egBocP/C4vDAR8WJx2uoeMG
 sJhXWvZyuozFG1yPvfUL52MSZxCboBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-EF9LsGbrPvSb27-oDs3M6g-1; Mon, 22 Feb 2021 07:19:43 -0500
X-MC-Unique: EF9LsGbrPvSb27-oDs3M6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93467107ACE8;
 Mon, 22 Feb 2021 12:19:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C42C95D9CC;
 Mon, 22 Feb 2021 12:19:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4C686113860F; Mon, 22 Feb 2021 13:19:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 01/22] block: add eMMC block device type
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-2-git-send-email-sai.pavan.boddu@xilinx.com>
 <3c229241-fdc5-a445-d96e-ca16a5c0106b@redhat.com>
Date: Mon, 22 Feb 2021 13:19:35 +0100
In-Reply-To: <3c229241-fdc5-a445-d96e-ca16a5c0106b@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 22 Feb 2021 13:04:01
 +0100")
Message-ID: <87ft1opa5k.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, qemu-devel@nongnu.org,
 "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 saipava@xilinx.com, Alistair Francis <alistair.francis@wdc.com>,
 Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 =?utf-8?Q?C=C3=A9dr?= =?utf-8?Q?ic?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 2/22/21 9:20 AM, Sai Pavan Boddu wrote:
>> From: Vincent Palatin <vpalatin@chromium.org>
>>=20
>> Add new block device type.
>>=20
>> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
>> [SPB: Rebased over 5.1 version]
>> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  include/sysemu/blockdev.h | 1 +
>>  blockdev.c                | 1 +
>>  2 files changed, 2 insertions(+)
>>=20
>> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
>> index 3b5fcda..eefae9f 100644
>> --- a/include/sysemu/blockdev.h
>> +++ b/include/sysemu/blockdev.h
>> @@ -24,6 +24,7 @@ typedef enum {
>>       */
>>      IF_NONE =3D 0,
>>      IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF=
_XEN,
>> +    IF_EMMC,
>>      IF_COUNT
>>  } BlockInterfaceType;
>> =20
>> diff --git a/blockdev.c b/blockdev.c
>> index cd438e6..390d43c 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -83,6 +83,7 @@ static const char *const if_name[IF_COUNT] =3D {
>>      [IF_SD] =3D "sd",
>>      [IF_VIRTIO] =3D "virtio",
>>      [IF_XEN] =3D "xen",
>> +    [IF_EMMC] =3D "emmc",
>>  };
>
> We don't need to introduce support for the legacy -drive magic.
>
> -device should be enough for this device, right?

External interface extensions need rationale: why do we want / need it?
The commit message neglects to provide one.

Even more so when the interface in question is in a state like -drive
is.


