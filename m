Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFD9AA2BC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 14:11:02 +0200 (CEST)
Received: from localhost ([::1]:45374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5qbN-0002LK-Ok
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 08:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59982)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <66eeead73a86802bc9e8e09654f19f8ee53dfa7b@lizzy.crudebyte.com>)
 id 1i5qYO-0000ix-I3
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 08:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <66eeead73a86802bc9e8e09654f19f8ee53dfa7b@lizzy.crudebyte.com>)
 id 1i5qYL-0003XO-Ke
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 08:07:56 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:40851)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <66eeead73a86802bc9e8e09654f19f8ee53dfa7b@lizzy.crudebyte.com>)
 id 1i5qYL-0001vd-7i
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 08:07:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Subject:Date:Cc:To:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=SUkcrmIEEG9/xC6CdciZD/rNqZ4EXUT/WPjCU234q5E=; b=mg6DU
 idELcOnQVgv4QZwuRYywub8dr6kypuFYcP+Md1Fm9+JDHznaczb7Y+OFLShJ+9nrDn76Az8RbI4ni
 564EhaVmZ7SX84sLg6ebUHUV8xX/Q5wmcAd+CRgGdf96862YYo8DBQLyQPUrOzwAfDfQXYGOf1aiI
 IYUaLlXSCSbzlNh8K2ylCseoNf7PoCGtGphwrah85Qh+W20nVppB8tV26VLewj8TVb02XR8eMPhu5
 ijf1nRGFEyI2babCvvD/cI5UCh6QG1csYRyFfHKe0vQzNNDrpYOND3PttLK6sgoL1o0pHhm6XdgGS
 W0CqU6lDoV1SKwCDR/Na3VfbopNgg==;
Message-Id: <66eeead73a86802bc9e8e09654f19f8ee53dfa7b.1567680121.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1567680121.git.qemu_oss@crudebyte.com>
References: <cover.1567680121.git.qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Date: Thu, 5 Sep 2019 00:53:48 +0200
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.194.90.13
Subject: [Qemu-devel] [PATCH v7 3/3] 9p: Use variable length suffixes for
 inode remapping
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
From: Christian Schoenebeck via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, Antonios Motakis <antonios.motakis@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Schoenebeck <qemu_oss@crudebyte.com>

Use variable length suffixes for inode remapping instead of the fixed
16 bit size prefixes before. With this change the inode numbers on guest
will typically be much smaller (e.g. around >2^1 .. >2^7 instead of >2^48
with the previous fixed size inode remapping.

Additionally this solution is more efficient, since inode numbers in
practice can take almost their entire 64 bit range on guest as well, so
there is less likely a need for generating and tracking additional suffixes,
which might also be beneficial for nested virtualization where each level of
virtualization would shift up the inode bits and increase the chance of
expensive remapping actions.

The "Exponential Golomb" algorithm is used as basis for generating the
variable length suffixes. The algorithm has a parameter k which controls the
distribution of bits on increasing indeces (minimum bits at low index vs.
maximum bits at high index). With k=0 the generated suffixes look like:

Index Dec/Bin -> Generated Suffix Bin
1 [1] -> [1] (1 bits)
2 [10] -> [010] (3 bits)
3 [11] -> [110] (3 bits)
4 [100] -> [00100] (5 bits)
5 [101] -> [10100] (5 bits)
6 [110] -> [01100] (5 bits)
7 [111] -> [11100] (5 bits)
8 [1000] -> [0001000] (7 bits)
9 [1001] -> [1001000] (7 bits)
10 [1010] -> [0101000] (7 bits)
11 [1011] -> [1101000] (7 bits)
12 [1100] -> [0011000] (7 bits)
...
65533 [1111111111111101] ->  [1011111111111111000000000000000] (31 bits)
65534 [1111111111111110] ->  [0111111111111111000000000000000] (31 bits)
65535 [1111111111111111] ->  [1111111111111111000000000000000] (31 bits)
Hence minBits=1 maxBits=31

And with k=5 they would look like:

Index Dec/Bin -> Generated Suffix Bin
1 [1] -> [000001] (6 bits)
2 [10] -> [100001] (6 bits)
3 [11] -> [010001] (6 bits)
4 [100] -> [110001] (6 bits)
5 [101] -> [001001] (6 bits)
6 [110] -> [101001] (6 bits)
7 [111] -> [011001] (6 bits)
8 [1000] -> [111001] (6 bits)
9 [1001] -> [000101] (6 bits)
10 [1010] -> [100101] (6 bits)
11 [1011] -> [010101] (6 bits)
12 [1100] -> [110101] (6 bits)
...
65533 [1111111111111101] -> [0011100000000000100000000000] (28 bits)
65534 [1111111111111110] -> [1011100000000000100000000000] (28 bits)
65535 [1111111111111111] -> [0111100000000000100000000000] (28 bits)
Hence minBits=6 maxBits=28

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 268 +++++++++++++++++++++++++++++++++++++++++++++------
 hw/9pfs/9p.h |  44 ++++++++-
 2 files changed, 279 insertions(+), 33 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index d9be2d45d3..37abcdb71e 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -27,6 +27,7 @@
 #include "migration/blocker.h"
 #include "sysemu/qtest.h"
 #include "qemu/xxhash.h"
+#include <math.h>
 
 int open_fd_hw;
 int total_open_fd;
@@ -573,6 +574,116 @@ static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
                                 P9_STAT_MODE_NAMED_PIPE |   \
                                 P9_STAT_MODE_SOCKET)
 
+/* Mirrors all bits of a byte. So e.g. binary 10100000 would become 00000101. */
+static inline uint8_t mirror8bit(uint8_t byte)
+{
+    return (byte * 0x0202020202ULL & 0x010884422010ULL) % 1023;
+}
+
+/* Same as mirror8bit() just for a 64 bit data type instead for a byte. */
+static inline uint64_t mirror64bit(uint64_t value)
+{
+    return ((uint64_t)mirror8bit(value         & 0xff) << 56) |
+           ((uint64_t)mirror8bit((value >> 8)  & 0xff) << 48) |
+           ((uint64_t)mirror8bit((value >> 16) & 0xff) << 40) |
+           ((uint64_t)mirror8bit((value >> 24) & 0xff) << 32) |
+           ((uint64_t)mirror8bit((value >> 32) & 0xff) << 24) |
+           ((uint64_t)mirror8bit((value >> 40) & 0xff) << 16) |
+           ((uint64_t)mirror8bit((value >> 48) & 0xff) << 8)  |
+           ((uint64_t)mirror8bit((value >> 56) & 0xff));
+}
+
+/**
+ * @brief Parameter k for the Exponential Golomb algorihm to be used.
+ *
+ * The smaller this value, the smaller the minimum bit count for the Exp.
+ * Golomb generated affixes will be (at lowest index) however for the
+ * price of having higher maximum bit count of generated affixes (at highest
+ * index). Likewise increasing this parameter yields in smaller maximum bit
+ * count for the price of having higher minimum bit count.
+ *
+ * In practice that means: a good value for k depends on the expected amount
+ * of devices to be exposed by one export. For a small amount of devices k
+ * should be small, for a large amount of devices k might be increased
+ * instead. The default of k=0 should be fine for most users though.
+ *
+ * @b IMPORTANT: In case this ever becomes a runtime parameter; the value of
+ * k should not change as long as guest is still running! Because that would
+ * cause completely different inode numbers to be generated on guest.
+ */
+#define EXP_GOLOMB_K    0
+
+/**
+ * @brief Exponential Golomb algorithm for arbitrary k (including k=0).
+ *
+ * The Exponential Golomb algorithm generates @b prefixes (@b not suffixes!)
+ * with growing length and with the mathematical property of being
+ * "prefix-free". The latter means the generated prefixes can be prepended
+ * in front of arbitrary numbers and the resulting concatenated numbers are
+ * guaranteed to be always unique.
+ *
+ * This is a minor adjustment to the original Exp. Golomb algorithm in the
+ * sense that lowest allowed index (@param n) starts with 1, not with zero.
+ *
+ * @param n - natural number (or index) of the prefix to be generated
+ *            (1, 2, 3, ...)
+ * @param k - parameter k of Exp. Golomb algorithm to be used
+ *            (see comment on EXP_GOLOMB_K macro for details about k)
+ */
+static VariLenAffix expGolombEncode(uint64_t n, int k)
+{
+    const uint64_t value = n + (1 << k) - 1;
+    const int bits = (int) log2(value) + 1;
+    return (VariLenAffix) {
+        .type = AffixType_Prefix,
+        .value = value,
+        .bits = bits + MAX((bits - 1 - k), 0)
+    };
+}
+
+/**
+ * @brief Converts a suffix into a prefix, or a prefix into a suffix.
+ *
+ * Simply mirror all bits of the affix value, for the purpose to preserve
+ * respectively the mathematical "prefix-free" or "suffix-free" property
+ * after the conversion.
+ *
+ * If a passed prefix is suitable to create unique numbers, then the
+ * returned suffix is suitable to create unique numbers as well (and vice
+ * versa).
+ */
+static VariLenAffix invertAffix(const VariLenAffix *affix)
+{
+    return (VariLenAffix) {
+        .type =
+            (affix->type == AffixType_Suffix) ?
+                AffixType_Prefix : AffixType_Suffix,
+        .value =
+            mirror64bit(affix->value) >>
+            ((sizeof(affix->value) * 8) - affix->bits),
+        .bits = affix->bits
+    };
+}
+
+/**
+ * @brief Generates suffix numbers with "suffix-free" property.
+ *
+ * This is just a wrapper function on top of the Exp. Golomb algorithm.
+ *
+ * Since the Exp. Golomb algorithm generates prefixes, but we need suffixes,
+ * this function converts the Exp. Golomb prefixes into appropriate suffixes
+ * which are still suitable for generating unique numbers.
+ *
+ * @param n - natural number (or index) of the suffix to be generated
+ *            (1, 2, 3, ...)
+ */
+static VariLenAffix affixForIndex(uint64_t index)
+{
+    VariLenAffix prefix;
+    prefix = expGolombEncode(index, EXP_GOLOMB_K);
+    return invertAffix(&prefix); /* convert prefix to suffix */
+}
+
 /* creative abuse of tb_hash_func7, which is based on xxhash */
 static uint32_t qpp_hash(QppEntry e)
 {
@@ -584,13 +695,19 @@ static uint32_t qpf_hash(QpfEntry e)
     return qemu_xxhash7(e.ino, e.dev, 0, 0, 0);
 }
 
-static bool qpp_lookup_func(const void *obj, const void *userp)
+static bool qpd_cmp_func(const void *obj, const void *userp)
+{
+    const QpdEntry *e1 = obj, *e2 = userp;
+    return e1->dev == e2->dev;
+}
+
+static bool qpp_cmp_func(const void *obj, const void *userp)
 {
     const QppEntry *e1 = obj, *e2 = userp;
     return e1->dev == e2->dev && e1->ino_prefix == e2->ino_prefix;
 }
 
-static bool qpf_lookup_func(const void *obj, const void *userp)
+static bool qpf_cmp_func(const void *obj, const void *userp)
 {
     const QpfEntry *e1 = obj, *e2 = userp;
     return e1->dev == e2->dev && e1->ino == e2->ino;
@@ -610,16 +727,70 @@ static void qp_table_destroy(struct qht *ht)
     qht_destroy(ht);
 }
 
+static void qpd_table_init(struct qht *ht)
+{
+    qht_init(ht, qpd_cmp_func, 1, QHT_MODE_AUTO_RESIZE);
+}
+
 static void qpp_table_init(struct qht *ht)
 {
-    qht_init(ht, qpp_lookup_func, 1, QHT_MODE_AUTO_RESIZE);
+    qht_init(ht, qpp_cmp_func, 1, QHT_MODE_AUTO_RESIZE);
 }
 
 static void qpf_table_init(struct qht *ht)
 {
-    qht_init(ht, qpf_lookup_func, 1 << 16, QHT_MODE_AUTO_RESIZE);
+    qht_init(ht, qpf_cmp_func, 1 << 16, QHT_MODE_AUTO_RESIZE);
+}
+
+/*
+ * Returns how many (high end) bits of inode numbers of the passed fs
+ * device shall be used (in combination with the device number) to
+ * generate hash values for qpp_table entries.
+ *
+ * This function is required if variable length suffixes are used for inode
+ * number mapping on guest level. Since a device may end up having multiple
+ * entries in qpp_table, each entry most probably with a different suffix
+ * length, we thus need this function in conjunction with qpd_table to
+ * "agree" about a fix amount of bits (per device) to be always used for
+ * generating hash values for the purpose of accessing qpp_table in order
+ * get consistent behaviour when accessing qpp_table.
+ */
+static int qid_inode_prefix_hash_bits(V9fsPDU *pdu, dev_t dev)
+{
+    QpdEntry lookup = {
+        .dev = dev
+    }, *val;
+    uint32_t hash = dev;
+    VariLenAffix affix;
+
+    val = qht_lookup(&pdu->s->qpd_table, &lookup, hash);
+    if (!val) {
+        val = g_malloc0(sizeof(QpdEntry));
+        *val = lookup;
+        affix = affixForIndex(pdu->s->qp_affix_next);
+        val->prefix_bits = affix.bits;
+        qht_insert(&pdu->s->qpd_table, val, hash, NULL);
+        pdu->s->qp_ndevices++;
+    }
+    return val->prefix_bits;
 }
 
+/**
+ * @brief Slow / full mapping host inode nr -> guest inode nr.
+ *
+ * This function performs a slower and much more costly remapping of an
+ * original file inode number on host to an appropriate different inode
+ * number on guest. For every (dev, inode) combination on host a new
+ * sequential number is generated, cached and exposed as inode number on
+ * guest.
+ *
+ * This is just a "last resort" fallback solution if the much faster/cheaper
+ * qid_path_suffixmap() failed. In practice this slow / full mapping is not
+ * expected ever to be used at all though.
+ *
+ * @see qid_path_suffixmap() for details
+ *
+ */
 static int qid_path_fullmap(V9fsPDU *pdu, const struct stat *stbuf,
                             uint64_t *path)
 {
@@ -628,11 +799,7 @@ static int qid_path_fullmap(V9fsPDU *pdu, const struct stat *stbuf,
         .ino = stbuf->st_ino
     }, *val;
     uint32_t hash = qpf_hash(lookup);
-
-    /* most users won't need the fullmap, so init the table lazily */
-    if (!pdu->s->qpf_table.map) {
-        qpf_table_init(&pdu->s->qpf_table);
-    }
+    VariLenAffix affix;
 
     val = qht_lookup(&pdu->s->qpf_table, &lookup, hash);
 
@@ -650,8 +817,11 @@ static int qid_path_fullmap(V9fsPDU *pdu, const struct stat *stbuf,
         *val = lookup;
 
         /* new unique inode and device combo */
-        val->path = pdu->s->qp_fullpath_next++;
-        pdu->s->qp_fullpath_next &= QPATH_INO_MASK;
+        affix = affixForIndex(
+            1ULL << (sizeof(pdu->s->qp_affix_next) * 8)
+        );
+        val->path = (pdu->s->qp_fullpath_next++ << affix.bits) | affix.value;
+        pdu->s->qp_fullpath_next &= ((1ULL << (64 - affix.bits)) - 1);
         qht_insert(&pdu->s->qpf_table, val, hash, NULL);
     }
 
@@ -659,31 +829,60 @@ static int qid_path_fullmap(V9fsPDU *pdu, const struct stat *stbuf,
     return 0;
 }
 
-/*
- * stat_to_qid needs to map inode number (64 bits) and device id (32 bits)
- * to a unique QID path (64 bits). To avoid having to map and keep track
- * of up to 2^64 objects, we map only the 16 highest bits of the inode plus
- * the device id to the 16 highest bits of the QID path. The 48 lowest bits
- * of the QID path equal to the lowest bits of the inode number.
+/**
+ * @brief Quick mapping host inode nr -> guest inode nr.
  *
- * This takes advantage of the fact that inode number are usually not
- * random but allocated sequentially, so we have fewer items to keep
- * track of.
+ * This function performs quick remapping of an original file inode number
+ * on host to an appropriate different inode number on guest. This remapping
+ * of inodes is required to avoid inode nr collisions on guest which would
+ * happen if the 9p export contains more than 1 exported file system (or
+ * more than 1 file system data set), because unlike on host level where the
+ * files would have different device nrs, all files exported by 9p would
+ * share the same device nr on guest (the device nr of the virtual 9p device
+ * that is).
+ *
+ * Inode remapping is performed by chopping off high end bits of the original
+ * inode number from host, shifting the result upwards and then assigning a
+ * generated suffix number for the low end bits, where the same suffix number
+ * will be shared by all inodes with the same device id AND the same high end
+ * bits that have been chopped off. That approach utilizes the fact that inode
+ * numbers very likely share the same high end bits (i.e. due to their common
+ * sequential generation by file systems) and hence we only have to generate
+ * and track a very limited amount of suffixes in practice due to that.
+ *
+ * We generate variable size suffixes for that purpose. The 1st generated
+ * suffix will only have 1 bit and hence we only need to chop off 1 bit from
+ * the original inode number. The subsequent suffixes being generated will
+ * grow in (bit) size subsequently, i.e. the 2nd and 3rd suffix being
+ * generated will have 3 bits and hence we have to chop off 3 bits from their
+ * original inodes, and so on. That approach of using variable length suffixes
+ * (i.e. over fixed size ones) utilizes the fact that in practice only a very
+ * limited amount of devices are shared by the same export (e.g. typically
+ * less than 2 dozen devices per 9p export), so in practice we need to chop
+ * off less bits than with fixed size prefixes and yet are flexible to add
+ * new devices at runtime below host's export directory at any time without
+ * having to reboot guest nor requiring to reconfigure guest for that. And due
+ * to the very limited amount of original high end bits that we chop off that
+ * way, the total amount of suffixes we need to generate is less than by using
+ * fixed size prefixes and hence it also improves performance of the inode
+ * remapping algorithm, and finally has the nice side effect that the inode
+ * numbers on guest will be much smaller & human friendly. ;-)
  */
-static int qid_path_prefixmap(V9fsPDU *pdu, const struct stat *stbuf,
+static int qid_path_suffixmap(V9fsPDU *pdu, const struct stat *stbuf,
                               uint64_t *path)
 {
+    const int ino_hash_bits = qid_inode_prefix_hash_bits(pdu, stbuf->st_dev);
     QppEntry lookup = {
         .dev = stbuf->st_dev,
-        .ino_prefix = (uint16_t) (stbuf->st_ino >> 48)
+        .ino_prefix = (uint16_t) (stbuf->st_ino >> (64 - ino_hash_bits))
     }, *val;
     uint32_t hash = qpp_hash(lookup);
 
     val = qht_lookup(&pdu->s->qpp_table, &lookup, hash);
 
     if (!val) {
-        if (pdu->s->qp_prefix_next == 0) {
-            /* we ran out of prefixes */
+        if (pdu->s->qp_affix_next == 0) {
+            /* we ran out of affixes */
             warn_report_once(
                 "9p: Potential degraded performance of inode remapping"
             );
@@ -693,12 +892,13 @@ static int qid_path_prefixmap(V9fsPDU *pdu, const struct stat *stbuf,
         val = g_malloc0(sizeof(QppEntry));
         *val = lookup;
 
-        /* new unique inode prefix and device combo */
-        val->qp_prefix = pdu->s->qp_prefix_next++;
+        /* new unique inode affix and device combo */
+        val->qp_affix_index = pdu->s->qp_affix_next++;
+        val->qp_affix = affixForIndex(val->qp_affix_index);
         qht_insert(&pdu->s->qpp_table, val, hash, NULL);
     }
-
-    *path = ((uint64_t)val->qp_prefix << 48) | (stbuf->st_ino & QPATH_INO_MASK);
+    /* assuming generated affix to be suffix type, not prefix */
+    *path = (stbuf->st_ino << val->qp_affix.bits) | val->qp_affix.value;
     return 0;
 }
 
@@ -709,7 +909,7 @@ static int stat_to_qid(V9fsPDU *pdu, const struct stat *stbuf, V9fsQID *qidp)
 
     if (pdu->s->ctx.export_flags & V9FS_REMAP_INODES) {
         /* map inode+device to qid path (fast path) */
-        err = qid_path_prefixmap(pdu, stbuf, &qidp->path);
+        err = qid_path_suffixmap(pdu, stbuf, &qidp->path);
         if (err == -ENFILE) {
             /* fast path didn't work, fall back to full map */
             err = qid_path_fullmap(pdu, stbuf, &qidp->path);
@@ -3876,8 +4076,15 @@ int v9fs_device_realize_common(V9fsState *s, const V9fsTransport *t,
 
     s->dev_id = stat.st_dev;
 
+    /* init inode remapping : */
+    /* hash table for variable length inode suffixes */
+    qpd_table_init(&s->qpd_table);
+    /* hash table for slow/full inode remapping (most users won't need it) */
+    qpf_table_init(&s->qpf_table);
+    /* hash table for quick inode remapping */
     qpp_table_init(&s->qpp_table);
-    s->qp_prefix_next = 1; /* reserve 0 to detect overflow */
+    s->qp_ndevices = 0;
+    s->qp_affix_next = 1; /* reserve 0 to detect overflow */
     s->qp_fullpath_next = 1;
 
     s->ctx.fst = &fse->fst;
@@ -3901,6 +4108,7 @@ void v9fs_device_unrealize_common(V9fsState *s, Error **errp)
         fsdev_throttle_cleanup(s->ctx.fst);
     }
     g_free(s->tag);
+    qp_table_destroy(&s->qpd_table);
     qp_table_destroy(&s->qpp_table);
     qp_table_destroy(&s->qpf_table);
     g_free(s->ctx.fs_root);
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 35a362c0d7..3904f82901 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -236,13 +236,49 @@ struct V9fsFidState
     V9fsFidState *rclm_lst;
 };
 
-#define QPATH_INO_MASK        ((1ULL << 48) - 1)
+typedef enum AffixType_t {
+    AffixType_Prefix,
+    AffixType_Suffix, /* A.k.a. postfix. */
+} AffixType_t;
+
+/**
+ * @brief Unique affix of variable length.
+ *
+ * An affix is (currently) either a suffix or a prefix, which is either
+ * going to be prepended (prefix) or appended (suffix) with some other
+ * number for the goal to generate unique numbers. Accordingly the
+ * suffixes (or prefixes) we generate @b must all have the mathematical
+ * property of being suffix-free (or prefix-free in case of prefixes)
+ * so that no matter what number we concatenate the affix with, that we
+ * always reliably get unique numbers as result after concatenation.
+ */
+typedef struct VariLenAffix {
+    AffixType_t type; /* Whether this affix is a suffix or a prefix. */
+    uint64_t value; /* Actual numerical value of this affix. */
+    /*
+     * Lenght of the affix, that is how many (of the lowest) bits of @c value
+     * must be used for appending/prepending this affix to its final resulting,
+     * unique number.
+     */
+    int bits;
+} VariLenAffix;
+
+/* See qid_inode_prefix_hash_bits(). */
+typedef struct {
+    dev_t dev; /* FS device on host. */
+    /*
+     * How many (high) bits of the original inode number shall be used for
+     * hashing.
+     */
+    int prefix_bits;
+} QpdEntry;
 
 /* QID path prefix entry, see stat_to_qid */
 typedef struct {
     dev_t dev;
     uint16_t ino_prefix;
-    uint16_t qp_prefix;
+    uint32_t qp_affix_index;
+    VariLenAffix qp_affix;
 } QppEntry;
 
 /* QID path full entry, as above */
@@ -274,9 +310,11 @@ struct V9fsState
     V9fsConf fsconf;
     V9fsQID root_qid;
     dev_t dev_id;
+    struct qht qpd_table;
     struct qht qpp_table;
     struct qht qpf_table;
-    uint16_t qp_prefix_next;
+    uint64_t qp_ndevices; /* Amount of entries in qpd_table. */
+    uint16_t qp_affix_next;
     uint64_t qp_fullpath_next;
 };
 
-- 
2.20.1


