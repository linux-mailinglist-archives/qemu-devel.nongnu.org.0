Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243CC92685
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 16:22:31 +0200 (CEST)
Received: from localhost ([::1]:51944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hziYI-0002Hw-0T
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 10:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35910)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1hziXM-0001Wi-DF
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 10:21:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hziXJ-0003HA-Rb
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 10:21:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60766)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hziXE-0003DJ-It; Mon, 19 Aug 2019 10:21:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A7454C08EC01;
 Mon, 19 Aug 2019 14:21:23 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 094CA58CB2;
 Mon, 19 Aug 2019 14:21:20 +0000 (UTC)
Message-ID: <0000ce26b107930e8ed4f9eac7810026cda9f866.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 17:21:19 +0300
In-Reply-To: <6b9b4bf7-5765-400b-7452-e37ec797eed1@redhat.com>
References: <20190814202219.1870-1-mlevitsk@redhat.com>
 <20190814202219.1870-3-mlevitsk@redhat.com>
 <6b9b4bf7-5765-400b-7452-e37ec797eed1@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 19 Aug 2019 14:21:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH 02/13] qcrypto-luks: misc
 refactoring
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Daniel P. =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2019-08-15 at 17:40 -0400, John Snow wrote:
> 
> On 8/14/19 4:22 PM, Maxim Levitsky wrote:
> > This is also a preparation for key read/write/erase functions
> > 
> 
> This is a matter of taste and I am not usually reviewing LUKS patches
> (So don't take me too seriously), but I would prefer not to have "misc"
> patches and instead split things out by individual changes along with a
> nice commit message for each change.
> 
> > * use master key len from the header
> 
> This touches enough lines that you could make it its own patch, I think.
> 
> > * prefer to use crypto params in the QCryptoBlockLUKS
> >   over passing them as function arguments
> 
> I think the same is true here, and highlighting which variables you are
> sticking into state instead of leaving as functional parameters would be
> nice to see without all the other changes.
> 
> > * define QCRYPTO_BLOCK_LUKS_DEFAULT_ITER_TIME
> 
> This can likely be squashed with whichever patch of yours first needs to
> use it, because it's so short.
> 
> > * Add comments to various crypto parameters in the QCryptoBlockLUKS
> > 
> 
> Can probably be squashed with item #2.

I mostly agree with you! I usually write everything as one big patch,
and then split it. 
It takes time but this has the benefit of
much less overhead during the development, and it forces kind of self
review on me while doing the split.

This patch I probably didn't split enough, and I'll do it later when I send the next
revision. 

I only had split things to the extent that all the patches are readable and reviewable to avoid wasting time,
on stuff that I will have to probably rewrite anyway.

Thanks a lot for the feedback,

Best regards,
	Maxim Levitsky




> 
> 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  crypto/block-luks.c | 213 ++++++++++++++++++++++----------------------
> >  1 file changed, 105 insertions(+), 108 deletions(-)
> > 
> > diff --git a/crypto/block-luks.c b/crypto/block-luks.c
> > index 409ab50f20..48213abde7 100644
> > --- a/crypto/block-luks.c
> > +++ b/crypto/block-luks.c
> > @@ -70,6 +70,8 @@ typedef struct QCryptoBlockLUKSKeySlot QCryptoBlockLUKSKeySlot;
> >  
> >  #define QCRYPTO_BLOCK_LUKS_SECTOR_SIZE 512LL
> >  
> > +#define QCRYPTO_BLOCK_LUKS_DEFAULT_ITER_TIME 2000
> > +
> >  static const char qcrypto_block_luks_magic[QCRYPTO_BLOCK_LUKS_MAGIC_LEN] = {
> >      'L', 'U', 'K', 'S', 0xBA, 0xBE
> >  };
> > @@ -199,13 +201,25 @@ QEMU_BUILD_BUG_ON(sizeof(struct QCryptoBlockLUKSHeader) != 592);
> >  struct QCryptoBlockLUKS {
> >      QCryptoBlockLUKSHeader header;
> >  
> > -    /* Cache parsed versions of what's in header fields,
> > -     * as we can't rely on QCryptoBlock.cipher being
> > -     * non-NULL */
> > +    /* Main encryption algorithm used for encryption*/
> >      QCryptoCipherAlgorithm cipher_alg;
> > +
> > +    /* Mode of encryption for the selected encryption algorithm */
> >      QCryptoCipherMode cipher_mode;
> > +
> > +    /* Initialization vector generation algorithm */
> >      QCryptoIVGenAlgorithm ivgen_alg;
> > +
> > +    /* Hash algorithm used for IV generation*/
> >      QCryptoHashAlgorithm ivgen_hash_alg;
> > +
> > +    /*
> > +     * Encryption algorithm used for IV generation.
> > +     * Usually the same as main encryption algorithm
> > +     */
> > +    QCryptoCipherAlgorithm ivgen_cipher_alg;
> > +
> > +    /* Hash algorithm used in pbkdf2 function */
> >      QCryptoHashAlgorithm hash_alg;
> >  };
> >  
> > @@ -397,6 +411,12 @@ qcrypto_block_luks_essiv_cipher(QCryptoCipherAlgorithm cipher,
> >      }
> >  }
> >  
> > +static int masterkeylen(QCryptoBlockLUKS *luks)
> > +{
> > +    return luks->header.key_bytes;
> > +}
> > +
> > +
> 
> generally QEMU uses snake_case_names; please spell as "master_key_len".
> 
> >  /*
> >   * Given a key slot, and user password, this will attempt to unlock
> >   * the master encryption key from the key slot.
> > @@ -410,21 +430,15 @@ qcrypto_block_luks_essiv_cipher(QCryptoCipherAlgorithm cipher,
> >   */
> >  static int
> >  qcrypto_block_luks_load_key(QCryptoBlock *block,
> > -                            QCryptoBlockLUKSKeySlot *slot,
> > +                            uint slot_idx,
> >                              const char *password,
> > -                            QCryptoCipherAlgorithm cipheralg,
> > -                            QCryptoCipherMode ciphermode,
> > -                            QCryptoHashAlgorithm hash,
> > -                            QCryptoIVGenAlgorithm ivalg,
> > -                            QCryptoCipherAlgorithm ivcipheralg,
> > -                            QCryptoHashAlgorithm ivhash,
> >                              uint8_t *masterkey,
> > -                            size_t masterkeylen,
> >                              QCryptoBlockReadFunc readfunc,
> >                              void *opaque,
> >                              Error **errp)
> >  {
> >      QCryptoBlockLUKS *luks = block->opaque;
> > +    QCryptoBlockLUKSKeySlot *slot = &luks->header.key_slots[slot_idx];
> >      uint8_t *splitkey;
> >      size_t splitkeylen;
> >      uint8_t *possiblekey;
> > @@ -439,9 +453,9 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
> >          return 0;
> >      }
> >  
> > -    splitkeylen = masterkeylen * slot->stripes;
> > +    splitkeylen = masterkeylen(luks) * slot->stripes;
> >      splitkey = g_new0(uint8_t, splitkeylen);
> > -    possiblekey = g_new0(uint8_t, masterkeylen);
> > +    possiblekey = g_new0(uint8_t, masterkeylen(luks));
> >  
> >      /*
> >       * The user password is used to generate a (possible)
> > @@ -450,11 +464,11 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
> >       * the key is correct and validate the results of
> >       * decryption later.
> >       */
> > -    if (qcrypto_pbkdf2(hash,
> > +    if (qcrypto_pbkdf2(luks->hash_alg,
> >                         (const uint8_t *)password, strlen(password),
> >                         slot->salt, QCRYPTO_BLOCK_LUKS_SALT_LEN,
> >                         slot->iterations,
> > -                       possiblekey, masterkeylen,
> > +                       possiblekey, masterkeylen(luks),
> >                         errp) < 0) {
> >          goto cleanup;
> >      }
> > @@ -478,19 +492,19 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
> >  
> >      /* Setup the cipher/ivgen that we'll use to try to decrypt
> >       * the split master key material */
> > -    cipher = qcrypto_cipher_new(cipheralg, ciphermode,
> > -                                possiblekey, masterkeylen,
> > +    cipher = qcrypto_cipher_new(luks->cipher_alg, luks->cipher_mode,
> > +                                possiblekey, masterkeylen(luks),
> >                                  errp);
> >      if (!cipher) {
> >          goto cleanup;
> >      }
> >  
> > -    niv = qcrypto_cipher_get_iv_len(cipheralg,
> > -                                    ciphermode);
> > -    ivgen = qcrypto_ivgen_new(ivalg,
> > -                              ivcipheralg,
> > -                              ivhash,
> > -                              possiblekey, masterkeylen,
> > +    niv = qcrypto_cipher_get_iv_len(luks->cipher_alg,
> > +                                    luks->cipher_mode);
> > +    ivgen = qcrypto_ivgen_new(luks->ivgen_alg,
> > +                              luks->ivgen_cipher_alg,
> > +                              luks->ivgen_hash_alg,
> > +                              possiblekey, masterkeylen(luks),
> >                                errp);
> >      if (!ivgen) {
> >          goto cleanup;
> > @@ -519,8 +533,8 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
> >       * Now we've decrypted the split master key, join
> >       * it back together to get the actual master key.
> >       */
> > -    if (qcrypto_afsplit_decode(hash,
> > -                               masterkeylen,
> > +    if (qcrypto_afsplit_decode(luks->hash_alg,
> > +                               masterkeylen(luks),
> >                                 slot->stripes,
> >                                 splitkey,
> >                                 masterkey,
> > @@ -537,8 +551,8 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
> >       * then comparing that to the hash stored in the key slot
> >       * header
> >       */
> > -    if (qcrypto_pbkdf2(hash,
> > -                       masterkey, masterkeylen,
> > +    if (qcrypto_pbkdf2(luks->hash_alg,
> > +                       masterkey, masterkeylen(luks),
> >                         luks->header.master_key_salt,
> >                         QCRYPTO_BLOCK_LUKS_SALT_LEN,
> >                         luks->header.master_key_iterations,
> > @@ -577,37 +591,19 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
> >  static int
> >  qcrypto_block_luks_find_key(QCryptoBlock *block,
> >                              const char *password,
> > -                            QCryptoCipherAlgorithm cipheralg,
> > -                            QCryptoCipherMode ciphermode,
> > -                            QCryptoHashAlgorithm hash,
> > -                            QCryptoIVGenAlgorithm ivalg,
> > -                            QCryptoCipherAlgorithm ivcipheralg,
> > -                            QCryptoHashAlgorithm ivhash,
> > -                            uint8_t **masterkey,
> > -                            size_t *masterkeylen,
> > +                            uint8_t *masterkey,
> >                              QCryptoBlockReadFunc readfunc,
> >                              void *opaque,
> >                              Error **errp)
> >  {
> > -    QCryptoBlockLUKS *luks = block->opaque;
> >      size_t i;
> >      int rv;
> >  
> > -    *masterkey = g_new0(uint8_t, luks->header.key_bytes);
> > -    *masterkeylen = luks->header.key_bytes;
> > -
> >      for (i = 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
> >          rv = qcrypto_block_luks_load_key(block,
> > -                                         &luks->header.key_slots[i],
> > +                                         i,
> >                                           password,
> > -                                         cipheralg,
> > -                                         ciphermode,
> > -                                         hash,
> > -                                         ivalg,
> > -                                         ivcipheralg,
> > -                                         ivhash,
> > -                                         *masterkey,
> > -                                         *masterkeylen,
> > +                                         masterkey,
> >                                           readfunc,
> >                                           opaque,
> >                                           errp);
> > @@ -620,11 +616,7 @@ qcrypto_block_luks_find_key(QCryptoBlock *block,
> >      }
> >  
> >      error_setg(errp, "Invalid password, cannot unlock any keyslot");
> > -
> >   error:
> > -    g_free(*masterkey);
> > -    *masterkey = NULL;
> > -    *masterkeylen = 0;
> >      return -1;
> >  }
> >  
> > @@ -639,21 +631,15 @@ qcrypto_block_luks_open(QCryptoBlock *block,
> >                          size_t n_threads,
> >                          Error **errp)
> >  {
> > -    QCryptoBlockLUKS *luks;
> > +    QCryptoBlockLUKS *luks = NULL;
> >      Error *local_err = NULL;
> >      int ret = 0;
> >      size_t i;
> >      ssize_t rv;
> >      uint8_t *masterkey = NULL;
> > -    size_t masterkeylen;
> >      char *ivgen_name, *ivhash_name;
> > -    QCryptoCipherMode ciphermode;
> > -    QCryptoCipherAlgorithm cipheralg;
> > -    QCryptoIVGenAlgorithm ivalg;
> > -    QCryptoCipherAlgorithm ivcipheralg;
> > -    QCryptoHashAlgorithm hash;
> > -    QCryptoHashAlgorithm ivhash;
> >      char *password = NULL;
> > +    char *cipher_mode = NULL;
> >  
> >      if (!(flags & QCRYPTO_BLOCK_OPEN_NO_IO)) {
> >          if (!options->u.luks.key_secret) {
> > @@ -710,6 +696,8 @@ qcrypto_block_luks_open(QCryptoBlock *block,
> >          goto fail;
> >      }
> >  
> > +    cipher_mode = g_strdup(luks->header.cipher_mode);
> > +
> >      /*
> >       * The cipher_mode header contains a string that we have
> >       * to further parse, of the format
> > @@ -718,7 +706,7 @@ qcrypto_block_luks_open(QCryptoBlock *block,
> >       *
> >       * eg  cbc-essiv:sha256, cbc-plain64
> >       */
> > -    ivgen_name = strchr(luks->header.cipher_mode, '-');
> > +    ivgen_name = strchr(cipher_mode, '-');
> >      if (!ivgen_name) {
> >          ret = -EINVAL;
> >          error_setg(errp, "Unexpected cipher mode string format %s",
> > @@ -730,13 +718,13 @@ qcrypto_block_luks_open(QCryptoBlock *block,
> >  
> >      ivhash_name = strchr(ivgen_name, ':');
> >      if (!ivhash_name) {
> > -        ivhash = 0;
> > +        luks->ivgen_hash_alg = 0;
> >      } else {
> >          *ivhash_name = '\0';
> >          ivhash_name++;
> >  
> > -        ivhash = qcrypto_block_luks_hash_name_lookup(ivhash_name,
> > -                                                     &local_err);
> > +        luks->ivgen_hash_alg = qcrypto_block_luks_hash_name_lookup(ivhash_name,
> > +                                                                   &local_err);
> >          if (local_err) {
> >              ret = -ENOTSUP;
> >              error_propagate(errp, local_err);
> > @@ -744,25 +732,27 @@ qcrypto_block_luks_open(QCryptoBlock *block,
> >          }
> >      }
> >  
> > -    ciphermode = qcrypto_block_luks_cipher_mode_lookup(luks->header.cipher_mode,
> > -                                                       &local_err);
> > +    luks->cipher_mode = qcrypto_block_luks_cipher_mode_lookup(cipher_mode,
> > +                                                              &local_err);
> >      if (local_err) {
> >          ret = -ENOTSUP;
> >          error_propagate(errp, local_err);
> >          goto fail;
> >      }
> >  
> > -    cipheralg = qcrypto_block_luks_cipher_name_lookup(luks->header.cipher_name,
> > -                                                      ciphermode,
> > -                                                      luks->header.key_bytes,
> > -                                                      &local_err);
> > +    luks->cipher_alg =
> > +            qcrypto_block_luks_cipher_name_lookup(luks->header.cipher_name,
> > +                                                  luks->cipher_mode,
> > +                                                  luks->header.key_bytes,
> > +                                                  &local_err);
> >      if (local_err) {
> >          ret = -ENOTSUP;
> >          error_propagate(errp, local_err);
> >          goto fail;
> >      }
> >  
> > -    hash = qcrypto_block_luks_hash_name_lookup(luks->header.hash_spec,
> > +    luks->hash_alg =
> > +            qcrypto_block_luks_hash_name_lookup(luks->header.hash_spec,
> >                                                 &local_err);
> >      if (local_err) {
> >          ret = -ENOTSUP;
> > @@ -770,23 +760,24 @@ qcrypto_block_luks_open(QCryptoBlock *block,
> >          goto fail;
> >      }
> >  
> > -    ivalg = qcrypto_block_luks_ivgen_name_lookup(ivgen_name,
> > -                                                 &local_err);
> > +    luks->ivgen_alg = qcrypto_block_luks_ivgen_name_lookup(ivgen_name,
> > +                                                           &local_err);
> >      if (local_err) {
> >          ret = -ENOTSUP;
> >          error_propagate(errp, local_err);
> >          goto fail;
> >      }
> >  
> > -    if (ivalg == QCRYPTO_IVGEN_ALG_ESSIV) {
> > +    if (luks->ivgen_alg == QCRYPTO_IVGEN_ALG_ESSIV) {
> >          if (!ivhash_name) {
> >              ret = -EINVAL;
> >              error_setg(errp, "Missing IV generator hash specification");
> >              goto fail;
> >          }
> > -        ivcipheralg = qcrypto_block_luks_essiv_cipher(cipheralg,
> > -                                                      ivhash,
> > -                                                      &local_err);
> > +        luks->ivgen_cipher_alg =
> > +                qcrypto_block_luks_essiv_cipher(luks->cipher_alg,
> > +                                                luks->ivgen_hash_alg,
> > +                                                &local_err);
> >          if (local_err) {
> >              ret = -ENOTSUP;
> >              error_propagate(errp, local_err);
> > @@ -800,21 +791,25 @@ qcrypto_block_luks_open(QCryptoBlock *block,
> >           * ignore hash names with these ivgens rather than report
> >           * an error about the invalid usage
> >           */
> > -        ivcipheralg = cipheralg;
> > +        luks->ivgen_cipher_alg = luks->cipher_alg;
> >      }
> >  
> > +
> > +    g_free(cipher_mode);
> > +    cipher_mode = NULL;
> > +    ivgen_name = NULL;
> > +    ivhash_name = NULL;
> > +
> >      if (!(flags & QCRYPTO_BLOCK_OPEN_NO_IO)) {
> >          /* Try to find which key slot our password is valid for
> >           * and unlock the master key from that slot.
> >           */
> > +
> > +        masterkey = g_new0(uint8_t, masterkeylen(luks));
> > +
> >          if (qcrypto_block_luks_find_key(block,
> >                                          password,
> > -                                        cipheralg, ciphermode,
> > -                                        hash,
> > -                                        ivalg,
> > -                                        ivcipheralg,
> > -                                        ivhash,
> > -                                        &masterkey, &masterkeylen,
> > +                                        masterkey,
> >                                          readfunc, opaque,
> >                                          errp) < 0) {
> >              ret = -EACCES;
> > @@ -824,21 +819,24 @@ qcrypto_block_luks_open(QCryptoBlock *block,
> >          /* We have a valid master key now, so can setup the
> >           * block device payload decryption objects
> >           */
> > -        block->kdfhash = hash;
> > -        block->niv = qcrypto_cipher_get_iv_len(cipheralg,
> > -                                               ciphermode);
> > -        block->ivgen = qcrypto_ivgen_new(ivalg,
> > -                                         ivcipheralg,
> > -                                         ivhash,
> > -                                         masterkey, masterkeylen,
> > +        block->kdfhash = luks->hash_alg;
> > +        block->niv = qcrypto_cipher_get_iv_len(luks->cipher_alg,
> > +                                               luks->cipher_mode);
> > +
> > +        block->ivgen = qcrypto_ivgen_new(luks->ivgen_alg,
> > +                                         luks->ivgen_cipher_alg,
> > +                                         luks->ivgen_hash_alg,
> > +                                         masterkey, masterkeylen(luks),
> >                                           errp);
> >          if (!block->ivgen) {
> >              ret = -ENOTSUP;
> >              goto fail;
> >          }
> >  
> > -        ret = qcrypto_block_init_cipher(block, cipheralg, ciphermode,
> > -                                        masterkey, masterkeylen, n_threads,
> > +        ret = qcrypto_block_init_cipher(block, luks->cipher_alg,
> > +                                        luks->cipher_mode,
> > +                                        masterkey, masterkeylen(luks),
> > +                                        n_threads,
> >                                          errp);
> >          if (ret < 0) {
> >              ret = -ENOTSUP;
> > @@ -850,12 +848,6 @@ qcrypto_block_luks_open(QCryptoBlock *block,
> >      block->payload_offset = luks->header.payload_offset *
> >          block->sector_size;
> >  
> > -    luks->cipher_alg = cipheralg;
> > -    luks->cipher_mode = ciphermode;
> > -    luks->ivgen_alg = ivalg;
> > -    luks->ivgen_hash_alg = ivhash;
> > -    luks->hash_alg = hash;
> > -
> >      g_free(masterkey);
> >      g_free(password);
> >  
> > @@ -910,7 +902,7 @@ qcrypto_block_luks_create(QCryptoBlock *block,
> >  
> >      memcpy(&luks_opts, &options->u.luks, sizeof(luks_opts));
> >      if (!luks_opts.has_iter_time) {
> > -        luks_opts.iter_time = 2000;
> > +        luks_opts.iter_time = QCRYPTO_BLOCK_LUKS_DEFAULT_ITER_TIME;
> >      }
> >      if (!luks_opts.has_cipher_alg) {
> >          luks_opts.cipher_alg = QCRYPTO_CIPHER_ALG_AES_256;
> > @@ -930,6 +922,17 @@ qcrypto_block_luks_create(QCryptoBlock *block,
> >              luks_opts.has_ivgen_hash_alg = true;
> >          }
> >      }
> > +
> > +    luks = g_new0(QCryptoBlockLUKS, 1);
> > +    block->opaque = luks;
> > +
> > +    luks->cipher_alg = luks_opts.cipher_alg;
> > +    luks->cipher_mode = luks_opts.cipher_mode;
> > +    luks->ivgen_alg = luks_opts.ivgen_alg;
> > +    luks->ivgen_hash_alg = luks_opts.ivgen_hash_alg;
> > +    luks->hash_alg = luks_opts.hash_alg;
> > +
> > +
> >      /* Note we're allowing ivgen_hash_alg to be set even for
> >       * non-essiv iv generators that don't need a hash. It will
> >       * be silently ignored, for compatibility with dm-crypt */
> > @@ -944,8 +947,6 @@ qcrypto_block_luks_create(QCryptoBlock *block,
> >          return -1;
> >      }
> >  
> > -    luks = g_new0(QCryptoBlockLUKS, 1);
> > -    block->opaque = luks;
> >  
> >      memcpy(luks->header.magic, qcrypto_block_luks_magic,
> >             QCRYPTO_BLOCK_LUKS_MAGIC_LEN);
> > @@ -1003,6 +1004,8 @@ qcrypto_block_luks_create(QCryptoBlock *block,
> >          ivcipheralg = luks_opts.cipher_alg;
> >      }
> >  
> > +    luks->ivgen_cipher_alg = ivcipheralg;
> > +
> >      strcpy(luks->header.cipher_name, cipher_alg);
> >      strcpy(luks->header.cipher_mode, cipher_mode_spec);
> >      strcpy(luks->header.hash_spec, hash_alg);
> > @@ -1304,12 +1307,6 @@ qcrypto_block_luks_create(QCryptoBlock *block,
> >          goto error;
> >      }
> >  
> > -    luks->cipher_alg = luks_opts.cipher_alg;
> > -    luks->cipher_mode = luks_opts.cipher_mode;
> > -    luks->ivgen_alg = luks_opts.ivgen_alg;
> > -    luks->ivgen_hash_alg = luks_opts.ivgen_hash_alg;
> > -    luks->hash_alg = luks_opts.hash_alg;
> > -
> >      memset(masterkey, 0, luks->header.key_bytes);
> >      g_free(masterkey);
> >      memset(slotkey, 0, luks->header.key_bytes);
> > 



