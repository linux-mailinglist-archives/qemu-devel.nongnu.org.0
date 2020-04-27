Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F97F1BA3A5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 14:35:02 +0200 (CEST)
Received: from localhost ([::1]:43354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT2yT-000241-Hl
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 08:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37646)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jT2xN-0001H8-0t
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 08:33:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jT2xL-0007T9-WA
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 08:33:52 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36868
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jT2xL-0007Su-Jv
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 08:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587990829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I0Rif41FtfLN5rZCVPicr3V8GG/DoCGIIYksIDWRrXA=;
 b=KCungL/CZMrvpme8ouhDx3h92rdz6eo0WQelbB7hTYMU+q6KeKbPfozEd1/ah9N0qZclIr
 dQEXMGJl8jcybNZSpvXHMpnM/1NMJhmTSRsFnmGHez1e2nqMBe5RgompRVqymmopPrrFPq
 YR5Rz1bdfZW6jwePlqP9zXS46oT9DYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-6C2H6r7sMt6HH2_c7b6zOw-1; Mon, 27 Apr 2020 08:33:48 -0400
X-MC-Unique: 6C2H6r7sMt6HH2_c7b6zOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45BB2872FE0
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 12:33:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FFF960CD3;
 Mon, 27 Apr 2020 12:33:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8879B11358BC; Mon, 27 Apr 2020 14:33:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: qdev unrealize error handling WTF?!?
Date: Mon, 27 Apr 2020 14:33:45 +0200
Message-ID: <87k121hzva.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 23:33:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have a look at device_set_realized():

    static void device_set_realized(Object *obj, bool value, Error **errp)
    {
        DeviceState *dev =3D DEVICE(obj);
        DeviceClass *dc =3D DEVICE_GET_CLASS(dev);
        HotplugHandler *hotplug_ctrl;
        BusState *bus;
        Error *local_err =3D NULL;
        bool unattached_parent =3D false;
        static int unattached_count;

        if (dev->hotplugged && !dc->hotpluggable) {
            error_setg(errp, QERR_DEVICE_NO_HOTPLUG, object_get_typename(ob=
j));
            return;
        }

        if (value && !dev->realized) {
            [code to realize snipped...]
        } else if (!value && dev->realized) {
            /* We want local_err to track only the first error */
            QLIST_FOREACH(bus, &dev->child_bus, sibling) {
[1]             object_property_set_bool(OBJECT(bus), false, "realized",
                                         local_err ? NULL : &local_err);
            }
            if (qdev_get_vmsd(dev)) {
[2]             vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev=
);
            }
            if (dc->unrealize) {
[3]             dc->unrealize(dev, local_err ? NULL : &local_err);
            }
            dev->pending_deleted_event =3D true;
[4]         DEVICE_LISTENER_CALL(unrealize, Reverse, dev);

            if (local_err !=3D NULL) {
                goto fail;
            }
        }

        assert(local_err =3D=3D NULL);
        dev->realized =3D value;
        return;

    [realize-only error handling snipped...]
    fail:
        error_propagate(errp, local_err);
        if (unattached_parent) {
            object_unparent(OBJECT(dev));
            unattached_count--;
        }
    }

Can fail in two places: [1] a device on dev->child_bus fails to
unrealize, or [3] @dev itself fails to unrealize.  We hold on to the
first failure, and continue to unrealize.  device_set_realized() fails
when any of these fail.

Issue #1: What if some, but not all fail?  How can this possibly work?

Issue #2: Even if all fail, and therefore both the device and the ones
on ->child_bus all remain realized, there are side effects at [2] and
[4].

Any better ideas than &error_abort?


