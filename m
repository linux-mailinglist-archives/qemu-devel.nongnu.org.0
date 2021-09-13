Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22A8409E0F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 22:18:57 +0200 (CEST)
Received: from localhost ([::1]:35414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPsPo-0003Gs-Az
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 16:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarkko@kernel.org>) id 1mPsOx-0002bF-1P
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 16:18:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:43104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarkko@kernel.org>) id 1mPsOu-00069i-Qb
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 16:18:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DCD760E97;
 Mon, 13 Sep 2021 20:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631564278;
 bh=19X1bAJF5vgvUU/vOK3Pz9sZMT3TMY9ysK4tJ64WaDU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=bC79b08fzHuns0yjAGlBJ/9eT+rxXMxgh9KFWq1cxDlYPLo7LPQcAwJTtESlMweas
 jlPbZPs8sxX9cGF8C2h9dEbZvO2DmwN75UXxTHtigB+2wkpG/I9YKz29efZ3ZY/KIa
 mcFXh64wv2kS+HPMOUJ0I6QnQe07CUiAUkAkIj58ekE4iBSDgQnPNfNY3MHsjXyvvS
 T+nO/y+5m0Ctrh/Taj80cLFUKe/dF8V9tqEypH8w7UEmAAoPUqibvDeXDUjrcOQWkz
 CdQz5E+tAfGiHh4xhaj9TKYUAmbCGr3funT/eA3Z37QRcsgNL0j/O9u9PNsAopAsEc
 DgWRcD1+ytqzQ==
Message-ID: <0ec706b694f8e9451452b23c76c8a39155baf357.camel@kernel.org>
Subject: Re: [PATCH v4 22/33] hostmem-epc: Add the reset interface for EPC
 backend reset
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
 seanjc@google.com, kai.huang@intel.com
Date: Mon, 13 Sep 2021 23:17:55 +0300
In-Reply-To: <dc8394c5-52a1-573f-36d3-de8bc43973d3@redhat.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-23-yang.zhong@intel.com>
 <dc8394c5-52a1-573f-36d3-de8bc43973d3@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Received-SPF: pass client-ip=198.145.29.99; envelope-from=jarkko@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-09-10 at 17:10 +0200, Paolo Bonzini wrote:
> On 19/07/21 13:21, Yang Zhong wrote:
> > +void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
> > +                              Error **errp)
> > +{
> > +    MemoryRegion *mr =3D &backend->mr;
> > +
> > +    mr->enabled =3D false;
> > +
> > +    /* destroy the old memory region if it exist */
> > +    if (fd > 0 && mr->destructor) {
> > +        mr->destructor(mr);
> > +    }
> > +
> > +    sgx_epc_backend_memory_alloc(backend, errp);
> > +}
> > +
>=20
> Jarkko, Sean, Kai,
>=20
> this I think is problematic because it has a race window while=20
> /dev/sgx_vepc is closed and then reopened.  First, the vEPC space could=
=20
> be exhausted by somebody doing another mmap in the meanwhile.  Second,=
=20
> somebody might (for whatever reason) remove /dev/sgx_vepc while QEMU runs=
.

1: Why is it a problem that mmap() could fail?

2: Are you speaking about removing device node? If you have succesfully
   mapped /dev/sgx_vepc, that should not have much effect (file refcount).

/Jarkko


