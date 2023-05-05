Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C46F8522
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 16:59:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puwtD-0001cc-Gy; Fri, 05 May 2023 10:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1puwtA-0001c7-7S
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1puwt8-0004w2-2e
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683298703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=+vM0S1SFr2SMM3e/fxxGrvf063SW49IcOdqIUQlpaSA=;
 b=LpIz5QNK/iI4AWkYl/o09+O67l1UWW9cMhx9nRK23VvHr7x7fbKQ/iY85y6YGA8xqWEjs5
 fsUwAJPFLUIIIiWB0jMZQkDXPHgCoAOhnMzKKVIjp4zlyh5Oq1CS125nfeqcHcNU+MHm91
 svhYirTJu7STjBMdeddu501Tgs2R2qw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-mFai1hyRM6CY1lU3-mmBNw-1; Fri, 05 May 2023 10:58:20 -0400
X-MC-Unique: mFai1hyRM6CY1lU3-mmBNw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1727D80101C;
 Fri,  5 May 2023 14:58:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAADB140E917;
 Fri,  5 May 2023 14:58:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A2A4921E6924; Fri,  5 May 2023 16:58:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>
Subject: Machine x-remote property auto-shutdown
Date: Fri, 05 May 2023 16:58:18 +0200
Message-ID: <87h6squ8ol.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I stumbled over this property, looked closer, and now I'm confused.

Like most QOM properties, x-remote.auto-shutdown is virtually
undocumented.  All we have is this comment in vfio-user-obj.c:

    /**
     * Usage: add options:
     *     -machine x-remote,vfio-user=on,auto-shutdown=on
     *     -device <PCI-device>,id=<pci-dev-id>
     *     -object x-vfio-user-server,id=<id>,type=unix,path=<socket-path>,
     *             device=<pci-dev-id>
     *
     * Note that x-vfio-user-server object must be used with x-remote machine only.
     * This server could only support PCI devices for now.
     *
     * type - SocketAddress type - presently "unix" alone is supported. Required
     *        option
     *
     * path - named unix socket, it will be created by the server. It is
     *        a required option
     *
     * device - id of a device on the server, a required option. PCI devices
     *          alone are supported presently.
     *
     * notes - x-vfio-user-server could block IO and monitor during the
     *         initialization phase.
     */

This differs from docs/system/multi-process.rst, which has

  - Example command-line for the remote process is as follows:

      /usr/bin/qemu-system-x86_64                                        \
      -machine x-remote                                                  \
      -device lsi53c895a,id=lsi0                                         \
      -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
      -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0  \
      -object x-remote-object,id=robj1,devid=lsi0,fd=4,

No mention of auto-shutdown here.

It points to docs/devel/qemu-multiprocess, which doesn't exist.  I guess
it's docs/devel/multi-process.rst.  Please fix that.  Anyway, no mention
of auto-shutdown there, either.

Let's try code instead.  The only use of the property is here:

    static bool vfu_object_auto_shutdown(void)
    {
        bool auto_shutdown = true;
        Error *local_err = NULL;

        if (!current_machine) {
            return auto_shutdown;
        }

        auto_shutdown = object_property_get_bool(OBJECT(current_machine),
                                                 "auto-shutdown",
                                                 &local_err);

        /*
         * local_err would be set if no such property exists - safe to ignore.
         * Unlikely scenario as auto-shutdown is always defined for
         * TYPE_REMOTE_MACHINE, and  TYPE_VFU_OBJECT only works with
         * TYPE_REMOTE_MACHINE
         */
        if (local_err) {
            auto_shutdown = true;
            error_free(local_err);
        }

        return auto_shutdown;
    }

The comment suggests auto-shutdown should always be set with machine
TYPE_REMOTE_MACHINE, i.e. -machine x-remote basically requires
auto-shutdown=on.  Why isn't it the default then?  Why is it even
configurable?  Use cases?

Anyway, vfu_object_auto_shutdown() returns

(1) true when we don't have a current machine

(2) true when getting the current machine's auto-shutdown property fails

(3) the value of its auto-shutdown property otherwise

Two uses:

* In vfu_object_finalize():

    if (!k->nr_devs && vfu_object_auto_shutdown()) {
        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
    }

  I guess this requests shutdown when the last TYPE_VFU_OBJECT dies.

  SHUTDOWN_CAUSE_GUEST_SHUTDOWN is documented as

    # @guest-shutdown: Guest shutdown/suspend request, via ACPI or other
    #                  hardware-specific means

  Can't say whether it's the right one to use here.

* In VFU_OBJECT_ERROR():

    /**
     * VFU_OBJECT_ERROR - reports an error message. If auto_shutdown
     * is set, it aborts the machine on error. Otherwise, it logs an
     * error message without aborting.
     */
    //
    #define VFU_OBJECT_ERROR(o, fmt, ...)                                     \
        {                                                                     \
            if (vfu_object_auto_shutdown()) {                                 \
                error_setg(&error_abort, (fmt), ## __VA_ARGS__);              \
            } else {                                                          \
                error_report((fmt), ## __VA_ARGS__);                          \
            }                                                                 \
        }                                                                     \

  Here, the property does something entirely different: it makes QEMU
  *crash* on certain errors.

  Why are these errors so harmless when auto-shutdown is off that it's
  safe to continue, but so serious when it's on that we must crash
  immediately?

Could you explain to me why it makes sense to tie "automatic shutdown"
and "crash on certain errors" together?

By the way, both uses of vfu_object_auto_shutdown() are in device code.
I can't see how its cases (1) and (2) can be reached.


