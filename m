Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B322D6EEF37
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 09:20:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prZR4-0001pi-Ic; Wed, 26 Apr 2023 03:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prZR1-0001pQ-Uw
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 03:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prZR0-0000ij-7e
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 03:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682493565;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1v80ZYwL3IwkrBqiC62yLIe2kXbeqSJHz03cssJOxUk=;
 b=Zn7CH8AbyXGY7jwbZmKUCQQ0Wlf7r9NItDBK3DW5lJ05RFIG+QPlWfyvHY+izesb3n6lCW
 4Fj5nkl5qtdu0AGGu752GjH7qUECdyBXvpXN58KTdT9nUcFIgXBOg1CYB8lce/l4WA2JKw
 2lLOSN92B0klfqCsniTwAw4izzz+RQs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-mbJcnh7lPEuJGzzeETf4pA-1; Wed, 26 Apr 2023 03:19:23 -0400
X-MC-Unique: mbJcnh7lPEuJGzzeETf4pA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f173bd0d1bso41728215e9.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 00:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682493562; x=1685085562;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1v80ZYwL3IwkrBqiC62yLIe2kXbeqSJHz03cssJOxUk=;
 b=BWfKsPnf1Rvfdy70iXyBNwzAQDu9bx3YGrnhN1W3ABC4D3jX6Nv9Wwu7adQqGVDBju
 6K0ws8JBlzYDkRdlSrundc5RDq1QzJFMzWDv7pGFhxNZ6wjBEiLExof791ozStREvcCC
 RZxqhGYsSL4kWJ7Y1CSW0z2X/zocTqMDOYPYe1iK5F5CJ0eFnl0i/BqA6QIDbKNXwY/5
 Fy67BBci72sCpHqb+bGpvow5W3qHvAM2Dl3Fb2TVAwn8XlbcHnfMMLF9TGhFEU3dMeQl
 yj6CHPQktK5cxs+Xnh2sceeNQOFHwRGydL8NIYH9KgpDO14SZ5tJ1z/QBrSsBDmFdIXK
 4CwA==
X-Gm-Message-State: AAQBX9c3QtGmmNOjkw7d014waJvHeCmLJtW9CBirfmoArdrAG8agdMJ7
 fNRW1FlSmhJjkZC7bJ2gTncFdu2bDnwX9S5xVa/b3eAGLQwaKBO1cT2mlQmad2c4fDYLXkmsUv0
 hfEziCO8LcMKjK3o=
X-Received: by 2002:a7b:cb47:0:b0:3f0:967e:2cfb with SMTP id
 v7-20020a7bcb47000000b003f0967e2cfbmr12873261wmj.36.1682493562178; 
 Wed, 26 Apr 2023 00:19:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350a++v+djbyvP2BuuEUp2vTdegmjvJcGaNAXj7Du19VCbSYrs1iDi9LAFwzlMJPeipjg0oZcgw==
X-Received: by 2002:a7b:cb47:0:b0:3f0:967e:2cfb with SMTP id
 v7-20020a7bcb47000000b003f0967e2cfbmr12873241wmj.36.1682493561871; 
 Wed, 26 Apr 2023 00:19:21 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 o10-20020a05600c510a00b003ee443bf0c7sm20489132wms.16.2023.04.26.00.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 00:19:21 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Xu <peterx@redhat.com>,  qemu-devel@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Dave Jiang <dave.jiang@intel.com>,  Fan Ni
 <fan.ni@samsung.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PULL 61/73] hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register
In-Reply-To: <20230426021019-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Wed, 26 Apr 2023 02:12:47 -0400")
References: <cover.1678237635.git.mst@redhat.com>
 <010746ae1db7f52700cb2e2c46eb94f299cfa0d2.1678237635.git.mst@redhat.com>
 <ZEhzaWpNM+NvZCUw@x1n> <20230426021019-mutt-send-email-mst@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 09:19:20 +0200
Message-ID: <875y9jglfr.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Tue, Apr 25, 2023 at 08:42:17PM -0400, Peter Xu wrote:
>> Hi, Michael, Jonathan,
>>=20
>> On Tue, Mar 07, 2023 at 08:13:53PM -0500, Michael S. Tsirkin wrote:
>> This breaks the simplest migration from QEMU 8.0->7.2 binaries on all
>> machine types I think as long as the cap is present, e.g. the default
>> e1000e provided by the default q35 machine can already hit it with all
>> default cmdline:
>>=20
>>   ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
>>=20
>> 7.2 binary will have empty wmask for PCI_ERR_UNCOR_MASK, meanwhile I thi=
nk
>> it can also see a non-zero value, then the migration will fail at:
>>=20
>> vmstate_load 0000:00:02.0/e1000e, e1000e=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>> qemu-7.2: get_pci_config_device: Bad config data: i=3D0x10a read: 40 dev=
ice: 0 cmask: ff wmask: 0 w1cmask:0
>> qemu-7.2: Failed to load PCIDevice:config=20=20=20
>> qemu-7.2: Failed to load e1000e:parent_obj=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
>> qemu-7.2: error while loading state for instance 0x0 of device '0000:00:=
02.0/e1000e'=20=20=20=20=20=20
>> qemu-7.2: load of migration failed: Invalid argument
>>=20
>> We probably at least want to have the default value to be still zero, and
>> we'd need to make sure it'll not be modified by the guest, iiuc.
>>=20
>> Below oneliner works for me and makes the migration work again:
>>=20
>> =3D=3D=3D8<=3D=3D=3D
>> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
>> index 103667c368..563a37b79c 100644
>> --- a/hw/pci/pcie_aer.c
>> +++ b/hw/pci/pcie_aer.c
>> @@ -113,7 +113,7 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver, u=
int16_t offset,
>>      pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
>>                   PCI_ERR_UNC_SUPPORTED);
>>      pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
>> -                 PCI_ERR_UNC_MASK_DEFAULT);
>> +                 0/*PCI_ERR_UNC_MASK_DEFAULT*/);
>>      pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
>>                   PCI_ERR_UNC_SUPPORTED);
>> =3D=3D=3D8<=3D=3D=3D
>>=20
>> Anyone could have a look on a solid solution from PCI side?
>>=20
>> Copy Juan and Leonardo.
>>=20
>> Thanks,
>
> My bad, I forgot about this =F0=9F=A4=A6.
> So we need a property and tweak it with compat machinery depending on
> machine type. Jonathan, can you work on this pls?
> Or I can revert for now to relieve the time pressure,
> redo the patch at your leasure.

I agree with Michael here, the best option is adding a new property.

Later, Juan.


