Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0AE6AE26A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:29:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYJJ-0004u6-4a; Tue, 07 Mar 2023 09:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pZYJG-0004nw-Sv
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:28:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pZYJE-0006nZ-Pp
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678199336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eynDZAmXCjTZ1netBQRQ8ZmHJGv2SI9S8DXFOKd9A8c=;
 b=M9e+GCc2HkKM0Ja90PPQKYqLuztzgpDHCDWT+8fHTYH9TqnSuAYEzV17rF3u20GB4cL/5K
 zI7saLLOv71x3bjlU4y/dSBn9oZf/7CIsvVcb2M/+JFNrP3E7rXoZx3y1uIaL10NqIPf1s
 O1hnywJPYkmTxGoB1LL/wU+FbcgLl2M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-WSpqV_bsM9aEOIp-cyUMlQ-1; Tue, 07 Mar 2023 09:28:52 -0500
X-MC-Unique: WSpqV_bsM9aEOIp-cyUMlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E43C855309;
 Tue,  7 Mar 2023 14:28:52 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.45.242.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B95D4C15BA0;
 Tue,  7 Mar 2023 14:28:50 +0000 (UTC)
Date: Tue, 7 Mar 2023 15:28:46 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Markus Armbruster <armbru@pond.sub.org>
Cc: libvir-list@redhat.com, Andrea Bolognani <abologna@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: Re: query-command-line-options (was: [PATCH 1/7] qemu: capabilities:
 Introduce QEMU_CAPS_MACHINE_ACPI)
Message-ID: <ZAdKHkUIKjPLhFn7@angien.pipo.sk>
References: <cover.1677511354.git.pkrempa@redhat.com>
 <8718b22eda052662087087b4ce659b054974c9e0.1677511354.git.pkrempa@redhat.com>
 <CABJz62PHsQHiyo06PtfcDeS1LddYyDw2pC_seObtZcLR5cPQyQ@mail.gmail.com>
 <Y/zng8+7s05O0tRd@angien.pipo.sk>
 <CABJz62OMWXAx_ExYqvvg1DvcHkiP+SkwNMQZ+56QwoHpsNBqGA@mail.gmail.com>
 <87jzzsc320.fsf_-_@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzzsc320.fsf_-_@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 07, 2023 at 10:40:23 +0100, Markus Armbruster wrote:
> [Resent with cc: qemu-devel and adjusted subject, sorry for the noise]
> 
> abologna at redhat.com (Andrea Bolognani) writes:
> 
> > On Mon, Feb 27, 2023 at 06:25:23PM +0100, Peter Krempa wrote:
> >> On Mon, Feb 27, 2023 at 08:44:57 -0800, Andrea Bolognani wrote:

[...]

> > Another example I've found is "smp-opts", which seems to be used to
> > implement the -smp option. Once again, in the JSON we find "smp-opts"
> > instead of "smp".
> >
> > I think it would be worthwile to check with the QEMU developers and
> > make sure that they're aware of this behavior. Is it intended? Is it
> > documented anywhere? It certainly seems extremely confusing to me.
> 
> query-command-line-options has... issues.
> 
> First, it's generally[*] limited to options that use QemuOpts.
> 
> Second, it reports configuration group names, which are often, but not
> always the same as the option name.  The exceptions you just have to
> know.  Group name "acpi" vs. option name "acpitable" is one.

Ah! so that's where 'acpi' comes from.

> 
> Third, information on option parameters can be incomplete, or missing
> entirely.
> 
> Fourth, even when it's there, it's often insufficiently detailed.
> 
> These are design issues.  I believe the command cannot be fixed, only
> replaced.
> 
> See my talk "QEMU interface introspection: From hacks to
> solutions", KVM Forum 2015.
> Video at https://www.youtube.com/watch?v=IEa8Ao8_B9o
> Slides at http://www.linux-kvm.org/images/7/7a/02x05-Aspen-Markus_Armbruster-QEMU_interface_introspection.pdf
> 
> Questions?

In the end I've dropped the patch detecting the presence of the 'acpi'
option of -machine as queried via query-command-line-options, as we need
to know it per-machine type.  That is now reported by qemu in
query-machines, so we don't need to add more querying from
query-command-line options.

In fact I strive to eliminate it after your suggestions, but we can't
still detect the few outstanding flags from anywhere else.

List of currently outstanding queries using query-command-line-options:

    { "fsdev", "multidevs", QEMU_CAPS_FSDEV_MULTIDEVS },
    { "machine", "hpet", QEMU_CAPS_MACHINE_HPET },
    { "sandbox", NULL, QEMU_CAPS_SECCOMP_SANDBOX },
    { "spice", NULL, QEMU_CAPS_SPICE },
    { "spice", "gl", QEMU_CAPS_SPICE_GL },
    { "spice", "rendernode", QEMU_CAPS_SPICE_RENDERNODE },
    { "vnc", "power-control", QEMU_CAPS_VNC_POWER_CONTROL },



