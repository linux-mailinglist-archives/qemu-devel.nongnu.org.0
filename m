Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C30D6D96B0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:03:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOJa-0006mP-Jw; Thu, 06 Apr 2023 08:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pkOJY-0006m8-GV
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pkOJW-0003Qi-8n
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680782519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6kbf+wS0Fa9C32yr8ZDgiuZgxaJXHgImVjk0ykaGENo=;
 b=Ux4G7y4oOd0RKQADuFHAqlPDTvdBF7zjk/7Sy67gkLl1oMHksPvIXMkIP9hfNODrF8vl9r
 Mh6WiB3moHsMn/1U+HeuAkB5nDgPlgf22Wes9e5uZJVPi48TEZKJuY0/iOUlTXfx27VfcF
 YD2+4XSlzIYo/rw/jk7xy3Qc9DWlfPU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-vCwSKbu9Pc6mKSJFsTTdlw-1; Thu, 06 Apr 2023 08:01:57 -0400
X-MC-Unique: vCwSKbu9Pc6mKSJFsTTdlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A08B0811E7C
 for <qemu-devel@nongnu.org>; Thu,  6 Apr 2023 12:01:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 687B840C20FA;
 Thu,  6 Apr 2023 12:01:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C4091800081; Thu,  6 Apr 2023 14:01:56 +0200 (CEST)
Date: Thu, 6 Apr 2023 14:01:56 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 anisinha@redhat.com, jusual@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <scpexuuyjn2mvwggrter72nznjp4pxquuspr44bmtsu525bztj@t5txymlk54io>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <qdzi3oh24okot23eccd6d453wehyagbxhldoss4bup2whfohfo@hkzr2p3fq6na>
 <20230404103055.11f2de56@imammedo.users.ipa.redhat.com>
 <3akvszorhtqnaqkmwobfiivg5wdvkjrao36a2bworawbeii6ic@j2kelhsxvbwx>
 <20230406134648.477b7f64@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406134648.477b7f64@imammedo.users.ipa.redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

On Thu, Apr 06, 2023 at 01:46:48PM +0200, Igor Mammedov wrote:
> On Tue, 4 Apr 2023 12:46:45 +0200
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> > On Tue, Apr 04, 2023 at 10:30:55AM +0200, Igor Mammedov wrote:
> > > On Tue, 4 Apr 2023 09:03:59 +0200
> > > Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >   
> > > >   Hi,
> > > >   
> > > > > > Allowing pending delete expire brings ACPI PCI hotplug on par
> > > > > > with native PCIe unplug behavior [1] which in its turn refers
> > > > > > back to ACPI PCI hotplug ability to repeat unplug requests.    
> > > >   
> > > > > A bit concerned about how this interacts with failover,
> > > > > and 5sec is a lot of time that I hoped we'd avoid with acpi.
> > > > > Any better ideas of catching such misbehaving guests?    
> > > > 
> > > > The 5sec are coming from the pcie spec: The hot-unplug request can be
> > > > canceled within 5 seconds by pressing the button again. The problem here
> > > > is that both hotplug and hot-unplug use the same signaling path, so we
> > > > really have to wait the 5 seconds to avoid the OS mis-interpreting the
> > > > button press as 'cancel' event.  
> > > 
> > > Any pointer to spec?  
> > 
> > pcie base spec, section 6.7.1.5. Attention Button
> > 
> > > Does it apply to SHPC too?  
> > 
> > Yes (section 2.2.5. Attention Button).
> 
> shouldn't we set pending_deleted_expires_ms to 5sec for SHPC
> as we do with PCIe?

I suspect it is not *that* simple.

For pcie there is one more detail.  The code also looks at the
indicator led.  When it is set to 'blink' (used by the guest to signal
hotplug is in progress) the code will block unplug too, i.e. the rules
are (IIRC, didn't check the code):

  (1) if less than 5 secs passed, reject, else ...
  (2) if the indicator blinks, reject, else ...
  (3) allow request (and send virtual attention button press to guest).

SHPC should probably do that too.  Sending a attention button press
while the guest clearly signals a hotplug is in progress has a high
chance to be interpreted as cancel.

take care,
  Gerd


