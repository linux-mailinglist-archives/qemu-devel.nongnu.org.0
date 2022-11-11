Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0094D6253E3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 07:37:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNeI-00039U-Vz; Fri, 11 Nov 2022 01:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1otNeD-00039E-Aj
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:36:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1otNeB-00048X-Ss
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668148575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W8kaEMR3kTC2iFUezWoOFp9RXpkfdPvbvV1FLqLvB60=;
 b=h/UznUo6iQ7GqlfuQZJVhJqVxDmjsjFzXfs5d19FTasRWycBKWR17QyTxK8Gx507D99qaS
 wgf9OOOk+v00jYiKIPHB5lIjrqMD/t7TeqD16MRYKo5QS5ppjvb8L1dpKhj6dgME4etiNx
 Ckc6OT+l9vUyF7g7VgMD661QTBDP+WM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-UqJP1uExPO2oEG6GLc37-Q-1; Fri, 11 Nov 2022 01:36:09 -0500
X-MC-Unique: UqJP1uExPO2oEG6GLc37-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCF6D3811F43;
 Fri, 11 Nov 2022 06:36:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C143201C0D2;
 Fri, 11 Nov 2022 06:36:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1D06221E6921; Fri, 11 Nov 2022 07:36:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org,  Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org,  Klaus Jensen <k.jensen@samsung.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 1/2] hw/nvme: fix incorrect use of errp/local_err
References: <20221110220805.26816-1-its@irrelevant.dk>
 <20221110220805.26816-2-its@irrelevant.dk>
Date: Fri, 11 Nov 2022 07:36:07 +0100
In-Reply-To: <20221110220805.26816-2-its@irrelevant.dk> (Klaus Jensen's
 message of "Thu, 10 Nov 2022 23:08:04 +0100")
Message-ID: <87iljmdmlk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

> From: Klaus Jensen <k.jensen@samsung.com>
>
> Remove an unnecessary local Error value in nvme_realize(). In the
> process, change nvme_check_constraints() into returning a bool.
>
> Finally, removing the local Error value also fixes a bug where an error
> returned from nvme_init_subsys() would be lost.

Would it be lost?  It's the hunk below:

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
>  1 file changed, 23 insertions(+), 25 deletions(-)
>
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index ac3885ce5079..a5c0a5fa6ce2 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c

[...]

> @@ -7586,7 +7585,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error =
**errp)
   static void nvme_realize(PCIDevice *pci_dev, Error **errp)
   {
       NvmeCtrl *n =3D NVME(pci_dev);
       NvmeNamespace *ns;
       Error *local_err =3D NULL;

@local_err is null.

       NvmeCtrl *pn =3D NVME(pcie_sriov_get_pf(pci_dev));

       if (pci_is_vf(pci_dev)) {
           /*
            * VFs derive settings from the parent. PF's lifespan exceeds
            * that of VF's, so it's safe to share params.serial.
            */
           memcpy(&n->params, &pn->params, sizeof(NvmeParams));
           n->subsys =3D pn->subsys;
       }

       nvme_check_constraints(n, &local_err);
       if (local_err) {
           error_propagate(errp, local_err);
           return;
       }

@local_err still is null.

       qbus_init(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
>                &pci_dev->qdev, n->parent_obj.qdev.id);
>=20=20
>      if (nvme_init_subsys(n, errp)) {
> -        error_propagate(errp, local_err);

Since @local_err is null, this error_propagate() does nothing.  The
error from nvme_init_subsys() remains in @errp.

>          return;
>      }
>      nvme_init_state(n);


