Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A955EF3C3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 12:57:06 +0200 (CEST)
Received: from localhost ([::1]:44740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odrE1-0005IO-9Y
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 06:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odr7N-0003Db-Ft
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 06:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odr7J-0006kJ-Nc
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 06:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664448608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3t+DTxQ/kgxuXd9YhgzCIOZmP6QT81bffq/l/1FlaFk=;
 b=aknV8l/KM8u0mfdcC5NEfESPOUoJyZ72knatQMi4myLv6PTwl3L0/kp/fOqaSkxlBgn+VA
 LhBIs+JU7KYIM3AG0a+fPbBuZ2K2QR6x3/GRFbKX7f3KmD5EmZjhHbWfhMF/Auf6YGWucT
 D0bqVTx/sxCG8SoakTZF+KUBGUTDBdQ=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-22-uB6X2nBQMFizDsr5_5qMiw-1; Thu, 29 Sep 2022 06:50:06 -0400
X-MC-Unique: uB6X2nBQMFizDsr5_5qMiw-1
Received: by mail-ua1-f69.google.com with SMTP id
 z8-20020ab05648000000b003b48415d88cso335183uaa.10
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 03:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=3t+DTxQ/kgxuXd9YhgzCIOZmP6QT81bffq/l/1FlaFk=;
 b=Q1yvEjDOSjup+5shi044dFmEhj7GzbEFZ1s7udDgJN1Q8iXJ5DBFwrBVxVfeLDeYQi
 UCgDiY7P1PC12fZYCNFR6uVk4+7HXV2OowI6DqV1GQ2XxnM/z7fZigyP5l1rUAIPfXna
 GC+r5x6nsI/wXX0RPbJribHrPwX7Z/gytfGqKwWU0RdNpug+Pvy1EcL/cm7Vdc98652c
 jpnctARWZ5jmjSnZDV8xukUaisA9otmXerl2fYoySuWqNFsZP8+hfJUuAWnNPuHSaWjJ
 hOfxUz2omx4oNC6c5x50hqXWSN315/xUbuv5YpEmQn8tL6Se5WCOBv03AtlgU0B+jdH9
 jkTg==
X-Gm-Message-State: ACrzQf2n7UrCUkAfo3jq2P3A9jyQKQY7hQZW0HC6RZR1Uu2bpSFxaPE7
 LG0FPB8hP14NdEO7olTCqz4vpKVGglO8bca9V0veKxLjnts6+CcUCXuKiX02nJro1QkTUA2XVCC
 On2ew/Urw1chWQ8GQ4S72EmaB5i5B6hw=
X-Received: by 2002:ab0:6f94:0:b0:3d1:d6e5:5de6 with SMTP id
 f20-20020ab06f94000000b003d1d6e55de6mr1073455uav.51.1664448605504; 
 Thu, 29 Sep 2022 03:50:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7AIYTjx3mqE0b7ljJyJgBmdJwNTXvfP24F/B4A/OCklwK/6cn1Vc9o9JJysFY+ywpuP0we2mtws2wMWe2BDqI=
X-Received: by 2002:ab0:6f94:0:b0:3d1:d6e5:5de6 with SMTP id
 f20-20020ab06f94000000b003d1d6e55de6mr1073408uav.51.1664448604145; Thu, 29
 Sep 2022 03:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220928180603.101533-1-venu.busireddy@oracle.com>
In-Reply-To: <20220928180603.101533-1-venu.busireddy@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 29 Sep 2022 12:49:51 +0200
Message-ID: <CABgObfYXMBnVp2NqhyxOGjppDPc81Qk_fKepF6uzTkOBMoj2zA@mail.gmail.com>
Subject: Re: [PATCH v3] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
To: Venu Busireddy <venu.busireddy@oracle.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Sep 28, 2022 at 8:06 PM Venu Busireddy
<venu.busireddy@oracle.com> wrote:
>
> Section 5.6.6.3 of VirtIO specification states, "Events will also
> be reported via sense codes..." However, no sense data is sent when
> VIRTIO_SCSI_EVT_RESET_RESCAN or VIRTIO_SCSI_EVT_RESET_REMOVED events
> are reported (when disk hotplug/hotunplug events occur). SCSI layer
> on Solaris depends on this sense data, and hence does not handle disk
> hotplug/hotunplug events.
>
> When disk inventory changes, return a CHECK_CONDITION status with sense
> data of 0x06/0x3F/0x0E (sense code REPORTED_LUNS_CHANGED), as per the
> specifications in Section 5.14 (h) of SAM-4.
>
> Signed-off-by: Venu Busireddy <venu.busireddy@oracle.com>
>
> v2 -> v3:
>     - Implement the suggestion from Paolo Bonzini <pbonzini@redhat.com>.
>
> v1 -> v2:
>     - Send the sense data for VIRTIO_SCSI_EVT_RESET_REMOVED event too.
> ---
>  hw/scsi/scsi-bus.c              |  1 +
>  hw/scsi/virtio-scsi.c           | 16 ++++++++++++++++
>  include/hw/scsi/scsi.h          |  6 ++++++
>  include/hw/virtio/virtio-scsi.h |  1 +
>  4 files changed, 24 insertions(+)
>
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index 4403717c4aaf..b7cb249f2eab 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -730,6 +730,7 @@ SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
>            */
>           !(buf[0] == REQUEST_SENSE && d->sense_is_ua))) {
>          ops = &reqops_unit_attention;
> +        d->clear_reported_luns_changed = true;

Any reason to have this flag, and not just clear
s->reported_luns_changed after scsi_req_new? Is it to handle the
invalid opcode case?

I just reread the code and noticed that there is also a *bus* unit
attention mechanism, which is unused but seems perfect for this
usecase. The first device on the bus to execute a command successfully
will consume it.

You need something like

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 4403717c4a..78274e8477 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1616,6 +1616,24 @@ static int scsi_ua_precedence(SCSISense sense)
     return (sense.asc << 8) | sense.ascq;
 }

+void scsi_bus_set_ua(SCSIBus *bus, SCSISense sense)
+{
+    int prec1, prec2;
+    if (sense.key != UNIT_ATTENTION) {
+        return;
+    }
+
+    /*
+     * Override a pre-existing unit attention condition, except for a more
+     * important reset condition.
+    */
+    prec1 = scsi_ua_precedence(bus->unit_attention);
+    prec2 = scsi_ua_precedence(sense);
+    if (prec2 < prec1) {
+        bus->unit_attention = sense;
+    }
+}
+
 void scsi_device_set_ua(SCSIDevice *sdev, SCSISense sense)
 {
     int prec1, prec2;
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 88e1a48343..0c86d0359f 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -186,6 +186,7 @@ SCSIDevice *scsi_bus_legacy_add_drive(
                                       BlockdevOnError rerror,
                                       BlockdevOnError werror,
                                       const char *serial, Error **errp);
+void scsi_bus_set_ua(SCSIBus *bus, SCSISense sense);
 void scsi_bus_legacy_handle_cmdline(SCSIBus *bus);
 void scsi_legacy_handle_cmdline(void);


and if you call the new function in the plug/unplug callbacks it
should just work.

Paolo


