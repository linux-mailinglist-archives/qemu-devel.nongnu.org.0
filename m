Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D00641D587
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:33:58 +0200 (CEST)
Received: from localhost ([::1]:48486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVrVt-0004rf-AU
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVrUe-0003ia-92
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVrUc-0000ZY-Gh
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632990757;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09jcFwLgP85SrcGBY0/VqkddKtx5jkF/m+klprCg/E0=;
 b=Y2jSMij8VNsnP/v64Bo7dP0ZJNJEE0ebPIjw4+BgA5cWdtZkxwvgzh9IdLKy6GyEx5X6qN
 t4ig5et/XBqRiFBbd9O/CL0Yi5fg6f05uKP4wvMdG4EHfotjIk0L38pnH2ZcwRibO8jsLF
 Qbj8o0MsHD2eJ4WrDLW5lHOozg2Z4/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-iRNLOdgGMeKuR96jv9NTXw-1; Thu, 30 Sep 2021 04:32:35 -0400
X-MC-Unique: iRNLOdgGMeKuR96jv9NTXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94426801B3D;
 Thu, 30 Sep 2021 08:32:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B45D01346F;
 Thu, 30 Sep 2021 08:32:29 +0000 (UTC)
Date: Thu, 30 Sep 2021 09:32:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v4 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
Message-ID: <YVV2GoXCv6BT4fgf@redhat.com>
References: <20210930054915.13252-1-dovmurik@linux.ibm.com>
 <20210930054915.13252-2-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210930054915.13252-2-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 08:49:14AM +0300, Dov Murik wrote:
> Add the sev_add_kernel_loader_hashes function to calculate the hashes of
> the kernel/initrd/cmdline and fill a designated OVMF encrypted hash
> table area.  For this to work, OVMF must support an encrypted area to
> place the data which is advertised via a special GUID in the OVMF reset
> table.
> 
> The hashes of each of the files is calculated (or the string in the case
> of the cmdline with trailing '\0' included).  Each entry in the hashes
> table is GUID identified and since they're passed through the
> sev_encrypt_flash interface, the hashes will be accumulated by the AMD
> PSP measurement (SEV_LAUNCH_MEASURE).
> 
> Co-developed-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>  target/i386/sev_i386.h |  12 ++++
>  target/i386/sev-stub.c |   5 ++
>  target/i386/sev.c      | 137 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 154 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


