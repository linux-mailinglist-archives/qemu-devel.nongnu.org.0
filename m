Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2469F1428A1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 11:57:26 +0100 (CET)
Received: from localhost ([::1]:34013 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itUkG-0000Zx-OI
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 05:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itURI-0008SG-8g
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:37:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itURG-0003NO-5R
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:37:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41449
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itURF-0003My-VA
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=POlrnJtHqYzTPgz26FEG9BNU0bYXsBrc8l+YGLA2QjU=;
 b=hzvYElQkQqIpYE9z6L7RUZMzMuB7y1jv3Rkqkryxmpc1iKfR3ldHVOOGh+xtHtb6OtHJJF
 hRm4sO8ZcL76Ukkpk+QbqxldtoSJg4eVNStYuTkPw7sS0U1bMegUvkRfOMmjpkfCzpEgBl
 ilfxQcU4PnmDVehVtZU27pL3pzQNaCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-rs21A_unNb6cGhvolAfZMg-1; Mon, 20 Jan 2020 05:37:44 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EB8D1B18BC2;
 Mon, 20 Jan 2020 10:37:42 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA0CF1BC6D;
 Mon, 20 Jan 2020 10:37:32 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/29] migration: Support QLIST migration
Date: Mon, 20 Jan 2020 11:33:39 +0100
Message-Id: <20200120103340.25118-29-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: rs21A_unNb6cGhvolAfZMg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Support QLIST migration using the same principle as QTAILQ:
94869d5c52 ("migration: migrate QTAILQ").

The VMSTATE_QLIST_V macro has the same proto as VMSTATE_QTAILQ_V.
The change mainly resides in QLIST RAW macros: QLIST_RAW_INSERT_HEAD
and QLIST_RAW_REVERSE.

Tests also are provided.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/vmstate.h |  21 +++++
 include/qemu/queue.h        |  39 +++++++++
 migration/trace-events      |   5 ++
 migration/vmstate-types.c   |  70 +++++++++++++++
 tests/test-vmstate.c        | 170 ++++++++++++++++++++++++++++++++++++
 5 files changed, 305 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 01790b8d9b..30667631bc 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -229,6 +229,7 @@ extern const VMStateInfo vmstate_info_tmp;
 extern const VMStateInfo vmstate_info_bitmap;
 extern const VMStateInfo vmstate_info_qtailq;
 extern const VMStateInfo vmstate_info_gtree;
+extern const VMStateInfo vmstate_info_qlist;
=20
 #define type_check_2darray(t1,t2,n,m) ((t1(*)[n][m])0 - (t2*)0)
 /*
@@ -798,6 +799,26 @@ extern const VMStateInfo vmstate_info_gtree;
     .offset       =3D offsetof(_state, _field),                           =
       \
 }
=20
+/*
+ * For migrating a QLIST
+ * Target QLIST needs be properly initialized.
+ * _type: type of QLIST element
+ * _next: name of QLIST_ENTRY entry field in QLIST element
+ * _vmsd: VMSD for QLIST element
+ * size: size of QLIST element
+ * start: offset of QLIST_ENTRY in QTAILQ element
+ */
+#define VMSTATE_QLIST_V(_field, _state, _version, _vmsd, _type, _next)  \
+{                                                                        \
+    .name         =3D (stringify(_field)),                                =
 \
+    .version_id   =3D (_version),                                         =
 \
+    .vmsd         =3D &(_vmsd),                                           =
 \
+    .size         =3D sizeof(_type),                                      =
 \
+    .info         =3D &vmstate_info_qlist,                                =
 \
+    .offset       =3D offsetof(_state, _field),                           =
 \
+    .start        =3D offsetof(_type, _next),                             =
 \
+}
+
 /* _f : field name
    _f_n : num of elements field_name
    _n : num of elements
diff --git a/include/qemu/queue.h b/include/qemu/queue.h
index 4764d93ea3..4d4554a7ce 100644
--- a/include/qemu/queue.h
+++ b/include/qemu/queue.h
@@ -501,4 +501,43 @@ union {                                               =
                  \
         QTAILQ_RAW_TQH_CIRC(head)->tql_prev =3D QTAILQ_RAW_TQE_CIRC(elm, e=
ntry);  \
 } while (/*CONSTCOND*/0)
=20
+#define QLIST_RAW_FIRST(head)                                             =
     \
+        field_at_offset(head, 0, void *)
+
+#define QLIST_RAW_NEXT(elm, entry)                                        =
     \
+        field_at_offset(elm, entry, void *)
+
+#define QLIST_RAW_PREVIOUS(elm, entry)                                    =
     \
+        field_at_offset(elm, entry + sizeof(void *), void *)
+
+#define QLIST_RAW_FOREACH(elm, head, entry)                               =
     \
+        for ((elm) =3D *QLIST_RAW_FIRST(head);                            =
       \
+             (elm);                                                       =
     \
+             (elm) =3D *QLIST_RAW_NEXT(elm, entry))
+
+#define QLIST_RAW_INSERT_HEAD(head, elm, entry) do {                      =
     \
+        void *first =3D *QLIST_RAW_FIRST(head);                           =
       \
+        *QLIST_RAW_FIRST(head) =3D elm;                                   =
       \
+        *QLIST_RAW_PREVIOUS(elm, entry) =3D QLIST_RAW_FIRST(head);        =
       \
+        if (first) {                                                      =
     \
+            *QLIST_RAW_NEXT(elm, entry) =3D first;                        =
       \
+            *QLIST_RAW_PREVIOUS(first, entry) =3D QLIST_RAW_NEXT(elm, entr=
y);    \
+        } else {                                                          =
     \
+            *QLIST_RAW_NEXT(elm, entry) =3D NULL;                         =
       \
+        }                                                                 =
     \
+} while (0)
+
+#define QLIST_RAW_REVERSE(head, elm, entry) do {                          =
     \
+        void *iter =3D *QLIST_RAW_FIRST(head), *prev =3D NULL, *next;     =
         \
+        while (iter) {                                                    =
     \
+            next =3D *QLIST_RAW_NEXT(iter, entry);                        =
       \
+            *QLIST_RAW_PREVIOUS(iter, entry) =3D QLIST_RAW_NEXT(next, entr=
y);    \
+            *QLIST_RAW_NEXT(iter, entry) =3D prev;                        =
       \
+            prev =3D iter;                                                =
       \
+            iter =3D next;                                                =
       \
+        }                                                                 =
     \
+        *QLIST_RAW_FIRST(head) =3D prev;                                  =
       \
+        *QLIST_RAW_PREVIOUS(prev, entry) =3D QLIST_RAW_FIRST(head);       =
       \
+} while (0)
+
 #endif /* QEMU_SYS_QUEUE_H */
diff --git a/migration/trace-events b/migration/trace-events
index 2f9129e213..4ab0a503d2 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -76,6 +76,11 @@ get_gtree_end(const char *field_name, const char *key_vm=
sd_name, const char *val
 put_gtree(const char *field_name, const char *key_vmsd_name, const char *v=
al_vmsd_name, uint32_t nnodes) "%s(%s/%s) nnodes=3D%d"
 put_gtree_end(const char *field_name, const char *key_vmsd_name, const cha=
r *val_vmsd_name, int ret) "%s(%s/%s) %d"
=20
+get_qlist(const char *field_name, const char *vmsd_name, int version_id) "=
%s(%s v%d)"
+get_qlist_end(const char *field_name, const char *vmsd_name) "%s(%s)"
+put_qlist(const char *field_name, const char *vmsd_name, int version_id) "=
%s(%s v%d)"
+put_qlist_end(const char *field_name, const char *vmsd_name) "%s(%s)"
+
 # qemu-file.c
 qemu_file_fclose(void) ""
=20
diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
index 7236cf92bc..1eee36773a 100644
--- a/migration/vmstate-types.c
+++ b/migration/vmstate-types.c
@@ -843,3 +843,73 @@ const VMStateInfo vmstate_info_gtree =3D {
     .get  =3D get_gtree,
     .put  =3D put_gtree,
 };
+
+static int put_qlist(QEMUFile *f, void *pv, size_t unused_size,
+                     const VMStateField *field, QJSON *vmdesc)
+{
+    const VMStateDescription *vmsd =3D field->vmsd;
+    /* offset of the QTAILQ entry in a QTAILQ element*/
+    size_t entry_offset =3D field->start;
+    void *elm;
+    int ret;
+
+    trace_put_qlist(field->name, vmsd->name, vmsd->version_id);
+    QLIST_RAW_FOREACH(elm, pv, entry_offset) {
+        qemu_put_byte(f, true);
+        ret =3D vmstate_save_state(f, vmsd, elm, vmdesc);
+        if (ret) {
+            error_report("%s: failed to save %s (%d)", field->name,
+                         vmsd->name, ret);
+            return ret;
+        }
+    }
+    qemu_put_byte(f, false);
+    trace_put_qlist_end(field->name, vmsd->name);
+
+    return 0;
+}
+
+static int get_qlist(QEMUFile *f, void *pv, size_t unused_size,
+                     const VMStateField *field)
+{
+    int ret =3D 0;
+    const VMStateDescription *vmsd =3D field->vmsd;
+    /* size of a QLIST element */
+    size_t size =3D field->size;
+    /* offset of the QLIST entry in a QLIST element */
+    size_t entry_offset =3D field->start;
+    int version_id =3D field->version_id;
+    void *elm;
+
+    trace_get_qlist(field->name, vmsd->name, vmsd->version_id);
+    if (version_id > vmsd->version_id) {
+        error_report("%s %s",  vmsd->name, "too new");
+        return -EINVAL;
+    }
+    if (version_id < vmsd->minimum_version_id) {
+        error_report("%s %s",  vmsd->name, "too old");
+        return -EINVAL;
+    }
+
+    while (qemu_get_byte(f)) {
+        elm =3D g_malloc(size);
+        ret =3D vmstate_load_state(f, vmsd, elm, version_id);
+        if (ret) {
+            error_report("%s: failed to load %s (%d)", field->name,
+                         vmsd->name, ret);
+            g_free(elm);
+            return ret;
+        }
+        QLIST_RAW_INSERT_HEAD(pv, elm, entry_offset);
+    }
+    QLIST_RAW_REVERSE(pv, elm, entry_offset);
+    trace_get_qlist_end(field->name, vmsd->name);
+
+    return ret;
+}
+
+const VMStateInfo vmstate_info_qlist =3D {
+    .name =3D "qlist",
+    .get  =3D get_qlist,
+    .put  =3D put_qlist,
+};
diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
index 8f184f3556..cea363dd69 100644
--- a/tests/test-vmstate.c
+++ b/tests/test-vmstate.c
@@ -926,6 +926,28 @@ static const VMStateDescription vmstate_domain =3D {
     }
 };
=20
+/* test QLIST Migration */
+
+typedef struct TestQListElement {
+    uint32_t  id;
+    QLIST_ENTRY(TestQListElement) next;
+} TestQListElement;
+
+typedef struct TestQListContainer {
+    uint32_t  id;
+    QLIST_HEAD(, TestQListElement) list;
+} TestQListContainer;
+
+static const VMStateDescription vmstate_qlist_element =3D {
+    .name =3D "test/queue list",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(id, TestQListElement),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_iommu =3D {
     .name =3D "iommu",
     .version_id =3D 1,
@@ -939,6 +961,18 @@ static const VMStateDescription vmstate_iommu =3D {
     }
 };
=20
+static const VMStateDescription vmstate_container =3D {
+    .name =3D "test/container/qlist",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(id, TestQListContainer),
+        VMSTATE_QLIST_V(list, TestQListContainer, 1, vmstate_qlist_element=
,
+                        TestQListElement, next),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 uint8_t first_domain_dump[] =3D {
     /* id */
     0x00, 0x0, 0x0, 0x6,
@@ -1229,6 +1263,140 @@ static void test_gtree_load_iommu(void)
     qemu_fclose(fload);
 }
=20
+static uint8_t qlist_dump[] =3D {
+    0x00, 0x00, 0x00, 0x01, /* container id */
+    0x1, /* start of a */
+    0x00, 0x00, 0x00, 0x0a,
+    0x1, /* start of b */
+    0x00, 0x00, 0x0b, 0x00,
+    0x1, /* start of c */
+    0x00, 0x0c, 0x00, 0x00,
+    0x1, /* start of d */
+    0x0d, 0x00, 0x00, 0x00,
+    0x0, /* end of list */
+    QEMU_VM_EOF, /* just to ensure we won't get EOF reported prematurely *=
/
+};
+
+static TestQListContainer *alloc_container(void)
+{
+    TestQListElement *a =3D g_malloc(sizeof(TestQListElement));
+    TestQListElement *b =3D g_malloc(sizeof(TestQListElement));
+    TestQListElement *c =3D g_malloc(sizeof(TestQListElement));
+    TestQListElement *d =3D g_malloc(sizeof(TestQListElement));
+    TestQListContainer *container =3D g_malloc(sizeof(TestQListContainer))=
;
+
+    a->id =3D 0x0a;
+    b->id =3D 0x0b00;
+    c->id =3D 0xc0000;
+    d->id =3D 0xd000000;
+    container->id =3D 1;
+
+    QLIST_INIT(&container->list);
+    QLIST_INSERT_HEAD(&container->list, d, next);
+    QLIST_INSERT_HEAD(&container->list, c, next);
+    QLIST_INSERT_HEAD(&container->list, b, next);
+    QLIST_INSERT_HEAD(&container->list, a, next);
+    return container;
+}
+
+static void free_container(TestQListContainer *container)
+{
+    TestQListElement *iter, *tmp;
+
+    QLIST_FOREACH_SAFE(iter, &container->list, next, tmp) {
+        QLIST_REMOVE(iter, next);
+        g_free(iter);
+    }
+    g_free(container);
+}
+
+static void compare_containers(TestQListContainer *c1, TestQListContainer =
*c2)
+{
+    TestQListElement *first_item_c1, *first_item_c2;
+
+    while (!QLIST_EMPTY(&c1->list)) {
+        first_item_c1 =3D QLIST_FIRST(&c1->list);
+        first_item_c2 =3D QLIST_FIRST(&c2->list);
+        assert(first_item_c2);
+        assert(first_item_c1->id =3D=3D first_item_c2->id);
+        QLIST_REMOVE(first_item_c1, next);
+        QLIST_REMOVE(first_item_c2, next);
+        g_free(first_item_c1);
+        g_free(first_item_c2);
+    }
+    assert(QLIST_EMPTY(&c2->list));
+}
+
+/*
+ * Check the prev & next fields are correct by doing list
+ * manipulations on the container. We will do that for both
+ * the source and the destination containers
+ */
+static void manipulate_container(TestQListContainer *c)
+{
+     TestQListElement *prev =3D NULL, *iter =3D QLIST_FIRST(&c->list);
+     TestQListElement *elem;
+
+     elem =3D g_malloc(sizeof(TestQListElement));
+     elem->id =3D 0x12;
+     QLIST_INSERT_AFTER(iter, elem, next);
+
+     elem =3D g_malloc(sizeof(TestQListElement));
+     elem->id =3D 0x13;
+     QLIST_INSERT_HEAD(&c->list, elem, next);
+
+     while (iter) {
+        prev =3D iter;
+        iter =3D QLIST_NEXT(iter, next);
+     }
+
+     elem =3D g_malloc(sizeof(TestQListElement));
+     elem->id =3D 0x14;
+     QLIST_INSERT_BEFORE(prev, elem, next);
+
+     elem =3D g_malloc(sizeof(TestQListElement));
+     elem->id =3D 0x15;
+     QLIST_INSERT_AFTER(prev, elem, next);
+
+     QLIST_REMOVE(prev, next);
+     g_free(prev);
+}
+
+static void test_save_qlist(void)
+{
+    TestQListContainer *container =3D alloc_container();
+
+    save_vmstate(&vmstate_container, container);
+    compare_vmstate(qlist_dump, sizeof(qlist_dump));
+    free_container(container);
+}
+
+static void test_load_qlist(void)
+{
+    QEMUFile *fsave, *fload;
+    TestQListContainer *orig_container =3D alloc_container();
+    TestQListContainer *dest_container =3D g_malloc0(sizeof(TestQListConta=
iner));
+    char eof;
+
+    QLIST_INIT(&dest_container->list);
+
+    fsave =3D open_test_file(true);
+    qemu_put_buffer(fsave, qlist_dump, sizeof(qlist_dump));
+    g_assert(!qemu_file_get_error(fsave));
+    qemu_fclose(fsave);
+
+    fload =3D open_test_file(false);
+    vmstate_load_state(fload, &vmstate_container, dest_container, 1);
+    eof =3D qemu_get_byte(fload);
+    g_assert(!qemu_file_get_error(fload));
+    g_assert_cmpint(eof, =3D=3D, QEMU_VM_EOF);
+    manipulate_container(orig_container);
+    manipulate_container(dest_container);
+    compare_containers(orig_container, dest_container);
+    free_container(orig_container);
+    free_container(dest_container);
+}
+
 typedef struct TmpTestStruct {
     TestStruct *parent;
     int64_t diff;
@@ -1353,6 +1521,8 @@ int main(int argc, char **argv)
     g_test_add_func("/vmstate/gtree/load/loaddomain", test_gtree_load_doma=
in);
     g_test_add_func("/vmstate/gtree/save/saveiommu", test_gtree_save_iommu=
);
     g_test_add_func("/vmstate/gtree/load/loadiommu", test_gtree_load_iommu=
);
+    g_test_add_func("/vmstate/qlist/save/saveqlist", test_save_qlist);
+    g_test_add_func("/vmstate/qlist/load/loadqlist", test_load_qlist);
     g_test_add_func("/vmstate/tmp_struct", test_tmp_struct);
     g_test_run();
=20
--=20
2.24.1


