Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0EC2F7FE7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:45:16 +0100 (CET)
Received: from localhost ([::1]:35798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RHn-0006aX-6u
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0RBg-0008Ed-RB
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0RBf-0004Tz-3h
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610725134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=T1gEFYs8BJq4VgEOQSlhRu2XCUetWfopliW4eNbcSqM=;
 b=XfEMhvQRr33Q+9/xfpIbOwDXpb/6YUxoVK4sUiQHuexPOY1HyjfEgbkv4Nl6JrC8KWsioI
 xyJUZRPLEgHEe2+kFzcnyOv7wFGAc1CRwd8phsDUPOguRtuV9lHqG8ZKBb9hy1Zh8Dlusf
 84g4SsndIV9NRZYd40VubUfnNgpsSwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-6sIR6yXwOUqggplAkGZMgg-1; Fri, 15 Jan 2021 10:38:52 -0500
X-MC-Unique: 6sIR6yXwOUqggplAkGZMgg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2C2C80A5C0;
 Fri, 15 Jan 2021 15:38:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-142.ams2.redhat.com
 [10.36.115.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0718E6F7E5;
 Fri, 15 Jan 2021 15:38:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7339011386A7; Fri, 15 Jan 2021 16:38:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Realize methods realizing "sideways" in the composition tree
Date: Fri, 15 Jan 2021 16:38:42 +0100
Message-ID: <87im7yi519.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Perhaps I'm slow on the uptake today...

We have

    typedef struct XHCIPciState {
        /*< private >*/
        PCIDevice parent_obj;
        /*< public >*/
(1)     XHCIState xhci;
        OnOffAuto msi;
        OnOffAuto msix;
    } XHCIPciState;

This is a PCI device that contains a (bus-less) TYPE_XHCI device, at
(1).

    static void xhci_instance_init(Object *obj)
    {
        XHCIPciState *s = XHCI_PCI(obj);
        /*
         * QEMU_PCI_CAP_EXPRESS initialization does not depend on QEMU command
         * line, therefore, no need to wait to realize like other devices
         */
        PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
(2)     object_initialize_child(obj, "xhci-core", &s->xhci, TYPE_XHCI);
        qdev_alias_all_properties(DEVICE(&s->xhci), obj);
    }

The .instance_init() method initializes the child as it should, at (2).

    static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
    {
        int ret;
        Error *err = NULL;
        XHCIPciState *s = XHCI_PCI(dev);

        [a few dev->config[] modifications...]

(1)     object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
        s->xhci.intr_update = xhci_pci_intr_update;
        s->xhci.intr_raise = xhci_pci_intr_raise;
(2)     object_property_set_bool(OBJECT(&s->xhci), "realized", true, &err);
        if (err) {
            error_propagate(errp, err);
            return;
        }

The .realize() method realizes the child at (1).  It should use
qdev_realize() like we do everywhere else, since commit ce189ab230
"qdev: Convert bus-less devices to qdev_realize() with Coccinelle".

It sets a link property from the child back to the parent at (2).  Why
do we need a link?  Each QOM Object contains a pointer to its parent,
doesn't it?

Same for xhci_sysbus_realize().


