Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2A4273ECE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 11:48:16 +0200 (CEST)
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKeuF-0005DC-W1
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 05:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1kKerv-0003pQ-A0; Tue, 22 Sep 2020 05:45:51 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1kKerr-0000TT-3e; Tue, 22 Sep 2020 05:45:51 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600767927; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=YsuV0/6tvJu0vQYqGPy5cnE7E8OXRSpBKZ8PhWZkM9K2xmhN1HnRPZScspNVx4rBzBwsnxP8e/RHG1YqZ3+ukCK2MguhoYFCSvCy125UWbY9LzWNZ3+lwyU84BVBcEK96quZWukd3cMZI3ZcrzA+JEX939tdqk+/I9dyJbzRdek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1600767927;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=EcrY6ophsbBEUHkM/1XrDL/mKiT+jIvBa63QKOkXXyY=; 
 b=MVlt6MI5HuYo/qHMjycL/waxl5ngD3bVYYX8RQACgQXd5m1Jiv4Nw67oVByWvhXqib7ShDWXMqAgROWFYkyGTQUQBMNLHUakEd7QPl9djbUrJWrJAJckOy3exoj7p+8CcFdBL8HFFOk0Jx0z2w1nkPh+VofLpo89rybwFVsrFzU=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1600767927; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:Mime-Version:Content-Transfer-Encoding;
 bh=EcrY6ophsbBEUHkM/1XrDL/mKiT+jIvBa63QKOkXXyY=;
 b=N0v/b+0li6jXdrEGHfrx+3qTiYeo72POjbZC8n9qg1MHXbQ7MDGUy8pJBJo9YtZQ
 6f+hQvTrRM2ttGBqxvl6CZeewLhctYEHGXH7s6s7HEpehcmcKutcMi71TwXw4L27Aef
 LXBLPOR10IlMMamq1uT5kIui2m+bp3+t9fRIl9rw=
Received: from vpn-10-85-95-225.fra53.corp.amazon.com (54.239.6.177
 [54.239.6.177]) by mx.zoho.com.cn
 with SMTPS id 1600767926351195.99045056638624;
 Tue, 22 Sep 2020 17:45:26 +0800 (CST)
Message-ID: <a8e87383339c264bf9d99aebafaf45d7a023f0d8.camel@euphon.net>
Subject: Re: [PATCH v2 0/6] block/nvme: Map doorbells pages write-only,
 remove magic from nvme_init
From: Fam Zheng <fam@euphon.net>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Date: Tue, 22 Sep 2020 10:45:20 +0100
In-Reply-To: <20200922083821.578519-1-philmd@redhat.com>
References: <20200922083821.578519-1-philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 04:19:31
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-09-22 at 10:38 +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> Instead of mapping 8K of I/O + doorbells as RW during the whole
> execution, maps I/O temporarly at init, and map doorbells WO.
>=20
> Replace various magic values by slighly more explicit macros from
> "block/nvme.h".
>=20
> Since v1: Fix uninitialized regs* (patchew)
>=20
> Philippe Mathieu-Daud=C3=A9 (6):
>   util/vfio-helpers: Pass page protections to qemu_vfio_pci_map_bar()
>   block/nvme: Map doorbells pages write-only
>   block/nvme: Reduce I/O registers scope
>   block/nvme: Drop NVMeRegs structure, directly use NvmeBar
>   block/nvme: Use register definitions from 'block/nvme.h'
>   block/nvme: Replace magic value by SCALE_MS definition
>=20
>  include/qemu/vfio-helpers.h |  2 +-
>  block/nvme.c                | 73 +++++++++++++++++++++------------
> ----
>  util/vfio-helpers.c         |  4 +-
>  3 files changed, 44 insertions(+), 35 deletions(-)
>=20

Reviewed-by: Fam Zheng <fam@euphon.net>


