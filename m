Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229BD58EEF0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 17:07:54 +0200 (CEST)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLnJI-0008Ah-PP
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 11:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLnHJ-00061N-2R
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 11:05:52 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLnHE-0006pM-Cf
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 11:05:46 -0400
Received: by mail-ej1-x629.google.com with SMTP id y13so28169380ejp.13
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=qbrYhUiAu7LigxQMPxOI5oV+jbt8XGgZHLt92cRcg3s=;
 b=vPFelpWikw7MybScb3fCHgZJCcYjqBt6580QcIRHSNg/Ug79AuxpHyNWDw2QiczoMR
 NnG2NmYjv4fi5MXM4E7hSiNR8xmhpvPbiBcj8e9eCICgyGbecKkg2yuZXyvcxpuxjc/v
 +ZHO/uCu/cBrPxhNUwV0hMkGTMOsHpDC7Yvm5oVH9JvyIn/lGdXZCbsS3x/rwEV6nToB
 vrco61uF9b0jtcVvcCm8g5tMJg4FVxGERTd9MJobBfX229v+HeojHfxYkDPsLW26E+/v
 VfBriSZR14hf5dnBWdqZ/G3fezUxMQZVLaI4Bco9k6ZSeku0POmKr1sHbvG3R2CiarnE
 QTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=qbrYhUiAu7LigxQMPxOI5oV+jbt8XGgZHLt92cRcg3s=;
 b=geV5dL5l26dno7htQ9vs8Z893LSvMbGnmk8GAzfwyhSRVclBoiaSqvoukveJ3xB6W/
 8XwSUPxqkyHBadTYBcqAhuhJfucs00Y7r0zwsm1T4yFboaJz8IDS2lWKucNKq5NjpAcU
 P6QEgeM0pxaPyVP/8ZLmTdFzEyk0VPKT1t6app8DDQYMGb6MgMop/xNKLwBcd54lr/o5
 stNIpfHSgby70D4zP9SHHm39s7pQDyxeOOZyLb2LPMR2/63RPAWFYuAw63Yntf3LbwVO
 bpmMn7Stq3KxTzWD0CoQ9zA1ftIrlNw5SqMmsDe50qWXeLj4WeVTSKIgGlHWBj8jNKC1
 vpLg==
X-Gm-Message-State: ACgBeo2M+5EFkfS4U+KHiM03q0rvEGb8Vk4noRkGVcFcEKl7EjmeqeG2
 p2shiuyUU69Sgyyqq63abX7ggg==
X-Google-Smtp-Source: AA6agR67tYIw9hbdpVi9dNHWpLVRB6ovhi2FgkoNnLfZ1GPX88hn3egkXZer0achBYxT9feZmB23aA==
X-Received: by 2002:a17:907:60c8:b0:730:9efe:ecbd with SMTP id
 hv8-20020a17090760c800b007309efeecbdmr19791180ejc.90.1660143942766; 
 Wed, 10 Aug 2022 08:05:42 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a056402000400b004404e290e7esm7829876edu.77.2022.08.10.08.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:05:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E83F81FFB7;
 Wed, 10 Aug 2022 16:05:40 +0100 (BST)
References: <MN0PR11MB61090F118B8D3977D0EC03FEF0659@MN0PR11MB6109.namprd11.prod.outlook.com>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Lu, Jingdong" <jingdong.lu@intel.com>
Cc: qemu-devel@nongnu.org
Subject: Re: Shared memory between host and guest
Date: Wed, 10 Aug 2022 16:03:37 +0100
In-reply-to: <MN0PR11MB61090F118B8D3977D0EC03FEF0659@MN0PR11MB6109.namprd11.prod.outlook.com>
Message-ID: <87h72kjfzv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Lu, Jingdong" <jingdong.lu@intel.com> writes:

> Hi experts,
>
>=20=20
>
> I have some basic questions regarding shared memory between host and gues=
t based on QEMU/KVM:
>
>=20=20
>
> 1, Can host and guest share the same block of physical memory? Ivshmem? I=
s it continuous physical memory?
>
>=20=20
>
> 2, More specifically, is there any way to support the following operation=
s?
>
> 1 Guest starts.
>
> 2 Host side allocates one block of physical memory like 2MB.
>
> 3 Host side adds this memory to running guest  memory mapping.

With support for pci hotplug you can add/remove virtio-pmem blocks to
the guest.

>
> 4 Both of host and guest can access this shared memory.

Yes - you can back the memory with a file. See:

  https://qemu.readthedocs.io/en/latest/system/devices/virtio-pmem.html


>
>=20=20
>
> Best Regards,
>
> Jingdong


--=20
Alex Benn=C3=A9e

