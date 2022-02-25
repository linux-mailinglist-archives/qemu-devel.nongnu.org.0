Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E114C4669
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 14:32:55 +0100 (CET)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNaiL-0000IN-Uc
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 08:32:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1nNa5p-0000ii-QS
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:53:06 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:53422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1nNa5k-0000DT-LF
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:53:02 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D52E61B87;
 Fri, 25 Feb 2022 12:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22AEC340E7;
 Fri, 25 Feb 2022 12:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1645793568;
 bh=k70Mm1upOxGWmsfQxSUf0akmkVM2raW07xRde9JsJKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T5TGdmUfWYwiM40dkWqh42IVnuCj4XBrMYt/8xkHE3INhGb0RcLcrKgWBpasl5Jco
 ODZYMZ03HmZ6KUnRGTpiSiCixKNgP/lHMkBCJUVWX/denDe4MKXhQws+z9fo7YJHTA
 UqqeN6ei8Wvh5P86Uw9+qrv80O1PbBQjyQEB09TA=
Date: Fri, 25 Feb 2022 13:52:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing
 RNG on VM fork
Message-ID: <YhjRHW0t/sxjb7Hi@kroah.com>
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220225124848.909093-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=gregkh@linuxfoundation.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, mst@redhat.com,
 raduweis@amazon.com, qemu-devel@nongnu.org, linux@dominikbrodowski.net,
 kys@microsoft.com, ardb@kernel.org, wei.liu@kernel.org, sthemmin@microsoft.com,
 ben@skyportsystems.com, decui@microsoft.com, ebiggers@kernel.org,
 lersek@redhat.com, ehabkost@redhat.com, adrian@parity.io, jannh@google.com,
 haiyangz@microsoft.com, graf@amazon.com, tytso@mit.edu, colmmacc@amazon.com,
 berrange@redhat.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, imammedo@redhat.com, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 01:48:48PM +0100, Jason A. Donenfeld wrote:
> VM Generation ID is a feature from Microsoft, described at
> <https://go.microsoft.com/fwlink/?LinkId=260709>, and supported by
> Hyper-V and QEMU. Its usage is described in Microsoft's RNG whitepaper,
> <https://aka.ms/win10rng>, as:
> 
>     If the OS is running in a VM, there is a problem that most
>     hypervisors can snapshot the state of the machine and later rewind
>     the VM state to the saved state. This results in the machine running
>     a second time with the exact same RNG state, which leads to serious
>     security problems.  To reduce the window of vulnerability, Windows
>     10 on a Hyper-V VM will detect when the VM state is reset, retrieve
>     a unique (not random) value from the hypervisor, and reseed the root
>     RNG with that unique value.  This does not eliminate the
>     vulnerability, but it greatly reduces the time during which the RNG
>     system will produce the same outputs as it did during a previous
>     instantiation of the same VM state.
> 
> Linux has the same issue, and given that vmgenid is supported already by
> multiple hypervisors, we can implement more or less the same solution.
> So this commit wires up the vmgenid ACPI notification to the RNG's newly
> added add_vmfork_randomness() function.
> 
> It can be used from qemu via the `-device vmgenid,guid=auto` parameter.
> After setting that, use `savevm` in the monitor to save the VM state,
> then quit QEMU, start it again, and use `loadvm`. That will trigger this
> driver's notify function, which hands the new UUID to the RNG. This is
> described in <https://git.qemu.org/?p=qemu.git;a=blob;f=docs/specs/vmgenid.txt>.
> And there are hooks for this in libvirt as well, described in
> <https://libvirt.org/formatdomain.html#general-metadata>.
> 
> Note, however, that the treatment of this as a UUID is considered to be
> an accidental QEMU nuance, per
> <https://github.com/libguestfs/virt-v2v/blob/master/docs/vm-generation-id-across-hypervisors.txt>,
> so this driver simply treats these bytes as an opaque 128-bit binary
> blob, as per the spec. This doesn't really make a difference anyway,
> considering that's how it ends up when handed to the RNG in the end.
> 
> Cc: Adrian Catangiu <adrian@parity.io>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Dominik Brodowski <linux@dominikbrodowski.net>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

