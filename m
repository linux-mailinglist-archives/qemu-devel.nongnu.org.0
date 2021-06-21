Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5B93AE7DC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:05:12 +0200 (CEST)
Received: from localhost ([::1]:38396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHjr-0002Hd-Gn
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lvHej-0006YI-Bj; Mon, 21 Jun 2021 06:59:53 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lvHeh-0000Vi-7P; Mon, 21 Jun 2021 06:59:53 -0400
Received: by mail-il1-x132.google.com with SMTP id q9so1197375ilj.3;
 Mon, 21 Jun 2021 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=65iCn+N656h8Vx86+QqtTLVCiYd6/kCbOhX1W6bKJyk=;
 b=mnBdvoCRhrNXj6B7Iyz6flWVhR0OkiFvgvry6+mVATxdlLqmiqfflZfDF/DqJ91Say
 dXunMjIOue/TencLrjnZbFpFitwHetYDPaEucxz9Ay4txjqvQo3FUU8bitFPagIc0Cp4
 UxHv1KBXTsU6O/xcgZAZGn0W3d5Ttb3K0txd6lvaVY4KvJb4+dM8g5fYNQx8p+lNRjew
 xUi/9oOgyxIs2WLH5C7mc0KcxsTXAyY3VKeSecs4UgINOIdkmMUuzpl7+rsXVCBIIOm3
 xBKuwn/PRx39TxYWw5P3O9J8w1GQJu7RYhdmh23wNyIeTh2GJlOjoWuZVa5jVeOe7ALm
 JuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=65iCn+N656h8Vx86+QqtTLVCiYd6/kCbOhX1W6bKJyk=;
 b=Lk3GBmayIsEDobjMEvSCfLwd9ZYHbMRHpPopDlZJZ7fhC+ruLuhol8Twj26zZV72mB
 QkKGeiFYwrvk71mRnd8e1Yjho5sp3XpcM1he/yS7KdgkayZzFSNaiZF+pCz9uOgBleYC
 0RL5B5DeA4dQbTNiikVOy9fKroaKIfcLE8EgkvgBqLweesMQzdPKgk7xhc15uSI+8Ihq
 GvLVoMgb+z1h2yplfrJxeaAKEVX/juCcQBzZhILmhITqNws3JbvoNykwxPVQLOdAsUOq
 t7PdM12GZ95V4UqSMlMISjh8ObJSZyAylbKQdJvgpxxSUkF2x53n+pSHfJLy6zGmreI8
 +8Ug==
X-Gm-Message-State: AOAM5305mXPJM0EtN8FOWuUaP2I7rrQn5k1V5FKtcEjvgkNKJdkf0d2f
 qxWrnpxVC0gcFDpQOtByid/9+VmqyviSADGcT/M=
X-Google-Smtp-Source: ABdhPJyu+nHbf2ozzLjBHs8Wfn8VXFsrnQyYWXxLiZwtxE6DfDitSMd6We6+ggbyE52cqDv+MVJysTOUq2w8cvI/Xg0=
X-Received: by 2002:a05:6e02:1906:: with SMTP id
 w6mr2744086ilu.281.1624273189243; 
 Mon, 21 Jun 2021 03:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210617160520.3694358-1-oro@il.ibm.com>
 <CAOi1vP8JJiupdBCQsfN=KK8j1Q2Bnu059vXS0a1M53QsgY+OFQ@mail.gmail.com>
 <YNBOiU8xPhDO3zae@redhat.com>
In-Reply-To: <YNBOiU8xPhDO3zae@redhat.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 21 Jun 2021 12:59:37 +0200
Message-ID: <CAOi1vP8LROnu1_dE28JU17gbOjQW8MiB8L-65Pt0ZWPMZucUUg@mail.gmail.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=idryomov@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Mykola Golub <to.my.trociny@gmail.com>, Or Ozeri <oro@il.ibm.com>,
 Danny Harnik <dannyh@il.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 10:32 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Sat, Jun 19, 2021 at 09:44:32PM +0200, Ilya Dryomov wrote:
> > On Thu, Jun 17, 2021 at 6:05 PM Or Ozeri <oro@il.ibm.com> wrote:
> > >
> > > Starting from ceph Pacific, RBD has built-in support for image-level =
encryption.
> > > Currently supported formats are LUKS version 1 and 2.
> > >
> > > There are 2 new relevant librbd APIs for controlling encryption, both=
 expect an
> > > open image context:
> > >
> > > rbd_encryption_format: formats an image (i.e. writes the LUKS header)
> > > rbd_encryption_load: loads encryptor/decryptor to the image IO stack
> > >
> > > This commit extends the qemu rbd driver API to support the above.
> > >
> > > Signed-off-by: Or Ozeri <oro@il.ibm.com>
> > > ---
> > >  block/raw-format.c   |   7 +
> > >  block/rbd.c          | 371 +++++++++++++++++++++++++++++++++++++++++=
+-
> > >  qapi/block-core.json | 110 ++++++++++++-
> > >  3 files changed, 482 insertions(+), 6 deletions(-)
>
>
> > > diff --git a/block/rbd.c b/block/rbd.c
> > > index f098a89c7b..183b17cd84 100644
> > > --- a/block/rbd.c
> > > +++ b/block/rbd.c
> > > @@ -73,6 +73,18 @@
> > >  #define LIBRBD_USE_IOVEC 0
> > >  #endif
> > >
> > > +#define RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN 8
> > > +
> > > +static const char rbd_luks_header_verification[
> > > +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] =3D {
> > > +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 1
> > > +};
> > > +
> > > +static const char rbd_luks2_header_verification[
> > > +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] =3D {
> > > +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2
> > > +};
> > > +
> > >  typedef enum {
> > >      RBD_AIO_READ,
> > >      RBD_AIO_WRITE,
> > > @@ -341,6 +353,206 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64=
_t offs)
> > >      }
> > >  }
> > >
> > > +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> > > +static int qemu_rbd_convert_luks_options(
> > > +        RbdEncryptionOptionsLUKSBase *luks_opts,
> > > +        char **passphrase,
> > > +        Error **errp)
> > > +{
> > > +    int r =3D 0;
> > > +
> > > +    if (!luks_opts->has_key_secret) {
> > > +        r =3D -EINVAL;
> > > +        error_setg_errno(errp, -r, "missing encrypt.key-secret");
> > > +        return r;
> > > +    }
> >
> > Why is key-secret optional?
>
> It doesn't look like it is handled correctly here, but we need to
> be able to run 'qemu-img info <volume>' and get information back
> on the size of the image, and whether or not it is encrypted,
> without having to supply a passphrase upfront. So it is right that
> key-secret be optional, but also we shouldn't return an fatal
> error like this.

Hi Daniel,

The key-secret lives inside RbdEncryptionOptions (or
RbdEncryptionCreateOptions) which are already optional:

    '*encrypt': 'RbdEncryptionOptions'

    '*encrypt' :        'RbdEncryptionCreateOptions'

The image is opened as usual and then, if "encrypt" is specified,
the encryption profile is loaded (or created and laid down).  It does
not make sense to attempt to load or create the encryption profile
without the passphrase -- it would always fail.

"qemu-img info" can get the size, etc without loading the encryption
profile (i.e. ->bdrv_get_info and ->bdrv_get_specific_info don't need
it).  But note that once the encryption profile is loaded, the size
changes because librbd subtracts the LUKS header overhead.  So

    $ qemu-img info --image-opts driver=3Drbd,pool=3Dfoo,image=3Dbar

and

    $ qemu-img info --object secret,file=3Dpassphrase.txt,id=3Dsec0
--image-opts driver=3Drbd,pool=3Dfoo,image=3Dbar,encrypt.format=3Dluks2,enc=
rypt.key-secret=3Dsec0

would give different results.

>
> Only if BDRV_O_NO_IO is NOT set, should this error be reported
>
>
>
>
> > >  static int64_t qemu_rbd_getlength(BlockDriverState *bs)
> > >  {
> > >      BDRVRBDState *s =3D bs->opaque;
> > > @@ -1243,6 +1589,22 @@ static QemuOptsList qemu_rbd_create_opts =3D {
> > >              .type =3D QEMU_OPT_STRING,
> > >              .help =3D "ID of secret providing the password",
> > >          },
> > > +        {
> > > +            .name =3D "encrypt.format",
> > > +            .type =3D QEMU_OPT_STRING,
> > > +            .help =3D "Encrypt the image, format choices: 'luks', 'l=
uks2'",
> >
> > I think it should be "luks1" and "luks2" to match rbd/librbd.h and
> > "rbd encryption format" command.
>
> No, it should stay "luks" not "luks1", to match the existing QEMU
> terminology for its LUKS v1 encryption support.

If you insist on following the QEMU nomenclature here it's fine with
me but I want to point out that encryption-formatted clones won't be
interoperable with QEMU LUKS driver or dm-crypt so making the names
match QEMU instead of librbd and rbd CLI seems a bit misleading.

>
>
> > > @@ -3609,6 +3622,94 @@
> > >  { 'enum': 'RbdAuthMode',
> > >    'data': [ 'cephx', 'none' ] }
> > >
> > > +##
> > > +# @RbdImageEncryptionFormat:
> > > +#
> > > +# Since: 6.1
> > > +##
> > > +{ 'enum': 'RbdImageEncryptionFormat',
> > > +  'data': [ 'luks', 'luks2' ] }
> >
> > Ditto -- "luks1" and "luks2".
>
> No, the patch is correct as is.
>
> > > +# @RbdEncryptionOptionsLUKSBase:
> > > +#
> > > +# @key-secret: ID of a QCryptoSecret object providing a passphrase
> > > +#              for unlocking the encryption
> > > +#
> > > +# Since: 6.1
> > > +##
> > > +{ 'struct': 'RbdEncryptionOptionsLUKSBase',
> > > +  'data': { '*key-secret': 'str' }}
> >
> > When would we not need a passphrase?  I think it should be required.
>
> When running 'qemu-img info'
>
> > > +##
> > > +# @RbdEncryptionCreateOptionsLUKSBase:
> > > +#
> > > +# @cipher-alg: The encryption algorithm
> > > +#
> > > +# Since: 6.1
> > > +##
> > > +{ 'struct': 'RbdEncryptionCreateOptionsLUKSBase',
> > > +  'base': 'RbdEncryptionOptionsLUKSBase',
> > > +  'data': { '*cipher-alg': 'QCryptoCipherAlgorithm'}}
> >
> > Why QCryptoCipherAlgorithm instead of just enumerating the two
> > algorithms that librbd supports?  An early failure when parsing
> > seems better than failing in qemu_rbd_convert_luks_create_options()
> > and having to clean up the newly created image.
>
> We don't want to duplicate algorithm names that already have
> a defined enum data type.

Did you see my other comment on this?  Quoting it just in case:

    > ... QCryptoCipherAlgorithm is a set of 12 algorithms of
    > which librbd supports only two.  On top of that, e.g. "aes-256" for
    > librbd really means "aes-256" + "xts" + "plain64" -- it bundles
    > QCryptoCipherAlgorithm, QCryptoCipherMode and QCryptoIVGenAlgorithm
    > with the latter two being hard-coded.

This is not a big deal, but I just don't see how confusing everyone
who introspects the QAPI into thinking that all these algorithms are
supported (and forgoing an early parsing failure as a side effect) is
worth avoiding a trivial [ 'aes-128', 'aes-256' ] definition here.

Thanks,

                Ilya

