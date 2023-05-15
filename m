Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D372702821
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:19:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUKg-0001e1-Ml; Mon, 15 May 2023 05:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pyUKf-0001dK-Fl
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pyUKd-0001Qt-KY
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684142246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CphxiyCdxXAE9G3paGCzXDfcs1M5TieKlYJ63Pomtfs=;
 b=W4oW/givWkT8Lqfdx1ms+op59O/MP18RE8rg8gd0J9bIBrZHNmpXrNDffzjwpo7/EOfX5e
 3Myj0XOpjsI+rK4Tg3yoqOAasS+W4mqaLPNwsBgYLbrm2D6xl2db6kfClRb9NSiDqWwIFh
 603FObzCqM+YyJ0xMT9haVMKUDQaBug=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-L9zjGEe8Ma2nMU9q5oJIOA-1; Mon, 15 May 2023 05:17:25 -0400
X-MC-Unique: L9zjGEe8Ma2nMU9q5oJIOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3567380671D;
 Mon, 15 May 2023 09:17:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63B3140C2063;
 Mon, 15 May 2023 09:17:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 69CB121E681C; Mon, 15 May 2023 11:17:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,  Elena Ufimtseva
 <elena.ufimtseva@oracle.com>,  Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Machine x-remote property auto-shutdown
References: <87h6squ8ol.fsf@pond.sub.org>
 <EF3614AE-EAEC-4B7A-B428-562A40E20DCF@oracle.com>
Date: Mon, 15 May 2023 11:17:23 +0200
In-Reply-To: <EF3614AE-EAEC-4B7A-B428-562A40E20DCF@oracle.com> (Jag Raman's
 message of "Mon, 8 May 2023 18:26:07 +0000")
Message-ID: <877cta0x98.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Jag Raman <jag.raman@oracle.com> writes:

> Hi Markus,
>
> Please see the comments inline below.
>
>> On May 5, 2023, at 10:58 AM, Markus Armbruster <armbru@redhat.com> wrote:
>> 
>> I stumbled over this property, looked closer, and now I'm confused.
>> 
>> Like most QOM properties, x-remote.auto-shutdown is virtually
>> undocumented.  All we have is this comment in vfio-user-obj.c:
>> 
>>    /**
>>     * Usage: add options:
>>     *     -machine x-remote,vfio-user=on,auto-shutdown=on
>>     *     -device <PCI-device>,id=<pci-dev-id>
>>     *     -object x-vfio-user-server,id=<id>,type=unix,path=<socket-path>,
>>     *             device=<pci-dev-id>
>>     *
>>     * Note that x-vfio-user-server object must be used with x-remote machine only.
>>     * This server could only support PCI devices for now.
>>     *
>>     * type - SocketAddress type - presently "unix" alone is supported. Required
>>     *        option
>>     *
>>     * path - named unix socket, it will be created by the server. It is
>>     *        a required option
>>     *
>>     * device - id of a device on the server, a required option. PCI devices
>>     *          alone are supported presently.
>>     *
>>     * notes - x-vfio-user-server could block IO and monitor during the
>>     *         initialization phase.
>>     */
>> 
>> This differs from docs/system/multi-process.rst, which has
>> 
>>  - Example command-line for the remote process is as follows:
>> 
>>      /usr/bin/qemu-system-x86_64                                        \
>>      -machine x-remote                                                  \
>>      -device lsi53c895a,id=lsi0                                         \
>>      -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
>>      -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0  \
>>      -object x-remote-object,id=robj1,devid=lsi0,fd=4,
>> 
>> No mention of auto-shutdown here.
>> 
>> It points to docs/devel/qemu-multiprocess, which doesn't exist.  I guess
>> it's docs/devel/multi-process.rst.  Please fix that.  Anyway, no mention
>
> Sorry about this. I will fix it.

Thanks!

>> of auto-shutdown there, either.
>> 
>> Let's try code instead.  The only use of the property is here:
>> 
>>    static bool vfu_object_auto_shutdown(void)
>>    {
>>        bool auto_shutdown = true;
>>        Error *local_err = NULL;
>> 
>>        if (!current_machine) {
>>            return auto_shutdown;
>>        }
>> 
>>        auto_shutdown = object_property_get_bool(OBJECT(current_machine),
>>                                                 "auto-shutdown",
>>                                                 &local_err);
>> 
>>        /*
>>         * local_err would be set if no such property exists - safe to ignore.
>>         * Unlikely scenario as auto-shutdown is always defined for
>>         * TYPE_REMOTE_MACHINE, and  TYPE_VFU_OBJECT only works with
>>         * TYPE_REMOTE_MACHINE
>>         */
>>        if (local_err) {
>>            auto_shutdown = true;
>>            error_free(local_err);
>>        }
>> 
>>        return auto_shutdown;
>>    }
>> 
>> The comment suggests auto-shutdown should always be set with machine
>> TYPE_REMOTE_MACHINE, i.e. -machine x-remote basically requires
>> auto-shutdown=on.  Why isn't it the default then?  Why is it even
>> configurable?  Use cases?
>
> The "auto-shutdown" property tells the server if it should continue running
> after all the clients disconnect or if it should shut down automatically after
> the last client disconnects.
>
> The user can set this property to "off" when the server serves multiple
> QEMU clients. The server process will continue to run after the last
> client disconnects, waiting for more clients to connect in the future.
>
>> 
>> Anyway, vfu_object_auto_shutdown() returns
>> 
>> (1) true when we don't have a current machine
>> 
>> (2) true when getting the current machine's auto-shutdown property fails
>> 
>> (3) the value of its auto-shutdown property otherwise
>> 
>> Two uses:
>> 
>> * In vfu_object_finalize():
>> 
>>    if (!k->nr_devs && vfu_object_auto_shutdown()) {
>>        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>>    }
>> 
>>  I guess this requests shutdown when the last TYPE_VFU_OBJECT dies.

Double-checking:

1. Is TYPE_VFU_OBJECT intended only for TYPE_REMOTE_MACHINE?

2. If yes, what prevents use with another machine type?

>>  SHUTDOWN_CAUSE_GUEST_SHUTDOWN is documented as
>> 
>>    # @guest-shutdown: Guest shutdown/suspend request, via ACPI or other
>>    #                  hardware-specific means
>> 
>>  Can't say whether it's the right one to use here.
>> 
>> * In VFU_OBJECT_ERROR():
>> 
>>    /**
>>     * VFU_OBJECT_ERROR - reports an error message. If auto_shutdown
>>     * is set, it aborts the machine on error. Otherwise, it logs an
>>     * error message without aborting.
>>     */
>>    //
>>    #define VFU_OBJECT_ERROR(o, fmt, ...)                                     \
>>        {                                                                     \
>>            if (vfu_object_auto_shutdown()) {                                 \
>>                error_setg(&error_abort, (fmt), ## __VA_ARGS__);              \
>>            } else {                                                          \
>>                error_report((fmt), ## __VA_ARGS__);                          \
>>            }                                                                 \
>>        }                                                                     \
>> 
>>  Here, the property does something entirely different: it makes QEMU
>>  *crash* on certain errors.
>> 
>>  Why are these errors so harmless when auto-shutdown is off that it's
>>  safe to continue, but so serious when it's on that we must crash
>>  immediately?
>> 
>> Could you explain to me why it makes sense to tie "automatic shutdown"
>> and "crash on certain errors" together?
>
> When auto-shutdown is "off," we don't want the server to die automatically
> unless explicitly killed. As such, we report the error instead of crashing
> the server when auto-shutdown is off.

You report the error to stderr and then continue.  This is safe only
when the error is recoverable.

Are you sure they all are?

Aborting on recoverable error is problematic.  Can you explain in more
detail why you want to abort?

> -- Jag
>
>> 
>> By the way, both uses of vfu_object_auto_shutdown() are in device code.
>> I can't see how its cases (1) and (2) can be reached.

Why do these cases exist?


