Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD557391D4E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 18:51:00 +0200 (CEST)
Received: from localhost ([::1]:39590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llwkF-00047L-BB
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 12:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1llwdi-0001VM-D9
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:44:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1llwdY-0003BG-Eo
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622047422;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssHEIadIqhw7GP3pafEiXxQbT8ZQnNwRKe8Vbn6QNAc=;
 b=Lum8/2/PJb4D+rw4StNKpnm/YMj96b6kVffwl45pbLbyvvtMKhGmmREIxcIfoYmBjbjvc3
 vUxkZWLPxxJ+kMaETeWC9VwKbD3D+Sldxdq+y25nNuaHs21MmFIXQpv/aO2tQ1GLSAgUkW
 TQcu88CS+MEHz7sfvmg8KLI2/AsEMR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-Xn1PT7n8NEe9oiknbYIbug-1; Wed, 26 May 2021 12:43:37 -0400
X-MC-Unique: Xn1PT7n8NEe9oiknbYIbug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ACB01020C52;
 Wed, 26 May 2021 16:43:36 +0000 (UTC)
Received: from redhat.com (ovpn-115-19.ams2.redhat.com [10.36.115.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C448D19D9D;
 Wed, 26 May 2021 16:43:29 +0000 (UTC)
Date: Wed, 26 May 2021 17:43:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] i386: use better matching family/model/stepping for
 generic CPUs
Message-ID: <YK56rnSly772QAxl@redhat.com>
References: <20210507133650.645526-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210507133650.645526-1-berrange@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On Fri, May 07, 2021 at 02:36:48PM +0100, Daniel P. Berrangé wrote:
> This is in response to this bug report:
> 
>    https://gitlab.com/qemu-project/qemu/-/issues/191
> 
> The generic 'qemu64' and 'max' CPUs currently defined to report a
> family/model/stepping that approximately corresponds to an AMD K7
> vintage architecture. The K7 series predates the introduction of
> 64-bit support by AMD in the K8 series. This has been reported to
> lead to LLVM complaints about generating 64-bit code for a 32-bit
> CPU target
> 
>   LLVM ERROR: 64-bit code requested on a subtarget that doesn't support it!
> 
> The bug report is fairly limited, but it suggests LLVM looks at the
> family/model/stepping and decides it to be 32-bit, despite qemu64
> reporting it is 64-bit capable. I've not reproduced this myself,
> however, so I'm largely trusting the original reporter's diagnosis
> 
> Of course interpreting the family/model/stepping only makes sense
> with scoped to the reported vendor ID.  Under TCG, the vendor is
> honoured, but AFAICT, under KVM the vendor defined by the QEMU
> model model is ignored and the real host vendor passed through.
> This will make the chosen family/model/stepping non-sensical when
> run under KVM on an Intel host.
> 
> None the less these patches change to report a CPUID with the
> family, model and stepping taken from a
> 
>  AMD Athlon(tm) 64 X2 Dual Core Processor 4000+
> 
> which is one of the first 64-bit AMD CPUs. This is at least more
> accurate in terms of the static CPU model definition, even if it
> is still nonsense in the case where KVM overrides the vendor to
> be non-AMD.
> 
> Daniel P. Berrangé (2):
>   i386: use better matching family/model/stepping for 'qemu64' CPU
>   i386: use better matching family/model/stepping for 'max' CPU
> 
>  hw/i386/pc.c      |  6 +++++-
>  target/i386/cpu.c | 12 +++++++++---
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> -- 
> 2.31.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


