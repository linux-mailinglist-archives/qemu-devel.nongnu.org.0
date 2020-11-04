Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE6B2A62CD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 11:59:46 +0100 (CET)
Received: from localhost ([::1]:48798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaGW1-0001lA-Gc
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 05:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kaGUT-0000HF-BQ
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 05:58:11 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:51317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kaGUO-0006Sr-V6
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 05:58:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=BuusXKipO9sV7IbeGX/ke1Pbc6tpoFRGsBHLpw4lasc=; b=T5Ejha61cF9Kpw4lq2xBLpp6sb
 PLWT2yj9xw5zzBw5KhERTduXDHYOOW5NmjrJ71DXTwusZbGM5wm592EuyurzImfb730TM/L7RFwvp
 K2XfxKEQ5fTrlC6emp3vUebDFmuxdKk89R3sOu6MH927uzx/g1QE+b4j1zDZOUhPXaTmuLSuLqnPd
 +oooQlfJ0gPVW4uBGPEREm+j6yFQBte6WjXKhSd/jRbSt1gZVaWUCVXBrLuEtvva7s6ES3O2bKz/x
 LUP+QnWgZTHDqbfG+zEC8wdWOn8B9dF43UX99kPpxEqY68LzhtgGYPfpodw5W3Zrck26Doq0/JO0I
 czfLvslw==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] hw/9pfs: virtio-9p: Ensure config space is a multiple of
 4 bytes
Date: Wed, 04 Nov 2020 11:57:59 +0100
Message-ID: <10842894.6D7ucCyY7K@silver>
In-Reply-To: <CAEUhbmUxHkvZ_CimzeAGwgZVNSH7OXtX2Xsu+GiWWYmGXfWuYA@mail.gmail.com>
References: <1603959941-9689-1-git-send-email-bmeng.cn@gmail.com>
 <20201103065732-mutt-send-email-mst@kernel.org>
 <CAEUhbmUxHkvZ_CimzeAGwgZVNSH7OXtX2Xsu+GiWWYmGXfWuYA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 05:58:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 4. November 2020 08:44:44 CET Bin Meng wrote:
> Hi Michael,
> 
> On Tue, Nov 3, 2020 at 8:05 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Tue, Nov 03, 2020 at 02:26:10PM +0800, Bin Meng wrote:
> > > Hi Michael,
> > > 
> > > On Fri, Oct 30, 2020 at 5:29 PM Michael S. Tsirkin <mst@redhat.com> 
wrote:
> > > > On Thu, Oct 29, 2020 at 04:25:41PM +0800, Bin Meng wrote:
> > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > 
> > > > > At present the virtio device config space access is handled by the
> > > > > virtio_config_readX() and virtio_config_writeX() APIs. They perform
> > > > > a sanity check on the result of address plus size against the config
> > > > > space size before the access occurs.
> > > > > 
> > > > > For unaligned access, the last converted naturally aligned access
> > > > > will fail the sanity check on 9pfs. For example, with a mount_tag
> > > > > `p9fs`, if guest software tries to read the mount_tag via a 4 byte
> > > > > read at the mount_tag offset which is not 4 byte aligned, the read
> > > > > result will be `p9\377\377`, which is wrong.
> > > > > 
> > > > > This changes the size of device config space to be a multiple of 4
> > > > > bytes so that correct result can be returned in all circumstances.
> > > > > 
> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > 
> > > > The patch is ok, but I'd like to clarify the commit log.
> > > 
> > > Thanks for the review.
> > > 
> > > > If I understand correctly, what happens is:
> > > > - tag is set to a value that is not a multiple of 4 bytes
> > > 
> > > It's not about the mount_tag value, but the length of the mount_tag is
> > > 4.
> > > 
> > > > - guest attempts to read the last 4 bytes of the tag
> > > 
> > > Yep. So the config space of a 9pfs looks like the following:
> > > 
> > > offset: 0x14, size: 2 bytes indicating the length of the following
> > > mount_tag offset: 0x16, size: value of (offset 0x14).
> > > 
> > > When a 4-byte mount_tag is given, guest software is subject to read 4
> > > bytes (value read from offset 0x14) at offset 0x16.
> > 
> > Well looking at Linux guest code:
> > 
> > 
> > static inline void __virtio_cread_many(struct virtio_device *vdev,
> > 
> >                                        unsigned int offset,
> >                                        void *buf, size_t count, size_t
> >                                        bytes)
> > 
> > {
> > 
> >         u32 old, gen = vdev->config->generation ?
> >         
> >                 vdev->config->generation(vdev) : 0;
> >         
> >         int i;
> >         
> >         might_sleep();
> >         do {
> >         
> >                 old = gen;
> >                 
> >                 for (i = 0; i < count; i++)
> >                 
> >                         vdev->config->get(vdev, offset + bytes * i,
> >                         
> >                                           buf + i * bytes, bytes);
> >                 
> >                 gen = vdev->config->generation ?
> >                 
> >                         vdev->config->generation(vdev) : 0;
> >         
> >         } while (gen != old);
> > 
> > }
> > 
> > 
> > 
> > static inline void virtio_cread_bytes(struct virtio_device *vdev,
> > 
> >                                       unsigned int offset,
> >                                       void *buf, size_t len)
> > 
> > {
> > 
> >         __virtio_cread_many(vdev, offset, buf, len, 1);
> > 
> > }
> > 
> > and:
> >         virtio_cread_bytes(vdev, offsetof(struct virtio_9p_config, tag),
> >         
> >                            tag, tag_len);
> > 
> > So guest is doing multiple 1-byte reads.
> 
> Correct.
> 
> > Spec actually says:
> >         For device configuration access, the driver MUST use 8-bit wide
> >         accesses for 8-bit wide fields, 16-bit wide
> >         
> >         and aligned accesses for 16-bit wide fields and 32-bit wide and
> >         aligned accesses for 32-bit and 64-bit wide
> >         
> >         fields. For 64-bit fields, the driver MAY access each of the high
> >         and low 32-bit parts of the field independently.
> Yes.
> 
> > 9p was never standardized, but the linux header at least lists it as
> > follows:
> > 
> > struct virtio_9p_config {
> > 
> >         /* length of the tag name */
> >         __virtio16 tag_len;
> >         /* non-NULL terminated tag name */
> >         __u8 tag[0];
> > 
> > } __attribute__((packed));
> > 
> > In that sense tag is an 8 byte field.
> > 
> > So which guest reads tag using a 32 bit read, and why?
> 
> The obvious fix can be made to the guest which exposed this issue, but
> I was wondering whether we should enforce all virtio devices' config
> space size to be a multiple of 4 bytes which sounds more natural.
> 
> Regards,
> Bin

Personally I am not opposed for this to be addressed in qemu, but Michael 
should decide that.

But even if it would be addressed in qemu, I still think this would better be 
addressed on virtio side, not on virtio user side (9pfs, etc.), because that's 
a virtio implementation detail that might change in future.

What I definitely don't want to see though, is this alignment issue being 
handled with a hard coded value on user (9pfs) side as this patch does right 
now. Because that smells like it would be overseen if something changes on 
virtio side one day.

Best regards,
Christian Schoenebeck



