Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BBF4D5F35
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 11:12:35 +0100 (CET)
Received: from localhost ([::1]:41440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nScG8-0004OE-UO
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 05:12:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nScDo-0001xH-UG
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:10:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nScDm-0003Sl-8P
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646993405;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=P5tMpq8QgggNPj8vr96zMSOAMAai2QDI7lYHO+90L/I=;
 b=Z6nv80fy4b0vcr5sKqkKlCaCjVFLVUbWD0hQN0k36/w6oPzoD0HGOpj9JBVvC2t/AdFjxx
 OAcBNKVcdhDjgGUxB3n4gHfr3YwX65sgQnKFIUMNydjlJfTBs0oVPkuNnzqWZn94tS2//v
 dnP8Rjzq8udvWatWyEbnnyvTEMMWmvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-tdyB9PK_NFmu7swN6P7Ydg-1; Fri, 11 Mar 2022 05:09:58 -0500
X-MC-Unique: tdyB9PK_NFmu7swN6P7Ydg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE7211006AA6;
 Fri, 11 Mar 2022 10:09:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 858BA7A5CE;
 Fri, 11 Mar 2022 10:09:00 +0000 (UTC)
Date: Fri, 11 Mar 2022 10:08:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
Message-ID: <YisfuddcFS613BwA@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
 <20220303121534-mutt-send-email-mst@kernel.org>
 <20220304114124.6fe97646@redhat.com>
 <c42748ca-3e06-d57e-dcfb-a2a97006d2fc@oracle.com>
MIME-Version: 1.0
In-Reply-To: <c42748ca-3e06-d57e-dcfb-a2a97006d2fc@oracle.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 09:41:44AM -0500, Steven Sistare wrote:
> On 3/4/2022 5:41 AM, Igor Mammedov wrote:
> > On Thu, 3 Mar 2022 12:21:15 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > 
> >> On Wed, Dec 22, 2021 at 11:05:15AM -0800, Steve Sistare wrote:
> >>> Allocate anonymous memory using memfd_create if the memfd-alloc machine
> >>> option is set.
> >>>
> >>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >>> ---
> >>>  hw/core/machine.c   | 19 +++++++++++++++++++
> >>>  include/hw/boards.h |  1 +
> >>>  qemu-options.hx     |  6 ++++++
> >>>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
> >>>  softmmu/vl.c        |  1 +
> >>>  trace-events        |  1 +
> >>>  util/qemu-config.c  |  4 ++++
> >>>  7 files changed, 70 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/hw/core/machine.c b/hw/core/machine.c
> >>> index 53a99ab..7739d88 100644
> >>> --- a/hw/core/machine.c
> >>> +++ b/hw/core/machine.c
> >>> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
> >>>      ms->mem_merge = value;
> >>>  }
> >>>  
> >>> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
> >>> +{
> >>> +    MachineState *ms = MACHINE(obj);
> >>> +
> >>> +    return ms->memfd_alloc;
> >>> +}
> >>> +
> >>> +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
> >>> +{
> >>> +    MachineState *ms = MACHINE(obj);
> >>> +
> >>> +    ms->memfd_alloc = value;
> >>> +}
> >>> +
> >>>  static bool machine_get_usb(Object *obj, Error **errp)
> >>>  {
> >>>      MachineState *ms = MACHINE(obj);
> >>> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
> >>>      object_class_property_set_description(oc, "mem-merge",
> >>>          "Enable/disable memory merge support");
> >>>  
> >>> +    object_class_property_add_bool(oc, "memfd-alloc",
> >>> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
> >>> +    object_class_property_set_description(oc, "memfd-alloc",
> >>> +        "Enable/disable allocating anonymous memory using memfd_create");
> >>> +
> >>>      object_class_property_add_bool(oc, "usb",
> >>>          machine_get_usb, machine_set_usb);
> >>>      object_class_property_set_description(oc, "usb",
> >>> diff --git a/include/hw/boards.h b/include/hw/boards.h
> >>> index 9c1c190..a57d7a0 100644
> >>> --- a/include/hw/boards.h
> >>> +++ b/include/hw/boards.h
> >>> @@ -327,6 +327,7 @@ struct MachineState {
> >>>      char *dt_compatible;
> >>>      bool dump_guest_core;
> >>>      bool mem_merge;
> >>> +    bool memfd_alloc;
> >>>      bool usb;
> >>>      bool usb_disabled;
> >>>      char *firmware;
> >>> diff --git a/qemu-options.hx b/qemu-options.hx
> >>> index 7d47510..33c8173 100644
> >>> --- a/qemu-options.hx
> >>> +++ b/qemu-options.hx
> >>> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
> >>>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
> >>>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
> >>>      "                mem-merge=on|off controls memory merge support (default: on)\n"
> >>> +    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"  
> >>
> >> Question: are there any disadvantages associated with using
> >> memfd_create? I guess we are using up an fd, but that seems minor.  Any
> >> reason not to set to on by default? maybe with a fallback option to
> >> disable that?
> 
> Old Linux host kernels, circa 4.1, do not support huge pages for shared memory.

That doesn't matter, as we don't support any distros with kernels that old

   https://www.qemu.org/docs/master/about/build-platforms.html

We can assume something around kernel 4.18 I believe.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


