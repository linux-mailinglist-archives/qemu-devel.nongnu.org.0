Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F9490806
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 12:58:49 +0100 (CET)
Received: from localhost ([::1]:52904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Qeu-0007h2-0k
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 06:58:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9QdD-0006ul-7L
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 06:57:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9Qd9-0002Me-9d
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 06:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642420615;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6dV35EUYVkKZ81W55neF7PgN0JvKrw243x3xmp6twM4=;
 b=eXWSsCkGEUEUw2kDOUBMYeIJ9scHd2kb5Z8jFECO0YC6sJERQdLQ8nszbRgSW+ZQ8nV8+8
 SkSc5Nkcv/68sGGDk8TQziB7gSFK1txVxgXirvhNALAmg1tDwXL5QiWW6dAHqzluoO+J92
 iD95fUXNByJoNJH/4crrJ/iOZf7M4Hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-FGFsHUtNPk2BnNrybSLGpg-1; Mon, 17 Jan 2022 06:56:49 -0500
X-MC-Unique: FGFsHUtNPk2BnNrybSLGpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A47CA1015DDB;
 Mon, 17 Jan 2022 11:56:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E5BF70D42;
 Mon, 17 Jan 2022 11:56:36 +0000 (UTC)
Date: Mon, 17 Jan 2022 11:56:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH 0/2] Improved support for AMD SEV firmware loading
Message-ID: <YeVZcQ/MW+P9Lh0l@redhat.com>
References: <20220113165511.46098-1-berrange@redhat.com>
 <59d81ace-8a66-4ab4-2768-a68d302e62d8@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <59d81ace-8a66-4ab4-2768-a68d302e62d8@linux.ibm.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <Ashish.Kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 09:34:30AM +0200, Dov Murik wrote:
> [+cc Tom, Brijesh, Ashish - see SEV-related changes in this series]
> 
> 
> On 13/01/2022 18:55, Daniel P. Berrangé wrote:
> > The AMD SEV build of EDK2 only emits a single file, intended to be
> > 
> > mapped readonly. There is explicitly no separate writable VARS
> > 
> > store for persisting non-volatile firmware variables.
> > 
> > 
> > 
> > This can be used with QEMU's traditional pflash configuration
> > 
> > mechanism by only populating pflash0, leaving pflash1 unconfigured.
> > 
> > Conceptually, however, it is odd to be using pflash at all when we
> > 
> > have no intention of supporting any writable variables. The -bios
> > 
> > option should be sufficient for any firmware that is exclusively
> > 
> > readonly code.
> > 
> > 
> > 
> > 
> > 
> > A second issue is that the firmware descriptor schema does not allow
> > 
> > for describing a firmware that uses pflash, without any associated
> > 
> > non-volatile storage.
> > 
> > 
> > 
> > In docs/interop/firmware.json
> > 
> > 
> > 
> >  'struct' : 'FirmwareMappingFlash',
> > 
> >   'data'   : { 'executable'     : 'FirmwareFlashFile',
> > 
> >                'nvram-template' : 'FirmwareFlashFile' } }
> > 
> > 
> > 
> > Notice that nvram-template is mandatory, and when consuming these
> > 
> > files libvirt will thus complain if the nvram-template field is
> > 
> > missing.
> > 
> > 
> > 
> > We could in theory make nvram-template optional in the schema and
> > 
> > then update libvirt to take account of it, but this feels dubious
> > 
> > when we have a perfectly good way of describing a firmware without
> > 
> > NVRAM, using 'FirmwareMappingMemory' which is intended to be used
> > 
> > with QEMU's -bios option.
> > 
> > 
> > 
> > 
> > 
> > A third issue is in libvirt, where again the code handling the
> > 
> > configuration of pflash supports two scenarios
> > 
> > 
> > 
> >  - A single pflash image, which is writable
> > 
> >  - A pair of pflash images, one writable one readonly
> > 
> > 
> > 
> > There is no support for a single read-only pflash image in libvirt
> > 
> > today.
> > 
> > 
> > 
> > 
> > 
> > This all points towards the fact that we should be using -bios
> > 
> > to load the AMD SEV firmware build of EDK.
> > 
> > 
> > 
> > The only thing preventing us doing that is that QEMU does not
> > 
> > initialize the SEV firmware when using -bios. That is fairly
> > 
> > easily solved, as done in this patch series.
> > 
> > 
> > 
> > For testing I've launched QEMU in in these scenarios
> > 
> > 
> > 
> >   - SEV guest using -bios and boot from HD
> > 
> >   - SEV guest using pflash and boot from HD
> > 
> >   - SEV-ES guest using -bios and direct kernel boot
> > 
> >   - SEV-ES guest using pflash and direct kernel boot
> > 
> > 
> > 
> > In all these cases I was able to validate the reported SEV
> > 
> > guest measurement.
> > 
> > 
> 
> 
> I'm having trouble testing this series (applied on top of master commit 69353c332c):
> it hangs with -bios but works OK with pflash:
> 
> Here's with -bios:
> 
> $ sudo /home/dmurik/git/qemu/build/qemu-system-x86_64 -enable-kvm \
>        -cpu host -machine q35 -smp 4 -m 2G \
>        -machine confidential-guest-support=sev0 \
>        -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x0 \
>        -bios /home/dmurik/git/edk2/Build/AmdSev/DEBUG_GCC5/FV/OVMF.fd \
>        -nographic \
>        -global isa-debugcon.iobase=0x402 -debugcon file:ovmf-1.log \
>        -monitor pty -trace 'enable=kvm_sev_*'
> 
> char device redirected to /dev/pts/14 (label compat_monitor0)
> kvm_sev_init
> kvm_sev_launch_start policy 0x0 session (nil) pdh (nil)
> kvm_sev_change_state uninit -> launch-update
> kvm_sev_launch_update_data addr 0x7f42e9bff010 len 0x400000
> kvm_sev_change_state launch-update -> launch-secret
> kvm_sev_launch_measurement data PF6n7+Vujx5sW8PC6iMRtHXfpXdJ4osbcfYvoknu7gg4ypMqs727NTzG86Ft8Llu
> kvm_sev_launch_finish
> kvm_sev_change_state launch-secret -> running
> 
> 
> Here it hangs. The ovmf-1.log file is empty.
> 
> Notice that kvm_sev_launch_update_data is called, so the new
> -bios behaviour is triggered correctly.  But the guest doesn't
> start running.

Sorry, it seems I failed to test this properly before rushing into
sending last week. I was too focused on making sure the SEV measurement
was working and not the rest.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


