Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA783167CA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 14:18:55 +0100 (CET)
Received: from localhost ([::1]:37630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9pOQ-0002jh-73
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 08:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9pMp-0002B4-PI
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:17:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9pMm-0005ez-BB
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612963030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDXpiQYA+AdEx6MGcC5Q9ovJqkqLB1zKTH8AzZSbhgo=;
 b=ZGw+r/0DcKgRkcGJsXItF+GS7nG4/VXqdC+V7vAKfba733JVEUnIkonm599Zi4h76A4lOh
 wM24tRy68CGu+OFalViB8iXWGWc59IGaX9MPO/OyuKO7udxK7NculWuwW+00npiCaDmXD1
 dANxNM738NuQLgZDpvrnP9B+jxke9dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-yOzKIxDcOlqztm_BHaJnFg-1; Wed, 10 Feb 2021 08:17:08 -0500
X-MC-Unique: yOzKIxDcOlqztm_BHaJnFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8558107ACED;
 Wed, 10 Feb 2021 13:17:07 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 017B460BE2;
 Wed, 10 Feb 2021 13:17:02 +0000 (UTC)
Date: Wed, 10 Feb 2021 14:17:00 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Isaku Yamahata <yamahata.qemudev@gmail.com>
Subject: Re: [PATCH v2 3/9] acpi/core: always set SCI_EN when SMM isn't
 supported
Message-ID: <20210210141700.7fda6710@redhat.com>
In-Reply-To: <20210209192305.GA28049@private.email.ne.jp>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <b21a1b211ad4dc99aaf5f19d803f96dfa88b3fb1.1612821109.git.isaku.yamahata@intel.com>
 <20210209160514.0e015448@redhat.com>
 <20210209192305.GA28049@private.email.ne.jp>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, isaku.yamahata@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Feb 2021 11:23:05 -0800
Isaku Yamahata <yamahata.qemudev@gmail.com> wrote:

> On Tue, Feb 09, 2021 at 04:05:14PM +0100,
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > On Mon,  8 Feb 2021 13:57:22 -0800
> > isaku.yamahata@gmail.com wrote:
> >   
> > > From: Isaku Yamahata <isaku.yamahata@intel.com>
> > > 
> > > If SMM is not supported, ACPI fixed hardware doesn't support
> > > legacy-mode. ACPI-only platform. Where SCI_EN in PM1_CNT register is
> > > always set.
> > > The bit tells OS legacy mode(SCI_EN cleared) or ACPI mode(SCI_EN set).  
> > 
> > does it break some specific software?  
> 
> With the next patch (setting fadt.smi_cmd = 0 when smm isn't supported),
> guest Linux tries to switch to ACPI mode, finds smi_cmd = 0, and then
> fails to initialize acpi subsystem.
> will update the commit message in next respin.
> 
> 
> > > ACPI spec 4.8.10.1 PM1 Event Grouping
> > > PM1 Eanble Registers  
> > > > For ACPI-only platforms (where SCI_EN is always set)    
> > > 
> > > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>  
> > it changes guest ABI for old machine types but it seems to me that
> > it's harmless (in typical use-cases backward and forward migrated
> > guest should work fine).
> > 
> > The only thing that is broken is transitioning to legacy mode
> > when guest was started on old QEMU and then migrated to the new one
> > where disable op will be NOP and qemu always stays in ACPI mode
> > (so guest will hang while it waits for transition to happen).  
> 
> The patch affects guests only when SMM isn't supported.
> Concretely
> - user explicitly specified to disable smm by -machine smm=off
> or
> - underlying kvm doesn't have KVM_CAP_X86_SMM (smm=auto: default)
> Please refer to x86_machine_is_smm_enabled().
> Also Libvirt checks if guest bios requires SMI and enables smm even
> when user disabling SMM. qemuFirmwareEnableFeatures()


> If smm is disabled and legacy-mode is enabled without this patch,
> SMI won't be injected to guest anyway. Thus guest breaks already.
can you point to code in QEMU that prevents SMI being triggered?
(what see is QEMU faking SMM being configured when smm_enable=false,
and seabios skipping its smm code based on that, other guest code
may behave differently though).

But that's beside point, guest started on old QEMU may believe that
it runs on Legacy/ACPI platform even with (smm=off), and hence can try
to enable/disable ACPI mode explicitly. Combined with migration to QEMU
with this patches it might turn into problem (which is hard to
troubleshoot in the wild).


> > Can you test this scenario with various guest OSes (old/new/MS Windows)
> > to check if it won't break them.  
> 
> Unless -machine smm=off is explicitly passed, this patch won't break
> guests. And such case is rare as I described above.

yes, it's a corner case but it doesn't guarantee that someone isn't using
it it in the wild.

> My motivation for this patch series is preparation for TDX which disallows
> SMM mode and SMI injection.
> 
> 
> > if we are to be conservative, we need to disable this compliance fix
> > on old machine types.  
> 
> I'm fine with adding one more knob to be on safe side.
> -machine smm=off is such knob, though.

you can use 2ebc21216f as an example of compat knob that changes behavior
depending on machine version. (i.e. to keep old behavior in piix4/ich9 on
exiting machine versions)

> Thanks,


