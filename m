Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE6C31AE3A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 22:57:00 +0100 (CET)
Received: from localhost ([::1]:50098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB2uR-0008PF-8P
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 16:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lB2t4-0007Ni-4S; Sat, 13 Feb 2021 16:55:34 -0500
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lB2sy-0002f0-8W; Sat, 13 Feb 2021 16:55:33 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613253298; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=EsxDhA0okANp1a/4EpYg+YYcEVt1kCJrxnqE+3S1R8F9I4CX73U/HtjBafbr8MGQ7uw5eowDDHlkMl/P3sSJT+KckY7PtdjR3dKLYptqszqHadtrdBkUgCFsw0aNiV1TxGn9A2vf7+4pruwtQxo4f6dPz/rTXlRhLlXMhrwi7HM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1613253298;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=zn/pJYlSQ58MnoEC7kyThntb5mPZcBOCV8/Ax66d9W4=; 
 b=TN2s+WvARFH6L8GYN060AvXarW0kMb8a++kSoASg8uxan93dyAQaUAEzT564mhooZMi/v8vGATNZmly7DLPSgBUg86mCG9SAC3Rj/NX0B+sbkxB4ezCjCb7DQNFRUFRhFJCEuoLjh/2KTCisb4Q3ZoiRRNLf6bIbEoE59Fswq64=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1613253298; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:To:Cc:Message-ID:Subject:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 bh=zn/pJYlSQ58MnoEC7kyThntb5mPZcBOCV8/Ax66d9W4=;
 b=BufcVIvyhrkqni3RmIb3yp5lUhSgNFndG9QLSepZWHa+9a5uqGn8fN+89yu/w+3J
 VpIN/8GnN6EdYOE0MWVQi5VxqWCkOPEf3cLyC8ePQl/BXDC2fgl0jkUZcps4limmzf3
 pP8FaQc86bjBl13vDgiAt8lsMb9AX8e9cGnCbQPg=
Received: from localhost (ec2-18-134-147-35.eu-west-2.compute.amazonaws.com
 [18.134.147.35]) by mx.zoho.com.cn
 with SMTPS id 1613253296311916.3191945360106;
 Sun, 14 Feb 2021 05:54:56 +0800 (CST)
Date: Sat, 13 Feb 2021 21:54:48 +0000
From: Fam Zheng <fam@euphon.net>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20210213215448.GA67780@ip-172-44-255-31>
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default
 with 'null-co' driver
References: <20210211142656.3818078-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210211142656.3818078-1-philmd@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-02-11 15:26, Philippe Mathieu-Daud=E9 wrote:
> The null-co driver doesn't zeroize buffer in its default config,
> because it is designed for testing and tests want to run fast.
> However this confuses security researchers (access to uninit
> buffers).

I'm a little surprised.

Is changing default the only way to fix this? I'm not opposed to
changing the default but I'm not convinced this is the easiest way.
block/nvme.c also doesn't touch the memory, but defers to the device
DMA, why doesn't that confuse the security checker?

Cannot we just somehow annotate it in a way that the checker can
understand (akin to how we provide coverity models) and be done?

Thanks,
Fam

>=20
> A one-line patch supposed which became a painful one, because
> there is so many different syntax to express the same usage:
>=20
>  opt =3D qdict_new();
>  qdict_put_str(opt, "read-zeroes", "off");
>  null_bs =3D bdrv_open("null-co://", NULL, opt, BDRV_O_RDWR | BDRV_O_PROT=
OCOL,
>                      &error_abort);
>=20
> vm.qmp('blockdev-add', driver=3D'null-co', read_zeroes=3DFalse, ...)
>=20
> vm.add_drive_raw("id=3Ddrive0,driver=3Dnull-co,read-zeroes=3Doff,if=3Dnon=
e")
>=20
>     blk0 =3D { 'node-name': 'src',
>         'driver': 'null-co',
>         'read-zeroes': 'off' }
>=20
>     'file': {
>         'driver': 'null-co',
>         'read-zeroes': False,
>     }
>=20
>     "file": {
>         "driver": "null-co",
>         "read-zeroes": "off"
>     }
>=20
>     { "execute": "blockdev-add",
>       "arguments": {
>           "driver": "null-co",
>           "read-zeroes": false,
>           "node-name": "disk0"
>         }
>     }
>=20
> opts =3D {'driver': 'null-co,read-zeroes=3Doff', 'node-name': 'root', 'si=
ze': 1024}
>=20
> qemu -drive driver=3Dnull-co,read-zeroes=3Doff
>=20
> qemu-io ... "json:{'driver': 'null-co', 'read-zeroes': false, 'size': 655=
36}"
>=20
> qemu-img null-co://,read-zeroes=3Doff
>=20
> qemu-img ... -o data_file=3D"json:{'driver':'null-co',,'read-zeroes':fals=
e,,'size':'4294967296'}"
>=20
> There are probably more.
>=20
> Anyhow, the iotests I am not sure and should be audited are 056, 155
> (I don't understand the syntax) and 162.
>=20
> Please review,
>=20
> Phil.
>=20
> Philippe Mathieu-Daud=3DC3=3DA9 (2):
>   block: Explicit null-co uses 'read-zeroes=3D3Dfalse'
>   block/null: Enable 'read-zeroes' mode by default
>=20
>  docs/devel/testing.rst                     | 14 +++++++-------
>  tests/qtest/fuzz/generic_fuzz_configs.h    | 11 ++++++-----
>  block/null.c                               |  2 +-
>  tests/test-bdrv-drain.c                    | 10 ++++++++--
>  tests/acceptance/virtio_check_params.py    |  2 +-
>  tests/perf/block/qcow2/convert-blockstatus |  6 +++---
>  tests/qemu-iotests/040                     |  2 +-
>  tests/qemu-iotests/041                     | 12 ++++++++----
>  tests/qemu-iotests/051                     |  2 +-
>  tests/qemu-iotests/051.out                 |  2 +-
>  tests/qemu-iotests/051.pc.out              |  4 ++--
>  tests/qemu-iotests/087                     |  6 ++++--
>  tests/qemu-iotests/118                     |  2 +-
>  tests/qemu-iotests/133                     |  2 +-
>  tests/qemu-iotests/153                     |  8 ++++----
>  tests/qemu-iotests/184                     |  2 ++
>  tests/qemu-iotests/184.out                 | 10 +++++-----
>  tests/qemu-iotests/218                     |  3 +++
>  tests/qemu-iotests/224                     |  3 ++-
>  tests/qemu-iotests/224.out                 |  8 ++++----
>  tests/qemu-iotests/225                     |  2 +-
>  tests/qemu-iotests/227                     |  4 ++--
>  tests/qemu-iotests/227.out                 |  4 ++--
>  tests/qemu-iotests/228                     |  2 +-
>  tests/qemu-iotests/235                     |  1 +
>  tests/qemu-iotests/245                     |  2 +-
>  tests/qemu-iotests/270                     |  2 +-
>  tests/qemu-iotests/283                     |  3 ++-
>  tests/qemu-iotests/283.out                 |  4 ++--
>  tests/qemu-iotests/299                     |  1 +
>  tests/qemu-iotests/299.out                 |  2 +-
>  tests/qemu-iotests/300                     |  4 ++--
>  32 files changed, 82 insertions(+), 60 deletions(-)
>=20
> --=3D20
> 2.26.2
>=20
>=20
>=20


