Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53FE1773F4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 11:22:30 +0100 (CET)
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j94h3-0006px-UE
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 05:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52803)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j94WZ-0000OH-Bf
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j94WX-0006Jw-CP
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27526
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j94WX-0006Jp-7z
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583230296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4GYxqFMSlUpDZfY0hHnuNuw94Jx/2/P0h/td/zEzqU=;
 b=W2mJ1braXZ0cUDkV5AB4aVMYTIi+WVk3EH+9RtOMR8STFxsldJ6TidBd0riY58ACX/9M02
 jIZNdm8k6+eHJV8jITXgIZPbJy2EnXnx1e8X3P4qmD7XXiYp9roAzAhFPSmw/BVn11zJUx
 2bwitP75Qk6wnaQKwPnrqGLA/UbGWvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-0zcQz8NQNVW-ZuG5EI3jZA-1; Tue, 03 Mar 2020 05:11:33 -0500
X-MC-Unique: 0zcQz8NQNVW-ZuG5EI3jZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D874107ACC4;
 Tue,  3 Mar 2020 10:11:32 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-98.pek2.redhat.com
 [10.72.12.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B80AB8B745;
 Tue,  3 Mar 2020 10:11:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 21/23] net/filter.c: Add Options to insert filters anywhere
 in the filter list
Date: Tue,  3 Mar 2020 18:10:40 +0800
Message-Id: <1583230242-14597-22-git-send-email-jasowang@redhat.com>
In-Reply-To: <1583230242-14597-1-git-send-email-jasowang@redhat.com>
References: <1583230242-14597-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Jason Wang <jasowang@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

To switch the Secondary to Primary, we need to insert new filters
before the filter-rewriter.

Add the options insert=3D and position=3D to be able to insert filters
anywhere in the filter list.

position should be "head" or "tail" to insert at the head or
tail of the filter list or it should be "id=3D<id>" to specify
the id of another filter.
insert should be either "before" or "behind" to specify where to
insert the new filter relative to the one specified with position.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/filter.h |  2 ++
 net/filter.c         | 92 ++++++++++++++++++++++++++++++++++++++++++++++++=
+++-
 qemu-options.hx      | 31 +++++++++++++++---
 3 files changed, 119 insertions(+), 6 deletions(-)

diff --git a/include/net/filter.h b/include/net/filter.h
index e8fb625..9393c59 100644
--- a/include/net/filter.h
+++ b/include/net/filter.h
@@ -62,6 +62,8 @@ struct NetFilterState {
     NetClientState *netdev;
     NetFilterDirection direction;
     bool on;
+    char *position;
+    bool insert_before_flag;
     QTAILQ_ENTRY(NetFilterState) next;
 };
=20
diff --git a/net/filter.c b/net/filter.c
index 4b932e7..8221666 100644
--- a/net/filter.c
+++ b/net/filter.c
@@ -171,11 +171,47 @@ static void netfilter_set_status(Object *obj, const c=
har *str, Error **errp)
     }
 }
=20
+static char *netfilter_get_position(Object *obj, Error **errp)
+{
+    NetFilterState *nf =3D NETFILTER(obj);
+
+    return g_strdup(nf->position);
+}
+
+static void netfilter_set_position(Object *obj, const char *str, Error **e=
rrp)
+{
+    NetFilterState *nf =3D NETFILTER(obj);
+
+    nf->position =3D g_strdup(str);
+}
+
+static char *netfilter_get_insert(Object *obj, Error **errp)
+{
+    NetFilterState *nf =3D NETFILTER(obj);
+
+    return nf->insert_before_flag ? g_strdup("before") : g_strdup("behind"=
);
+}
+
+static void netfilter_set_insert(Object *obj, const char *str, Error **err=
p)
+{
+    NetFilterState *nf =3D NETFILTER(obj);
+
+    if (strcmp(str, "before") && strcmp(str, "behind")) {
+        error_setg(errp, "Invalid value for netfilter insert, "
+                         "should be 'before' or 'behind'");
+        return;
+    }
+
+    nf->insert_before_flag =3D !strcmp(str, "before");
+}
+
 static void netfilter_init(Object *obj)
 {
     NetFilterState *nf =3D NETFILTER(obj);
=20
     nf->on =3D true;
+    nf->insert_before_flag =3D false;
+    nf->position =3D g_strdup("tail");
=20
     object_property_add_str(obj, "netdev",
                             netfilter_get_netdev_id, netfilter_set_netdev_=
id,
@@ -187,11 +223,18 @@ static void netfilter_init(Object *obj)
     object_property_add_str(obj, "status",
                             netfilter_get_status, netfilter_set_status,
                             NULL);
+    object_property_add_str(obj, "position",
+                            netfilter_get_position, netfilter_set_position=
,
+                            NULL);
+    object_property_add_str(obj, "insert",
+                            netfilter_get_insert, netfilter_set_insert,
+                            NULL);
 }
=20
 static void netfilter_complete(UserCreatable *uc, Error **errp)
 {
     NetFilterState *nf =3D NETFILTER(uc);
+    NetFilterState *position =3D NULL;
     NetClientState *ncs[MAX_QUEUE_NUM];
     NetFilterClass *nfc =3D NETFILTER_GET_CLASS(uc);
     int queues;
@@ -219,6 +262,41 @@ static void netfilter_complete(UserCreatable *uc, Erro=
r **errp)
         return;
     }
=20
+    if (strcmp(nf->position, "head") && strcmp(nf->position, "tail")) {
+        Object *container;
+        Object *obj;
+        char *position_id;
+
+        if (!g_str_has_prefix(nf->position, "id=3D")) {
+            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "position",
+                       "'head', 'tail' or 'id=3D<id>'");
+            return;
+        }
+
+        /* get the id from the string */
+        position_id =3D g_strndup(nf->position + 3, strlen(nf->position) -=
 3);
+
+        /* Search for the position to insert before/behind */
+        container =3D object_get_objects_root();
+        obj =3D object_resolve_path_component(container, position_id);
+        if (!obj) {
+            error_setg(errp, "filter '%s' not found", position_id);
+            g_free(position_id);
+            return;
+        }
+
+        position =3D NETFILTER(obj);
+
+        if (position->netdev !=3D ncs[0]) {
+            error_setg(errp, "filter '%s' belongs to a different netdev",
+                        position_id);
+            g_free(position_id);
+            return;
+        }
+
+        g_free(position_id);
+    }
+
     nf->netdev =3D ncs[0];
=20
     if (nfc->setup) {
@@ -228,7 +306,18 @@ static void netfilter_complete(UserCreatable *uc, Erro=
r **errp)
             return;
         }
     }
-    QTAILQ_INSERT_TAIL(&nf->netdev->filters, nf, next);
+
+    if (position) {
+        if (nf->insert_before_flag) {
+            QTAILQ_INSERT_BEFORE(position, nf, next);
+        } else {
+            QTAILQ_INSERT_AFTER(&nf->netdev->filters, position, nf, next);
+        }
+    } else if (!strcmp(nf->position, "head")) {
+        QTAILQ_INSERT_HEAD(&nf->netdev->filters, nf, next);
+    } else if (!strcmp(nf->position, "tail")) {
+        QTAILQ_INSERT_TAIL(&nf->netdev->filters, nf, next);
+    }
 }
=20
 static void netfilter_finalize(Object *obj)
@@ -245,6 +334,7 @@ static void netfilter_finalize(Object *obj)
         QTAILQ_REMOVE(&nf->netdev->filters, nf, next);
     }
     g_free(nf->netdev_id);
+    g_free(nf->position);
 }
=20
 static void default_handle_event(NetFilterState *nf, int event, Error **er=
rp)
diff --git a/qemu-options.hx b/qemu-options.hx
index ac315c1..828e71b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4546,7 +4546,7 @@ applications, they can do this through this parameter=
. Its format is
 a gnutls priority string as described at
 @url{https://gnutls.org/manual/html_node/Priority-Strings.html}.
=20
-@item -object filter-buffer,id=3D@var{id},netdev=3D@var{netdevid},interval=
=3D@var{t}[,queue=3D@var{all|rx|tx}][,status=3D@var{on|off}]
+@item -object filter-buffer,id=3D@var{id},netdev=3D@var{netdevid},interval=
=3D@var{t}[,queue=3D@var{all|rx|tx}][,status=3D@var{on|off}][,position=3D@v=
ar{head|tail|id=3D<id>}][,insert=3D@var{behind|before}]
=20
 Interval @var{t} can't be 0, this filter batches the packet delivery: all
 packets arriving in a given interval on netdev @var{netdevid} are delayed
@@ -4565,11 +4565,32 @@ queue @var{all|rx|tx} is an option that can be appl=
ied to any netfilter.
 @option{tx}: the filter is attached to the transmit queue of the netdev,
              where it will receive packets sent by the netdev.
=20
-@item -object filter-mirror,id=3D@var{id},netdev=3D@var{netdevid},outdev=
=3D@var{chardevid},queue=3D@var{all|rx|tx}[,vnet_hdr_support]
+position @var{head|tail|id=3D<id>} is an option to specify where the
+filter should be inserted in the filter list. It can be applied to any
+netfilter.
+
+@option{head}: the filter is inserted at the head of the filter
+               list, before any existing filters.
+
+@option{tail}: the filter is inserted at the tail of the filter
+               list, behind any existing filters (default).
+
+@option{id=3D<id>}: the filter is inserted before or behind the filter
+                  specified by <id>, see the insert option below.
+
+insert @var{behind|before} is an option to specify where to insert the
+new filter relative to the one specified with position=3Did=3D<id>. It can
+be applied to any netfilter.
+
+@option{before}: insert before the specified filter.
+
+@option{behind}: insert behind the specified filter (default).
+
+@item -object filter-mirror,id=3D@var{id},netdev=3D@var{netdevid},outdev=
=3D@var{chardevid},queue=3D@var{all|rx|tx}[,vnet_hdr_support][,position=3D@=
var{head|tail|id=3D<id>}][,insert=3D@var{behind|before}]
=20
 filter-mirror on netdev @var{netdevid},mirror net packet to chardev@var{ch=
ardevid}, if it has the vnet_hdr_support flag, filter-mirror will mirror pa=
cket with vnet_hdr_len.
=20
-@item -object filter-redirector,id=3D@var{id},netdev=3D@var{netdevid},inde=
v=3D@var{chardevid},outdev=3D@var{chardevid},queue=3D@var{all|rx|tx}[,vnet_=
hdr_support]
+@item -object filter-redirector,id=3D@var{id},netdev=3D@var{netdevid},inde=
v=3D@var{chardevid},outdev=3D@var{chardevid},queue=3D@var{all|rx|tx}[,vnet_=
hdr_support][,position=3D@var{head|tail|id=3D<id>}][,insert=3D@var{behind|b=
efore}]
=20
 filter-redirector on netdev @var{netdevid},redirect filter's net packet to=
 chardev
 @var{chardevid},and redirect indev's packet to filter.if it has the vnet_h=
dr_support flag,
@@ -4578,7 +4599,7 @@ Create a filter-redirector we need to differ outdev i=
d from indev id, id can not
 be the same. we can just use indev or outdev, but at least one of indev or=
 outdev
 need to be specified.
=20
-@item -object filter-rewriter,id=3D@var{id},netdev=3D@var{netdevid},queue=
=3D@var{all|rx|tx},[vnet_hdr_support]
+@item -object filter-rewriter,id=3D@var{id},netdev=3D@var{netdevid},queue=
=3D@var{all|rx|tx},[vnet_hdr_support][,position=3D@var{head|tail|id=3D<id>}=
][,insert=3D@var{behind|before}]
=20
 Filter-rewriter is a part of COLO project.It will rewrite tcp packet to
 secondary from primary to keep secondary tcp connection,and rewrite
@@ -4591,7 +4612,7 @@ colo secondary:
 -object filter-redirector,id=3Df2,netdev=3Dhn0,queue=3Drx,outdev=3Dred1
 -object filter-rewriter,id=3Drew0,netdev=3Dhn0,queue=3Dall
=20
-@item -object filter-dump,id=3D@var{id},netdev=3D@var{dev}[,file=3D@var{fi=
lename}][,maxlen=3D@var{len}]
+@item -object filter-dump,id=3D@var{id},netdev=3D@var{dev}[,file=3D@var{fi=
lename}][,maxlen=3D@var{len}][,position=3D@var{head|tail|id=3D<id>}][,inser=
t=3D@var{behind|before}]
=20
 Dump the network traffic on netdev @var{dev} to the file specified by
 @var{filename}. At most @var{len} bytes (64k by default) per packet are st=
ored.
--=20
2.5.0


