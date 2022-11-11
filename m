Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED393625434
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:01:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNyN-0002AT-Qj; Fri, 11 Nov 2022 01:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1otNxA-0001xD-Ss
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:56:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1otNwv-0004IU-Vh
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668149729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LtYc/T8mSG5KndeFV93DsK/S2N+63NJaPbUTWr9qWQk=;
 b=QJR1/mH/xiqoQj9EYoHaIVo5dJIohrybJDN7rmIIFC1dYaSXkWlQkqT+VrEdbILGimKQHA
 9q5T/so2kFeiM50UICPAKTeMcQ++kRMg0O2jLxGVYXT46tzvRBLasJYMJYa4666VOQKWG1
 dZd0/okLc++nFK0ORqOyFnGmc1wYYsI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-CEqwqh8vNeK-WTAC2OGTzQ-1; Fri, 11 Nov 2022 01:55:26 -0500
X-MC-Unique: CEqwqh8vNeK-WTAC2OGTzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D70C29ABA0A;
 Fri, 11 Nov 2022 06:55:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6310E1121330;
 Fri, 11 Nov 2022 06:55:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3044321E6921; Fri, 11 Nov 2022 07:55:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org,  Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org,  Klaus Jensen <k.jensen@samsung.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 1/2] hw/nvme: fix incorrect use of errp/local_err
References: <20221110220805.26816-1-its@irrelevant.dk>
 <20221110220805.26816-2-its@irrelevant.dk>
 <87iljmdmlk.fsf@pond.sub.org> <Y23uiV5Ue2YKaIS7@cormorant.local>
Date: Fri, 11 Nov 2022 07:55:24 +0100
In-Reply-To: <Y23uiV5Ue2YKaIS7@cormorant.local> (Klaus Jensen's message of
 "Fri, 11 Nov 2022 07:41:13 +0100")
Message-ID: <874jv6dlpf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Klaus Jensen <its@irrelevant.dk> writes:

> On Nov 11 07:36, Markus Armbruster wrote:
>> Klaus Jensen <its@irrelevant.dk> writes:
>>=20
>> > From: Klaus Jensen <k.jensen@samsung.com>
>> >
>> > Remove an unnecessary local Error value in nvme_realize(). In the
>> > process, change nvme_check_constraints() into returning a bool.
>> >
>> > Finally, removing the local Error value also fixes a bug where an error
>> > returned from nvme_init_subsys() would be lost.
>>=20
>> Would it be lost?  It's the hunk below:
>>=20
>> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> > ---
>> >  hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
>> >  1 file changed, 23 insertions(+), 25 deletions(-)
>> >
>> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> > index ac3885ce5079..a5c0a5fa6ce2 100644
>> > --- a/hw/nvme/ctrl.c
>> > +++ b/hw/nvme/ctrl.c
>>=20
>> [...]
>>=20
>> > @@ -7586,7 +7585,6 @@ static void nvme_realize(PCIDevice *pci_dev, Err=
or **errp)
>>    static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>>    {
>>        NvmeCtrl *n =3D NVME(pci_dev);
>>        NvmeNamespace *ns;
>>        Error *local_err =3D NULL;
>>=20
>> @local_err is null.
>>=20
>>        NvmeCtrl *pn =3D NVME(pcie_sriov_get_pf(pci_dev));
>>=20
>>        if (pci_is_vf(pci_dev)) {
>>            /*
>>             * VFs derive settings from the parent. PF's lifespan exceeds
>>             * that of VF's, so it's safe to share params.serial.
>>             */
>>            memcpy(&n->params, &pn->params, sizeof(NvmeParams));
>>            n->subsys =3D pn->subsys;
>>        }
>>=20
>>        nvme_check_constraints(n, &local_err);
>>        if (local_err) {
>>            error_propagate(errp, local_err);
>>            return;
>>        }
>>=20
>> @local_err still is null.
>>=20
>>        qbus_init(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
>> >                &pci_dev->qdev, n->parent_obj.qdev.id);
>> >=20=20
>> >      if (nvme_init_subsys(n, errp)) {
>> > -        error_propagate(errp, local_err);
>>=20
>> Since @local_err is null, this error_propagate() does nothing.  The
>> error from nvme_init_subsys() remains in @errp.
>>=20
>
> Oh, right. Thanks.
>
> I misread the function documentation, getting the impression that it
> would overwrite dst_errp regardless of the value of local_err.

Happens :)

If you have suggestions on improving the doc, shoot.

This commit's message could perhaps be adjusted like

    hw/nvme: Clean up confused use of errp/local_err

    Remove an unnecessary local Error value in nvme_realize(). In the
    process, change nvme_check_constraints() to return a bool.

What do you think?


