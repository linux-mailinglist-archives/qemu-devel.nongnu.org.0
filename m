Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67CD54C783
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 13:30:30 +0200 (CEST)
Received: from localhost ([::1]:56670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1REC-0001aB-NU
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 07:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1RBS-0000gR-EG
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:27:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1RBO-0005xl-Hb
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655292453;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pRNOQc/M65XGy3Jv6mDi7CqMQ9+EzlnXjaC/To7apk=;
 b=bmesmIlFut9u8IC5785LD2bdEsqSQ7aEMHKvzT0gcToc/cxoKy2hAj3fDTp54C4INphzOg
 2UbjmWABwtML3m/iwg322iuX1jOqUGe5qD0zzr6i/zJF8dLjDHBvzwt+M6C+7HqyUK5U+/
 DRHFGE8SdW+n6JtEEbHvUiQwehj38YM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-vPWp4mbANHqkV8XWgzFzrg-1; Wed, 15 Jun 2022 07:27:29 -0400
X-MC-Unique: vPWp4mbANHqkV8XWgzFzrg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AB443C025D1;
 Wed, 15 Jun 2022 11:27:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 163FD111F5;
 Wed, 15 Jun 2022 11:27:27 +0000 (UTC)
Date: Wed, 15 Jun 2022 12:27:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 0/4] cutils: Introduce bundle mechanism
Message-ID: <YqnCHXx4iY5O0vnn@redhat.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
 <YqmYrFjshfAopt3A@redhat.com>
 <4d501ec8-836c-9d33-65a0-4a6ab943091b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d501ec8-836c-9d33-65a0-4a6ab943091b@redhat.com>
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

On Wed, Jun 15, 2022 at 01:02:08PM +0200, Paolo Bonzini wrote:
> On 6/15/22 10:30, Daniel P. Berrangé wrote:
> > I don't think this is an attractive approach to the problem,
> > because it results in us adding a bunch of meson rules to
> > simulate 'make install' within the build dir. This is undesirable
> > clutter IMHO, and can be solved more simply by just modifying the
> > qemu_find_file() method.
> > 
> > The core problem is the impl of qemu_find_file is taking the wrong
> > approach, in several ways, but mostly because of its use of a single
> > 'data_dirs' array for all types of file. This is bad because it
> > has the assumption that build dir and install dir layouts match,
> > and second because when we add extra firmware data dirs, we don't
> > want this used for non-firmware files.
> > 
> > We need to separate out the handling of different types of resources
> > for this to work correctly.
> 
> In some sense this is what Akihiko did - instead of separating them in
> qemu_find_file(), the "pre-install" layout separates them in the filesystem.
> While I had remarks on the implementation I think it's a sensible approach.
> 
> The pre-install directory could even be created as a custom_target, using
> the JSON files from Meson introspection.

Doing that is more complicated than just refactoring qemu_find_file,
such that its search locations can be tailored per file type, just
by setting a couple variables in the code IMHO.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


