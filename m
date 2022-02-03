Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3104A83DC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 13:33:48 +0100 (CET)
Received: from localhost ([::1]:53100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFbJ6-00088S-40
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 07:33:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFbHS-00071t-5b; Thu, 03 Feb 2022 07:32:06 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:33679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFbHN-0008MX-UF; Thu, 03 Feb 2022 07:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=86+sX0LEJxzbPl5hG2yNd0BN0taWSLUHj17iojHQDqg=; b=vgRNLXwu80QC5roCGFNXlQx9RW
 gLT+nBRXJ2lNvaVG2YOI0KS5gAwRQleiq2zL+j9UyTRVJiixZDC9ebacokqoIg/T4mlAjuflvYyCb
 3kWRBl3ikrukaB2Qp5ZFPKFsurBiIitFqUGlkIP6IKuWJ/Ys9UCEEhhlAuMFeartN5jZ7k0sE2Kq4
 ENzeiTpE7/3LAcwGn/okfALNwMHOFrlm6Y38r1QKPuXsWojHFg9H1jT13JvD/D83v5rI5a2nBw2U4
 wbjIW4zeI2d0fGdjtvDKP2qRzNzVOpjmA6DfdmJHURpfR3fzN7EYTnpSR1bLReSs94IX3FaNDpCGn
 37AX47EBWPYdotV0FrZGdBH7Ds5WT/cxpyVrOvDOdniopZUa/b1CHKRYM46R7KwkTEOp25s627usI
 HYc2WCcRrhwq5z1Mzorvalw/ujjcSZuQ5j8st0eaUxVSpin8eyslzMUm560E8SfCp3X6hni1wmO0n
 EXHGM4ZexZYA63CzVnjGlrdAwVwI6jojAILKLEy78FomsfwkPUMWQL5qihVDm1l9zoxVpdpw7wnqC
 uqBhEuaELuCBgHME8RIzLvy2AXPMsOYKQxqRc7EzctMzIFdyEyQsbvBSp1Ul9H1mW1KXY6eHzpjKd
 xtCuKJRArDoABosn3BKmd42/itEDUBzxpmaUox2T8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, qemu-stable@nongnu.org,
 "Dmitry V. Levin" <ldv@altlinux.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Thu, 03 Feb 2022 13:31:58 +0100
Message-ID: <1731735.zDmDcn6TH7@silver>
In-Reply-To: <20220203062005.chsjk5bb3pftlapn@altlinux.org>
References: <20220128223326.927132-1-vt@altlinux.org>
 <20220203045540.3wmae6mp7cnjtzxm@altlinux.org>
 <20220203062005.chsjk5bb3pftlapn@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 3. Februar 2022 07:20:05 CET Vitaly Chikunov wrote:
> On Thu, Feb 03, 2022 at 07:55:41AM +0300, Vitaly Chikunov wrote:
> > Christian,
> > 
> > On Wed, Feb 02, 2022 at 05:55:45PM +0100, Christian Schoenebeck wrote:
> > > On Freitag, 28. Januar 2022 23:33:26 CET Vitaly Chikunov wrote:
> > > > `struct dirent' returned from readdir(3) could be shorter than
> > > > `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> > > > 
> > > > into unallocated page causing SIGSEGV. Example stack trace:
> > > >  #0  0x00005555559ebeed v9fs_co_readdir_many
> > > >  (/usr/bin/qemu-system-x86_64 +
> > > > 
> > > > 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir
> > > > (/usr/bin/qemu-system-x86_64
> > > > + 0x4982e9) #2  0x0000555555eb7983 coroutine_trampoline
> > > > (/usr/bin/qemu-system-x86_64 + 0x963983) #3  0x00007ffff73e0be0 n/a
> > > > (n/a +
> > > > 0x0)
> > > > 
> > > > While fixing, provide a helper for any future `struct dirent' cloning.
> > > > 
> > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> > > > Cc: qemu-stable@nongnu.org
> > > > Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> > > > ---
> > > > Tested on x86-64 Linux.
> > > 
> > > I was too optimistic. Looks like this needs more work. With this patch
> > > applied the 9p test cases [1] are crashing now:
> > > 
> > > $ gdb --args tests/qtest/qos-test -m slow
> > > ...
> > > # Start of flush tests
> > > ok 50
> > > /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/vi
> > > rtio-9p-tests/synth/flush/success ok 51
> > > /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/vi
> > > rtio-9p-tests/synth/flush/ignored # End of flush tests
> > > # Start of readdir tests
> > 
> > I changed implementation from the one using dent->d_reclen to the one
> > using
> > 
> > strlen(dent->d_name) and it's passed readdir tests, but failed later:
> >   # Start of readdir tests
> >   ok 53
> >   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/vi
> >   rtio-9p-tests/synth/readdir/basic ok 54
> >   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/vi
> >   rtio-9p-tests/synth/readdir/split_512 ok 55
> >   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/vi
> >   rtio-9p-tests/synth/readdir/split_256 ok 56
> >   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/vi
> >   rtio-9p-tests/synth/readdir/split_128 # End of readdir tests
> >   # End of synth tests
> >   # Start of local tests
> >   # starting QEMU: exec x86_64-softmmu/qemu-system-x86_64 -qtest
> >   unix:/tmp/qtest-2822967.sock -qtest-log /dev/null -chardev
> >   socket,path=/tmp/qtest-2822967.qmp,id=char0 -mon
> >   chardev=char0,mode=control -display none -M pc  -fsdev
> >   local,id=fsdev0,path='/usr/src/RPM/BUILD/qemu-6.2.0/build-dynamic/qtest
> >   -9p-local-NpcZCR',security_model=mapped-xattr -device
> >   virtio-9p-pci,fsdev=fsdev0,addr=04.0,mount_tag=qtest -accel qtest #
> >   GLib-DEBUG: setenv()/putenv() are not thread-safe and should not be
> >   used after threads are created ok 57
> >   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/vi
> >   rtio-9p-tests/local/config Received response 7 (RLERROR) instead of 73
> >   (RMKDIR)
> >   Rlerror has errno 95 (Operation not supported)
> >   **
> >   ERROR:../tests/qtest/virtio-9p-test.c:305:v9fs_req_recv: assertion
> >   failed (hdr.id == id): (7 == 73) Bail out!
> >   ERROR:../tests/qtest/virtio-9p-test.c:305:v9fs_req_recv: assertion
> >   failed (hdr.id == id): (7 == 73) Aborted
> 
> I added some debugging output and in the bug case `d_reclen` is 0. Thus
> this is not readdir's struct dirent, but something else (test-only
> simulated dirent without accounting that we now have d_reclen logic).
> 
> This maybe related to the other bug in
> 
>   static void synth_direntry(V9fsSynthNode *node,
> 				  struct dirent *entry, off_t off)
>   {
>       strcpy(entry->d_name, node->name);
>       entry->d_ino = node->attr->inode;
>       entry->d_off = off + 1;
>   }
> 
> Where `d_reclen` is not updated.

The synth driver (used by the 'synth' 9p tests) intentionally just simulates a 
filesystem. The synth driver does not call any real fs syscalls, it just has 
its own very simple in-RAM-only structures that are used to simulate a fs and 
therefore the synth driver populates the dirent structure by itself.

Could you try to resolve this issue in the synth driver and send a v3 of this 
patch? I am currently busy with other tasks right now.

Best regards,
Christian Schoenebeck



