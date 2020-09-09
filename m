Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3CC262AD2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 10:47:01 +0200 (CEST)
Received: from localhost ([::1]:42996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFvkq-00068A-JX
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 04:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1kFvgq-0007gI-Kw; Wed, 09 Sep 2020 04:42:52 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1kFvgn-0007m8-Ng; Wed, 09 Sep 2020 04:42:52 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1599640956; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=INIg7jEynEWRY65CjXVPDp4TQUrJFAMRECTjww3QQbjeTd4vsDgweLOtOQfm1vRlPQF0v2lUi5SFAb9cCpbjfNthTam74vUoOlPxgm0ZhT9pq2kU+UNF1N8Gm3RiuBY9sdwVl0JxVwWnZDsDceXFZdFGXVK0OPvY6cYX5FWJqZ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1599640956;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=7K3KoI/zf8G2en/MhIkOshYOroFK6jAfzrLXPSofQqA=; 
 b=Uvv/ciky3pUWS6Tecr9+iWL0NW17YAGk+MK1Gjubq3YDJ3xUHRO62u8iJpMjXko/BSPAMUSbOtQg6wBwzecw5laL57uZFLScoHR+GaTF026V8zWkWnByZmoYMAnyFnKTLsua6xUmNaa2xT4aHA50fEtZPOjchCMm2BNcQtDs5z4=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1599640956; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:To:Cc:Message-ID:Subject:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 bh=7K3KoI/zf8G2en/MhIkOshYOroFK6jAfzrLXPSofQqA=;
 b=HARM/0dz5tNG4UwcHBdPuWWYReWvw5gTD28sfdhBJqtTe0fVo3Taw/z3jcuIhb0Q
 x5xWuX2BG1iLv/jlR9QF8+P2KBBaxBAU6N3hvkUXFtd0b4AA+yC6wQxiuVcg54wYPpC
 jDwpcJZOwhhouaYIunRjVToEIrfNVsqAW5FkYYbY=
Received: from localhost (ec2-52-56-101-76.eu-west-2.compute.amazonaws.com
 [52.56.101.76]) by mx.zoho.com.cn
 with SMTPS id 1599640954566923.3874393320741;
 Wed, 9 Sep 2020 16:42:34 +0800 (CST)
Date: Wed, 9 Sep 2020 08:42:30 +0000
From: Fam Zheng <fam@euphon.net>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20200909084230.c3eebbu5dsfeqnpu@dev>
Subject: Re: [RFC PATCH v5 4/4] block/nvme: Use
 qemu_vfio_pci_init_msix_irqs() to initialize our IRQ
References: <20200908180342.280749-1-philmd@redhat.com>
 <20200908180342.280749-5-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200908180342.280749-5-philmd@redhat.com>
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 04:38:34
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-09-08 20:03, Philippe Mathieu-Daud=E9 wrote:
> Instead of initializing one MSIX IRQ with the generic
> qemu_vfio_pci_init_irq() function, use the MSIX specific one which
> ill allow us to use multiple IRQs. For now we provide an array of

s/ill/will/

> a single IRQ.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Fam


