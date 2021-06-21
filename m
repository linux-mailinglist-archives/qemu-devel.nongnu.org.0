Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D2E3AEC99
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:38:32 +0200 (CEST)
Received: from localhost ([::1]:54962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvM0N-0005AT-69
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lvLz0-00049b-S9; Mon, 21 Jun 2021 11:37:06 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lvLyx-00011B-LC; Mon, 21 Jun 2021 11:37:06 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624289802; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=VbJmXiQ7ih9ccAzovJEiynzLzAA+Le9gGHdwDyZDKPiRAfYoq+EWwVH4Vb0+A1XHkh3lx1Mgbfp5VRACXUWIlcmigNA4CWlNz0E7cjCi3Orig2N6Tisaz+8/vkuzKe1fvsZjEdFmZqGOU2wSBt8QNgIEYTrL4lXUWkEqgR20EDM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1624289802;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=4o5nt6apoIPEjKK9yTVxd06N4x4SJz2hKTNFrJsZcYc=; 
 b=WLvUHDZRzMnnmU/iBU+v1n/+YBvpT07jWlG5k1RGUemDBLdHAoKEGGCrHPcC6N8+vn86b4JgTfnlp0Qc9M8w2sZocka+9k+sDynFRXG4pDc+i5KdHdEySe1b+8uTbWELnThPT9ISIIDffoSGu5oSKu4IbzgOnWzRPKANINLxlpo=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624289802; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
 bh=4o5nt6apoIPEjKK9yTVxd06N4x4SJz2hKTNFrJsZcYc=;
 b=T5dS9+8emC1nUxjf3y40yP4d9X4s+JZeaYQNkmwUyvYLpVQ/MlwJkY1Lb7fiq/S+
 85BGFCBqZJTo1GjChP1/A+mPBZIVAKgRpGCzablMKM9ltVJhvc5FZY7piHBpbQLgom4
 7P2nEuQmLD81Uv+H3jPqoDbR3PMAIfP65wih0ybs=
Received: from n200-111-076.byted.org
 (ec2-3-67-219-253.eu-central-1.compute.amazonaws.com [3.67.219.253]) by
 mx.zoho.com.cn with SMTPS id 162428980074517.74789841558129;
 Mon, 21 Jun 2021 23:36:40 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
From: Fam Zheng <fam@euphon.net>
In-Reply-To: <6b77db0c-8625-992e-8546-15b9a24ae928@redhat.com>
Date: Mon, 21 Jun 2021 16:36:31 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <0EF3A65E-39CB-4114-8572-001C2DF05863@euphon.net>
References: <20210621093240.4170701-1-philmd@redhat.com>
 <9A674DF3-041E-4E7C-BB49-481AA77B1F7B@euphon.net>
 <6b77db0c-8625-992e-8546-15b9a24ae928@redhat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 =?utf-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 21 Jun 2021, at 16:13, Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com> wrote:
>=20
> On 6/21/21 3:18 PM, Fam Zheng wrote:
>>=20
>>=20
>>> On 21 Jun 2021, at 10:32, Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com> wrote:
>>>=20
>>> When the NVMe block driver was introduced (see commit bdd6a90a9e5,
>>> January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
>>> -ENOMEM in case of error. The driver was correctly handling the
>>> error path to recycle its volatile IOVA mappings.
>>>=20
>>> To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
>>> DMA mappings per container", April 2019) added the -ENOSPC error to
>>> signal the user exhausted the DMA mappings available for a =
container.
>>>=20
>>> The block driver started to mis-behave:
>>>=20
>>> qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
>>> (qemu)
>>> (qemu) info status
>>> VM status: paused (io-error)
>>> (qemu) c
>>> VFIO_MAP_DMA failed: No space left on device
>>> qemu-system-x86_64: block/block-backend.c:1968: blk_get_aio_context: =
Assertion `ctx =3D=3D blk->ctx' failed.
>>=20
>> Hi Phil,
>>=20
>>=20
>> The diff looks good to me, but I=E2=80=99m not sure what exactly =
caused the assertion failure. There is `if (r) { goto fail; }` that =
handles -ENOSPC before, so it should be treated as a general case. What =
am I missing?
>=20
> Good catch, ENOSPC ends setting BLOCK_DEVICE_IO_STATUS_NOSPACE
> -> BLOCK_ERROR_ACTION_STOP, so the VM is paused with DMA mapping
> exhausted. I don't understand the full "VM resume" path, but this
> is not what we want (IO_NOSPACE is to warn the operator to add
> more storage and resume, which is pointless in our case, resuming
> won't help until we flush the mappings).
>=20
> IIUC what we want is return ENOMEM to set =
BLOCK_DEVICE_IO_STATUS_FAILED.

I agree with that. It just makes me feel there=E2=80=99s another bug in =
the resuming code path. Can you get a backtrace?

Fam=

