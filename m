Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25B6478806
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:46:20 +0100 (CET)
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9oi-0006IS-1j
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:46:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1my9n2-0004pw-RD
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:44:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1my9mz-0003F8-Tl
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:44:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639734272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVNrV1X/GwZ5uHTAj0YpuZkNEm/4MmifxIcjirsYArs=;
 b=ZGtIUOlRabscl+5do0yAJTwMNd8SLrbIT/WU0Z3hl5q1137zIQfc8QuvVl0CUH6Z69Eo7B
 SVRhTT1LXa4NaMgAI/MuFvbYYIKfxG4S0He23UidJoE+2NXgS8E9ObkKayOBVL2+H1ffRN
 l3oCDkgz/+83Vvm4xnWU5Xyn4Y/K8k0=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-8TAdwOacO0um56CvZL2BtQ-1; Fri, 17 Dec 2021 04:44:29 -0500
X-MC-Unique: 8TAdwOacO0um56CvZL2BtQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 l7-20020a622507000000b00494608c84a4so1298520pfl.6
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 01:44:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NVNrV1X/GwZ5uHTAj0YpuZkNEm/4MmifxIcjirsYArs=;
 b=N2QYVDEGrvt2n6XGCaid9Kb/DCVgZDkOLFYTmUW1jOp8h41S0Cnhc2N+IYh7dFeJOb
 0zkjy2qj1EaXOYt5+M8OqqObrR2ef1v8/EJVWbxImglJJS4K1KlGRVv0R+67PrxfX6Qu
 8u2LWR3tLFIIeFZVhjASo373nWUeGG4IqUHmC2NqTM1bnlP6IBJHo4nne6QaiNvkFjUR
 nz1nx9vtGAGeRKgmK9Wb/ryI8XpEYpfTnA10B3AePuOP5eBiXyWO/TdJtqDtSsNHsNvs
 oZgFop1BbbnlruTnDFZCKQoWBfwhOmd6Img37PAf5klzt12qt/0OnPT2gINm99lbCWnP
 qFEA==
X-Gm-Message-State: AOAM5339vystub4WnKwEvZHffbZvLJmzPLQaGB8EVqrCf0Yrn7bp/4bk
 WGCmDe6gkhrdfL/4z/Belu+s3e4Gh/gDuK1dw6NWHhRwpJXuXioW+6ZaZuSvrnfNkMIUVtIWoSj
 I6Xd1UwcHR8lu7qIoVBWoAIU822ybd1k=
X-Received: by 2002:a17:903:191:b0:148:b9fc:c42b with SMTP id
 z17-20020a170903019100b00148b9fcc42bmr2156514plg.63.1639734268107; 
 Fri, 17 Dec 2021 01:44:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9GwNCW4lcPiYplwJMCW5j1LBndS6tzAK4BhA8NSiqYnJJpoWoo04PHBENQc/fA/cCnF9yJgLDuxQLuA2iFsw=
X-Received: by 2002:a17:903:191:b0:148:b9fc:c42b with SMTP id
 z17-20020a170903019100b00148b9fcc42bmr2156479plg.63.1639734267816; Fri, 17
 Dec 2021 01:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20211217030858.834822-1-alxndr@bu.edu>
 <PN0PR01MB6352C2E496E5723275EB1878FC789@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN0PR01MB6352C2E496E5723275EB1878FC789@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Fri, 17 Dec 2021 10:44:17 +0100
Message-ID: <CAA8xKjX0GteTzhyY1o7pR6PkDq9z01_S5JmOAeBsBj2Y04ktLQ@mail.gmail.com>
Subject: Re: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 17, 2021 at 7:28 AM Qiuhao Li <Qiuhao.Li@outlook.com> wrote:
>
> Thanks Alex. It seems this patch sets and checks if the destination devic=
e is busy. But how about the data transfers not triggered directly by PMIO/=
MMIO handlers? For example:
>
> 1. Device A Timer's callback -> Device A MMIO handler
> 2. Device A BH's callback -> Device A MMIO handler
>
> In these situations, when A launches a DMA to itself, the dev->engaged_in=
_direct_io is not set, so the operation is allowed. Maybe we should log the=
 source and check the destination when we launch data transfers. Is there a=
 way to do that?
>
> Below is a reproducer in NVMe which triggers DMA in a timer's callback (n=
vme_process_sq). I can still trigger use-after-free exception with this pat=
ch on qemu-6.1.0:
>
> cat << EOF | ./qemu-system-x86_64 -display none -machine accel=3Dqtest \
> -machine q35 -nodefaults -drive file=3Dnull-co://,if=3Dnone,format=3Draw,=
id=3Ddisk0 \
> -device nvme,drive=3Ddisk0,serial=3D1 -qtest stdio \
>
> outl 0xcf8 0x80000810               /* MLBAR (BAR0) =E2=80=93 Memory Regi=
ster Base Address, lower 32-bits */
> outl 0xcfc 0xe0000000               /* MMIO Base Address =3D 0xe0000000 *=
/
> outl 0xcf8 0x80000804               /* CMD - Command */
> outw 0xcfc 0x06                     /* Bus Master Enable, Memory Space En=
able */
> write 0xe0000024 0x4 0x02000200     /* [3] 3.1.8, Admin Queue Attributes =
*/
> write 0xe0000028 0x4 0x00100000     /* asq =3D 0x1000 */
> write 0xe0000030 0x4 0x00200000     /* acq =3D 0x2000 */
> write 0xe0000014 0x4 0x01004600     /* [3] 3.1.5, Controller Configuratio=
n, start ctrl */
> write 0xe0001000 0x1 0x01           /* [3] 3.1.24, SQyTDBL =E2=80=93 Subm=
ission Queue y Tail Doorbell */
> write 0x1000 0x1 0x02               /* cmd->opcode, NVME_ADM_CMD_GET_LOG_=
PAGE, nvme_get_log() */
> write 0x1018 0x4 0x140000e0         /* prp1 =3D 0xe0000014, NVME_REG_CC, =
nvme_ctrl_reset() */
> write 0x1028 0x4 0x03000004         /* cmd->cdw10, lid =3D 3 NVME_LOG_FW_=
SLOT_INFO, nvme_fw_log_info, buf_len =3D 4 */
> write 0x1030 0x4 0xfc010000         /* cmd->cdw12 =3D 0x1fc, Log Page Off=
set, trans_len =3D sizeof(fw_log) - 0x1fc =3D 4 */
> clock_step
> EOF
>
> CC: Mauro Matteo Cascella and Philippe Mathieu-Daud=C3=A9. Should we put =
the reproducer above to https://gitlab.com/qemu-project/qemu/-/issues/556??

Upstream issue: https://gitlab.com/qemu-project/qemu/-/issues/782

Thanks.
--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


