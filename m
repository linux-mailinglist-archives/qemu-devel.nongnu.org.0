Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC7D409F12
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 23:24:19 +0200 (CEST)
Received: from localhost ([::1]:36580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPtR4-0000DG-Gt
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 17:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarkko@kernel.org>) id 1mPtQC-0007yu-Dn
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 17:23:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:43570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarkko@kernel.org>) id 1mPtQA-0005fp-7P
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 17:23:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C4B360EE5;
 Mon, 13 Sep 2021 21:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631568200;
 bh=GsaLsgmeOo9TWSJ18tE35t5q8xR4NI61onpIGLV+Kpc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=QtaTQU75ni3u0gacV2vYkQyNtTku+RCX53Jdld3gmXDpy3jjNmytsps4wIkuXnj9l
 VJi0rO6OSE2OpBFMdpCp9yIluuAN2egzd/ZFbNSdph1ok8PoZ/MgBfm6U6EhML3JGJ
 XKkyxA/G4Zs0AlrDo/0Y1/b0h/E864k9T0Tkktg9BgFTJHVj+JC1o/uhfoReulEbuj
 1uJDXeXKTLovslCKFlQ0/xGmk5SxlypLw8xk/GyUMhMIdm6b9kjIjOCaeCsYmyaHsp
 CreQbiFDxP0xD/jOZIAds17hq7SGw7rtslK7hy/VLorZ0a+U9/QQfabYio+REQ5ivK
 ETAV/GiAp5sKw==
Message-ID: <f286ec034464bf032be2c174b6415bc9d3665b88.camel@kernel.org>
Subject: Re: [PATCH v4 22/33] hostmem-epc: Add the reset interface for EPC
 backend reset
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Date: Tue, 14 Sep 2021 00:23:18 +0300
In-Reply-To: <YT+2ddfdb+6u83Jq@google.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-23-yang.zhong@intel.com>
 <dc8394c5-52a1-573f-36d3-de8bc43973d3@redhat.com>
 <0ec706b694f8e9451452b23c76c8a39155baf357.camel@kernel.org>
 <YT+2ddfdb+6u83Jq@google.com>
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
Cc: Yang Zhong <yang.zhong@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kai.huang@intel.com, eblake@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-09-13 at 20:37 +0000, Sean Christopherson wrote:
> On Mon, Sep 13, 2021, Jarkko Sakkinen wrote:
> > On Fri, 2021-09-10 at 17:10 +0200, Paolo Bonzini wrote:
> > > On 19/07/21 13:21, Yang Zhong wrote:
> > > > +void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
> > > > +                              Error **errp)
> > > > +{
> > > > +    MemoryRegion *mr =3D &backend->mr;
> > > > +
> > > > +    mr->enabled =3D false;
> > > > +
> > > > +    /* destroy the old memory region if it exist */
> > > > +    if (fd > 0 && mr->destructor) {
> > > > +        mr->destructor(mr);
> > > > +    }
> > > > +
> > > > +    sgx_epc_backend_memory_alloc(backend, errp);
> > > > +}
> > > > +
> > >=20
> > > Jarkko, Sean, Kai,
> > >=20
> > > this I think is problematic because it has a race window while=20
> > > /dev/sgx_vepc is closed and then reopened.  First, the vEPC space cou=
ld=20
> > > be exhausted by somebody doing another mmap in the meanwhile.  Second=
,=20
> > > somebody might (for whatever reason) remove /dev/sgx_vepc while QEMU =
runs.
> >=20
> > 1: Why is it a problem that mmap() could fail?
>=20
> The flow in question is QEMU's emulation of a guest RESET.  If mmap() fai=
ls, QEMU
> either has to kill the VM or disable SGX.  In either case, it's fatal to =
a running
> workload/VM.

Thanks for the explanations.

Isn't this more about badly configured system/workloads? That's
at least for me the existential question.

I'm interested of legit workloads where this behaviour could still
cause any issues.

I'd guess than in e.g. data center environment, you'd have firly
strict orchestration for this type of resource so that you know
that workloads have an appropriate bandwidth.

/Jarkko

