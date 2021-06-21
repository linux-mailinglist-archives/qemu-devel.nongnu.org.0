Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5571E3AE4FA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:33:40 +0200 (CEST)
Received: from localhost ([::1]:55458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFNC-0005Sy-Uc
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvFLy-0004fP-Cx
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvFLw-0001wz-81
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624264339;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3n2XdVHYIzNHQxxfr7H/f/G8PA78kyswJrJ6ws06jbc=;
 b=eWeg7miXRYQ03UqOcd6JSxCgc2DcNHZ6Pn0YQ4McVMcewDRsGLOZUokxJ/9+oxBfNUgZcZ
 6xi7oDoGn33kQ73Y12kn7xL7EtzQSyk+91P+kQuu6PMv5HVYO5DziB2s9k3U8pctFYQNhF
 8FwRwAZZEsfl1O6zn92z2txcaGTYypI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-tPtlQ-oxMpmchPL0Njaiyg-1; Mon, 21 Jun 2021 04:32:15 -0400
X-MC-Unique: tPtlQ-oxMpmchPL0Njaiyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C64C1018723;
 Mon, 21 Jun 2021 08:32:14 +0000 (UTC)
Received: from redhat.com (ovpn-114-109.ams2.redhat.com [10.36.114.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B36F5FC08;
 Mon, 21 Jun 2021 08:32:12 +0000 (UTC)
Date: Mon, 21 Jun 2021 09:32:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ilya Dryomov <idryomov@gmail.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
Message-ID: <YNBOiU8xPhDO3zae@redhat.com>
References: <20210617160520.3694358-1-oro@il.ibm.com>
 <CAOi1vP8JJiupdBCQsfN=KK8j1Q2Bnu059vXS0a1M53QsgY+OFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOi1vP8JJiupdBCQsfN=KK8j1Q2Bnu059vXS0a1M53QsgY+OFQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, Jun 19, 2021 at 09:44:32PM +0200, Ilya Dryomov wrote:
> On Thu, Jun 17, 2021 at 6:05 PM Or Ozeri <oro@il.ibm.com> wrote:
> >
> > Starting from ceph Pacific, RBD has built-in support for image-level encryption.
> > Currently supported formats are LUKS version 1 and 2.
> >
> > There are 2 new relevant librbd APIs for controlling encryption, both expect an
> > open image context:
> >
> > rbd_encryption_format: formats an image (i.e. writes the LUKS header)
> > rbd_encryption_load: loads encryptor/decryptor to the image IO stack
> >
> > This commit extends the qemu rbd driver API to support the above.
> >
> > Signed-off-by: Or Ozeri <oro@il.ibm.com>
> > ---
> >  block/raw-format.c   |   7 +
> >  block/rbd.c          | 371 ++++++++++++++++++++++++++++++++++++++++++-
> >  qapi/block-core.json | 110 ++++++++++++-
> >  3 files changed, 482 insertions(+), 6 deletions(-)


> > diff --git a/block/rbd.c b/block/rbd.c
> > index f098a89c7b..183b17cd84 100644
> > --- a/block/rbd.c
> > +++ b/block/rbd.c
> > @@ -73,6 +73,18 @@
> >  #define LIBRBD_USE_IOVEC 0
> >  #endif
> >
> > +#define RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN 8
> > +
> > +static const char rbd_luks_header_verification[
> > +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
> > +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 1
> > +};
> > +
> > +static const char rbd_luks2_header_verification[
> > +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
> > +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2
> > +};
> > +
> >  typedef enum {
> >      RBD_AIO_READ,
> >      RBD_AIO_WRITE,
> > @@ -341,6 +353,206 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
> >      }
> >  }
> >
> > +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> > +static int qemu_rbd_convert_luks_options(
> > +        RbdEncryptionOptionsLUKSBase *luks_opts,
> > +        char **passphrase,
> > +        Error **errp)
> > +{
> > +    int r = 0;
> > +
> > +    if (!luks_opts->has_key_secret) {
> > +        r = -EINVAL;
> > +        error_setg_errno(errp, -r, "missing encrypt.key-secret");
> > +        return r;
> > +    }
> 
> Why is key-secret optional?

It doesn't look like it is handled correctly here, but we need to
be able to run 'qemu-img info <volume>' and get information back
on the size of the image, and whether or not it is encrypted,
without having to supply a passphrase upfront. So it is right that
key-secret be optional, but also we shouldn't return an fatal
error like this.

Only if BDRV_O_NO_IO is NOT set, should this error be reported




> >  static int64_t qemu_rbd_getlength(BlockDriverState *bs)
> >  {
> >      BDRVRBDState *s = bs->opaque;
> > @@ -1243,6 +1589,22 @@ static QemuOptsList qemu_rbd_create_opts = {
> >              .type = QEMU_OPT_STRING,
> >              .help = "ID of secret providing the password",
> >          },
> > +        {
> > +            .name = "encrypt.format",
> > +            .type = QEMU_OPT_STRING,
> > +            .help = "Encrypt the image, format choices: 'luks', 'luks2'",
> 
> I think it should be "luks1" and "luks2" to match rbd/librbd.h and
> "rbd encryption format" command.

No, it should stay "luks" not "luks1", to match the existing QEMU
terminology for its LUKS v1 encryption support.


> > @@ -3609,6 +3622,94 @@
> >  { 'enum': 'RbdAuthMode',
> >    'data': [ 'cephx', 'none' ] }
> >
> > +##
> > +# @RbdImageEncryptionFormat:
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'enum': 'RbdImageEncryptionFormat',
> > +  'data': [ 'luks', 'luks2' ] }
> 
> Ditto -- "luks1" and "luks2".

No, the patch is correct as is.

> > +# @RbdEncryptionOptionsLUKSBase:
> > +#
> > +# @key-secret: ID of a QCryptoSecret object providing a passphrase
> > +#              for unlocking the encryption
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'RbdEncryptionOptionsLUKSBase',
> > +  'data': { '*key-secret': 'str' }}
> 
> When would we not need a passphrase?  I think it should be required.

When running 'qemu-img info'

> > +##
> > +# @RbdEncryptionCreateOptionsLUKSBase:
> > +#
> > +# @cipher-alg: The encryption algorithm
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'RbdEncryptionCreateOptionsLUKSBase',
> > +  'base': 'RbdEncryptionOptionsLUKSBase',
> > +  'data': { '*cipher-alg': 'QCryptoCipherAlgorithm'}}
> 
> Why QCryptoCipherAlgorithm instead of just enumerating the two
> algorithms that librbd supports?  An early failure when parsing
> seems better than failing in qemu_rbd_convert_luks_create_options()
> and having to clean up the newly created image.

We don't want to duplicate algorithm names that already have
a defined enum data type.

> 
> > +
> > +##
> > +# @RbdEncryptionOptionsLUKS:
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'RbdEncryptionOptionsLUKS',
> > +  'base': 'RbdEncryptionOptionsLUKSBase',
> > +  'data': {}}
> > +
> > +##
> > +# @RbdEncryptionOptionsLUKS2:
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'RbdEncryptionOptionsLUKS2',
> > +  'base': 'RbdEncryptionOptionsLUKSBase',
> > +  'data': {}}
> > +
> > +##
> > +# @RbdEncryptionCreateOptionsLUKS:
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'RbdEncryptionCreateOptionsLUKS',
> > +  'base': 'RbdEncryptionCreateOptionsLUKSBase',
> > +  'data': {}}
> > +
> > +##
> > +# @RbdEncryptionCreateOptionsLUKS2:
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'RbdEncryptionCreateOptionsLUKS2',
> > +  'base': 'RbdEncryptionCreateOptionsLUKSBase',
> > +  'data': {}}
> 
> This appears over-engineered to me.  A three-deep hierarchy for
> a structure with two fields (key-secret and cipher-alg) seems like
> it could be simplified.
> 
> Why differentiate between luks1 and luks2 if the fields are exactly
> the same?  Do you expect one of these empty derived structures to be
> extended in the future?

The current QEMU luks driver already supports alot more options
for creation than this, so it is conceivable we'll need more
here in future. Also LUKSv2 has many more features than v1, so
I wouldn't be surprised if the structs diverge eventually.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


