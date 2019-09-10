Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDC3AED33
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 16:37:34 +0200 (CEST)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7hGv-0001go-GW
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 10:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i7hFY-0000os-27
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:36:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i7hFW-0000yR-3t
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:36:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31347)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i7hFQ-0000uK-To; Tue, 10 Sep 2019 10:36:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9395E30A7B8F;
 Tue, 10 Sep 2019 14:35:59 +0000 (UTC)
Received: from dhcp-4-67.tlv.redhat.com (dhcp-4-67.tlv.redhat.com [10.35.4.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09CC9100194E;
 Tue, 10 Sep 2019 14:35:56 +0000 (UTC)
Message-ID: <0d1bbda1fccb296746b5df3d5bde3ee9443a07b8.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Date: Tue, 10 Sep 2019 17:35:55 +0300
In-Reply-To: <a21dc942-404c-6fc5-08c5-88be1d01508b@virtuozzo.com>
References: <20190906195750.17651-1-mlevitsk@redhat.com>
 <20190906195750.17651-2-mlevitsk@redhat.com>
 <7634baef-f42f-4603-2ec9-3f4aa6cfe278@virtuozzo.com>
 <dd0b472186f651823a3ba7a74111a8361235109a.camel@redhat.com>
 <a21dc942-404c-6fc5-08c5-88be1d01508b@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 10 Sep 2019 14:35:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/3] block/qcow2: refactoring of
 threaded encryption code
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P . =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2019-09-10 at 14:17 +0000, Vladimir Sementsov-Ogievskiy wrote:
> 10.09.2019 15:31, Maxim Levitsky wrote:
> > On Sat, 2019-09-07 at 19:08 +0000, Vladimir Sementsov-Ogievskiy wrote:
> > > 06.09.2019 22:57, Maxim Levitsky wrote:
> > > > This commit tries to clarify few function arguments,
> > > > and add comments describing the encrypt/decrypt interface
> > > > 
> > > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > > ---
> > > >    block/qcow2-cluster.c | 10 +++----
> > > >    block/qcow2-threads.c | 61 ++++++++++++++++++++++++++++++++++---------
> > > >    2 files changed, 53 insertions(+), 18 deletions(-)
> > > > 
> > > > diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
> > > > index f09cc992af..1989b423da 100644
> > > > --- a/block/qcow2-cluster.c
> > > > +++ b/block/qcow2-cluster.c
> > > > @@ -463,8 +463,8 @@ static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
> > > >    }
> > > >    
> > > >    static bool coroutine_fn do_perform_cow_encrypt(BlockDriverState *bs,
> > > > -                                                uint64_t src_cluster_offset,
> > > > -                                                uint64_t cluster_offset,
> > > > +                                                uint64_t guest_cluster_offset,
> > > > +                                                uint64_t host_cluster_offset,
> > > >                                                    unsigned offset_in_cluster,
> > > >                                                    uint8_t *buffer,
> > > >                                                    unsigned bytes)
> > > > @@ -474,8 +474,8 @@ static bool coroutine_fn do_perform_cow_encrypt(BlockDriverState *bs,
> > > >            assert((offset_in_cluster & ~BDRV_SECTOR_MASK) == 0);
> > > >            assert((bytes & ~BDRV_SECTOR_MASK) == 0);
> > > >            assert(s->crypto);
> > > > -        if (qcow2_co_encrypt(bs, cluster_offset,
> > > > -                             src_cluster_offset + offset_in_cluster,
> > > > +        if (qcow2_co_encrypt(bs, host_cluster_offset,
> > > > +                             guest_cluster_offset + offset_in_cluster,
> > > >                                 buffer, bytes) < 0) {
> > > >                return false;
> > > >            }
> > > > @@ -496,7 +496,7 @@ static int coroutine_fn do_perform_cow_write(BlockDriverState *bs,
> > > >        }
> > > >    
> > > >        ret = qcow2_pre_write_overlap_check(bs, 0,
> > > > -            cluster_offset + offset_in_cluster, qiov->size, true);
> > > > +              cluster_offset + offset_in_cluster, qiov->size, true);
> > > 
> > > 
> > > Hmm, unrelated hunk.
> > 
> > I was asked to do this to fix coding style, so that wrapped line,
> > is 4 characters shifted to the right.
> 
> AFAIS, Eric asked only about qcow2_co_encdec calls and definition.. It's OK to fix style in code
> you touch in you patch anyway, but no reason to fix style somewhere else, it dirties patch for
> no reason, making it more difficult (a bit, but still) to review and more difficult to backport..
All right, then I'll drop that change. I kind of agree with this, but I also didn't mind doing these fixes
either.

> 
> > 
> > > 
> > > >        if (ret < 0) {
> > > >            return ret;
> > > >        }
> > > > diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
> > > > index 3b1e63fe41..c3cda0c6a5 100644
> > > > --- a/block/qcow2-threads.c
> > > > +++ b/block/qcow2-threads.c
> > > > @@ -234,15 +234,19 @@ static int qcow2_encdec_pool_func(void *opaque)
> > > >    }
> > > >    
> > > >    static int coroutine_fn
> > > > -qcow2_co_encdec(BlockDriverState *bs, uint64_t file_cluster_offset,
> > > > -                  uint64_t offset, void *buf, size_t len, Qcow2EncDecFunc func)
> > > > +qcow2_co_encdec(BlockDriverState *bs, uint64_t host_cluster_offset,
> > > > +                uint64_t guest_offset, void *buf, size_t len,
> > > > +                Qcow2EncDecFunc func)
> > > >    {
> > > >        BDRVQcow2State *s = bs->opaque;
> > > > +
> > > > +    uint64_t offset = s->crypt_physical_offset ?
> > > > +        host_cluster_offset + offset_into_cluster(s, guest_offset) :
> > > > +        guest_offset;
> > > > +
> > > >        Qcow2EncDecData arg = {
> > > >            .block = s->crypto,
> > > > -        .offset = s->crypt_physical_offset ?
> > > > -                      file_cluster_offset + offset_into_cluster(s, offset) :
> > > > -                      offset,
> > > > +        .offset = offset,
> > > >            .buf = buf,
> > > >            .len = len,
> > > >            .func = func,
> > > > @@ -251,18 +255,49 @@ qcow2_co_encdec(BlockDriverState *bs, uint64_t file_cluster_offset,
> > > >        return qcow2_co_process(bs, qcow2_encdec_pool_func, &arg);
> > > >    }
> > > >    
> > > > +
> > > > +/*
> > > > + * qcow2_co_encrypt()
> > > > + *
> > > > + * Encrypts one or more contiguous aligned sectors
> > > > + *
> > > > + * @host_cluster_offset - on disk offset of the first cluster in which
> > > > + * the encrypted data will be written
> > > 
> > > 
> > > It's not quite right, it's not on disk, but on .file child of qcow2 node, which
> > > may be any other format or protocol node.. So, I called it file_cluster_offset.
> > > But I'm OK with new naming anyway. And it may be better for encryption related
> > > logic..
> > 
> > Yes, the .file is the underlying storage for both qcow2 metadata and the data,
> > and it is unlikely be another qcow2 file. Usually it will be a raw file,
> > accessed with some protocol.
> > I will change the wording to not include the 'disk' word though.
> > 
> > 
> > To be really honest, the best naming here would be one that follows the virtual memory concepts.
> > A virtual block/cluster address and a physical block/cluster address.
> > However we talked with Kevin recently and I also studied quite a lot of qcow2 code,
> > and the usual convention is guest cluster offset and host cluster offset,
> > and often guest offsets are just called offsets, which is very confusing IMHO.
> 
> It don't confuse me, as it's an interface of block-layer. Interface user just writes at some offset.
> And the fact that internally, we consider interface parameter "offset" as "guest offset" and map it
> to some physical offset - it's an implementation details. In other words, guest don't know that it
> writes at "guest offset", it just writes at "offset" and don't care.
> 
> > 
> > 
> > > 
> > >   > + * Used as an initialization vector for encryption
> > > 
> > > Hmm, is it default now?
> > 
> > 
> > Most of block crypto implementations have IV which derive
> > some way or another from the sector address.
> > 
> >  From what I see, the block address is either used as is,
> > or encrypted itself with same encryption key,
> > and the result is used as IV. Even the legacy qcow
> > encryption uses this, although it uses the virtual block
> > address, and apparently this is one of its security flaws.
> > 
> > If you don't use any IV, you end up with major security
> > hole - sectors of the same content will be encrypted
> > to the same cipertext.
> > 
> > I added this comment to clarify the usage of offset,
> > since other that this aspect of IV generation,
> > the crypto routines only need the data to be encrypted and
> > the encryption key which is stored in the crypto context.
> > 
> > 
> > > 
> > > > + *
> > > > + * @guest_offset - guest (virtual) offset of the first sector of the
> > > > + * data to be encrypted
> > > 
> > > Hmm, stop. It's wrong. Data to be encrypted is in buffer, so, it's not first sector of
> > > the data to be encrypted, but first sector in which guest writes data (to be encrypted
> > > in meantime).
> > 
> > No no no!
> > 
> > guest_offset is literally the guest's disk address of the first sector that is in the buffer.
> > The qcow2_co_encrypt is called from 2 places:
> > 
> > 1. qcow2_co_pwritev_part - here indeed the actually guest written data
> > is encrypted, and the 'offset' is passed which is the offset on which pwritev was called
> 
> I mean, that in this case your comment for me sounds like "data to be encrypted is on disk, at this offset".
> but it's not actually on disk, data is in buffer. And what is on disk we don't know, we are going to
> write...
> 
> But I don't really care. Hope it's actually obvious for averyone, where is data on write path.

Ah, now I understand. I don't mind adding a word or two explicitly mentioning that the *data* to be
encrypted is in the given buffer.

> 
> > 
> > 
> > 2. do_perform_cow_encrypt - here the just read data from before or after actually written guest
> > data is encrypted, and the guest_offset represents the address of that data.
> > I changed the do_perform_cow_encrypt, so that it receives from the caller the host and guest offset
> > of the data to be encrypted. It then aligns the host offset on start of the cluster, and passes
> > the guest offset as is, so that it does the same as qcow2_co_pwritev_part.
> > 
> > 
> > So what is wrong here?
> > 
> > >   
> > > 
> > > > + * Used as an initialization vector for older, qcow2 native encryption
> > > > + *
> > > > + * @buf - buffer with the data to encrypt
> > > > + * @len - length of the buffer (in sector size multiplies)
> > > > + *
> > > > + * Note that the group of the sectors, don't have to be aligned
> > > > + * on cluster boundary and can also cross a cluster boundary.
> > > 
> > > And I doubt in it now. I'm afraid that if we call qcow2_co_encrypt for a group
> > > of the sectors crossing a cluster boundary, we will finish up with similar bug: we'll
> > > use first cluster offset as a vector for all the sectors. We still never do it.. So,
> > > I think it worth assertion and corresponding comment.
> > > 
> > > Or is it correct?
> > 
> > Crypto code receives the data to be encrypted and decrypted,
> > and offset of first sector (512 bytes aligned) of that data (for IV calculation).
> > If the data spans multiple sectors (this happens already a lot)
> 
> Ah, yes, that's OK, sorry.
> 
> > then it able to handle this since the code works.
> > The relevant code is in do_qcrypto_block_cipher_encdec, and
> > is actually generic for all the crypto modes.
> > 
> > So there should not be anything special about crossing the cluster
> > boundary, other that noting this here, just in case.
> > 
> > No only that code can cross a cluster boundary, but it can even be
> > called for more that one cluster at once. It looks like qcow2 code limits all
> > the IO in case crypto is used to QCOW_MAX_CRYPT_CLUSTERS, which is 32
> > currently. I don't know why to be honest.
> > 
> > Remember that crypto code has no notion of clusters. It works purely
> > on sector (512 bytes) level, and each sector will have its own IV calculated,
> > based on its sector address.
> > 
> > > 
> > > > + *
> > > > + *
> > > > + */
> > > >    int coroutine_fn
> > > > -qcow2_co_encrypt(BlockDriverState *bs, uint64_t file_cluster_offset,
> > > > -                 uint64_t offset, void *buf, size_t len)
> > > > +qcow2_co_encrypt(BlockDriverState *bs, uint64_t host_cluster_offset,
> > > > +                 uint64_t guest_offset, void *buf, size_t len)
> > > >    {
> > > > -    return qcow2_co_encdec(bs, file_cluster_offset, offset, buf, len,
> > > > -                             qcrypto_block_encrypt);
> > > > +    return qcow2_co_encdec(bs, host_cluster_offset, guest_offset, buf, len,
> > > > +                           qcrypto_block_encrypt);
> > > >    }
> > > >    
> > > > +
> > > > +/*
> > > > + * qcow2_co_decrypt()
> > > > + *
> > > > + * Decrypts one or more contiguous aligned sectors
> > > > + * Same function as qcow2_co_encrypt
> > > 
> > > Hmm, not exactly same :)
> > 
> > I'll fix that.
> > 
> > 
> > > 
> > > > + *
> > > > + */
> > > > +
> > > >    int coroutine_fn
> > > > -qcow2_co_decrypt(BlockDriverState *bs, uint64_t file_cluster_offset,
> > > > -                 uint64_t offset, void *buf, size_t len)
> > > > +qcow2_co_decrypt(BlockDriverState *bs, uint64_t host_cluster_offset,
> > > > +                 uint64_t guest_offset, void *buf, size_t len)
> > > >    {
> > > > -    return qcow2_co_encdec(bs, file_cluster_offset, offset, buf, len,
> > > > -                             qcrypto_block_decrypt);
> > > > +    return qcow2_co_encdec(bs, host_cluster_offset, guest_offset, buf, len,
> > > > +                           qcrypto_block_decrypt);
> > > >    }
> > > > 


Best regards,
	Maxim Levitsky



