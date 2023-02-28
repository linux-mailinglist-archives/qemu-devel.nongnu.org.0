Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC2A6A5E96
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 19:06:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX4Ln-0002tK-6c; Tue, 28 Feb 2023 13:05:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pX4Lh-0002sq-TC
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:05:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pX4Lf-0006Hg-MT
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677607510;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVatY9VGQXQLScRmJ33NZx6hKkCdFAYGdtZI6ueLAIk=;
 b=Pp6yASG8/+Jj4BxFHjZbKxWjueLpmMpCMq/imNEXjGzUCXMlKXqp/HEyx/tFO3JU8nKTuP
 bEDpCTk859FYMM0be7f2YLUkIhARLzMWgwycFUsb5Bw7udzVx31QaKHqfrh4RTXgWBd4My
 zTzJwpCwpXvPmltyYfaim2vYzzRt544=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-DQ4Gl0FLN7u4N2Zla-CZ9w-1; Tue, 28 Feb 2023 13:05:04 -0500
X-MC-Unique: DQ4Gl0FLN7u4N2Zla-CZ9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E38F3857AA4;
 Tue, 28 Feb 2023 18:05:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1BA71121318;
 Tue, 28 Feb 2023 18:05:00 +0000 (UTC)
Date: Tue, 28 Feb 2023 18:04:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: Andrew Melnychenko <andrew@daynix.com>, jasowang@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, philmd@linaro.org, armbru@redhat.com,
 eblake@redhat.com, qemu-devel@nongnu.org, toke@redhat.com,
 mprivozn@redhat.com, yan@daynix.com
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
Message-ID: <Y/5CQ5md6huqNsx4@redhat.com>
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com>
 <Y/NCQhGmqIadlw0y@redhat.com>
 <CAOEp5Of-sC1nuz4rAZkt8YoL2ctnSPAQ9QyxoQ97XiQ17wZ1Fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOEp5Of-sC1nuz4rAZkt8YoL2ctnSPAQ9QyxoQ97XiQ17wZ1Fg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 11:56:27AM +0200, Yuri Benditovich wrote:
> On Mon, Feb 20, 2023 at 11:50 AM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Sun, Feb 19, 2023 at 06:20:58PM +0200, Andrew Melnychenko wrote:
> > > Added a function to check the stamp in the helper.
> > > eBPF helper should have a special symbol that generates during the build.
> > > QEMU checks the helper and determines that it fits, so the helper
> > > will produce proper output.
> >
> > I think this is quite limiting for in place upgrades.
> >
> > Consider this scenario
> >
> >  * Host has QEMU 8.1.0 installed
> >  * VM is running QEMU 8.1.0
> >  * QEMU 8.1.1 is released with a bug fix in the EBF program
> >  * Host is upgraded to QEMU 8.1.1
> >  * User attempts to hotplug a NIC to the running VM
> >
> > IIUC this last step is going to fail because we'll be loading
> > the EBF program from 8.1.1 and so its hash is different from
> > that expected by the QEMU 8.1.0 that the pre-existing VM is
> > running.
> >
> >   Indeed we did not take in account the in-place upgrade.
> 
> 
> 
> > If some changes to the EBF program are not going to be back
> > compatible from the POV of the QEMU process, should we instead
> > be versioning the EBF program. eg so new QEMU will ship both
> > the old and new versions of the EBF program.
> 
> This does not seem to be an elegant option: QEMU theoretically can include
> different eBPF programs but it hardly can interface with each one of them.
> The code of QEMU (access to eBPF maps etc) includes header files which eBPF
> of the day is being built with them.
> 
> I see 2 options to address this issue (of course there are more)
> 1. Build and install qemu-rss-helper-<hash> executable. Libvirt will always
> have a correct name, so for the running instance it will use
> qemu-rss-helper-<old-hash>, for the new instance it will use
> qemu-rss-helper-<new-hash>

We'll get an ever growing number of program variants we need to
build & distribute with each new QEMU release.

> 2. Build the helper executable and link it inside qemu as a blob. Libvirt
> will always retrieve the executable to the temporary file name and use it.
> So the retrieved helper will always be compatible with QEMU. I'm not sure
> what is the most portable way to do that.

QEMU is considered an untrusted process, so there's no way we're going
to ask it to give us an ELF binary and then execute that in privileged
context.

> Does one of these seem suitable?

Neither feels very appealing to me.

I've been trying to understand the eBPF code we're dealing with in a
little more detail.

IIUC, QEMU, or rather the virtio-net  driver needs to receive one FD
for the BPF program, and one or more FDs for the BPF maps that the
program uses. Currently it uses 3 maps, so needs 3 map FDs on top of
the program FD.

The helper program that is proposed here calls ebpf_rss_load() to
load the program and get back a struct which gives access to the
4 FDs, which are then sent to the mgmt app, which forwards them
onto QEMU.

The ebpf_rss_load() method is making use of various structs that
are specific to the RSS program implementation, but does not seems
to do anything especially interesting.  It calls into rss_bpf__open()
which eventually gets around to calling rss_bpf__create_skeleton
which is where the interesting stuff happens.

This rss_bpf__create_skeleton() method is implemented in terms of
totally generic libbpf APIs, and has the actual blob that is the
BPF program.

Looking at what this does, I feel it should be trivial for a mgmt
app to implement equivalent logic to rss_bpf__create_skeleton in a
generic manner, if we could just expose the program blob and the
map names to the mgmt app. eg a simple json file

  {
     "maps": [
        "tap_rss_map_configurations",
	"tap_rss_map_indirection_table",
	"tap_rss_map_toeplitz_key",
     ],
     "program": "....the big blob encoded in base64..."
  }

if we installed that file are /usr/share/qemu/bpf/net-rss.json
then when a QEMU process is started, the mgmt app capture the
data in this JSON file. It now has enough info to create the
EBPF programs needed and pass the FDs over to QEMU. This would
be robust against QEMU software upgrades, and not tied to the
specific EBPF program imlp. We can add or remove maps / change
their names etc any time, as the details in the JSON descriptor
can be updated.  This avoids need for any special helper program
to be provided by QEMU with the problems that is throwing up
for us.

What am I missing ?  This seems pretty straightforward to
achieve from what I see.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


