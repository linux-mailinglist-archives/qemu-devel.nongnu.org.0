Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA706672FC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 14:16:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxQj-0006AK-K0; Thu, 12 Jan 2023 08:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFxQX-0005xw-90
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:15:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFxQU-0003ek-4z
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673529325;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHzFjGMfSP3qV41ZFOIPLD70uFT61LQGzAmgBXaRMVw=;
 b=LO2aRgWLT6xCuufZP0MkiO1MHN0EiKwgMCj0wJ0G+Cp+hGLWbIotg/K8ihmYhhDVlkYIf8
 bYvbKwvLExlv1dahXvU9GrieBNeA6rirURt+0vEsT9jOG2N2GqE0tnuogZwLx5fO7OPRId
 lvHe1UX4fPmbUVn4TsfhHZJWT75T8u8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-pegsT9_WMsCQzW_zhhTzjQ-1; Thu, 12 Jan 2023 08:15:23 -0500
X-MC-Unique: pegsT9_WMsCQzW_zhhTzjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7129318E0045;
 Thu, 12 Jan 2023 13:15:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B632EC15BA0;
 Thu, 12 Jan 2023 13:15:22 +0000 (UTC)
Date: Thu, 12 Jan 2023 13:15:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Or Ozeri <ORO@il.ibm.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Danny Harnik <DANNYH@il.ibm.com>, "idryomov@gmail.com" <idryomov@gmail.com>
Subject: Re: [PATCH v4 3/3] block/rbd: Add support for layered encryption
Message-ID: <Y8AH6IzP/5o8OVNm@redhat.com>
References: <20221120102836.3174090-1-oro@il.ibm.com>
 <20221120102836.3174090-4-oro@il.ibm.com>
 <Y8ACAjd0S9q8sS0k@redhat.com>
 <MN2PR15MB348836909E481EEE26A1A1288AFD9@MN2PR15MB3488.namprd15.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN2PR15MB348836909E481EEE26A1A1288AFD9@MN2PR15MB3488.namprd15.prod.outlook.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

On Thu, Jan 12, 2023 at 01:06:51PM +0000, Or Ozeri wrote:
> > -----Original Message-----
> > From: Daniel P. Berrangé <berrange@redhat.com>
> > Sent: Thursday, 12 January 2023 14:50
> > To: Or Ozeri <ORO@il.ibm.com>
> > Cc: qemu-devel@nongnu.org; qemu-block@nongnu.org; Danny Harnik
> > <DANNYH@il.ibm.com>; idryomov@gmail.com
> > Subject: [EXTERNAL] Re: [PATCH v4 3/3] block/rbd: Add support for layered
> > encryption
> > 
> > I don't think we should be reporting this differently.
> > 
> > The layering is not a different encryption format. It is a configuration
> > convenience to avoid repeating the same passphrase for a stack of images
> > when opening an image.
> > 
> > In terms of encryption format it is still either using 'luks1' or 'luks2'.
> > 
> 
> I don’t think that's right.
> The simplest argument is that the magic for RBD layered-luks is not "LUKS".
> So, it's a different format, which cannot be opened by dm-crypt for example.
> I think this is important for the user to know that, and thus it is useful to point it out
> in the output of qemu-img info.

This different magic is an internal implementation detail of RBD. The
on-disk encryption is still following either the luks1 or luks2 format
spec. On the QEMU side we're only needing to know what the on disk format
spec is, and whether or not the parents use a common key, so that apps
know what they need to provide to QEMU for disk config. 

Opening a volume  with dm-crypt is not relevant to QEMU's usage, and
if users are doing that, they should be using the RBD tools directly
and qemu-img info is unrelated to that.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


