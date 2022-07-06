Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205045686C8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 13:40:05 +0200 (CEST)
Received: from localhost ([::1]:38624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o93Nz-0008Ca-NQ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 07:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o93Jf-0005ZB-DK
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 07:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o93JX-00026s-7v
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 07:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657107325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zjl6OISXQwTwnY1Kf0wve+kUQ7mVBtgEB8pdrywtfTA=;
 b=NCcnG5XwnRrdyZokm8wM/Hr3Exvd5FDL1fJ9QL4f3g8QHvk2Nn7ZDYDtXqaANsZhjFKuL1
 N6Ei/fZ9mzyhE/xewXfUMe5wm/RSV+KA7vuoHHb+XdmTsTnQL9pSM0UfGIwOX47oDzphTD
 FyWbVRmQLNXztK3eeIJI2udqdy+AUVQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-TsZwEb8dNCGGYGtc2Gxx8g-1; Wed, 06 Jul 2022 07:35:24 -0400
X-MC-Unique: TsZwEb8dNCGGYGtc2Gxx8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A7151C0782B;
 Wed,  6 Jul 2022 11:35:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B93E740CFD0B;
 Wed,  6 Jul 2022 11:35:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B564521E691E; Wed,  6 Jul 2022 13:35:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,  hreitz@redhat.com,  peter.maydell@linaro.org
Subject: Re: [RFC PATCH] qobject: Rewrite implementation of QDict for
 in-order traversal
References: <20220705095421.2455041-1-armbru@redhat.com>
Date: Wed, 06 Jul 2022 13:35:22 +0200
In-Reply-To: <20220705095421.2455041-1-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 5 Jul 2022 11:54:21 +0200")
Message-ID: <87wncqmq2t.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> QDict is implemented as a simple hash table of fixed size.  Observe:
>
> * Slow for large n.  Not sure this matters.
>
> * A QDict with n entries takes 4120 + n * 32 bytes on my box.  Wastes
>   space for small n, which is a common case.
>
> * Order of traversal depends on the hash function and on insertion
>   order, because it iterates first over buckets, then collision
>   chains.
>
> * Special code ensures qdict_size() takes constant time.
>
> Replace the hash table by a linked list.  Observe:
>
> * Even slower for large n.  Might be bad enough to matter.
>
> * A QDict with n entries takes 32 + n * 24 bytes.
>
> * Traversal is in insertion order.
>
> * qdict_size() is linear in the number of entries.
>
> This is an experiment.  Do not commit to master as is.

Forgot to mention: see also

        Subject: Re: [PULL 14/15] qdev: Base object creation on QDict rather than QemuOpts
        Message-ID: <87wnctzdl9.fsf@pond.sub.org>
        https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg00358.html

> The change of traversal order affects expected test output.  I updated
> only the tests covered by "make check" so far.  I expect some more to
> hide under tests/qemu-iotests/.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/qmp/qdict.h              |  15 +-
>  qobject/qdict.c                       | 104 +--
>  tests/unit/check-qdict.c              |   2 +-
>  tests/unit/check-qobject.c            |   2 +-
>  tests/qemu-iotests/043.out            |  22 +-
>  tests/qemu-iotests/060.out            |  16 +-
>  tests/qemu-iotests/061.out            |  52 +-
>  tests/qemu-iotests/071.out            |   4 +-
>  tests/qemu-iotests/099.out            |   4 +-
>  tests/qemu-iotests/108.out            |  14 +-
>  tests/qemu-iotests/117.out            |   2 +-
>  tests/qemu-iotests/120.out            |   2 +-
>  tests/qemu-iotests/127.out            |  20 +-
>  tests/qemu-iotests/140.out            |   4 +-
>  tests/qemu-iotests/141.out            |  76 +--
>  tests/qemu-iotests/143.out            |   2 +-
>  tests/qemu-iotests/156.out            |  20 +-
>  tests/qemu-iotests/161.out            |  28 +-
>  tests/qemu-iotests/176.out            |  16 +-
>  tests/qemu-iotests/184.out            | 170 ++---
>  tests/qemu-iotests/186.out            |  82 +--
>  tests/qemu-iotests/190.out            |   4 +-
>  tests/qemu-iotests/191.out            | 868 +++++++++++++-------------
>  tests/qemu-iotests/195.out            |   4 +-
>  tests/qemu-iotests/229.out            |  14 +-
>  tests/qemu-iotests/244.out            |  12 +-
>  tests/qemu-iotests/249.out            |  18 +-
>  tests/qemu-iotests/tests/qsd-jobs.out |   8 +-
>  28 files changed, 776 insertions(+), 809 deletions(-)
>
> diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
> index 82e90fc072..cf5c602286 100644
> --- a/include/qapi/qmp/qdict.h
> +++ b/include/qapi/qmp/qdict.h
> @@ -16,8 +16,7 @@
>  #include "qapi/qmp/qobject.h"
>  #include "qemu/queue.h"
>  
> -#define QDICT_BUCKET_MAX 512
> -
> +#if 0
>  typedef struct QDictEntry {
>      char *key;
>      QObject *value;
> @@ -29,6 +28,18 @@ struct QDict {
>      size_t size;
>      QLIST_HEAD(,QDictEntry) table[QDICT_BUCKET_MAX];
>  };
> +#else
> +typedef struct QDictEntry {
> +    char *key;
> +    QObject *value;
> +    QSIMPLEQ_ENTRY(QDictEntry) next;
> +} QDictEntry;
> +
> +struct QDict {
> +    struct QObjectBase_ base;
> +    QSIMPLEQ_HEAD(, QDictEntry) entries;
> +};
> +#endif
>  
>  void qdict_unref(QDict *q);
>  
> diff --git a/qobject/qdict.c b/qobject/qdict.c
> index 8faff230d3..444608cbc4 100644
> --- a/qobject/qdict.c
> +++ b/qobject/qdict.c
> @@ -29,27 +29,11 @@ QDict *qdict_new(void)
>  
>      qdict = g_malloc0(sizeof(*qdict));
>      qobject_init(QOBJECT(qdict), QTYPE_QDICT);
> +    QSIMPLEQ_INIT(&qdict->entries);
>  
>      return qdict;
>  }
>  
> -/**
> - * tdb_hash(): based on the hash algorithm from gdbm, via tdb
> - * (from module-init-tools)
> - */
> -static unsigned int tdb_hash(const char *name)
> -{
> -    unsigned value;    /* Used to compute the hash value.  */
> -    unsigned   i;      /* Used to cycle through random values. */
> -
> -    /* Set the initial value from the key size. */
> -    for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++) {
> -        value = (value + (((const unsigned char *)name)[i] << (i * 5 % 24)));
> -    }
> -
> -    return (1103515243 * value + 12345);
> -}
> -
>  /**
>   * alloc_entry(): allocate a new QDictEntry
>   */
> @@ -88,15 +72,14 @@ const char *qdict_entry_key(const QDictEntry *entry)
>  /**
>   * qdict_find(): List lookup function
>   */
> -static QDictEntry *qdict_find(const QDict *qdict,
> -                              const char *key, unsigned int bucket)
> +static QDictEntry *qdict_find(const QDict *qdict, const char *key)
>  {
>      QDictEntry *entry;
>  
> -    QLIST_FOREACH(entry, &qdict->table[bucket], next)
> -        if (!strcmp(entry->key, key)) {
> +    QSIMPLEQ_FOREACH(entry, &qdict->entries, next) {
> +        if (!strcmp(key, entry->key))
>              return entry;
> -        }
> +    }
>  
>      return NULL;
>  }
> @@ -114,11 +97,8 @@ static QDictEntry *qdict_find(const QDict *qdict,
>   */
>  void qdict_put_obj(QDict *qdict, const char *key, QObject *value)
>  {
> -    unsigned int bucket;
> -    QDictEntry *entry;
> +    QDictEntry *entry = qdict_find(qdict, key);
>  
> -    bucket = tdb_hash(key) % QDICT_BUCKET_MAX;
> -    entry = qdict_find(qdict, key, bucket);
>      if (entry) {
>          /* replace key's value */
>          qobject_unref(entry->value);
> @@ -126,8 +106,7 @@ void qdict_put_obj(QDict *qdict, const char *key, QObject *value)
>      } else {
>          /* allocate a new entry */
>          entry = alloc_entry(key, value);
> -        QLIST_INSERT_HEAD(&qdict->table[bucket], entry, next);
> -        qdict->size++;
> +        QSIMPLEQ_INSERT_TAIL(&qdict->entries, entry, next);
>      }
>  }
>  
> @@ -161,8 +140,8 @@ QObject *qdict_get(const QDict *qdict, const char *key)
>  {
>      QDictEntry *entry;
>  
> -    entry = qdict_find(qdict, key, tdb_hash(key) % QDICT_BUCKET_MAX);
> -    return (entry == NULL ? NULL : entry->value);
> +    entry = qdict_find(qdict, key);
> +    return entry ? entry->value : NULL;
>  }
>  
>  /**
> @@ -172,8 +151,7 @@ QObject *qdict_get(const QDict *qdict, const char *key)
>   */
>  int qdict_haskey(const QDict *qdict, const char *key)
>  {
> -    unsigned int bucket = tdb_hash(key) % QDICT_BUCKET_MAX;
> -    return (qdict_find(qdict, key, bucket) == NULL ? 0 : 1);
> +    return qdict_find(qdict, key) != NULL;
>  }
>  
>  /**
> @@ -181,7 +159,14 @@ int qdict_haskey(const QDict *qdict, const char *key)
>   */
>  size_t qdict_size(const QDict *qdict)
>  {
> -    return qdict->size;
> +    QDictEntry *entry;
> +    size_t sz = 0;
> +
> +    QSIMPLEQ_FOREACH(entry, &qdict->entries, next) {
> +        sz++;
> +    }
> +
> +    return sz;
>  }
>  
>  /**
> @@ -301,25 +286,13 @@ const char *qdict_get_try_str(const QDict *qdict, const char *key)
>      return qstr ? qstring_get_str(qstr) : NULL;
>  }
>  
> -static QDictEntry *qdict_next_entry(const QDict *qdict, int first_bucket)
> -{
> -    int i;
> -
> -    for (i = first_bucket; i < QDICT_BUCKET_MAX; i++) {
> -        if (!QLIST_EMPTY(&qdict->table[i])) {
> -            return QLIST_FIRST(&qdict->table[i]);
> -        }
> -    }
> -
> -    return NULL;
> -}
> -
>  /**
>   * qdict_first(): Return first qdict entry for iteration.
>   */
>  const QDictEntry *qdict_first(const QDict *qdict)
>  {
> -    return qdict_next_entry(qdict, 0);
> +    return QSIMPLEQ_FIRST(&qdict->entries);
> +
>  }
>  
>  /**
> @@ -327,15 +300,7 @@ const QDictEntry *qdict_first(const QDict *qdict)
>   */
>  const QDictEntry *qdict_next(const QDict *qdict, const QDictEntry *entry)
>  {
> -    QDictEntry *ret;
> -
> -    ret = QLIST_NEXT(entry, next);
> -    if (!ret) {
> -        unsigned int bucket = tdb_hash(entry->key) % QDICT_BUCKET_MAX;
> -        ret = qdict_next_entry(qdict, bucket + 1);
> -    }
> -
> -    return ret;
> +    return QSIMPLEQ_NEXT(entry, next);
>  }
>  
>  /**
> @@ -346,14 +311,11 @@ QDict *qdict_clone_shallow(const QDict *src)
>  {
>      QDict *dest;
>      QDictEntry *entry;
> -    int i;
>  
>      dest = qdict_new();
>  
> -    for (i = 0; i < QDICT_BUCKET_MAX; i++) {
> -        QLIST_FOREACH(entry, &src->table[i], next) {
> -            qdict_put_obj(dest, entry->key, qobject_ref(entry->value));
> -        }
> +    QSIMPLEQ_FOREACH(entry, &src->entries, next) {
> +        qdict_put_obj(dest, entry->key, qobject_ref(entry->value));
>      }
>  
>      return dest;
> @@ -380,13 +342,11 @@ static void qentry_destroy(QDictEntry *e)
>   */
>  void qdict_del(QDict *qdict, const char *key)
>  {
> -    QDictEntry *entry;
> +    QDictEntry *entry = qdict_find(qdict, key);
>  
> -    entry = qdict_find(qdict, key, tdb_hash(key) % QDICT_BUCKET_MAX);
>      if (entry) {
> -        QLIST_REMOVE(entry, next);
> +        QSIMPLEQ_REMOVE(&qdict->entries, entry, QDictEntry, next);
>          qentry_destroy(entry);
> -        qdict->size--;
>      }
>  }
>  
> @@ -424,20 +384,16 @@ bool qdict_is_equal(const QObject *x, const QObject *y)
>   */
>  void qdict_destroy_obj(QObject *obj)
>  {
> -    int i;
>      QDict *qdict;
>  
>      assert(obj != NULL);
>      qdict = qobject_to(QDict, obj);
>  
> -    for (i = 0; i < QDICT_BUCKET_MAX; i++) {
> -        QDictEntry *entry = QLIST_FIRST(&qdict->table[i]);
> -        while (entry) {
> -            QDictEntry *tmp = QLIST_NEXT(entry, next);
> -            QLIST_REMOVE(entry, next);
> -            qentry_destroy(entry);
> -            entry = tmp;
> -        }
> +    while (!QSIMPLEQ_EMPTY(&qdict->entries)) {
> +        QDictEntry *entry = QSIMPLEQ_FIRST(&qdict->entries);
> +
> +        QSIMPLEQ_REMOVE_HEAD(&qdict->entries, next);
> +        qentry_destroy(entry);
>      }
>  
>      g_free(qdict);
> diff --git a/tests/unit/check-qdict.c b/tests/unit/check-qdict.c
> index b5efa859b0..d7d3df5efb 100644
> --- a/tests/unit/check-qdict.c
> +++ b/tests/unit/check-qdict.c
> @@ -47,7 +47,7 @@ static void qdict_put_obj_test(void)
>      qdict_put_int(qdict, "", num);
>  
>      g_assert(qdict_size(qdict) == 1);
> -    ent = QLIST_FIRST(&qdict->table[12345 % QDICT_BUCKET_MAX]);
> +    ent = QSIMPLEQ_FIRST(&qdict->entries);
>      qn = qobject_to(QNum, ent->value);
>      g_assert_cmpint(qnum_get_int(qn), ==, num);
>  
> diff --git a/tests/unit/check-qobject.c b/tests/unit/check-qobject.c
> index 022b7c74fe..0416762f80 100644
> --- a/tests/unit/check-qobject.c
> +++ b/tests/unit/check-qobject.c
> @@ -192,10 +192,10 @@ static void qobject_is_equal_dict_test(void)
>      qdict_put_int(dict_0, "baz", 3);
>      qdict_put_null(dict_0, "null");
>  
> -    qdict_put_int(dict_1, "f.o", 1);
>      qdict_put_int(dict_1, "bar", 2);
>      qdict_put_int(dict_1, "baz", 3);
>      qdict_put_null(dict_1, "null");
> +    qdict_put_int(dict_1, "f.o", 1);
>  
>      qdict_put_int(dict_different_key, "F.o", 1);
>      qdict_put_int(dict_different_key, "bar", 2);
> diff --git a/tests/qemu-iotests/043.out b/tests/qemu-iotests/043.out
> index 63ecb21816..d8fcff24e9 100644
> --- a/tests/qemu-iotests/043.out
> +++ b/tests/qemu-iotests/043.out
> @@ -40,29 +40,29 @@ cluster_size: 65536
>  == finite chain of length 3 (json) ==
>  [
>      {
> -        "virtual-size": 134217728,
>          "filename": "TEST_DIR/t.IMGFMT",
> -        "cluster-size": 65536,
>          "format": "IMGFMT",
> -        "full-backing-filename": "TEST_DIR/t.IMGFMT.2.base",
> +        "dirty-flag": false,
> +        "virtual-size": 134217728,
> +        "cluster-size": 65536,
>          "backing-filename": "TEST_DIR/t.IMGFMT.2.base",
> -        "dirty-flag": false
> +        "full-backing-filename": "TEST_DIR/t.IMGFMT.2.base",
>      },
>      {
> -        "virtual-size": 134217728,
>          "filename": "TEST_DIR/t.IMGFMT.2.base",
> -        "cluster-size": 65536,
>          "format": "IMGFMT",
> -        "full-backing-filename": "TEST_DIR/t.IMGFMT.1.base",
> +        "dirty-flag": false,
> +        "virtual-size": 134217728,
> +        "cluster-size": 65536,
>          "backing-filename": "TEST_DIR/t.IMGFMT.1.base",
> -        "dirty-flag": false
> +        "full-backing-filename": "TEST_DIR/t.IMGFMT.1.base",
>      },
>      {
> -        "virtual-size": 134217728,
>          "filename": "TEST_DIR/t.IMGFMT.1.base",
> -        "cluster-size": 65536,
>          "format": "IMGFMT",
> -        "dirty-flag": false
> +        "dirty-flag": false,
> +        "virtual-size": 134217728,
> +        "cluster-size": 65536,
>      }
>  ]
>  *** done
> diff --git a/tests/qemu-iotests/060.out b/tests/qemu-iotests/060.out
> index 329977d9b9..f654a6579c 100644
> --- a/tests/qemu-iotests/060.out
> +++ b/tests/qemu-iotests/060.out
> @@ -17,11 +17,11 @@ virtual size: 64 MiB (67108864 bytes)
>  cluster_size: 65536
>  Format specific information:
>      compat: 1.1
> -    compression type: COMPRESSION_TYPE
> -    lazy refcounts: false
> -    refcount bits: 16
> -    corrupt: true
>      extended l2: false
> +    lazy refcounts: false
> +    corrupt: true
> +    refcount bits: 16
> +    compression type: COMPRESSION_TYPE
>  qemu-io: can't open device TEST_DIR/t.IMGFMT: IMGFMT: Image is corrupt; cannot be opened read/write
>  no file open, try 'help open'
>  read 512/512 bytes at offset 0
> @@ -418,11 +418,11 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
>  qcow2: Marking image as corrupt: Preventing invalid write on metadata (overlaps with refcount table); further corruption events will be suppressed
>  QMP_VERSION
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_IMAGE_CORRUPTED", "data": {"device": "none0", "msg": "Preventing invalid write on metadata (overlaps with refcount table)", "offset": 65536, "node-name": "drive", "fatal": true, "size": 65536}}
> +{"event": "BLOCK_IMAGE_CORRUPTED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"device": "none0", "node-name": "drive", "msg": "Preventing invalid write on metadata (overlaps with refcount table)", "offset": 65536, "size": 65536, "fatal": true}}
>  write failed: Input/output error
>  {"return": ""}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  
>  === Testing incoming inactive corrupted image ===
>  
> @@ -430,10 +430,10 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
>  QMP_VERSION
>  {"return": {}}
>  qcow2: Image is corrupt: L2 table offset 0x2a2a2a00 unaligned (L1 index: 0); further non-fatal corruption events will be suppressed
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_IMAGE_CORRUPTED", "data": {"device": "", "msg": "L2 table offset 0x2a2a2a00 unaligned (L1 index: 0)", "node-name": "drive", "fatal": false}}
> +{"event": "BLOCK_IMAGE_CORRUPTED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"device": "", "node-name": "drive", "msg": "L2 table offset 0x2a2a2a00 unaligned (L1 index: 0)", "fatal": false}}
>  {"return": ""}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  
>      corrupt: false
>  *** done
> diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
> index 139fc68177..6a05d67378 100644
> --- a/tests/qemu-iotests/061.out
> +++ b/tests/qemu-iotests/061.out
> @@ -497,7 +497,7 @@ wrote 65536/65536 bytes at offset 2147483648
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  wrote 65536/65536 bytes at offset 3221225472
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -    (0.00/100%)
>     (12.50/100%)
>     (25.00/100%)
>     (37.50/100%)
>     (50.00/100%)
>     (62.50/100%)
>     (75.00/100%)
>     (87.50/100%)
>     (100.00/100%)
>     (100.00/100%)
> +    (0.00/100%)
>     (12.50/100%)
>     (25.00/100%)
>     (37.50/100%)
>     (50.00/100%)
>     (62.50/100%)
>     (75.00/100%)
>     (87.50/100%)
>     (100.00/100%)
>     (100.00/100%)
>  No errors were found on the image.
>  
>  === Testing progress report with snapshot ===
> @@ -512,7 +512,7 @@ wrote 65536/65536 bytes at offset 2147483648
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  wrote 65536/65536 bytes at offset 3221225472
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -    (0.00/100%)
>     (6.25/100%)
>     (12.50/100%)
>     (18.75/100%)
>     (25.00/100%)
>     (31.25/100%)
>     (37.50/100%)
>     (43.75/100%)
>     (50.00/100%)
>     (56.25/100%)
>     (62.50/100%)
>     (68.75/100%)
>     (75.00/100%)
>     (81.25/100%)
>     (87.50/100%)
>     (93.75/100%)
>     (100.00/100%)
>     (100.00/100%)
> +    (0.00/100%)
>     (6.25/100%)
>     (12.50/100%)
>     (18.75/100%)
>     (25.00/100%)
>     (31.25/100%)
>     (37.50/100%)
>     (43.75/100%)
>     (50.00/100%)
>     (56.25/100%)
>     (62.50/100%)
>     (68.75/100%)
>     (75.00/100%)
>     (81.25/100%)
>     (87.50/100%)
>     (93.75/100%)
>     (100.00/100%)
>     (100.00/100%)
>  No errors were found on the image.
>  
>  === Testing version downgrade with external data file ===
> @@ -525,13 +525,13 @@ virtual size: 64 MiB (67108864 bytes)
>  cluster_size: 65536
>  Format specific information:
>      compat: 1.1
> -    compression type: COMPRESSION_TYPE
> -    lazy refcounts: false
> -    refcount bits: 16
>      data file: TEST_DIR/t.IMGFMT.data
>      data file raw: false
> -    corrupt: false
>      extended l2: false
> +    lazy refcounts: false
> +    corrupt: false
> +    refcount bits: 16
> +    compression type: COMPRESSION_TYPE
>  No errors were found on the image.
>  
>  === Testing version downgrade with extended L2 entries ===
> @@ -552,13 +552,13 @@ virtual size: 64 MiB (67108864 bytes)
>  cluster_size: 65536
>  Format specific information:
>      compat: 1.1
> -    compression type: COMPRESSION_TYPE
> -    lazy refcounts: false
> -    refcount bits: 16
>      data file: foo
>      data file raw: false
> -    corrupt: false
>      extended l2: false
> +    lazy refcounts: false
> +    corrupt: false
> +    refcount bits: 16
> +    compression type: COMPRESSION_TYPE
>  
>  qemu-img: Could not open 'TEST_DIR/t.IMGFMT': 'data-file' is required for this image
>  image: TEST_DIR/t.IMGFMT
> @@ -567,12 +567,12 @@ virtual size: 64 MiB (67108864 bytes)
>  cluster_size: 65536
>  Format specific information:
>      compat: 1.1
> -    compression type: COMPRESSION_TYPE
> -    lazy refcounts: false
> -    refcount bits: 16
>      data file raw: false
> -    corrupt: false
>      extended l2: false
> +    lazy refcounts: false
> +    corrupt: false
> +    refcount bits: 16
> +    compression type: COMPRESSION_TYPE
>  
>  === Clearing and setting data-file-raw ===
>  
> @@ -583,13 +583,13 @@ virtual size: 64 MiB (67108864 bytes)
>  cluster_size: 65536
>  Format specific information:
>      compat: 1.1
> -    compression type: COMPRESSION_TYPE
> -    lazy refcounts: false
> -    refcount bits: 16
>      data file: TEST_DIR/t.IMGFMT.data
>      data file raw: true
> -    corrupt: false
>      extended l2: false
> +    lazy refcounts: false
> +    corrupt: false
> +    refcount bits: 16
> +    compression type: COMPRESSION_TYPE
>  No errors were found on the image.
>  image: TEST_DIR/t.IMGFMT
>  file format: IMGFMT
> @@ -597,13 +597,13 @@ virtual size: 64 MiB (67108864 bytes)
>  cluster_size: 65536
>  Format specific information:
>      compat: 1.1
> -    compression type: COMPRESSION_TYPE
> -    lazy refcounts: false
> -    refcount bits: 16
>      data file: TEST_DIR/t.IMGFMT.data
>      data file raw: false
> -    corrupt: false
>      extended l2: false
> +    lazy refcounts: false
> +    corrupt: false
> +    refcount bits: 16
> +    compression type: COMPRESSION_TYPE
>  No errors were found on the image.
>  qemu-img: data-file-raw cannot be set on existing images
>  image: TEST_DIR/t.IMGFMT
> @@ -612,12 +612,12 @@ virtual size: 64 MiB (67108864 bytes)
>  cluster_size: 65536
>  Format specific information:
>      compat: 1.1
> -    compression type: COMPRESSION_TYPE
> -    lazy refcounts: false
> -    refcount bits: 16
>      data file: TEST_DIR/t.IMGFMT.data
>      data file raw: false
> -    corrupt: false
>      extended l2: false
> +    lazy refcounts: false
> +    corrupt: false
> +    refcount bits: 16
> +    compression type: COMPRESSION_TYPE
>  No errors were found on the image.
>  *** done
> diff --git a/tests/qemu-iotests/071.out b/tests/qemu-iotests/071.out
> index bca0c02f5c..ff00da1ad1 100644
> --- a/tests/qemu-iotests/071.out
> +++ b/tests/qemu-iotests/071.out
> @@ -46,7 +46,7 @@ QMP_VERSION
>  read failed: Input/output error
>  {"return": ""}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  
>  
>  === Testing blkverify on existing block device ===
> @@ -85,7 +85,7 @@ wrote 512/512 bytes at offset 0
>  read failed: Input/output error
>  {"return": ""}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  QEMU_PROG: Failed to flush the L2 table cache: Input/output error
>  QEMU_PROG: Failed to flush the refcount block cache: Input/output error
>  
> diff --git a/tests/qemu-iotests/099.out b/tests/qemu-iotests/099.out
> index 8cce627529..5726466bc6 100644
> --- a/tests/qemu-iotests/099.out
> +++ b/tests/qemu-iotests/099.out
> @@ -12,11 +12,11 @@ blkverify:TEST_DIR/t.IMGFMT.compare:TEST_DIR/t.IMGFMT
>  
>  === Testing JSON filename for blkdebug ===
>  
> -json:{"driver": "IMGFMT", "file": {"image": {"driver": "file", "filename": "TEST_DIR/t.IMGFMT"}, "driver": "blkdebug", "inject-error.0.event": "l1_update"}}
> +json:{"driver": "IMGFMT", "file": {"driver": "blkdebug", "inject-error.0.event": "l1_update", "image": {"driver": "file", "filename": "TEST_DIR/t.IMGFMT"}}}
>  
>  === Testing indirectly enforced JSON filename ===
>  
> -json:{"driver": "raw", "file": {"test": {"driver": "IMGFMT", "file": {"image": {"driver": "file", "filename": "TEST_DIR/t.IMGFMT"}, "driver": "blkdebug", "inject-error.0.event": "l1_update"}}, "driver": "blkverify", "raw": {"driver": "file", "filename": "TEST_DIR/t.IMGFMT.compare"}}}
> +json:{"driver": "raw", "file": {"driver": "blkverify", "test": {"driver": "IMGFMT", "file": {"driver": "blkdebug", "inject-error.0.event": "l1_update", "image": {"driver": "file", "filename": "TEST_DIR/t.IMGFMT"}}}, "raw": {"driver": "file", "filename": "TEST_DIR/t.IMGFMT.compare"}}}
>  
>  === Testing plain filename for blkdebug ===
>  
> diff --git a/tests/qemu-iotests/108.out b/tests/qemu-iotests/108.out
> index b5401d788d..faaabbcdf3 100644
> --- a/tests/qemu-iotests/108.out
> +++ b/tests/qemu-iotests/108.out
> @@ -163,18 +163,18 @@ OK: Reftable is where we expect it
>                 "size": 67108864,
>                 "cluster-size": 512
>             } } }
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "create"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "create"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "create", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "create", "status": "running"}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "create"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "create"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "create"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "create", "status": "waiting"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "create", "status": "pending"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "create", "status": "concluded"}}
>  { "execute": "job-dismiss", "arguments": { "id": "create" } }
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "create"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "create", "status": "null"}}
>  {"return": {}}
>  { "execute": "quit" }
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  
>  wrote 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> diff --git a/tests/qemu-iotests/117.out b/tests/qemu-iotests/117.out
> index 735ffd25c6..015c971197 100644
> --- a/tests/qemu-iotests/117.out
> +++ b/tests/qemu-iotests/117.out
> @@ -19,7 +19,7 @@ wrote 65536/65536 bytes at offset 0
>  {"return": ""}
>  { 'execute': 'quit' }
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  No errors were found on the image.
>  read 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> diff --git a/tests/qemu-iotests/120.out b/tests/qemu-iotests/120.out
> index 0744c1f136..d677c72599 100644
> --- a/tests/qemu-iotests/120.out
> +++ b/tests/qemu-iotests/120.out
> @@ -6,7 +6,7 @@ wrote 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  {"return": ""}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  read 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  read 65536/65536 bytes at offset 0
> diff --git a/tests/qemu-iotests/127.out b/tests/qemu-iotests/127.out
> index 1685c4850a..863832d162 100644
> --- a/tests/qemu-iotests/127.out
> +++ b/tests/qemu-iotests/127.out
> @@ -14,20 +14,20 @@ wrote 42/42 bytes at offset 0
>             'mode':   'existing',
>             'sync':   'top'
>         } }
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "mirror"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "mirror"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "mirror", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "mirror", "status": "running"}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "mirror"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_READY", "data": {"device": "mirror", "len": 65536, "offset": 65536, "speed": 0, "type": "mirror"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "mirror", "status": "ready"}}
> +{"event": "BLOCK_JOB_READY", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "mirror", "device": "mirror", "len": 65536, "offset": 65536, "speed": 0}}
>  { 'execute': 'block-job-complete',
>         'arguments': { 'device': 'mirror' } }
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "mirror"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "mirror"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "mirror", "len": 65536, "offset": 65536, "speed": 0, "type": "mirror"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "mirror", "status": "waiting"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "mirror", "status": "pending"}}
> +{"event": "BLOCK_JOB_COMPLETED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "mirror", "device": "mirror", "len": 65536, "offset": 65536, "speed": 0}}
>  { 'execute': 'quit' }
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "mirror"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "mirror"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "mirror", "status": "concluded"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "mirror", "status": "null"}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  *** done
> diff --git a/tests/qemu-iotests/140.out b/tests/qemu-iotests/140.out
> index 312f76d5da..586b64b24e 100644
> --- a/tests/qemu-iotests/140.out
> +++ b/tests/qemu-iotests/140.out
> @@ -15,10 +15,10 @@ read 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  { 'execute': 'eject',
>         'arguments': { 'device': 'drv' }}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "drv"}}
> +{"event": "BLOCK_EXPORT_DELETED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "drv"}}
>  qemu-io: can't open device nbd+unix:///drv?socket=SOCK_DIR/nbd: Requested export not available
>  server reported: export 'drv' not present
>  { 'execute': 'quit' }
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  *** done
> diff --git a/tests/qemu-iotests/141.out b/tests/qemu-iotests/141.out
> index 63203d9944..4d8c7b598c 100644
> --- a/tests/qemu-iotests/141.out
> +++ b/tests/qemu-iotests/141.out
> @@ -23,20 +23,20 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/m.
>  'format': 'IMGFMT',
>  'sync': 'none'}}
>  Formatting 'TEST_DIR/o.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.IMGFMT backing_fmt=IMGFMT
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "paused", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "running"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "paused"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "running"}}
>  {'execute': 'blockdev-del',
>            'arguments': {'node-name': 'drv0'}}
>  {"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: node is used as backing hd of 'NODE_NAME'"}}
>  {'execute': 'block-job-cancel',
>            'arguments': {'device': 'job0'}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "job0", "len": 1048576, "offset": 0, "speed": 0, "type": "backup"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "aborting"}}
> +{"event": "BLOCK_JOB_CANCELLED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "backup", "device": "job0", "len": 1048576, "offset": 0, "speed": 0}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "concluded"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "null"}}
>  {'execute': 'blockdev-del',
>            'arguments': {'node-name': 'drv0'}}
>  {"return": {}}
> @@ -59,21 +59,21 @@ Formatting 'TEST_DIR/o.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.
>  'format': 'IMGFMT',
>  'sync': 'none'}}
>  Formatting 'TEST_DIR/o.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.IMGFMT backing_fmt=IMGFMT
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "mirror"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "running"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "ready"}}
> +{"event": "BLOCK_JOB_READY", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "mirror", "device": "job0", "len": 0, "offset": 0, "speed": 0}}
>  {'execute': 'blockdev-del',
>            'arguments': {'node-name': 'drv0'}}
>  {"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: block device is in use by block job: mirror"}}
>  {'execute': 'block-job-cancel',
>            'arguments': {'device': 'job0'}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "mirror"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "waiting"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "pending"}}
> +{"event": "BLOCK_JOB_COMPLETED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "mirror", "device": "job0", "len": 0, "offset": 0, "speed": 0}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "concluded"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "null"}}
>  {'execute': 'blockdev-del',
>            'arguments': {'node-name': 'drv0'}}
>  {"return": {}}
> @@ -91,21 +91,21 @@ Formatting 'TEST_DIR/o.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.
>  {"return": {}}
>  {'execute': 'block-commit',
>  'arguments': {'job-id': 'job0', 'device': 'drv0'}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "running"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "ready"}}
> +{"event": "BLOCK_JOB_READY", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "commit", "device": "job0", "len": 0, "offset": 0, "speed": 0}}
>  {'execute': 'blockdev-del',
>            'arguments': {'node-name': 'drv0'}}
>  {"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: block device is in use by block job: commit"}}
>  {'execute': 'block-job-cancel',
>            'arguments': {'device': 'job0'}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "waiting"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "pending"}}
> +{"event": "BLOCK_JOB_COMPLETED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "commit", "device": "job0", "len": 0, "offset": 0, "speed": 0}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "concluded"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "null"}}
>  {'execute': 'blockdev-del',
>            'arguments': {'node-name': 'drv0'}}
>  {"return": {}}
> @@ -128,18 +128,18 @@ wrote 1048576/1048576 bytes at offset 0
>  'device': 'drv0',
>  'top':    'TEST_DIR/m.IMGFMT',
>  'speed':  1}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "running"}}
>  {'execute': 'blockdev-del',
>            'arguments': {'node-name': 'drv0'}}
>  {"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: block device is in use by block job: commit"}}
>  {'execute': 'block-job-cancel',
>            'arguments': {'device': 'job0'}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "job0", "len": 1048576, "offset": 524288, "speed": 1, "type": "commit"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "aborting"}}
> +{"event": "BLOCK_JOB_CANCELLED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "commit", "device": "job0", "len": 1048576, "offset": 524288, "speed": 1}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "concluded"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "null"}}
>  {'execute': 'blockdev-del',
>            'arguments': {'node-name': 'drv0'}}
>  {"return": {}}
> @@ -161,18 +161,18 @@ wrote 1048576/1048576 bytes at offset 0
>  'arguments': {'job-id': 'job0',
>  'device': 'drv0',
>  'speed': 1}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "running"}}
>  {'execute': 'blockdev-del',
>            'arguments': {'node-name': 'drv0'}}
>  {"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: block device is in use by block job: stream"}}
>  {'execute': 'block-job-cancel',
>            'arguments': {'device': 'job0'}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "job0", "len": 1048576, "offset": 524288, "speed": 1, "type": "stream"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "aborting"}}
> +{"event": "BLOCK_JOB_CANCELLED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "stream", "device": "job0", "len": 1048576, "offset": 524288, "speed": 1}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "concluded"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "null"}}
>  {'execute': 'blockdev-del',
>            'arguments': {'node-name': 'drv0'}}
>  {"return": {}}
> diff --git a/tests/qemu-iotests/143.out b/tests/qemu-iotests/143.out
> index 9ec5888e0e..ec58b08e43 100644
> --- a/tests/qemu-iotests/143.out
> +++ b/tests/qemu-iotests/143.out
> @@ -11,5 +11,5 @@ qemu-io: can't open device nbd+unix:///aa--aa1?socket=SOCK_DIR/nbd: Requested ex
>  server reported: export 'aa--aa...' not present
>  { 'execute': 'quit' }
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  *** done
> diff --git a/tests/qemu-iotests/156.out b/tests/qemu-iotests/156.out
> index 4a22f0c41a..bb01818fc7 100644
> --- a/tests/qemu-iotests/156.out
> +++ b/tests/qemu-iotests/156.out
> @@ -26,11 +26,11 @@ Formatting 'TEST_DIR/t.IMGFMT.target.overlay', fmt=IMGFMT size=1048576 backing_f
>                        'target': 'TEST_DIR/t.IMGFMT.target.overlay',
>                        'mode': 'existing',
>                        'sync': 'top' } }
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "source"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "source"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "source", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "source", "status": "running"}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "source"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_READY", "data": {"device": "source", "len": 131072, "offset": 131072, "speed": 0, "type": "mirror"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "source", "status": "ready"}}
> +{"event": "BLOCK_JOB_READY", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "mirror", "device": "source", "len": 131072, "offset": 131072, "speed": 0}}
>  { 'execute': 'human-monitor-command',
>         'arguments': { 'command-line':
>                        'qemu-io source "write -P 4 192k 64k"' } }
> @@ -40,11 +40,11 @@ wrote 65536/65536 bytes at offset 196608
>  { 'execute': 'block-job-complete',
>         'arguments': { 'device': 'source' } }
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "source"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "source"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "source", "len": 196608, "offset": 196608, "speed": 0, "type": "mirror"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "source"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "source"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "source", "status": "waiting"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "source", "status": "pending"}}
> +{"event": "BLOCK_JOB_COMPLETED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "mirror", "device": "source", "len": 196608, "offset": 196608, "speed": 0}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "source", "status": "concluded"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "source", "status": "null"}}
>  
>  { 'execute': 'human-monitor-command',
>         'arguments': { 'command-line':
> @@ -73,7 +73,7 @@ read 65536/65536 bytes at offset 196608
>  
>  { 'execute': 'quit' }
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  
>  read 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> diff --git a/tests/qemu-iotests/161.out b/tests/qemu-iotests/161.out
> index 6cc285afcf..c62657639a 100644
> --- a/tests/qemu-iotests/161.out
> +++ b/tests/qemu-iotests/161.out
> @@ -18,17 +18,17 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.
>  {"return": {}}
>  { 'execute': 'block-stream',        'arguments': { 'device': 'none0',
>                        'base': 'TEST_DIR/t.IMGFMT.base' } }
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "none0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "none0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "none0", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "none0", "status": "running"}}
>  {"return": {}}
>  { 'execute': 'human-monitor-command',
>         'arguments': { 'command-line':
>                        'qemu-io none0 "reopen -o backing.detect-zeroes=on"' } }
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "none0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "none0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "none0", "len": 1048576, "offset": 1048576, "speed": 0, "type": "stream"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "none0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "none0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "none0", "status": "waiting"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "none0", "status": "pending"}}
> +{"event": "BLOCK_JOB_COMPLETED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "stream", "device": "none0", "len": 1048576, "offset": 1048576, "speed": 0}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "none0", "status": "concluded"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "none0", "status": "null"}}
>  {"return": ""}
>  
>  *** Commit and then change an option on the backing file
> @@ -40,16 +40,16 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.
>  {"return": {}}
>  { 'execute': 'block-commit',        'arguments': { 'device': 'none0',
>                        'top': 'TEST_DIR/t.IMGFMT.int' } }
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "none0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "none0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "none0", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "none0", "status": "running"}}
>  {"return": {}}
>  { 'execute': 'human-monitor-command',
>         'arguments': { 'command-line':
>                        'qemu-io none0 "reopen -o backing.detect-zeroes=on"' } }
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "none0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "none0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "none0", "len": 1048576, "offset": 1048576, "speed": 0, "type": "commit"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "none0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "none0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "none0", "status": "waiting"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "none0", "status": "pending"}}
> +{"event": "BLOCK_JOB_COMPLETED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "commit", "device": "none0", "len": 1048576, "offset": 1048576, "speed": 0}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "none0", "status": "concluded"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "none0", "status": "null"}}
>  {"return": ""}
>  *** done
> diff --git a/tests/qemu-iotests/176.out b/tests/qemu-iotests/176.out
> index 9d09b60452..b46b743850 100644
> --- a/tests/qemu-iotests/176.out
> +++ b/tests/qemu-iotests/176.out
> @@ -170,7 +170,7 @@ QMP_VERSION
>  {"return": {}}
>  {"return": {}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  wrote 196608/196608 bytes at offset 2147287040
>  192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  wrote 131072/131072 bytes at offset 2147352576
> @@ -207,7 +207,7 @@ QMP_VERSION
>  {"return": {}}
>  {"return": {"sha256": HASH}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  
>  === Test pass bitmap.1 ===
>  
> @@ -219,7 +219,7 @@ QMP_VERSION
>  {"return": {}}
>  {"return": {}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  wrote 196608/196608 bytes at offset 2147287040
>  192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  wrote 131072/131072 bytes at offset 2147352576
> @@ -257,7 +257,7 @@ QMP_VERSION
>  {"return": {}}
>  {"return": {"sha256": HASH}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  
>  === Test pass bitmap.2 ===
>  
> @@ -269,7 +269,7 @@ QMP_VERSION
>  {"return": {}}
>  {"return": {}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  wrote 196608/196608 bytes at offset 2147287040
>  192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  wrote 131072/131072 bytes at offset 2147352576
> @@ -307,7 +307,7 @@ QMP_VERSION
>  {"return": {}}
>  {"return": {"sha256": HASH}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  
>  === Test pass bitmap.3 ===
>  
> @@ -319,7 +319,7 @@ QMP_VERSION
>  {"return": {}}
>  {"return": {}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  wrote 196608/196608 bytes at offset 2147287040
>  192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  wrote 131072/131072 bytes at offset 2147352576
> @@ -354,5 +354,5 @@ QMP_VERSION
>  {"return": {}}
>  {"return": {"sha256": HASH}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> +{"event": "SHUTDOWN", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"guest": false, "reason": "host-qmp-quit"}}
>  *** done
> diff --git a/tests/qemu-iotests/184.out b/tests/qemu-iotests/184.out
> index 77e5489d65..93e33ba20a 100644
> --- a/tests/qemu-iotests/184.out
> +++ b/tests/qemu-iotests/184.out
> @@ -24,64 +24,64 @@ Testing:
>  {
>      "return": [
>          {
> -            "iops_rd": 0,
> +            "file": "json:{\"driver\": \"throttle\", \"throttle-group\": \"group0\", \"file\": {\"driver\": \"null-co\"}}",
> +            "node-name": "throttle0",
> +            "ro": false,
> +            "drv": "throttle",
> +            "backing_file_depth": 1,
> +            "encrypted": false,
>              "detect_zeroes": "off",
> +            "bps": 0,
> +            "bps_rd": 0,
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
>              "image": {
> +                "filename": "json:{\"driver\": \"throttle\", \"throttle-group\": \"group0\", \"file\": {\"driver\": \"null-co\"}}",
> +                "format": "throttle",
> +                "actual-size": 0,
> +                "virtual-size": 1073741824,
>                  "backing-image": {
> -                    "virtual-size": 1073741824,
>                      "filename": "null-co://",
>                      "format": "null-co",
> -                    "actual-size": 0
> -                },
> -                "virtual-size": 1073741824,
> -                "filename": "json:{\"throttle-group\": \"group0\", \"driver\": \"throttle\", \"file\": {\"driver\": \"null-co\"}}",
> -                "format": "throttle",
> -                "actual-size": 0
> +                    "actual-size": 0,
> +                    "virtual-size": 1073741824
> +                }
>              },
> -            "iops_wr": 0,
> -            "ro": false,
> -            "node-name": "throttle0",
> -            "backing_file_depth": 1,
> -            "drv": "throttle",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
> -            "encrypted": false,
> -            "bps": 0,
> -            "bps_rd": 0,
>              "cache": {
> -                "no-flush": false,
> +                "writeback": true,
>                  "direct": false,
> -                "writeback": true
> +                "no-flush": false
>              },
> -            "file": "json:{\"throttle-group\": \"group0\", \"driver\": \"throttle\", \"file\": {\"driver\": \"null-co\"}}"
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> -            "detect_zeroes": "off",
> -            "image": {
> -                "virtual-size": 1073741824,
> -                "filename": "null-co://",
> -                "format": "null-co",
> -                "actual-size": 0
> -            },
> -            "iops_wr": 0,
> -            "ro": false,
> +            "file": "null-co://",
>              "node-name": "disk0",
> -            "backing_file_depth": 0,
> +            "ro": false,
>              "drv": "null-co",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
> +            "backing_file_depth": 0,
>              "encrypted": false,
> +            "detect_zeroes": "off",
>              "bps": 0,
>              "bps_rd": 0,
> -            "cache": {
> -                "no-flush": false,
> -                "direct": false,
> -                "writeback": true
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
> +            "image": {
> +                "filename": "null-co://",
> +                "format": "null-co",
> +                "actual-size": 0,
> +                "virtual-size": 1073741824
>              },
> -            "file": "null-co://"
> +            "cache": {
> +                "writeback": true,
> +                "direct": false,
> +                "no-flush": false
> +            },
> +            "write_threshold": 0
>          }
>      ]
>  }
> @@ -94,11 +94,11 @@ Testing:
>      }
>  }
>  {
> +    "event": "SHUTDOWN",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "SHUTDOWN",
>      "data": {
>          "guest": false,
>          "reason": "host-qmp-quit"
> @@ -121,52 +121,25 @@ Testing:
>  }
>  {
>      "return": {
> -        "bps-read-max-length": 1,
> -        "iops-read-max-length": 1,
> -        "bps-read-max": 0,
> -        "bps-total": 0,
> -        "iops-total-max-length": 1,
>          "iops-total": 1000,
> -        "iops-write-max": 0,
> -        "bps-write": 0,
> -        "bps-total-max": 0,
> -        "bps-write-max": 0,
> -        "iops-size": 0,
> -        "iops-read": 0,
> -        "iops-write-max-length": 1,
> -        "iops-write": 0,
> -        "bps-total-max-length": 1,
> -        "iops-read-max": 0,
> -        "bps-read": 0,
> -        "bps-write-max-length": 1,
> -        "iops-total-max": 0
> -    }
> -}
> -{
> -    "return": {
> -    }
> -}
> -{
> -    "return": {
> -        "bps-read-max-length": 1,
> -        "iops-read-max-length": 1,
> -        "bps-read-max": 0,
> -        "bps-total": 0,
> +        "iops-total-max": 0,
>          "iops-total-max-length": 1,
> -        "iops-total": 0,
> -        "iops-write-max": 0,
> -        "bps-write": 0,
> -        "bps-total-max": 0,
> -        "bps-write-max": 0,
> -        "iops-size": 0,
>          "iops-read": 0,
> -        "iops-write-max-length": 1,
> -        "iops-write": 0,
> -        "bps-total-max-length": 1,
>          "iops-read-max": 0,
> +        "iops-read-max-length": 1,
> +        "iops-write": 0,
> +        "iops-write-max": 0,
> +        "iops-write-max-length": 1,
> +        "bps-total": 0,
> +        "bps-total-max": 0,
> +        "bps-total-max-length": 1,
>          "bps-read": 0,
> +        "bps-read-max": 0,
> +        "bps-read-max-length": 1,
> +        "bps-write": 0,
> +        "bps-write-max": 0,
>          "bps-write-max-length": 1,
> -        "iops-total-max": 0
> +        "iops-size": 0
>      }
>  }
>  {
> @@ -174,11 +147,38 @@ Testing:
>      }
>  }
>  {
> +    "return": {
> +        "iops-total": 0,
> +        "iops-total-max": 0,
> +        "iops-total-max-length": 1,
> +        "iops-read": 0,
> +        "iops-read-max": 0,
> +        "iops-read-max-length": 1,
> +        "iops-write": 0,
> +        "iops-write-max": 0,
> +        "iops-write-max-length": 1,
> +        "bps-total": 0,
> +        "bps-total-max": 0,
> +        "bps-total-max-length": 1,
> +        "bps-read": 0,
> +        "bps-read-max": 0,
> +        "bps-read-max-length": 1,
> +        "bps-write": 0,
> +        "bps-write-max": 0,
> +        "bps-write-max-length": 1,
> +        "iops-size": 0
> +    }
> +}
> +{
> +    "return": {
> +    }
> +}
> +{
> +    "event": "SHUTDOWN",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "SHUTDOWN",
>      "data": {
>          "guest": false,
>          "reason": "host-qmp-quit"
> @@ -216,11 +216,11 @@ Testing:
>      }
>  }
>  {
> +    "event": "SHUTDOWN",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "SHUTDOWN",
>      "data": {
>          "guest": false,
>          "reason": "host-qmp-quit"
> @@ -252,11 +252,11 @@ Testing:
>      }
>  }
>  {
> +    "event": "SHUTDOWN",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "SHUTDOWN",
>      "data": {
>          "guest": false,
>          "reason": "host-qmp-quit"
> diff --git a/tests/qemu-iotests/186.out b/tests/qemu-iotests/186.out
> index 01530040e5..12ea630222 100644
> --- a/tests/qemu-iotests/186.out
> +++ b/tests/qemu-iotests/186.out
> @@ -57,7 +57,7 @@ qdev_id: [not inserted]
>  Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device ide-hd,drive=null
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": true} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]
>      Cache mode:       writeback
>  (qemu) quit
> @@ -65,7 +65,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
>  Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device ide-hd,drive=null,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": true} (null-co)
>      Attached to:      qdev_id
>      Cache mode:       writeback
>  (qemu) quit
> @@ -73,7 +73,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
>  Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device scsi-hd,drive=null
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": true} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]
>      Cache mode:       writeback
>  (qemu) quit
> @@ -81,7 +81,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
>  Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device scsi-hd,drive=null,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": true} (null-co)
>      Attached to:      qdev_id
>      Cache mode:       writeback
>  (qemu) quit
> @@ -89,7 +89,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
>  Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device virtio-blk-pci,drive=null
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": true} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]/virtio-backend
>      Cache mode:       writeback
>  (qemu) quit
> @@ -97,7 +97,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
>  Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device virtio-blk-pci,drive=null,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": true} (null-co)
>      Attached to:      /machine/peripheral/qdev_id/virtio-backend
>      Cache mode:       writeback
>  (qemu) quit
> @@ -105,7 +105,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
>  Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device floppy,drive=null
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": true} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -114,7 +114,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
>  Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device floppy,drive=null,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": true} (null-co)
>      Attached to:      qdev_id
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -123,7 +123,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
>  Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device ide-cd,drive=null
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": true} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -132,7 +132,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
>  Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device ide-cd,drive=null,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": true} (null-co)
>      Attached to:      qdev_id
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -141,7 +141,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
>  Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device scsi-cd,drive=null
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": true} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -150,7 +150,7 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
>  Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device scsi-cd,drive=null,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": true} (null-co)
>      Attached to:      qdev_id
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -162,11 +162,11 @@ null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device ide-hd,drive=null,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
>  
> -null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      qdev_id
>      Cache mode:       writeback
>  (qemu) quit
> @@ -174,11 +174,11 @@ null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device scsi-hd,drive=null,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
>  
> -null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      qdev_id
>      Cache mode:       writeback
>  (qemu) quit
> @@ -186,11 +186,11 @@ null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device virtio-blk-pci,drive=null,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
>  
> -null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      /machine/peripheral/qdev_id/virtio-backend
>      Cache mode:       writeback
>  (qemu) quit
> @@ -198,11 +198,11 @@ null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device floppy,drive=null,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
>  
> -null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      qdev_id
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -211,11 +211,11 @@ null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device ide-cd,drive=null,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
>  
> -null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      qdev_id
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -224,11 +224,11 @@ null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device scsi-cd,drive=null,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
>  
> -null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +null: json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      qdev_id
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -240,7 +240,7 @@ null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device ide-hd,drive=none0
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]
>      Cache mode:       writeback
>  (qemu) quit
> @@ -248,7 +248,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device ide-hd,drive=none0,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      qdev_id
>      Cache mode:       writeback
>  (qemu) quit
> @@ -256,7 +256,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device scsi-hd,drive=none0
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]
>      Cache mode:       writeback
>  (qemu) quit
> @@ -264,7 +264,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device scsi-hd,drive=none0,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      qdev_id
>      Cache mode:       writeback
>  (qemu) quit
> @@ -272,7 +272,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device virtio-blk-pci,drive=none0
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]/virtio-backend
>      Cache mode:       writeback
>  (qemu) quit
> @@ -280,7 +280,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device virtio-blk-pci,drive=none0,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      /machine/peripheral/qdev_id/virtio-backend
>      Cache mode:       writeback
>  (qemu) quit
> @@ -288,7 +288,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device floppy,drive=none0
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -297,7 +297,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device floppy,drive=none0,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      qdev_id
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -306,7 +306,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device ide-cd,drive=none0
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -315,7 +315,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device ide-cd,drive=none0,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      qdev_id
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -324,7 +324,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device scsi-cd,drive=none0
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -333,7 +333,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device scsi-cd,drive=none0,id=qdev_id
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +none0 (null): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      qdev_id
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -411,7 +411,7 @@ floppy0: [not inserted]
>  Testing: -drive if=floppy,driver=null-co,read-zeroes=on
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -floppy0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +floppy0 (NODE_NAME): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      /machine/unattached/device[N]
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -420,7 +420,7 @@ floppy0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=ide,driver=null-co,read-zeroes=on
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -ide0-hd0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +ide0-hd0 (NODE_NAME): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      /machine/unattached/device[N]
>      Cache mode:       writeback
>  (qemu) quit
> @@ -436,7 +436,7 @@ ide0-cd0: [not inserted]
>  Testing: -drive if=ide,driver=null-co,read-zeroes=on,media=cdrom
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -ide0-cd0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co, read-only)
> +ide0-cd0 (NODE_NAME): json:{"driver": "null-co", "read-zeroes": "on"} (null-co, read-only)
>      Attached to:      /machine/unattached/device[N]
>      Removable device: not locked, tray closed
>      Cache mode:       writeback
> @@ -445,7 +445,7 @@ ide0-cd0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co,
>  Testing: -drive if=virtio,driver=null-co,read-zeroes=on
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -virtio0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
> +virtio0 (NODE_NAME): json:{"driver": "null-co", "read-zeroes": "on"} (null-co)
>      Attached to:      /machine/peripheral-anon/device[N]/virtio-backend
>      Cache mode:       writeback
>  (qemu) quit
> @@ -453,7 +453,7 @@ virtio0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
>  Testing: -drive if=pflash,driver=null-co,read-zeroes=on,size=1M
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) info block
> -pflash0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co", "size": "1M"} (null-co)
> +pflash0 (NODE_NAME): json:{"driver": "null-co", "size": "1M", "read-zeroes": "on"} (null-co)
>      Attached to:      /machine/system.flash0
>      Cache mode:       writeback
>  (qemu) quit
> diff --git a/tests/qemu-iotests/190.out b/tests/qemu-iotests/190.out
> index ed9d8214eb..2acea9982c 100644
> --- a/tests/qemu-iotests/190.out
> +++ b/tests/qemu-iotests/190.out
> @@ -29,8 +29,8 @@ bitmaps size: 537198592
>  
>  expected bitmap 545259520
>  {
> -    "bitmaps": 545259520,
>      "required": 18874368,
> -    "fully-allocated": 2199042129920
> +    "fully-allocated": 2199042129920,
> +    "bitmaps": 545259520
>  }
>  *** done
> diff --git a/tests/qemu-iotests/191.out b/tests/qemu-iotests/191.out
> index ea88777374..a7dfb22080 100644
> --- a/tests/qemu-iotests/191.out
> +++ b/tests/qemu-iotests/191.out
> @@ -22,25 +22,25 @@ wrote 65536/65536 bytes at offset 1048576
>                        'base':'TEST_DIR/t.IMGFMT.base',
>                        'top': 'TEST_DIR/t.IMGFMT.mid' } }
>  {
> +    "event": "JOB_STATUS_CHANGE",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "JOB_STATUS_CHANGE",
>      "data": {
> -        "status": "created",
> -        "id": "commit0"
> +        "id": "commit0",
> +        "status": "created"
>      }
>  }
>  {
> +    "event": "JOB_STATUS_CHANGE",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "JOB_STATUS_CHANGE",
>      "data": {
> -        "status": "running",
> -        "id": "commit0"
> +        "id": "commit0",
> +        "status": "running"
>      }
>  }
>  {
> @@ -48,61 +48,61 @@ wrote 65536/65536 bytes at offset 1048576
>      }
>  }
>  {
> +    "event": "JOB_STATUS_CHANGE",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "JOB_STATUS_CHANGE",
>      "data": {
> -        "status": "waiting",
> -        "id": "commit0"
> +        "id": "commit0",
> +        "status": "waiting"
>      }
>  }
>  {
> +    "event": "JOB_STATUS_CHANGE",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "JOB_STATUS_CHANGE",
>      "data": {
> -        "status": "pending",
> -        "id": "commit0"
> +        "id": "commit0",
> +        "status": "pending"
>      }
>  }
>  {
> -    "timestamp": {
> -        "seconds":  TIMESTAMP,
> -        "microseconds":  TIMESTAMP
> -    },
>      "event": "BLOCK_JOB_COMPLETED",
> +    "timestamp": {
> +        "seconds":  TIMESTAMP,
> +        "microseconds":  TIMESTAMP
> +    },
>      "data": {
> +        "type": "commit",
>          "device": "commit0",
>          "len": 67108864,
>          "offset": 67108864,
> -        "speed": 0,
> -        "type": "commit"
> +        "speed": 0
>      }
>  }
>  {
> +    "event": "JOB_STATUS_CHANGE",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "JOB_STATUS_CHANGE",
>      "data": {
> -        "status": "concluded",
> -        "id": "commit0"
> +        "id": "commit0",
> +        "status": "concluded"
>      }
>  }
>  {
> +    "event": "JOB_STATUS_CHANGE",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "JOB_STATUS_CHANGE",
>      "data": {
> -        "status": "null",
> -        "id": "commit0"
> +        "id": "commit0",
> +        "status": "null"
>      }
>  }
>  
> @@ -112,268 +112,268 @@ wrote 65536/65536 bytes at offset 1048576
>  {
>      "return": [
>          {
> -            "iops_rd": 0,
> -            "detect_zeroes": "off",
> -            "image": {
> -                "backing-image": {
> -                    "virtual-size": 67108864,
> -                    "filename": "TEST_DIR/t.IMGFMT.base",
> -                    "cluster-size": 65536,
> -                    "format": "IMGFMT",
> -                    "actual-size": SIZE,
> -                    "dirty-flag": false
> -                },
> -                "backing-filename-format": "IMGFMT",
> -                "virtual-size": 67108864,
> -                "filename": "TEST_DIR/t.IMGFMT.ovl2",
> -                "cluster-size": 65536,
> -                "format": "IMGFMT",
> -                "actual-size": SIZE,
> -                "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
> -                "backing-filename": "TEST_DIR/t.IMGFMT.base",
> -                "dirty-flag": false
> -            },
> -            "iops_wr": 0,
> -            "ro": false,
> +            "file": "TEST_DIR/t.IMGFMT.ovl2",
>              "node-name": "top2",
> -            "backing_file_depth": 1,
> +            "ro": false,
>              "drv": "IMGFMT",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
>              "backing_file": "TEST_DIR/t.IMGFMT.base",
> +            "backing_file_depth": 1,
>              "encrypted": false,
> +            "detect_zeroes": "off",
>              "bps": 0,
>              "bps_rd": 0,
> -            "cache": {
> -                "no-flush": false,
> -                "direct": false,
> -                "writeback": true
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
> +            "image": {
> +                "filename": "TEST_DIR/t.IMGFMT.ovl2",
> +                "format": "IMGFMT",
> +                "dirty-flag": false,
> +                "actual-size": SIZE,
> +                "virtual-size": 67108864,
> +                "cluster-size": 65536,
> +                "backing-filename": "TEST_DIR/t.IMGFMT.base",
> +                "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
> +                "backing-filename-format": "IMGFMT",
> +                "backing-image": {
> +                    "filename": "TEST_DIR/t.IMGFMT.base",
> +                    "format": "IMGFMT",
> +                    "dirty-flag": false,
> +                    "actual-size": SIZE,
> +                    "virtual-size": 67108864,
> +                    "cluster-size": 65536,
> +                },
>              },
> -            "file": "TEST_DIR/t.IMGFMT.ovl2"
> +            "cache": {
> +                "writeback": true,
> +                "direct": false,
> +                "no-flush": false
> +            },
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> +            "file": "TEST_DIR/t.IMGFMT.ovl2",
> +            "node-name": "NODE_NAME",
> +            "ro": false,
> +            "drv": "file",
> +            "backing_file_depth": 0,
> +            "encrypted": false,
>              "detect_zeroes": "off",
> +            "bps": 0,
> +            "bps_rd": 0,
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
>              "image": {
> -                "virtual-size": 197120,
>                  "filename": "TEST_DIR/t.IMGFMT.ovl2",
>                  "format": "file",
> +                "dirty-flag": false,
>                  "actual-size": SIZE,
> -                "dirty-flag": false
> +                "virtual-size": 197120
>              },
> -            "iops_wr": 0,
> -            "ro": false,
> -            "node-name": "NODE_NAME",
> -            "backing_file_depth": 0,
> -            "drv": "file",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
> -            "encrypted": false,
> -            "bps": 0,
> -            "bps_rd": 0,
>              "cache": {
> -                "no-flush": false,
> +                "writeback": true,
>                  "direct": false,
> -                "writeback": true
> +                "no-flush": false
>              },
> -            "file": "TEST_DIR/t.IMGFMT.ovl2"
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> -            "detect_zeroes": "off",
> -            "image": {
> -                "backing-image": {
> -                    "virtual-size": 67108864,
> -                    "filename": "TEST_DIR/t.IMGFMT.base",
> -                    "cluster-size": 65536,
> -                    "format": "IMGFMT",
> -                    "actual-size": SIZE,
> -                    "dirty-flag": false
> -                },
> -                "backing-filename-format": "IMGFMT",
> -                "virtual-size": 67108864,
> -                "filename": "TEST_DIR/t.IMGFMT",
> -                "cluster-size": 65536,
> -                "format": "IMGFMT",
> -                "actual-size": SIZE,
> -                "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
> -                "backing-filename": "TEST_DIR/t.IMGFMT.base",
> -                "dirty-flag": false
> -            },
> -            "iops_wr": 0,
> -            "ro": false,
> +            "file": "TEST_DIR/t.IMGFMT",
>              "node-name": "top",
> -            "backing_file_depth": 1,
> +            "ro": false,
>              "drv": "IMGFMT",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
>              "backing_file": "TEST_DIR/t.IMGFMT.base",
> +            "backing_file_depth": 1,
>              "encrypted": false,
> +            "detect_zeroes": "off",
>              "bps": 0,
>              "bps_rd": 0,
> -            "cache": {
> -                "no-flush": false,
> -                "direct": false,
> -                "writeback": true
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
> +            "image": {
> +                "filename": "TEST_DIR/t.IMGFMT",
> +                "format": "IMGFMT",
> +                "dirty-flag": false,
> +                "actual-size": SIZE,
> +                "virtual-size": 67108864,
> +                "cluster-size": 65536,
> +                "backing-filename": "TEST_DIR/t.IMGFMT.base",
> +                "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
> +                "backing-filename-format": "IMGFMT",
> +                "backing-image": {
> +                    "filename": "TEST_DIR/t.IMGFMT.base",
> +                    "format": "IMGFMT",
> +                    "dirty-flag": false,
> +                    "actual-size": SIZE,
> +                    "virtual-size": 67108864,
> +                    "cluster-size": 65536,
> +                },
>              },
> -            "file": "TEST_DIR/t.IMGFMT"
> +            "cache": {
> +                "writeback": true,
> +                "direct": false,
> +                "no-flush": false
> +            },
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> +            "file": "TEST_DIR/t.IMGFMT",
> +            "node-name": "NODE_NAME",
> +            "ro": false,
> +            "drv": "file",
> +            "backing_file_depth": 0,
> +            "encrypted": false,
>              "detect_zeroes": "off",
> +            "bps": 0,
> +            "bps_rd": 0,
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
>              "image": {
> -                "virtual-size": 197120,
>                  "filename": "TEST_DIR/t.IMGFMT",
>                  "format": "file",
> +                "dirty-flag": false,
>                  "actual-size": SIZE,
> -                "dirty-flag": false
> +                "virtual-size": 197120
>              },
> -            "iops_wr": 0,
> -            "ro": false,
> -            "node-name": "NODE_NAME",
> -            "backing_file_depth": 0,
> -            "drv": "file",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
> -            "encrypted": false,
> -            "bps": 0,
> -            "bps_rd": 0,
>              "cache": {
> -                "no-flush": false,
> +                "writeback": true,
>                  "direct": false,
> -                "writeback": true
> +                "no-flush": false
>              },
> -            "file": "TEST_DIR/t.IMGFMT"
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> -            "detect_zeroes": "off",
> -            "image": {
> -                "backing-image": {
> -                    "virtual-size": 67108864,
> -                    "filename": "TEST_DIR/t.IMGFMT.base",
> -                    "cluster-size": 65536,
> -                    "format": "IMGFMT",
> -                    "actual-size": SIZE,
> -                    "dirty-flag": false
> -                },
> -                "backing-filename-format": "IMGFMT",
> -                "virtual-size": 67108864,
> -                "filename": "TEST_DIR/t.IMGFMT.mid",
> -                "cluster-size": 65536,
> -                "format": "IMGFMT",
> -                "actual-size": SIZE,
> -                "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
> -                "backing-filename": "TEST_DIR/t.IMGFMT.base",
> -                "dirty-flag": false
> -            },
> -            "iops_wr": 0,
> -            "ro": false,
> +            "file": "TEST_DIR/t.IMGFMT.mid",
>              "node-name": "mid",
> -            "backing_file_depth": 1,
> +            "ro": false,
>              "drv": "IMGFMT",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
>              "backing_file": "TEST_DIR/t.IMGFMT.base",
> +            "backing_file_depth": 1,
>              "encrypted": false,
> +            "detect_zeroes": "off",
>              "bps": 0,
>              "bps_rd": 0,
> -            "cache": {
> -                "no-flush": false,
> -                "direct": false,
> -                "writeback": true
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
> +            "image": {
> +                "filename": "TEST_DIR/t.IMGFMT.mid",
> +                "format": "IMGFMT",
> +                "dirty-flag": false,
> +                "actual-size": SIZE,
> +                "virtual-size": 67108864,
> +                "cluster-size": 65536,
> +                "backing-filename": "TEST_DIR/t.IMGFMT.base",
> +                "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
> +                "backing-filename-format": "IMGFMT",
> +                "backing-image": {
> +                    "filename": "TEST_DIR/t.IMGFMT.base",
> +                    "format": "IMGFMT",
> +                    "dirty-flag": false,
> +                    "actual-size": SIZE,
> +                    "virtual-size": 67108864,
> +                    "cluster-size": 65536,
> +                },
>              },
> -            "file": "TEST_DIR/t.IMGFMT.mid"
> +            "cache": {
> +                "writeback": true,
> +                "direct": false,
> +                "no-flush": false
> +            },
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> +            "file": "TEST_DIR/t.IMGFMT.mid",
> +            "node-name": "NODE_NAME",
> +            "ro": false,
> +            "drv": "file",
> +            "backing_file_depth": 0,
> +            "encrypted": false,
>              "detect_zeroes": "off",
> +            "bps": 0,
> +            "bps_rd": 0,
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
>              "image": {
> -                "virtual-size": 393216,
>                  "filename": "TEST_DIR/t.IMGFMT.mid",
>                  "format": "file",
> +                "dirty-flag": false,
>                  "actual-size": SIZE,
> -                "dirty-flag": false
> +                "virtual-size": 393216
>              },
> -            "iops_wr": 0,
> -            "ro": false,
> -            "node-name": "NODE_NAME",
> -            "backing_file_depth": 0,
> -            "drv": "file",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
> -            "encrypted": false,
> -            "bps": 0,
> -            "bps_rd": 0,
>              "cache": {
> -                "no-flush": false,
> +                "writeback": true,
>                  "direct": false,
> -                "writeback": true
> +                "no-flush": false
>              },
> -            "file": "TEST_DIR/t.IMGFMT.mid"
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> -            "detect_zeroes": "off",
> -            "image": {
> -                "virtual-size": 67108864,
> -                "filename": "TEST_DIR/t.IMGFMT.base",
> -                "cluster-size": 65536,
> -                "format": "IMGFMT",
> -                "actual-size": SIZE,
> -                "dirty-flag": false
> -            },
> -            "iops_wr": 0,
> -            "ro": false,
> +            "file": "TEST_DIR/t.IMGFMT.base",
>              "node-name": "base",
> -            "backing_file_depth": 0,
> +            "ro": false,
>              "drv": "IMGFMT",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
> +            "backing_file_depth": 0,
>              "encrypted": false,
> +            "detect_zeroes": "off",
>              "bps": 0,
>              "bps_rd": 0,
> -            "cache": {
> -                "no-flush": false,
> -                "direct": false,
> -                "writeback": true
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
> +            "image": {
> +                "filename": "TEST_DIR/t.IMGFMT.base",
> +                "format": "IMGFMT",
> +                "dirty-flag": false,
> +                "actual-size": SIZE,
> +                "virtual-size": 67108864,
> +                "cluster-size": 65536,
>              },
> -            "file": "TEST_DIR/t.IMGFMT.base"
> +            "cache": {
> +                "writeback": true,
> +                "direct": false,
> +                "no-flush": false
> +            },
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> +            "file": "TEST_DIR/t.IMGFMT.base",
> +            "node-name": "NODE_NAME",
> +            "ro": false,
> +            "drv": "file",
> +            "backing_file_depth": 0,
> +            "encrypted": false,
>              "detect_zeroes": "off",
> +            "bps": 0,
> +            "bps_rd": 0,
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
>              "image": {
> -                "virtual-size": 393216,
>                  "filename": "TEST_DIR/t.IMGFMT.base",
>                  "format": "file",
> +                "dirty-flag": false,
>                  "actual-size": SIZE,
> -                "dirty-flag": false
> +                "virtual-size": 393216
>              },
> -            "iops_wr": 0,
> -            "ro": false,
> -            "node-name": "NODE_NAME",
> -            "backing_file_depth": 0,
> -            "drv": "file",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
> -            "encrypted": false,
> -            "bps": 0,
> -            "bps_rd": 0,
>              "cache": {
> -                "no-flush": false,
> +                "writeback": true,
>                  "direct": false,
> -                "writeback": true
> +                "no-flush": false
>              },
> -            "file": "TEST_DIR/t.IMGFMT.base"
> +            "write_threshold": 0
>          }
>      ]
>  }
> @@ -383,11 +383,11 @@ wrote 65536/65536 bytes at offset 1048576
>      }
>  }
>  {
> +    "event": "SHUTDOWN",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "SHUTDOWN",
>      "data": {
>          "guest": false,
>          "reason": "host-qmp-quit"
> @@ -429,25 +429,25 @@ wrote 65536/65536 bytes at offset 1048576
>                        'base':'TEST_DIR/t.IMGFMT.base',
>                        'top': 'TEST_DIR/t.IMGFMT.mid' } }
>  {
> +    "event": "JOB_STATUS_CHANGE",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "JOB_STATUS_CHANGE",
>      "data": {
> -        "status": "created",
> -        "id": "commit0"
> +        "id": "commit0",
> +        "status": "created"
>      }
>  }
>  {
> +    "event": "JOB_STATUS_CHANGE",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "JOB_STATUS_CHANGE",
>      "data": {
> -        "status": "running",
> -        "id": "commit0"
> +        "id": "commit0",
> +        "status": "running"
>      }
>  }
>  {
> @@ -455,61 +455,61 @@ wrote 65536/65536 bytes at offset 1048576
>      }
>  }
>  {
> +    "event": "JOB_STATUS_CHANGE",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "JOB_STATUS_CHANGE",
>      "data": {
> -        "status": "waiting",
> -        "id": "commit0"
> +        "id": "commit0",
> +        "status": "waiting"
>      }
>  }
>  {
> +    "event": "JOB_STATUS_CHANGE",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "JOB_STATUS_CHANGE",
>      "data": {
> -        "status": "pending",
> -        "id": "commit0"
> +        "id": "commit0",
> +        "status": "pending"
>      }
>  }
>  {
> -    "timestamp": {
> -        "seconds":  TIMESTAMP,
> -        "microseconds":  TIMESTAMP
> -    },
>      "event": "BLOCK_JOB_COMPLETED",
> +    "timestamp": {
> +        "seconds":  TIMESTAMP,
> +        "microseconds":  TIMESTAMP
> +    },
>      "data": {
> +        "type": "commit",
>          "device": "commit0",
>          "len": 67108864,
>          "offset": 67108864,
> -        "speed": 0,
> -        "type": "commit"
> +        "speed": 0
>      }
>  }
>  {
> +    "event": "JOB_STATUS_CHANGE",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "JOB_STATUS_CHANGE",
>      "data": {
> -        "status": "concluded",
> -        "id": "commit0"
> +        "id": "commit0",
> +        "status": "concluded"
>      }
>  }
>  {
> +    "event": "JOB_STATUS_CHANGE",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "JOB_STATUS_CHANGE",
>      "data": {
> -        "status": "null",
> -        "id": "commit0"
> +        "id": "commit0",
> +        "status": "null"
>      }
>  }
>  
> @@ -519,279 +519,279 @@ wrote 65536/65536 bytes at offset 1048576
>  {
>      "return": [
>          {
> -            "iops_rd": 0,
> -            "detect_zeroes": "off",
> -            "image": {
> -                "backing-image": {
> -                    "virtual-size": 67108864,
> -                    "filename": "TEST_DIR/t.IMGFMT.base",
> -                    "cluster-size": 65536,
> -                    "format": "IMGFMT",
> -                    "actual-size": SIZE,
> -                    "dirty-flag": false
> -                },
> -                "backing-filename-format": "IMGFMT",
> -                "virtual-size": 67108864,
> -                "filename": "TEST_DIR/t.IMGFMT.ovl2",
> -                "cluster-size": 65536,
> -                "format": "IMGFMT",
> -                "actual-size": SIZE,
> -                "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
> -                "backing-filename": "TEST_DIR/t.IMGFMT.base",
> -                "dirty-flag": false
> -            },
> -            "iops_wr": 0,
> -            "ro": true,
> +            "file": "TEST_DIR/t.IMGFMT.ovl2",
>              "node-name": "NODE_NAME",
> -            "backing_file_depth": 1,
> +            "ro": true,
>              "drv": "IMGFMT",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
>              "backing_file": "TEST_DIR/t.IMGFMT.base",
> +            "backing_file_depth": 1,
>              "encrypted": false,
> +            "detect_zeroes": "off",
>              "bps": 0,
>              "bps_rd": 0,
> -            "cache": {
> -                "no-flush": false,
> -                "direct": false,
> -                "writeback": true
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
> +            "image": {
> +                "filename": "TEST_DIR/t.IMGFMT.ovl2",
> +                "format": "IMGFMT",
> +                "dirty-flag": false,
> +                "actual-size": SIZE,
> +                "virtual-size": 67108864,
> +                "cluster-size": 65536,
> +                "backing-filename": "TEST_DIR/t.IMGFMT.base",
> +                "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
> +                "backing-filename-format": "IMGFMT",
> +                "backing-image": {
> +                    "filename": "TEST_DIR/t.IMGFMT.base",
> +                    "format": "IMGFMT",
> +                    "dirty-flag": false,
> +                    "actual-size": SIZE,
> +                    "virtual-size": 67108864,
> +                    "cluster-size": 65536,
> +                },
>              },
> -            "file": "TEST_DIR/t.IMGFMT.ovl2"
> +            "cache": {
> +                "writeback": true,
> +                "direct": false,
> +                "no-flush": false
> +            },
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> +            "file": "TEST_DIR/t.IMGFMT.ovl2",
> +            "node-name": "NODE_NAME",
> +            "ro": true,
> +            "drv": "file",
> +            "backing_file_depth": 0,
> +            "encrypted": false,
>              "detect_zeroes": "off",
> +            "bps": 0,
> +            "bps_rd": 0,
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
>              "image": {
> -                "virtual-size": 197120,
>                  "filename": "TEST_DIR/t.IMGFMT.ovl2",
>                  "format": "file",
> +                "dirty-flag": false,
>                  "actual-size": SIZE,
> -                "dirty-flag": false
> +                "virtual-size": 197120
>              },
> -            "iops_wr": 0,
> -            "ro": true,
> -            "node-name": "NODE_NAME",
> -            "backing_file_depth": 0,
> -            "drv": "file",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
> -            "encrypted": false,
> -            "bps": 0,
> -            "bps_rd": 0,
>              "cache": {
> -                "no-flush": false,
> +                "writeback": true,
>                  "direct": false,
> -                "writeback": true
> +                "no-flush": false
>              },
> -            "file": "TEST_DIR/t.IMGFMT.ovl2"
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> -            "detect_zeroes": "off",
> -            "image": {
> -                "backing-image": {
> -                    "backing-image": {
> -                        "virtual-size": 67108864,
> -                        "filename": "TEST_DIR/t.IMGFMT.base",
> -                        "cluster-size": 65536,
> -                        "format": "IMGFMT",
> -                        "actual-size": SIZE,
> -                        "dirty-flag": false
> -                    },
> -                    "backing-filename-format": "IMGFMT",
> -                    "virtual-size": 67108864,
> -                    "filename": "TEST_DIR/t.IMGFMT.ovl2",
> -                    "cluster-size": 65536,
> -                    "format": "IMGFMT",
> -                    "actual-size": SIZE,
> -                    "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
> -                    "backing-filename": "TEST_DIR/t.IMGFMT.base",
> -                    "dirty-flag": false
> -                },
> -                "backing-filename-format": "IMGFMT",
> -                "virtual-size": 67108864,
> -                "filename": "TEST_DIR/t.IMGFMT.ovl3",
> -                "cluster-size": 65536,
> -                "format": "IMGFMT",
> -                "actual-size": SIZE,
> -                "full-backing-filename": "TEST_DIR/t.IMGFMT.ovl2",
> -                "backing-filename": "TEST_DIR/t.IMGFMT.ovl2",
> -                "dirty-flag": false
> -            },
> -            "iops_wr": 0,
> -            "ro": false,
> +            "file": "TEST_DIR/t.IMGFMT.ovl3",
>              "node-name": "top2",
> -            "backing_file_depth": 2,
> +            "ro": false,
>              "drv": "IMGFMT",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
>              "backing_file": "TEST_DIR/t.IMGFMT.ovl2",
> +            "backing_file_depth": 2,
>              "encrypted": false,
> +            "detect_zeroes": "off",
>              "bps": 0,
>              "bps_rd": 0,
> -            "cache": {
> -                "no-flush": false,
> -                "direct": false,
> -                "writeback": true
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
> +            "image": {
> +                "filename": "TEST_DIR/t.IMGFMT.ovl3",
> +                "format": "IMGFMT",
> +                "dirty-flag": false,
> +                "actual-size": SIZE,
> +                "virtual-size": 67108864,
> +                "cluster-size": 65536,
> +                "backing-filename": "TEST_DIR/t.IMGFMT.ovl2",
> +                "full-backing-filename": "TEST_DIR/t.IMGFMT.ovl2",
> +                "backing-filename-format": "IMGFMT",
> +                "backing-image": {
> +                    "filename": "TEST_DIR/t.IMGFMT.ovl2",
> +                    "format": "IMGFMT",
> +                    "dirty-flag": false,
> +                    "actual-size": SIZE,
> +                    "virtual-size": 67108864,
> +                    "cluster-size": 65536,
> +                    "backing-filename": "TEST_DIR/t.IMGFMT.base",
> +                    "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
> +                    "backing-filename-format": "IMGFMT",
> +                    "backing-image": {
> +                        "filename": "TEST_DIR/t.IMGFMT.base",
> +                        "format": "IMGFMT",
> +                        "dirty-flag": false,
> +                        "actual-size": SIZE,
> +                        "virtual-size": 67108864,
> +                        "cluster-size": 65536,
> +                    },
> +                },
>              },
> -            "file": "TEST_DIR/t.IMGFMT.ovl3"
> +            "cache": {
> +                "writeback": true,
> +                "direct": false,
> +                "no-flush": false
> +            },
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> +            "file": "TEST_DIR/t.IMGFMT.ovl3",
> +            "node-name": "NODE_NAME",
> +            "ro": false,
> +            "drv": "file",
> +            "backing_file_depth": 0,
> +            "encrypted": false,
>              "detect_zeroes": "off",
> +            "bps": 0,
> +            "bps_rd": 0,
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
>              "image": {
> -                "virtual-size": 197120,
>                  "filename": "TEST_DIR/t.IMGFMT.ovl3",
>                  "format": "file",
> +                "dirty-flag": false,
>                  "actual-size": SIZE,
> -                "dirty-flag": false
> +                "virtual-size": 197120
>              },
> -            "iops_wr": 0,
> -            "ro": false,
> -            "node-name": "NODE_NAME",
> -            "backing_file_depth": 0,
> -            "drv": "file",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
> -            "encrypted": false,
> -            "bps": 0,
> -            "bps_rd": 0,
>              "cache": {
> -                "no-flush": false,
> +                "writeback": true,
>                  "direct": false,
> -                "writeback": true
> +                "no-flush": false
>              },
> -            "file": "TEST_DIR/t.IMGFMT.ovl3"
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> -            "detect_zeroes": "off",
> -            "image": {
> -                "virtual-size": 67108864,
> -                "filename": "TEST_DIR/t.IMGFMT.base",
> -                "cluster-size": 65536,
> -                "format": "IMGFMT",
> -                "actual-size": SIZE,
> -                "dirty-flag": false
> -            },
> -            "iops_wr": 0,
> +            "file": "TEST_DIR/t.IMGFMT.base",
> +            "node-name": "NODE_NAME",
>              "ro": true,
> -            "node-name": "NODE_NAME",
> -            "backing_file_depth": 0,
>              "drv": "IMGFMT",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
> +            "backing_file_depth": 0,
>              "encrypted": false,
> +            "detect_zeroes": "off",
>              "bps": 0,
>              "bps_rd": 0,
> -            "cache": {
> -                "no-flush": false,
> -                "direct": false,
> -                "writeback": true
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
> +            "image": {
> +                "filename": "TEST_DIR/t.IMGFMT.base",
> +                "format": "IMGFMT",
> +                "dirty-flag": false,
> +                "actual-size": SIZE,
> +                "virtual-size": 67108864,
> +                "cluster-size": 65536,
>              },
> -            "file": "TEST_DIR/t.IMGFMT.base"
> +            "cache": {
> +                "writeback": true,
> +                "direct": false,
> +                "no-flush": false
> +            },
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> +            "file": "TEST_DIR/t.IMGFMT.base",
> +            "node-name": "NODE_NAME",
> +            "ro": true,
> +            "drv": "file",
> +            "backing_file_depth": 0,
> +            "encrypted": false,
>              "detect_zeroes": "off",
> +            "bps": 0,
> +            "bps_rd": 0,
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
>              "image": {
> -                "virtual-size": 393216,
>                  "filename": "TEST_DIR/t.IMGFMT.base",
>                  "format": "file",
> +                "dirty-flag": false,
>                  "actual-size": SIZE,
> -                "dirty-flag": false
> +                "virtual-size": 393216
>              },
> -            "iops_wr": 0,
> -            "ro": true,
> -            "node-name": "NODE_NAME",
> -            "backing_file_depth": 0,
> -            "drv": "file",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
> -            "encrypted": false,
> -            "bps": 0,
> -            "bps_rd": 0,
>              "cache": {
> -                "no-flush": false,
> +                "writeback": true,
>                  "direct": false,
> -                "writeback": true
> +                "no-flush": false
>              },
> -            "file": "TEST_DIR/t.IMGFMT.base"
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> -            "detect_zeroes": "off",
> -            "image": {
> -                "backing-image": {
> -                    "virtual-size": 67108864,
> -                    "filename": "TEST_DIR/t.IMGFMT.base",
> -                    "cluster-size": 65536,
> -                    "format": "IMGFMT",
> -                    "actual-size": SIZE,
> -                    "dirty-flag": false
> -                },
> -                "backing-filename-format": "IMGFMT",
> -                "virtual-size": 67108864,
> -                "filename": "TEST_DIR/t.IMGFMT",
> -                "cluster-size": 65536,
> -                "format": "IMGFMT",
> -                "actual-size": SIZE,
> -                "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
> -                "backing-filename": "TEST_DIR/t.IMGFMT.base",
> -                "dirty-flag": false
> -            },
> -            "iops_wr": 0,
> -            "ro": false,
> +            "file": "TEST_DIR/t.IMGFMT",
>              "node-name": "top",
> -            "backing_file_depth": 1,
> +            "ro": false,
>              "drv": "IMGFMT",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
>              "backing_file": "TEST_DIR/t.IMGFMT.base",
> +            "backing_file_depth": 1,
>              "encrypted": false,
> +            "detect_zeroes": "off",
>              "bps": 0,
>              "bps_rd": 0,
> -            "cache": {
> -                "no-flush": false,
> -                "direct": false,
> -                "writeback": true
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
> +            "image": {
> +                "filename": "TEST_DIR/t.IMGFMT",
> +                "format": "IMGFMT",
> +                "dirty-flag": false,
> +                "actual-size": SIZE,
> +                "virtual-size": 67108864,
> +                "cluster-size": 65536,
> +                "backing-filename": "TEST_DIR/t.IMGFMT.base",
> +                "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
> +                "backing-filename-format": "IMGFMT",
> +                "backing-image": {
> +                    "filename": "TEST_DIR/t.IMGFMT.base",
> +                    "format": "IMGFMT",
> +                    "dirty-flag": false,
> +                    "actual-size": SIZE,
> +                    "virtual-size": 67108864,
> +                    "cluster-size": 65536,
> +                },
>              },
> -            "file": "TEST_DIR/t.IMGFMT"
> +            "cache": {
> +                "writeback": true,
> +                "direct": false,
> +                "no-flush": false
> +            },
> +            "write_threshold": 0
>          },
>          {
> -            "iops_rd": 0,
> -            "detect_zeroes": "off",
> -            "image": {
> -                "virtual-size": 197120,
> -                "filename": "TEST_DIR/t.IMGFMT",
> -                "format": "file",
> -                "actual-size": SIZE,
> -                "dirty-flag": false
> -            },
> -            "iops_wr": 0,
> -            "ro": false,
> +            "file": "TEST_DIR/t.IMGFMT",
>              "node-name": "NODE_NAME",
> -            "backing_file_depth": 0,
> +            "ro": false,
>              "drv": "file",
> -            "iops": 0,
> -            "bps_wr": 0,
> -            "write_threshold": 0,
> +            "backing_file_depth": 0,
>              "encrypted": false,
> +            "detect_zeroes": "off",
>              "bps": 0,
>              "bps_rd": 0,
> -            "cache": {
> -                "no-flush": false,
> -                "direct": false,
> -                "writeback": true
> +            "bps_wr": 0,
> +            "iops": 0,
> +            "iops_rd": 0,
> +            "iops_wr": 0,
> +            "image": {
> +                "filename": "TEST_DIR/t.IMGFMT",
> +                "format": "file",
> +                "dirty-flag": false,
> +                "actual-size": SIZE,
> +                "virtual-size": 197120
>              },
> -            "file": "TEST_DIR/t.IMGFMT"
> +            "cache": {
> +                "writeback": true,
> +                "direct": false,
> +                "no-flush": false
> +            },
> +            "write_threshold": 0
>          }
>      ]
>  }
> @@ -801,11 +801,11 @@ wrote 65536/65536 bytes at offset 1048576
>      }
>  }
>  {
> +    "event": "SHUTDOWN",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "SHUTDOWN",
>      "data": {
>          "guest": false,
>          "reason": "host-qmp-quit"
> diff --git a/tests/qemu-iotests/195.out b/tests/qemu-iotests/195.out
> index ec84df5012..485d7a1115 100644
> --- a/tests/qemu-iotests/195.out
> +++ b/tests/qemu-iotests/195.out
> @@ -22,11 +22,11 @@ Testing: -drive if=none,file=TEST_DIR/t.IMGFMT,backing.node-name=mid
>      }
>  }
>  {
> +    "event": "SHUTDOWN",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "SHUTDOWN",
>      "data": {
>          "guest": false,
>          "reason": "host-qmp-quit"
> @@ -60,11 +60,11 @@ Testing: -drive if=none,file=TEST_DIR/t.IMGFMT,node-name=top
>      }
>  }
>  {
> +    "event": "SHUTDOWN",
>      "timestamp": {
>          "seconds":  TIMESTAMP,
>          "microseconds":  TIMESTAMP
>      },
> -    "event": "SHUTDOWN",
>      "data": {
>          "guest": false,
>          "reason": "host-qmp-quit"
> diff --git a/tests/qemu-iotests/229.out b/tests/qemu-iotests/229.out
> index 7d2bfbfbe6..3f4391df6e 100644
> --- a/tests/qemu-iotests/229.out
> +++ b/tests/qemu-iotests/229.out
> @@ -16,19 +16,19 @@ wrote 2097152/2097152 bytes at offset 0
>                                 'mode':   'existing',
>                                 'on-source-error': 'stop',
>                                 'on-target-error': 'stop' }}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "testdisk"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "testdisk"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "testdisk", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "testdisk", "status": "running"}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_ERROR", "data": {"device": "testdisk", "operation": "write", "action": "stop"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "paused", "id": "testdisk"}}
> +{"event": "BLOCK_JOB_ERROR", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"device": "testdisk", "operation": "write", "action": "stop"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "testdisk", "status": "paused"}}
>  
>  === Force cancel job paused in error state  ===
>  
>  {'execute': 'block-job-cancel',
>                   'arguments': { 'device': 'testdisk',
>                                  'force': true}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "testdisk"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "testdisk", "status": "running"}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "testdisk"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "testdisk", "len": 2097152, "offset": OFFSET, "speed": 0, "type": "mirror"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "testdisk", "status": "aborting"}}
> +{"event": "BLOCK_JOB_CANCELLED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "mirror", "device": "testdisk", "len": 2097152, "offset": OFFSET, "speed": 0}}
>  *** done
> diff --git a/tests/qemu-iotests/244.out b/tests/qemu-iotests/244.out
> index 5e03add054..57cffee1ea 100644
> --- a/tests/qemu-iotests/244.out
> +++ b/tests/qemu-iotests/244.out
> @@ -156,14 +156,14 @@ wrote 1048576/1048576 bytes at offset 0
>                 "data-file": "data",
>                 "data-file-raw": true
>             } } }
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "create"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "create"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "create", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "create", "status": "running"}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "create"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "create"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "create"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "create", "status": "waiting"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "create", "status": "pending"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "create", "status": "concluded"}}
>  { "execute": "job-dismiss", "arguments": { "id": "create" } }
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "create"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "create", "status": "null"}}
>  {"return": {}}
>  
>  Comparing pattern:
> diff --git a/tests/qemu-iotests/249.out b/tests/qemu-iotests/249.out
> index d2bf9be85e..a1a1a1b851 100644
> --- a/tests/qemu-iotests/249.out
> +++ b/tests/qemu-iotests/249.out
> @@ -16,8 +16,8 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.
>  { 'execute': 'block-commit',
>         'arguments': {'job-id': 'job0', 'device': 'none1', 'top-node': 'int',
>                       'filter-node-name': '1234'}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "null"}}
>  {"error": {"class": "GenericError", "desc": "Invalid node-name: '1234'"}}
>  
>  === Send a write command to a drive opened in read-only mode (2)
> @@ -30,14 +30,14 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.
>  
>  { 'execute': 'block-commit',
>         'arguments': {'job-id': 'job0', 'device': 'none1', 'top-node': 'int'}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "running"}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 1048576, "offset": 1048576, "speed": 0, "type": "commit"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "waiting"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "pending"}}
> +{"event": "BLOCK_JOB_COMPLETED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "commit", "device": "job0", "len": 1048576, "offset": 1048576, "speed": 0}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "concluded"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "null"}}
>  
>  === Send a write command to a drive opened in read-only mode (3)
>  
> diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
> index c1bc9b8356..336a5c3946 100644
> --- a/tests/qemu-iotests/tests/qsd-jobs.out
> +++ b/tests/qemu-iotests/tests/qsd-jobs.out
> @@ -8,15 +8,15 @@ QMP_VERSION
>  {"return": {}}
>  {"return": {}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
> +{"event": "BLOCK_JOB_CANCELLED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"type": "commit", "device": "job0", "len": 0, "offset": 0, "speed": 0}}
>  
>  === Streaming can't get permission on base node ===
>  
>  QMP_VERSION
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "created"}}
> +{"event": "JOB_STATUS_CHANGE", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "job0", "status": "null"}}
>  {"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt_base': permissions 'write' are both required by an unnamed block device (uses node 'fmt_base' as 'root' child) and unshared by stream job 'job0' (uses node 'fmt_base' as 'intermediate node' child)."}}
>  {"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
> +{"event": "BLOCK_EXPORT_DELETED", "timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "data": {"id": "export1"}}
>  *** done


