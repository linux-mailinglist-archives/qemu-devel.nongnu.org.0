Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DE21437EC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 08:56:04 +0100 (CET)
Received: from localhost ([::1]:49636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itoOI-0002uz-Lk
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 02:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49196)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1itoNN-0002Li-JT
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 02:55:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1itoNJ-0007nk-Ft
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 02:55:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45699
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1itoNJ-0007nY-Bx
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 02:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579593301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkbP//ACMtKzrzeAP7JJhVUxrkWeG92y6v02wFJeEiA=;
 b=Iz/c3b/09RBLWUSRs1FgnyB3Vfp/iktswQYhj5K1+sKwgu0RGVitE/S78UIfBIHU57QG2H
 JnWpgy0SwVewK5/8FeoJdXwPFhLWn/l8hOrogzs0+S6D1GuT6TPJpBJn8JMpAhPpSgi+pu
 m3LmAH7n1Wc7WbIy0P7HIsunMABZG/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-ZTV1RtzWNzKmy2rKdE0cBQ-1; Tue, 21 Jan 2020 02:54:57 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 714E98017CC;
 Tue, 21 Jan 2020 07:54:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7003360FC1;
 Tue, 21 Jan 2020 07:54:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DBEC61138600; Tue, 21 Jan 2020 08:54:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 02/13] qcrypto-luks: implement encryption key management
References: <20200114193350.10830-1-mlevitsk@redhat.com>
 <20200114193350.10830-3-mlevitsk@redhat.com>
Date: Tue, 21 Jan 2020 08:54:51 +0100
In-Reply-To: <20200114193350.10830-3-mlevitsk@redhat.com> (Maxim Levitsky's
 message of "Tue, 14 Jan 2020 21:33:39 +0200")
Message-ID: <87r1zti6r8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ZTV1RtzWNzKmy2rKdE0cBQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewing just the QAPI schema.

Maxim Levitsky <mlevitsk@redhat.com> writes:

> Next few patches will expose that functionality
> to the user.
>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  crypto/block-luks.c | 374 +++++++++++++++++++++++++++++++++++++++++++-
>  qapi/crypto.json    |  50 +++++-
>  2 files changed, 421 insertions(+), 3 deletions(-)
>
> diff --git a/crypto/block-luks.c b/crypto/block-luks.c
> index 4861db810c..349e95fed3 100644
> --- a/crypto/block-luks.c
> +++ b/crypto/block-luks.c
> @@ -32,6 +32,7 @@
>  #include "qemu/uuid.h"
> =20
>  #include "qemu/coroutine.h"
> +#include "qemu/bitmap.h"
> =20
>  /*
>   * Reference for the LUKS format implemented here is
> @@ -70,6 +71,9 @@ typedef struct QCryptoBlockLUKSKeySlot QCryptoBlockLUKS=
KeySlot;
> =20
>  #define QCRYPTO_BLOCK_LUKS_SECTOR_SIZE 512LL
> =20
> +#define QCRYPTO_BLOCK_LUKS_DEFAULT_ITER_TIME_MS 2000
> +#define QCRYPTO_BLOCK_LUKS_ERASE_ITERATIONS 40
> +
>  static const char qcrypto_block_luks_magic[QCRYPTO_BLOCK_LUKS_MAGIC_LEN]=
 =3D {
>      'L', 'U', 'K', 'S', 0xBA, 0xBE
>  };
> @@ -219,6 +223,9 @@ struct QCryptoBlockLUKS {
> =20
>      /* Hash algorithm used in pbkdf2 function */
>      QCryptoHashAlgorithm hash_alg;
> +
> +    /* Name of the secret that was used to open the image */
> +    char *secret;
>  };
> =20
> =20
> @@ -1069,6 +1076,112 @@ qcrypto_block_luks_find_key(QCryptoBlock *block,
>      return -1;
>  }
> =20
> +/*
> + * Returns true if a slot i is marked as active
> + * (contains encrypted copy of the master key)
> + */
> +static bool
> +qcrypto_block_luks_slot_active(const QCryptoBlockLUKS *luks,
> +                               unsigned int slot_idx)
> +{
> +    uint32_t val =3D luks->header.key_slots[slot_idx].active;
> +    return val =3D=3D  QCRYPTO_BLOCK_LUKS_KEY_SLOT_ENABLED;
> +}
> +
> +/*
> + * Returns the number of slots that are marked as active
> + * (slots that contain encrypted copy of the master key)
> + */
> +static unsigned int
> +qcrypto_block_luks_count_active_slots(const QCryptoBlockLUKS *luks)
> +{
> +    size_t i =3D 0;
> +    unsigned int ret =3D 0;
> +
> +    for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
> +        if (qcrypto_block_luks_slot_active(luks, i)) {
> +            ret++;
> +        }
> +    }
> +    return ret;
> +}
> +
> +/*
> + * Finds first key slot which is not active
> + * Returns the key slot index, or -1 if it doesn't exist
> + */
> +static int
> +qcrypto_block_luks_find_free_keyslot(const QCryptoBlockLUKS *luks)
> +{
> +    size_t i;
> +
> +    for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
> +        if (!qcrypto_block_luks_slot_active(luks, i)) {
> +            return i;
> +        }
> +    }
> +    return -1;
> +
> +}
> +
> +/*
> + * Erases an keyslot given its index
> + * Returns:
> + *    0 if the keyslot was erased successfully
> + *   -1 if a error occurred while erasing the keyslot
> + *
> + */
> +static int
> +qcrypto_block_luks_erase_key(QCryptoBlock *block,
> +                             unsigned int slot_idx,
> +                             QCryptoBlockWriteFunc writefunc,
> +                             void *opaque,
> +                             Error **errp)
> +{
> +    QCryptoBlockLUKS *luks =3D block->opaque;
> +    QCryptoBlockLUKSKeySlot *slot =3D &luks->header.key_slots[slot_idx];
> +    g_autofree uint8_t *garbagesplitkey =3D NULL;
> +    size_t splitkeylen =3D luks->header.master_key_len * slot->stripes;
> +    size_t i;
> +
> +    assert(slot_idx < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS);
> +    assert(splitkeylen > 0);
> +
> +    garbagesplitkey =3D g_new0(uint8_t, splitkeylen);
> +
> +    /* Reset the key slot header */
> +    memset(slot->salt, 0, QCRYPTO_BLOCK_LUKS_SALT_LEN);
> +    slot->iterations =3D 0;
> +    slot->active =3D QCRYPTO_BLOCK_LUKS_KEY_SLOT_DISABLED;
> +
> +    qcrypto_block_luks_store_header(block,  writefunc, opaque, errp);
> +
> +    /*
> +     * Now try to erase the key material, even if the header
> +     * update failed
> +     */
> +    for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_ERASE_ITERATIONS; i++) {
> +        if (qcrypto_random_bytes(garbagesplitkey, splitkeylen, errp) < 0=
) {
> +            /*
> +             * If we failed to get the random data, still write
> +             * at least zeros to the key slot at least once
> +             */
> +            if (i > 0) {
> +                return -1;
> +            }
> +        }
> +
> +        if (writefunc(block,
> +                      slot->key_offset_sector * QCRYPTO_BLOCK_LUKS_SECTO=
R_SIZE,
> +                      garbagesplitkey,
> +                      splitkeylen,
> +                      opaque,
> +                      errp) !=3D splitkeylen) {
> +            return -1;
> +        }
> +    }
> +    return 0;
> +}
> =20
>  static int
>  qcrypto_block_luks_open(QCryptoBlock *block,
> @@ -1099,6 +1212,7 @@ qcrypto_block_luks_open(QCryptoBlock *block,
> =20
>      luks =3D g_new0(QCryptoBlockLUKS, 1);
>      block->opaque =3D luks;
> +    luks->secret =3D g_strdup(options->u.luks.key_secret);
> =20
>      if (qcrypto_block_luks_load_header(block, readfunc, opaque, errp) < =
0) {
>          goto fail;
> @@ -1164,6 +1278,7 @@ qcrypto_block_luks_open(QCryptoBlock *block,
>   fail:
>      qcrypto_block_free_cipher(block);
>      qcrypto_ivgen_free(block->ivgen);
> +    g_free(luks->secret);
>      g_free(luks);
>      return -1;
>  }
> @@ -1204,7 +1319,7 @@ qcrypto_block_luks_create(QCryptoBlock *block,
> =20
>      memcpy(&luks_opts, &options->u.luks, sizeof(luks_opts));
>      if (!luks_opts.has_iter_time) {
> -        luks_opts.iter_time =3D 2000;
> +        luks_opts.iter_time =3D QCRYPTO_BLOCK_LUKS_DEFAULT_ITER_TIME_MS;
>      }
>      if (!luks_opts.has_cipher_alg) {
>          luks_opts.cipher_alg =3D QCRYPTO_CIPHER_ALG_AES_256;
> @@ -1244,6 +1359,8 @@ qcrypto_block_luks_create(QCryptoBlock *block,
>                     optprefix ? optprefix : "");
>          goto error;
>      }
> +    luks->secret =3D g_strdup(options->u.luks.key_secret);
> +
>      password =3D qcrypto_secret_lookup_as_utf8(luks_opts.key_secret, err=
p);
>      if (!password) {
>          goto error;
> @@ -1471,10 +1588,260 @@ qcrypto_block_luks_create(QCryptoBlock *block,
>      qcrypto_block_free_cipher(block);
>      qcrypto_ivgen_free(block->ivgen);
> =20
> +    g_free(luks->secret);
>      g_free(luks);
>      return -1;
>  }
> =20
> +/*
> + * Given LUKSKeyslotUpdate command, return @slots_bitmap with all slots
> + * that will be updated with new password (or erased)
> + * returns number of affected slots
> + */
> +static int qcrypto_block_luks_get_slots_bitmap(QCryptoBlock *block,
> +                                               QCryptoBlockReadFunc read=
func,
> +                                               void *opaque,
> +                                               const LUKSKeyslotUpdate *=
command,
> +                                               unsigned long *slots_bitm=
ap,
> +                                               Error **errp)
> +{
> +    const QCryptoBlockLUKS *luks =3D block->opaque;
> +    size_t i;
> +    int ret =3D 0;
> +
> +    if (command->has_keyslot) {
> +        /* keyslot set, select only this keyslot */
> +        int keyslot =3D command->keyslot;
> +
> +        if (keyslot < 0 || keyslot >=3D QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS=
) {
> +            error_setg(errp,
> +                       "Invalid slot %u specified, must be between 0 and=
 %u",
> +                       keyslot, QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS - 1);
> +            goto error;
> +        }
> +        bitmap_set(slots_bitmap, keyslot, 1);
> +        ret++;
> +
> +    } else if (command->has_old_secret) {
> +        /* initially select all active keyslots */
> +        for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
> +            if (qcrypto_block_luks_slot_active(luks, i)) {
> +                bitmap_set(slots_bitmap, i, 1);
> +                ret++;
> +            }
> +        }
> +    } else {
> +        /* find a free keyslot */
> +        int slot =3D qcrypto_block_luks_find_free_keyslot(luks);
> +
> +        if (slot =3D=3D -1) {
> +            error_setg(errp,
> +                       "Can't add a keyslot - all key slots are in use")=
;
> +            goto error;
> +        }
> +        bitmap_set(slots_bitmap, slot, 1);
> +        ret++;
> +    }
> +
> +    if (command->has_old_secret) {
> +        /* now deselect all keyslots that don't contain the password */
> +        g_autofree uint8_t *tmpkey =3D g_new0(uint8_t,
> +                                            luks->header.master_key_len)=
;
> +
> +        for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
> +            g_autofree char *old_password =3D NULL;
> +            int rv;
> +
> +            if (!test_bit(i, slots_bitmap)) {
> +                continue;
> +            }
> +
> +            old_password =3D qcrypto_secret_lookup_as_utf8(command->old_=
secret,
> +                                                         errp);
> +            if (!old_password) {
> +                goto error;
> +            }
> +
> +            rv =3D qcrypto_block_luks_load_key(block,
> +                                             i,
> +                                             old_password,
> +                                             tmpkey,
> +                                             readfunc,
> +                                             opaque,
> +                                             errp);
> +            if (rv =3D=3D -1)
> +                goto error;
> +            else if (rv =3D=3D 0) {
> +                bitmap_clear(slots_bitmap, i, 1);
> +                ret--;
> +            }
> +        }
> +    }
> +    return ret;
> +error:
> +    return -1;
> +}
> +
> +/*
> + * Apply a single keyslot update command as described in @command
> + * Optionally use @unlock_secret to retrieve the master key
> + */
> +static int
> +qcrypto_block_luks_apply_keyslot_update(QCryptoBlock *block,
> +                                        QCryptoBlockReadFunc readfunc,
> +                                        QCryptoBlockWriteFunc writefunc,
> +                                        void *opaque,
> +                                        LUKSKeyslotUpdate *command,
> +                                        const char *unlock_secret,
> +                                        uint8_t **master_key,
> +                                        bool force,
> +                                        Error **errp)
> +{
> +    QCryptoBlockLUKS *luks =3D block->opaque;
> +    g_autofree unsigned long *slots_bitmap =3D NULL;
> +    int64_t iter_time =3D QCRYPTO_BLOCK_LUKS_DEFAULT_ITER_TIME_MS;
> +    int slot_count;
> +    size_t i;
> +    char *new_password;
> +    bool erasing;
> +
> +    slots_bitmap =3D bitmap_new(QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS);
> +    slot_count =3D qcrypto_block_luks_get_slots_bitmap(block, readfunc, =
opaque,
> +                                                     command, slots_bitm=
ap,
> +                                                     errp);
> +    if (slot_count =3D=3D -1) {
> +        goto error;
> +    }
> +    /* no matching slots, so nothing to do */
> +    if (slot_count =3D=3D 0) {
> +        error_setg(errp, "Requested operation didn't match any slots");
> +        goto error;
> +    }
> +    /*
> +     * slot is erased when the password is set to null, or empty string
> +     * (for compatibility with command line)
> +     */
> +    erasing =3D command->new_secret->type =3D=3D QTYPE_QNULL ||
> +              strlen(command->new_secret->u.s) =3D=3D 0;
> +
> +    /* safety checks */
> +    if (!force) {
> +        if (erasing) {
> +            if (slot_count =3D=3D qcrypto_block_luks_count_active_slots(=
luks)) {
> +                error_setg(errp,
> +                           "Requested operation will erase all active ke=
yslots"
> +                           " which will erase all the data in the image"
> +                           " irreversibly - refusing operation");
> +                goto error;
> +            }
> +        } else {
> +            for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
> +                if (!test_bit(i, slots_bitmap)) {
> +                    continue;
> +                }
> +                if (qcrypto_block_luks_slot_active(luks, i)) {
> +                    error_setg(errp,
> +                               "Refusing to overwrite active slot %zu - =
"
> +                               "please erase it first", i);
> +                    goto error;
> +                }
> +            }
> +        }
> +    }
> +
> +    /* setup the data needed for storing the new keyslot */
> +    if (!erasing) {
> +        /* Load the master key if it wasn't already loaded */
> +        if (!*master_key) {
> +            g_autofree char *old_password;
> +            old_password =3D qcrypto_secret_lookup_as_utf8(unlock_secret=
,  errp);
> +            if (!old_password) {
> +                goto error;
> +            }
> +            *master_key =3D g_new0(uint8_t, luks->header.master_key_len)=
;
> +
> +            if (qcrypto_block_luks_find_key(block, old_password, *master=
_key,
> +                                            readfunc, opaque, errp) < 0)=
 {
> +                error_append_hint(errp, "Failed to retrieve the master k=
ey");
> +                goto error;
> +            }
> +        }
> +        new_password =3D qcrypto_secret_lookup_as_utf8(command->new_secr=
et->u.s,
> +                                                     errp);
> +        if (!new_password) {
> +            goto error;
> +        }
> +        if (command->has_iter_time) {
> +            iter_time =3D command->iter_time;
> +        }
> +    }
> +
> +    /* new apply the update */
> +    for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
> +        if (!test_bit(i, slots_bitmap)) {
> +            continue;
> +        }
> +        if (erasing) {
> +            if (qcrypto_block_luks_erase_key(block, i,
> +                                             writefunc,
> +                                             opaque,
> +                                             errp)) {
> +                error_append_hint(errp, "Failed to erase keyslot %zu", i=
);
> +                goto error;
> +            }
> +        } else {
> +            if (qcrypto_block_luks_store_key(block, i,
> +                                             new_password,
> +                                             *master_key,
> +                                             iter_time,
> +                                             writefunc,
> +                                             opaque,
> +                                             errp)) {
> +                error_append_hint(errp, "Failed to write to keyslot %zu"=
, i);
> +                goto error;
> +            }
> +        }
> +    }
> +    return 0;
> +error:
> +    return -EINVAL;
> +}
> +
> +static int
> +qcrypto_block_luks_amend_options(QCryptoBlock *block,
> +                                 QCryptoBlockReadFunc readfunc,
> +                                 QCryptoBlockWriteFunc writefunc,
> +                                 void *opaque,
> +                                 QCryptoBlockAmendOptions *options,
> +                                 bool force,
> +                                 Error **errp)
> +{
> +    QCryptoBlockLUKS *luks =3D block->opaque;
> +    QCryptoBlockAmendOptionsLUKS *options_luks =3D &options->u.luks;
> +    LUKSKeyslotUpdateList *ptr;
> +    g_autofree uint8_t *master_key =3D NULL;
> +    int ret;
> +
> +    char *unlock_secret =3D options_luks->has_unlock_secret ?
> +                          options_luks->unlock_secret :
> +                          luks->secret;
> +
> +    for (ptr =3D options_luks->keys; ptr; ptr =3D ptr->next) {
> +        ret =3D qcrypto_block_luks_apply_keyslot_update(block, readfunc,
> +                                                      writefunc, opaque,
> +                                                      ptr->value,
> +                                                      unlock_secret,
> +                                                      &master_key,
> +                                                      force, errp);
> +
> +        if (ret !=3D 0) {
> +            goto error;
> +        }
> +    }
> +    return 0;
> +error:
> +    return -1;
> +}
> =20
>  static int qcrypto_block_luks_get_info(QCryptoBlock *block,
>                                         QCryptoBlockInfo *info,
> @@ -1523,7 +1890,9 @@ static int qcrypto_block_luks_get_info(QCryptoBlock=
 *block,
> =20
>  static void qcrypto_block_luks_cleanup(QCryptoBlock *block)
>  {
> -    g_free(block->opaque);
> +    QCryptoBlockLUKS *luks =3D block->opaque;
> +    g_free(luks->secret);
> +    g_free(luks);
>  }
> =20
> =20
> @@ -1560,6 +1929,7 @@ qcrypto_block_luks_encrypt(QCryptoBlock *block,
>  const QCryptoBlockDriver qcrypto_block_driver_luks =3D {
>      .open =3D qcrypto_block_luks_open,
>      .create =3D qcrypto_block_luks_create,
> +    .amend =3D qcrypto_block_luks_amend_options,
>      .get_info =3D qcrypto_block_luks_get_info,
>      .cleanup =3D qcrypto_block_luks_cleanup,
>      .decrypt =3D qcrypto_block_luks_decrypt,
> diff --git a/qapi/crypto.json b/qapi/crypto.json
> index 9faebd03d4..e83847c71e 100644
> --- a/qapi/crypto.json
> +++ b/qapi/crypto.json
> @@ -1,6 +1,8 @@
>  # -*- Mode: Python -*-
>  #
> =20
> +{ 'include': 'common.json' }
> +
>  ##
>  # =3D Cryptography
>  ##
> @@ -310,6 +312,52 @@
>    'discriminator': 'format',
>    'data': { 'luks': 'QCryptoBlockInfoLUKS' } }
> =20
> +##
> +# @LUKSKeyslotUpdate:
> +#
> +# @keyslot:         If specified, will update only keyslot with this ind=
ex
> +#
> +# @old-secret:      If specified, will only update keyslots that
> +#                   can be opened with password which is contained in
> +#                   QCryptoSecret with @old-secret ID
> +#
> +#                   If neither @keyslot nor @old-secret is specified,
> +#                   first empty keyslot is selected for the update
> +#
> +# @new-secret:      The ID of a QCryptoSecret object providing a new dec=
ryption
> +#                   key to place in all matching keyslots.
> +#                   null/empty string erases all matching keyslots

I hate making the empty string do something completely different than a
non-empty string.

What about making @new-secret optional, and have absent @new-secret
erase?

> +#                                                                  unles=
s
> +#                   last valid keyslot is erased.

Leaves me to wonder what happens when I try.  If I read your code
correctly, it's an error.  Suggest "You cannot erase the last valid
keyslot".

Not documented here: "Refusing to overwrite active slot".

> +#
> +# @iter-time:       number of milliseconds to spend in
> +#                   PBKDF passphrase processing

Default?

> +# Since: 5.0
> +##
> +{ 'struct': 'LUKSKeyslotUpdate',
> +  'data': {
> +           '*keyslot': 'int',
> +           '*old-secret': 'str',
> +           'new-secret' : 'StrOrNull',
> +           '*iter-time' : 'int' } }
> +
> +
> +##
> +# @QCryptoBlockAmendOptionsLUKS:
> +#
> +# The options that can be changed on existing luks encrypted device
> +# @keys:           list of keyslot updates to perform
> +#                  (updates are performed in order)
> +# @unlock-secret:  use this secret to retrieve the current master key
> +#                  if not given will use the same secret as one

"as the one"?

> +#                  that was used to open the image
> +#
> +# Since: 5.0
> +##
> +{ 'struct': 'QCryptoBlockAmendOptionsLUKS',
> +  'data' : {
> +            'keys': ['LUKSKeyslotUpdate'],
> +             '*unlock-secret' : 'str' } }
> +
> =20
> =20
>  ##
> @@ -324,4 +372,4 @@
>    'base': 'QCryptoBlockOptionsBase',
>    'discriminator': 'format',
>    'data': {
> -            } }
> +          'luks': 'QCryptoBlockAmendOptionsLUKS' } }


