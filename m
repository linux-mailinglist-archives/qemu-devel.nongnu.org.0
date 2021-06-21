Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90953AE7E3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:06:50 +0200 (CEST)
Received: from localhost ([::1]:42328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHlR-00056S-C9
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvHjD-0002QJ-L8
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvHj9-0003f1-F4
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624273466;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPcpqYDShHdM/5AYxZHL29RgxflBsD88Q1WsdY9Dnwk=;
 b=TzUx0eq+p6AVbBs4ALyH5A77E1sisr3sLQMdVSft61AR22ssgvNR5Ngp4L8IC31Q4JhxJf
 naf4tranxPrBxLw55GIyoznGX/Zhgp9jzmetyTZ8ZkVCQLqHM+ph43Ol9AlxL838zPHfEs
 MeESqd6iHNkhccU9yOvTxi6IDeWQkds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-Jwr3bEIiMum0nDQNv7Qv3g-1; Mon, 21 Jun 2021 07:04:14 -0400
X-MC-Unique: Jwr3bEIiMum0nDQNv7Qv3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34994802C8A;
 Mon, 21 Jun 2021 11:04:13 +0000 (UTC)
Received: from redhat.com (ovpn-114-109.ams2.redhat.com [10.36.114.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0945B5D9CA;
 Mon, 21 Jun 2021 11:04:10 +0000 (UTC)
Date: Mon, 21 Jun 2021 12:04:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ilya Dryomov <idryomov@gmail.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
Message-ID: <YNByJ13sZxM9cv4s@redhat.com>
References: <20210617160520.3694358-1-oro@il.ibm.com>
 <CAOi1vP8JJiupdBCQsfN=KK8j1Q2Bnu059vXS0a1M53QsgY+OFQ@mail.gmail.com>
 <YNBOiU8xPhDO3zae@redhat.com>
 <CAOi1vP8LROnu1_dE28JU17gbOjQW8MiB8L-65Pt0ZWPMZucUUg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOi1vP8LROnu1_dE28JU17gbOjQW8MiB8L-65Pt0ZWPMZucUUg@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Mykola Golub <to.my.trociny@gmail.com>, Or Ozeri <oro@il.ibm.com>,
 Danny Harnik <dannyh@il.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 12:59:37PM +0200, Ilya Dryomov wrote:
> On Mon, Jun 21, 2021 at 10:32 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Sat, Jun 19, 2021 at 09:44:32PM +0200, Ilya Dryomov wrote:
> > > On Thu, Jun 17, 2021 at 6:05 PM Or Ozeri <oro@il.ibm.com> wrote:
> > > >
> > > > Starting from ceph Pacific, RBD has built-in support for image-level encryption.
> > > > Currently supported formats are LUKS version 1 and 2.
> > > >
> > > > There are 2 new relevant librbd APIs for controlling encryption, both expect an
> > > > open image context:
> > > >
> > > > rbd_encryption_format: formats an image (i.e. writes the LUKS header)
> > > > rbd_encryption_load: loads encryptor/decryptor to the image IO stack
> > > >
> > > > This commit extends the qemu rbd driver API to support the above.
> > > >
> > > > Signed-off-by: Or Ozeri <oro@il.ibm.com>
> > > > ---
> > > >  block/raw-format.c   |   7 +
> > > >  block/rbd.c          | 371 ++++++++++++++++++++++++++++++++++++++++++-
> > > >  qapi/block-core.json | 110 ++++++++++++-
> > > >  3 files changed, 482 insertions(+), 6 deletions(-)
> >
> >
> > > > diff --git a/block/rbd.c b/block/rbd.c
> > > > index f098a89c7b..183b17cd84 100644
> > > > --- a/block/rbd.c
> > > > +++ b/block/rbd.c
> > > > @@ -73,6 +73,18 @@
> > > >  #define LIBRBD_USE_IOVEC 0
> > > >  #endif
> > > >
> > > > +#define RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN 8
> > > > +
> > > > +static const char rbd_luks_header_verification[
> > > > +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
> > > > +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 1
> > > > +};
> > > > +
> > > > +static const char rbd_luks2_header_verification[
> > > > +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
> > > > +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2
> > > > +};
> > > > +
> > > >  typedef enum {
> > > >      RBD_AIO_READ,
> > > >      RBD_AIO_WRITE,
> > > > @@ -341,6 +353,206 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
> > > >      }
> > > >  }
> > > >
> > > > +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> > > > +static int qemu_rbd_convert_luks_options(
> > > > +        RbdEncryptionOptionsLUKSBase *luks_opts,
> > > > +        char **passphrase,
> > > > +        Error **errp)
> > > > +{
> > > > +    int r = 0;
> > > > +
> > > > +    if (!luks_opts->has_key_secret) {
> > > > +        r = -EINVAL;
> > > > +        error_setg_errno(errp, -r, "missing encrypt.key-secret");
> > > > +        return r;
> > > > +    }
> > >
> > > Why is key-secret optional?
> >
> > It doesn't look like it is handled correctly here, but we need to
> > be able to run 'qemu-img info <volume>' and get information back
> > on the size of the image, and whether or not it is encrypted,
> > without having to supply a passphrase upfront. So it is right that
> > key-secret be optional, but also we shouldn't return an fatal
> > error like this.
> 
> Hi Daniel,
> 
> The key-secret lives inside RbdEncryptionOptions (or
> RbdEncryptionCreateOptions) which are already optional:
> 
>     '*encrypt': 'RbdEncryptionOptions'
> 
>     '*encrypt' :        'RbdEncryptionCreateOptions'
> 
> The image is opened as usual and then, if "encrypt" is specified,
> the encryption profile is loaded (or created and laid down).  It does
> not make sense to attempt to load or create the encryption profile
> without the passphrase -- it would always fail.

Ah, that sounds like it is probably ok then.


> > Only if BDRV_O_NO_IO is NOT set, should this error be reported
> >
> >
> >
> >
> > > >  static int64_t qemu_rbd_getlength(BlockDriverState *bs)
> > > >  {
> > > >      BDRVRBDState *s = bs->opaque;
> > > > @@ -1243,6 +1589,22 @@ static QemuOptsList qemu_rbd_create_opts = {
> > > >              .type = QEMU_OPT_STRING,
> > > >              .help = "ID of secret providing the password",
> > > >          },
> > > > +        {
> > > > +            .name = "encrypt.format",
> > > > +            .type = QEMU_OPT_STRING,
> > > > +            .help = "Encrypt the image, format choices: 'luks', 'luks2'",
> > >
> > > I think it should be "luks1" and "luks2" to match rbd/librbd.h and
> > > "rbd encryption format" command.
> >
> > No, it should stay "luks" not "luks1", to match the existing QEMU
> > terminology for its LUKS v1 encryption support.
> 
> If you insist on following the QEMU nomenclature here it's fine with
> me but I want to point out that encryption-formatted clones won't be
> interoperable with QEMU LUKS driver or dm-crypt so making the names
> match QEMU instead of librbd and rbd CLI seems a bit misleading.

In what way is it not interoperable ?

If we don't specify any 'encrypt' option, does the guest see the
raw LUKS header + payload, or is the header completely hidden
and only ever accessible RBD ?


> > > > +##
> > > > +# @RbdEncryptionCreateOptionsLUKSBase:
> > > > +#
> > > > +# @cipher-alg: The encryption algorithm
> > > > +#
> > > > +# Since: 6.1
> > > > +##
> > > > +{ 'struct': 'RbdEncryptionCreateOptionsLUKSBase',
> > > > +  'base': 'RbdEncryptionOptionsLUKSBase',
> > > > +  'data': { '*cipher-alg': 'QCryptoCipherAlgorithm'}}
> > >
> > > Why QCryptoCipherAlgorithm instead of just enumerating the two
> > > algorithms that librbd supports?  An early failure when parsing
> > > seems better than failing in qemu_rbd_convert_luks_create_options()
> > > and having to clean up the newly created image.
> >
> > We don't want to duplicate algorithm names that already have
> > a defined enum data type.
> 
> Did you see my other comment on this?  Quoting it just in case:
> 
>     > ... QCryptoCipherAlgorithm is a set of 12 algorithms of
>     > which librbd supports only two.  On top of that, e.g. "aes-256" for
>     > librbd really means "aes-256" + "xts" + "plain64" -- it bundles
>     > QCryptoCipherAlgorithm, QCryptoCipherMode and QCryptoIVGenAlgorithm
>     > with the latter two being hard-coded.
> 
> This is not a big deal, but I just don't see how confusing everyone
> who introspects the QAPI into thinking that all these algorithms are
> supported (and forgoing an early parsing failure as a side effect) is
> worth avoiding a trivial [ 'aes-128', 'aes-256' ] definition here.

Even for the existing LUKS code in QEMU there is no guarantee that the
impl supports all the ciphers listed in the enum. You can't rely on the
introspection to that degree.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


