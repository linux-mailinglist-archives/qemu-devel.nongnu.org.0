Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D91C2AC5
	for <lists+qemu-devel@lfdr.de>; Sun,  3 May 2020 10:56:37 +0200 (CEST)
Received: from localhost ([::1]:50700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVAQO-0005QJ-BT
	for lists+qemu-devel@lfdr.de; Sun, 03 May 2020 04:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jVAPc-0004vs-I8
 for qemu-devel@nongnu.org; Sun, 03 May 2020 04:55:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42182
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jVAPa-0002xK-9a
 for qemu-devel@nongnu.org; Sun, 03 May 2020 04:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588496144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jDaJJfAJ7qOrKQLVVAw0eEA097Vn2gCpAxyhBjZt6/k=;
 b=OpCq2+He4YNRqepYFqi/sS7vpaMUz0KveLtLc/vHGIgCEw4IEbkfQENGlUEMzw6G1066hP
 B69D34sm4poD9pBwnDzZvdgcPEMH13dagt2C8THQAZn/peQ5IOeuuRPhFKzozEtJhUgB02
 p/e2ri/Zl54GKcMMcggRJ1etnjH6fQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-EeuauNT6OWS2Uvng5veLhA-1; Sun, 03 May 2020 04:55:42 -0400
X-MC-Unique: EeuauNT6OWS2Uvng5veLhA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFDAE800D24;
 Sun,  3 May 2020 08:55:41 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C44E45D9D5;
 Sun,  3 May 2020 08:55:36 +0000 (UTC)
Message-ID: <2f191d8fde9c12231b5976dca8429459fa559ce8.camel@redhat.com>
Subject: Re: [PATCH v2 02/14] qcrypto/luks: implement encryption key management
From: Maxim Levitsky <mlevitsk@redhat.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Date: Sun, 03 May 2020 11:55:35 +0300
In-Reply-To: <20200428131652.GA1467943@redhat.com>
References: <20200308151903.25941-1-mlevitsk@redhat.com>
 <20200308151903.25941-3-mlevitsk@redhat.com>
 <20200428131652.GA1467943@redhat.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/03 04:55:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-04-28 at 14:16 +0100, Daniel P. Berrang=C3=A9 wrote:
> On Sun, Mar 08, 2020 at 05:18:51PM +0200, Maxim Levitsky wrote:
> > Next few patches will expose that functionality
> > to the user.
> >=20
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  crypto/block-luks.c | 398 +++++++++++++++++++++++++++++++++++++++++++-
> >  qapi/crypto.json    |  61 ++++++-
> >  2 files changed, 455 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/crypto/block-luks.c b/crypto/block-luks.c
> > index 4861db810c..b11ee08c6d 100644
> > --- a/crypto/block-luks.c
> > +++ b/crypto/block-luks.c
> > +/*
> > + * Erases an keyslot given its index
> > + * Returns:
> > + *    0 if the keyslot was erased successfully
> > + *   -1 if a error occurred while erasing the keyslot
> > + *
> > + */
> > +static int
> > +qcrypto_block_luks_erase_key(QCryptoBlock *block,
> > +                             unsigned int slot_idx,
> > +                             QCryptoBlockWriteFunc writefunc,
> > +                             void *opaque,
> > +                             Error **errp)
> > +{
> > +    QCryptoBlockLUKS *luks =3D block->opaque;
> > +    QCryptoBlockLUKSKeySlot *slot =3D &luks->header.key_slots[slot_idx=
];
> > +    g_autofree uint8_t *garbagesplitkey =3D NULL;
> > +    size_t splitkeylen =3D luks->header.master_key_len * slot->stripes=
;
> > +    size_t i;
> > +
> > +    assert(slot_idx < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS);
> > +    assert(splitkeylen > 0);
> > +    garbagesplitkey =3D g_new0(uint8_t, splitkeylen);
> > +
> > +    /* Reset the key slot header */
> > +    memset(slot->salt, 0, QCRYPTO_BLOCK_LUKS_SALT_LEN);
> > +    slot->iterations =3D 0;
> > +    slot->active =3D QCRYPTO_BLOCK_LUKS_KEY_SLOT_DISABLED;
> > +
> > +    qcrypto_block_luks_store_header(block,  writefunc, opaque, errp);
>=20
> This may set  errp and we don't return immediately, so....
>=20
> > +    /*
> > +     * Now try to erase the key material, even if the header
> > +     * update failed
> > +     */
> > +    for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_ERASE_ITERATIONS; i++) {
> > +        if (qcrypto_random_bytes(garbagesplitkey, splitkeylen, errp) <=
 0) {
>=20
> ...this may then set errp a second time, which is not permitted.
>=20
> This call needs to use a "local_err", and error_propagate(errp, local_err=
).
> The latter is a no-op if errp is already set.

Fixed! Thanks for pointing this out!

>=20
> > +            /*
> > +             * If we failed to get the random data, still write
> > +             * at least zeros to the key slot at least once
> > +             */
> > +            if (i > 0) {
> > +                return -1;
> > +            }
> > +        }
> > +        if (writefunc(block,
> > +                      slot->key_offset_sector * QCRYPTO_BLOCK_LUKS_SEC=
TOR_SIZE,
> > +                      garbagesplitkey,
> > +                      splitkeylen,
> > +                      opaque,
> > +                      errp) !=3D splitkeylen) {
>=20
> same issue with errp here too.

Fixed too of course
>=20
> > +            return -1;
> > +        }
> > +    }
> > +    return 0;
> > +}
>=20
>=20
> > +/*
> > + * Given LUKSKeyslotUpdate command, set @slots_bitmap with all slots
> > + * that will be updated with new password (or erased)
> > + * returns 0 on success, and -1 on failure
> > + */
> > +static int
> > +qcrypto_block_luks_get_update_bitmap(QCryptoBlock *block,
> > +                                     QCryptoBlockReadFunc readfunc,
> > +                                     void *opaque,
> > +                                     const QCryptoBlockAmendOptionsLUK=
S *opts,
> > +                                     unsigned long *slots_bitmap,
> > +                                     Error **errp)
> > +{
> > +    const QCryptoBlockLUKS *luks =3D block->opaque;
> > +    size_t i;
> > +
> > +    bitmap_zero(slots_bitmap, QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS);
> > +
> > +    if (opts->has_keyslot) {
> > +        /* keyslot set, select only this keyslot */
> > +        int keyslot =3D opts->keyslot;
> > +
> > +        if (keyslot < 0 || keyslot >=3D QCRYPTO_BLOCK_LUKS_NUM_KEY_SLO=
TS) {
> > +            error_setg(errp,
> > +                       "Invalid slot %u specified, must be between 0 a=
nd %u",
> > +                       keyslot, QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS - 1);
> > +            return -1;
> > +        }
> > +        bitmap_set(slots_bitmap, keyslot, 1);
> > +
> > +    } else if (opts->has_old_secret) {
> > +        /* initially select all active keyslots */
> > +        for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
> > +            if (qcrypto_block_luks_slot_active(luks, i)) {
> > +                bitmap_set(slots_bitmap, i, 1);
> > +            }
> > +        }
> > +    } else {
> > +        /* find a free keyslot */
> > +        int slot =3D qcrypto_block_luks_find_free_keyslot(luks);
> > +
> > +        if (slot =3D=3D -1) {
> > +            error_setg(errp,
> > +                       "Can't add a keyslot - all key slots are in use=
");
> > +            return -1;
> > +        }
> > +        bitmap_set(slots_bitmap, slot, 1);
> > +    }
> > +
> > +    if (opts->has_old_secret) {
> > +        /* now deselect all keyslots that don't contain the password *=
/
> > +        g_autofree uint8_t *tmpkey =3D g_new0(uint8_t,
> > +                                            luks->header.master_key_le=
n);
> > +
> > +        for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
> > +            g_autofree char *old_password =3D NULL;
> > +            int rv;
> > +
> > +            if (!test_bit(i, slots_bitmap)) {
> > +                continue;
> > +            }
> > +
> > +            old_password =3D qcrypto_secret_lookup_as_utf8(opts->old_s=
ecret,
> > +                                                         errp);
> > +            if (!old_password) {
> > +                return -1;
> > +            }
> > +
> > +            rv =3D qcrypto_block_luks_load_key(block,
> > +                                             i,
> > +                                             old_password,
> > +                                             tmpkey,
> > +                                             readfunc,
> > +                                             opaque,
> > +                                             errp);
> > +            if (rv =3D=3D -1) {
> > +                return -1;
> > +            } else if (rv =3D=3D 0) {
> > +                bitmap_clear(slots_bitmap, i, 1);
> > +            }
> > +        }
> > +    }
> > +    return 0;
> > +}
>=20
> I'm not really liking this function as a concept. Some of the code
> only applies to the "add key" code path, while some of it only
> applies to the "erase key" code path.
>=20
> I'd prefer it if qcrypto_block_luks_erase_keys directly had the
> required logic, likewise qcrypto_block_luks_set_keys, and thus
> get rid of the bitmap concept entirely. I thin kit'd make the
> logic easier to understand.

It used to be like that in former versions that I did send, I added the con=
cept
of the bitmap very recently to reflect the way we defined this in the spec.
I don't mind that much coming back to older version of doing this,
but beware that it won't be that clear either.


>=20
> > +
> > +/*
> > + * Erase a set of keyslots given in @slots_bitmap
> > + */
> > +static int qcrypto_block_luks_erase_keys(QCryptoBlock *block,
> > +                                         QCryptoBlockReadFunc readfunc=
,
> > +                                         QCryptoBlockWriteFunc writefu=
nc,
> > +                                         void *opaque,
> > +                                         unsigned long *slots_bitmap,
> > +                                         bool force,
> > +                                         Error **errp)
> > +{
> > +    QCryptoBlockLUKS *luks =3D block->opaque;
> > +    long slot_count =3D bitmap_count_one(slots_bitmap,
> > +                                       QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOT=
S);
> > +    size_t i;
> > +
> > +    /* safety checks */
> > +    if (!force && slot_count =3D=3D qcrypto_block_luks_count_active_sl=
ots(luks)) {
> > +        error_setg(errp,
> > +                   "Requested operation will erase all active keyslots=
"
> > +                   " which will erase all the data in the image"
> > +                   " irreversibly - refusing operation");
> > +        return -EINVAL;
> > +    }
> > +
> > +    /* new apply the update */
> > +    for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
> > +        if (!test_bit(i, slots_bitmap)) {
> > +            continue;
> > +        }
> > +        if (qcrypto_block_luks_erase_key(block, i, writefunc, opaque, =
errp)) {
> > +            error_append_hint(errp, "Failed to erase keyslot %zu", i);
> > +            return -EINVAL;
> > +        }
> > +    }
> > +    return 0;
> > +}
> > +
> > +/*
> > + * Set a set of keyslots to @master_key encrypted by @new_secret
> > + */
> > +static int qcrypto_block_luks_set_keys(QCryptoBlock *block,
> > +                                       QCryptoBlockReadFunc readfunc,
> > +                                       QCryptoBlockWriteFunc writefunc=
,
> > +                                       void *opaque,
> > +                                       unsigned long *slots_bitmap,
> > +                                       uint8_t *master_key,
> > +                                       uint64_t iter_time,
> > +                                       char *new_secret,
> > +                                       bool force,
> > +                                       Error **errp)
>=20
> I'd call this  "add_key" instead of "set_keys".  I'm also unclear why
> we need to support setting a range of keyslots. AFAIK, adding a key
> should only ever affect a single keyslot.
Mostly for consistency. There is a very corner case of inline replacing
all keys that match one password with another.

If possible I would like to keep it this way though.


>=20
> > +{
> > +    QCryptoBlockLUKS *luks =3D block->opaque;
> > +    g_autofree char *new_password =3D NULL;
> > +    size_t i;
> > +
> > +    /* safety checks */
> > +    if (!force) {
> > +        for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
> > +            if (!test_bit(i, slots_bitmap)) {
> > +                continue;
> > +            }
> > +            if (qcrypto_block_luks_slot_active(luks, i)) {
> > +                error_setg(errp,
> > +                           "Refusing to overwrite active slot %zu - "
> > +                           "please erase it first", i);
> > +                return -EINVAL;
> > +            }
> > +        }
> > +    }
> > +
> > +    /* Load the new password */
> > +    new_password =3D qcrypto_secret_lookup_as_utf8(new_secret, errp);
> > +    if (!new_password) {
> > +        return -EINVAL;
> > +    }
> > +
> > +    /* Apply the update */
> > +    for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
> > +        if (!test_bit(i, slots_bitmap)) {
> > +            continue;
> > +        }
> > +        if (qcrypto_block_luks_store_key(block, i, new_password, maste=
r_key,
> > +                                         iter_time, writefunc, opaque,=
 errp)) {
> > +            error_append_hint(errp, "Failed to write to keyslot %zu", =
i);
> > +            return -EINVAL;
> > +        }
> > +    }
> > +    return 0;
> > +}
> > +
> > +static int
> > +qcrypto_block_luks_amend_options(QCryptoBlock *block,
> > +                                 QCryptoBlockReadFunc readfunc,
> > +                                 QCryptoBlockWriteFunc writefunc,
> > +                                 void *opaque,
> > +                                 QCryptoBlockAmendOptions *options,
> > +                                 bool force,
> > +                                 Error **errp)
> > +{
> > +    QCryptoBlockLUKS *luks =3D block->opaque;
> > +    QCryptoBlockAmendOptionsLUKS *opts_luks =3D &options->u.luks;
> > +    g_autofree uint8_t *master_key =3D NULL;
> > +    g_autofree unsigned long *update_bitmap =3D NULL;
> > +    char *unlock_secret =3D NULL;
> > +    long slot_count;
> > +
> > +    unlock_secret =3D opts_luks->has_unlock_secret ? opts_luks->unlock=
_secret :
> > +                                                   luks->secret;
> > +
> > +    /* Retrieve set of slots that we need to update */
> > +    update_bitmap =3D bitmap_new(QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS);
> > +    if (qcrypto_block_luks_get_update_bitmap(block, readfunc, opaque, =
opts_luks,
> > +                                             update_bitmap, errp) !=3D=
 0) {
> > +        return -1;
> > +    }
> > +
> > +    slot_count =3D bitmap_count_one(update_bitmap,
> > +                                  QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS);
> > +
> > +    /* no matching slots, so nothing to do */
> > +    if (slot_count =3D=3D 0) {
> > +        error_setg(errp, "Requested operation didn't match any slots")=
;
> > +        return -1;
> > +    }
> > +
> > +    if (opts_luks->state =3D=3D LUKS_KEYSLOT_STATE_ACTIVE) {
> > +
> > +        uint64_t iter_time =3D opts_luks->has_iter_time ?
> > +                             opts_luks->iter_time :
> > +                             QCRYPTO_BLOCK_LUKS_DEFAULT_ITER_TIME_MS;
> > +
> > +        if (!opts_luks->has_new_secret) {
> > +            error_setg(errp, "'new-secret' is required to activate a k=
eyslot");
> > +            return -EINVAL;
>=20
> return -1,   we shouldn't return errno values in luks code in general
> as we use  Error **errp.
Yep, fixed.

>=20
> > +        }
> > +        if (opts_luks->has_old_secret) {
> > +            error_setg(errp,
> > +                       "'old-secret' must not be given when activating=
 keyslots");
> > +            return -EINVAL;
> > +        }
> > +
> > +        /* Locate the password that will be used to retrieve the maste=
r key */
> > +        g_autofree char *old_password;
> > +        old_password =3D qcrypto_secret_lookup_as_utf8(unlock_secret, =
 errp);
> > +        if (!old_password) {
> > +            return -EINVAL;
> > +        }
> > +
> > +        /* Try to retrieve the master key */
> > +        master_key =3D g_new0(uint8_t, luks->header.master_key_len);
> > +        if (qcrypto_block_luks_find_key(block, old_password, master_ke=
y,
> > +                                        readfunc, opaque, errp) < 0) {
> > +            error_append_hint(errp, "Failed to retrieve the master key=
");
> > +            return -EINVAL;
> > +        }
> > +
> > +        /* Now set the new keyslots */
> > +        if (qcrypto_block_luks_set_keys(block, readfunc, writefunc,
> > +                                        opaque, update_bitmap, master_=
key,
> > +                                        iter_time,
> > +                                        opts_luks->new_secret,
> > +                                        force, errp) !=3D 0) {
> > +            return -1;
> > +        }
> > +    } else {
> > +        if (opts_luks->has_new_secret) {
> > +            error_setg(errp,
> > +                       "'new-secret' must not be given when erasing ke=
yslots");
> > +            return -EINVAL;
> > +        }
> > +        if (opts_luks->has_iter_time) {
> > +            error_setg(errp,
> > +                       "'iter-time' must not be given when erasing key=
slots");
> > +            return -EINVAL;
> > +        }
> > +        if (opts_luks->has_unlock_secret) {
> > +            error_setg(errp,
> > +                       "'unlock_secret' must not be given when erasing=
 keyslots");
> > +            return -EINVAL;
> > +        }
> > +
> > +        if (qcrypto_block_luks_erase_keys(block, readfunc, writefunc,
> > +                                          opaque, update_bitmap, force=
,
> > +                                          errp) !=3D 0) {
> > +            return -1;
> > +        }
> > +    }
> > +    return 0;
> > +}
> > =20
> >  static int qcrypto_block_luks_get_info(QCryptoBlock *block,
> >                                         QCryptoBlockInfo *info,
> > @@ -1523,7 +1912,11 @@ static int qcrypto_block_luks_get_info(QCryptoBl=
ock *block,
> > =20
> >  static void qcrypto_block_luks_cleanup(QCryptoBlock *block)
> >  {
> > -    g_free(block->opaque);
> > +    QCryptoBlockLUKS *luks =3D block->opaque;
> > +    if (luks) {
> > +        g_free(luks->secret);
> > +        g_free(luks);
> > +    }
> >  }
> > =20
> > =20
> > @@ -1560,6 +1953,7 @@ qcrypto_block_luks_encrypt(QCryptoBlock *block,
> >  const QCryptoBlockDriver qcrypto_block_driver_luks =3D {
> >      .open =3D qcrypto_block_luks_open,
> >      .create =3D qcrypto_block_luks_create,
> > +    .amend =3D qcrypto_block_luks_amend_options,
> >      .get_info =3D qcrypto_block_luks_get_info,
> >      .cleanup =3D qcrypto_block_luks_cleanup,
> >      .decrypt =3D qcrypto_block_luks_decrypt,
> > diff --git a/qapi/crypto.json b/qapi/crypto.json
> > index 3fd0ce177e..fe600fc608 100644
> > --- a/qapi/crypto.json
> > +++ b/qapi/crypto.json
> > @@ -1,6 +1,8 @@
> >  # -*- Mode: Python -*-
> >  #
> > =20
> > +{ 'include': 'common.json' }
> > +
> >  ##
> >  # =3D Cryptography
> >  ##
> > @@ -297,7 +299,6 @@
> >             'uuid': 'str',
> >             'slots': [ 'QCryptoBlockInfoLUKSSlot' ] }}
> > =20
> > -
> >  ##
> >  # @QCryptoBlockInfo:
> >  #
> > @@ -310,7 +311,63 @@
> >    'discriminator': 'format',
> >    'data': { 'luks': 'QCryptoBlockInfoLUKS' } }
> > =20
> > +##
> > +# @LUKSKeyslotState:
> > +#
> > +# Defines state of keyslots that are affected by the update
> > +#
> > +# @active:    The slots contain the given password and marked as activ=
e
> > +# @inactive:  The slots are erased (contain garbage) and marked as ina=
ctive
> > +#
> > +# Since: 5.0
> > +##
> > +{ 'enum': 'LUKSKeyslotState',
> > +  'data': [ 'active', 'inactive' ] }
>=20
> This should be called  QCryptoBLockLUKSKeyslotState
Roger that!

>=20
> > +##
> > +# @QCryptoBlockAmendOptionsLUKS:
> > +#
> > +# This struct defines the update parameters that activate/de-activate =
set
> > +# of keyslots
> > +#
> > +# @state: the desired state of the keyslots
> > +#
> > +# @new-secret:    The ID of a QCryptoSecret object providing the passw=
ord to be
> > +#                 written into added active keyslots
> > +#
> > +# @old-secret:    Optional (for deactivation only)
> > +#                 If given will deactive all keyslots that
> > +#                 match password located in QCryptoSecret with this ID
> > +#
> > +# @iter-time:     Optional (for activation only)
> > +#                 Number of milliseconds to spend in
> > +#                 PBKDF passphrase processing for the newly activated =
keyslot.
> > +#                 Currently defaults to 2000.
> > +#
> > +# @keyslot:       Optional. ID of the keyslot to activate/deactivate.
> > +#                 For keyslot activation, keyslot should not be active=
 already
> > +#                 (this is unsafe to update an active keyslot),
> > +#                 but possible if 'force' parameter is given.
> > +#                 If keyslot is not given, first free keyslot will be =
written.
> > +#
> > +#                 For keyslot deactivation, this parameter specifies t=
he exact
> > +#                 keyslot to deactivate
> > +#
> > +# @unlock-secret: Optional. The ID of a QCryptoSecret object providing=
 the
> > +#                 password to use to retrive current master key.
> > +#                 Defaults to the same secret that was used to open th=
e image
>=20
> My inclination would be to just call this  "@secret", as it serves the
> same purpose as the "@secret" parameter used when opening the image.

Let it be 'secret' I don't mind at all.

>=20
> > +{ 'struct': 'QCryptoBlockAmendOptionsLUKS',
> > +  'data': { 'state': 'LUKSKeyslotState',
> > +            '*new-secret': 'str',
> > +            '*old-secret': 'str',
> > +            '*keyslot': 'int',
> > +            '*iter-time': 'int',
> > +            '*unlock-secret': 'str' } }
> > =20
> >  ##
> >  # @QCryptoBlockAmendOptions:
> > @@ -324,4 +381,4 @@
> >    'base': 'QCryptoBlockOptionsBase',
> >    'discriminator': 'format',
> >    'data': {
> > -            } }
> > +          'luks': 'QCryptoBlockAmendOptionsLUKS' } }
>=20
> Regards,
> Daniel


Best regards and thanks for the review,
=09Maxim Levitsky


