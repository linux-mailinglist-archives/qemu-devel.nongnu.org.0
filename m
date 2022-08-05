Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A4A58A938
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:09:21 +0200 (CEST)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuGe-0007kk-QC
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJtzd-0005Tw-Hl
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:51:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJtza-0003RQ-QR
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659693102;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5ny37BHqGBx7dAsStmMfMae6c+vevtZ8XMIwJ0xJKNo=;
 b=LoKjOCf50ZCn71w92Jad7WB2OS2GJqEQLPGftMSEPYa6l8wwyAcvEQNASm5C4oGOdDxML9
 kSM+jJBkte5b/le4gUmSbVjCRFXIkQQQ4KdQlAzffBH733sMOJaEKLl8qjgcmyd3tPFH0g
 13gavTNKIPmMw/OuCUM6CsU1xMLePEg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-UIMSAbLZMpqW6huFBSHmXw-1; Fri, 05 Aug 2022 05:51:38 -0400
X-MC-Unique: UIMSAbLZMpqW6huFBSHmXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9267E823F10;
 Fri,  5 Aug 2022 09:51:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EDE340CFD0B;
 Fri,  5 Aug 2022 09:51:36 +0000 (UTC)
Date: Fri, 5 Aug 2022 10:51:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Regression in -readconfig [memory] size (was: [PULL 13/27]
 machine: add mem compound property)
Message-ID: <YuzoJfTzuc/oM7BI@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
 <20220512172505.1065394-14-pbonzini@redhat.com>
 <87czfcof27.fsf@pond.sub.org> <87pmhf6nrv.fsf_-_@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87pmhf6nrv.fsf_-_@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 05, 2022 at 11:30:12AM +0200, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
> > Paolo Bonzini <pbonzini@redhat.com> writes:
> >
> >> Make -m syntactic sugar for a compound property "-machine
> >> mem.{size,max-size,slots}".  The new property does not have
> >> the magic conversion to megabytes of unsuffixed arguments,
> >> and also does not understand that "0" means the default size
> >> (you have to leave it out to get the default).  This means
> >> that we need to convert the QemuOpts by hand to a QDict.
> >>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> Message-Id: <20220414165300.555321-4-pbonzini@redhat.com>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> [...]
> 
> > This appears to change the meaning of
> >
> >     [memory]
> >       size = "1024"
> >
> > in a -readconfig file from 1024MiB to 8KiB (1024 Bytes rounded up to
> > 8KiB silently).
> 
> No reply so far.
> 
> If we can't fix this, we better mention it in the release notes.

That is such a massive change in semantics of -readconfig that if we
can't fix it we might as well just go all out and fully drop all notion
of backcompat for -readconfig.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


