Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4B554C3B5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 10:41:52 +0200 (CEST)
Received: from localhost ([::1]:53016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Ob1-0002uD-OS
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 04:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1OQL-0008OL-6g
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:30:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1OQF-0001fy-4G
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655281842;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lzWVaX6Uc1tiuuYdmyYal5m3c2ntd347F1ZpfaQ5ZH8=;
 b=HucAXdHK9AIQsfJ7IW31m1UxZNOD9Vv3s3SULLbWhAhIG6OHZDUPgDlN8JTnUGQvRRV9FK
 PfLk4TE2ItxzJ9MGtKgWevE+u3TTYnNDsE5L0cpq5RPI/3sVlVtPrZD//8K8iid+YSAzzy
 PKDfVqeA1sXEpokks4yjIk0bNM9lNC0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-dqVHcqMzORu9XCEKqUi7-A-1; Wed, 15 Jun 2022 04:30:40 -0400
X-MC-Unique: dqVHcqMzORu9XCEKqUi7-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DF5283397E;
 Wed, 15 Jun 2022 08:30:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 082BB1131D;
 Wed, 15 Jun 2022 08:30:38 +0000 (UTC)
Date: Wed, 15 Jun 2022 09:30:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 0/4] cutils: Introduce bundle mechanism
Message-ID: <YqmYrFjshfAopt3A@redhat.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614210746.78911-1-akihiko.odaki@gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Jun 15, 2022 at 06:07:42AM +0900, Akihiko Odaki wrote:
> Developers often run QEMU without installing. The bundle mechanism
> allows to look up files which should be present in installation even in
> such a situation.
> 
> It is a general mechanism and can find any files located relative
> to the installation tree. The build tree must have a new directory,
> qemu-bundle, to represent what files the installation tree would
> have for reference by the executables.

I don't think this is an attractive approach to the problem,
because it results in us adding a bunch of meson rules to
simulate 'make install' within the build dir. This is undesirable
clutter IMHO, and can be solved more simply by just modifying the
qemu_find_file() method.

The core problem is the impl of qemu_find_file is taking the wrong
approach, in several ways, but mostly because of its use of a single
'data_dirs' array for all types of file. This is bad because it
has the assumption that build dir and install dir layouts match,
and second because when we add extra firmware data dirs, we don't
want this used for non-firmware files.

We need to separate out the handling of different types of resources
for this to work correctly.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


