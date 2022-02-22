Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7859E4BF4A2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:26:37 +0100 (CET)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRRM-0007eC-87
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:26:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMRPX-0006S6-Hp
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:24:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMRPU-0004Xn-UB
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645521880;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjBG7eHWXDH5vxM7EdRaAeVHmNknrtWs2ik4wT/hi+A=;
 b=DsoxVTeV069OC69XOvSBgutqPfB2tojim/aZvl69DUIriK0UxmTVTSxpzZKSgNGwsD0qI6
 8GTzoeoBQ3hbbVNly9V32LcMEbqfu9RtNsiYj97NSjqXZtVvwRsurqg+RL+Ae1b4i/F2MW
 hn7UoEjVg8yxIZbvvi8kj9UsYqeynZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-aZ2ztUUEOZm11wz1zW4YcA-1; Tue, 22 Feb 2022 04:24:34 -0500
X-MC-Unique: aZ2ztUUEOZm11wz1zW4YcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B101A800425;
 Tue, 22 Feb 2022 09:24:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF6357048B;
 Tue, 22 Feb 2022 09:24:02 +0000 (UTC)
Date: Tue, 22 Feb 2022 09:23:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] hw/i386: Improve bounds checking in OVMF table
 parsing
Message-ID: <YhSrrwlonNl4Qq0U@redhat.com>
References: <20220222071906.2632426-1-dovmurik@linux.ibm.com>
 <20220222071906.2632426-2-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220222071906.2632426-2-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 07:19:05AM +0000, Dov Murik wrote:
> When pc_system_parse_ovmf_flash() parses the optional GUIDed table in
> the end of the OVMF flash memory area, the table length field is checked
> for sizes that are too small, but doesn't error on sizes that are too
> big (bigger than the flash content itself).
> 
> Add a check for maximal size of the OVMF table, and add an error report
> in case the size is invalid.  In such a case, an error like this will be
> displayed during launch:
> 
>     qemu-system-x86_64: OVMF table has invalid size 4047
> 
> and the table parsing is skipped.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>  hw/i386/pc_sysfw_ovmf.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


