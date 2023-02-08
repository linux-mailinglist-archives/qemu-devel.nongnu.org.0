Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD22568F496
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:31:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPoHr-0008L5-Ts; Wed, 08 Feb 2023 12:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPoHp-0008KR-4p
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:31:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPoHl-0005Io-Di
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675877468;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lbCD0qKrlw7zpd2rWv6gG9kGyhwm4EfP0xV8jCeTmNA=;
 b=i8Z074z73rntEgtsnRf7U5M5MfhuA/RZP/2UqN4ZiYVvm14WIquxoTjy4mh94VYogN1SrH
 ehpXsMM2kyhFwjWHoaG3ZaWrq6MS8mfCKJ+JDxM1WnXlkKhF8IA3f/FfRtwC3pCVgCr/1Z
 dVgdxKKr51dXkmMhJONaHobMYC/ItQg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-1xI6j7jJN1mZ4R-OJzXdzQ-1; Wed, 08 Feb 2023 12:31:05 -0500
X-MC-Unique: 1xI6j7jJN1mZ4R-OJzXdzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D864F29AA39B;
 Wed,  8 Feb 2023 17:31:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B4FE2166B29;
 Wed,  8 Feb 2023 17:31:04 +0000 (UTC)
Date: Wed, 8 Feb 2023 17:31:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 3/4] lcitool: allow overriding package mappings and
 target facts
Message-ID: <Y+PcVRXC0acaf8Iz@redhat.com>
References: <20230117091638.50523-1-pbonzini@redhat.com>
 <20230117091638.50523-4-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117091638.50523-4-pbonzini@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Tue, Jan 17, 2023 at 10:16:37AM +0100, Paolo Bonzini wrote:
> lcitool has generally catered to the Libvirt's needs in terms of
> package versions, which are pretty conservative. For example, lcitool
> is hardcoding a version of Meson equal to 0.56. QEMU on the other hand
> has different needs since some features were added to Meson for the
> project's benefit in versions as recent as 0.63.
> 
> Until now, QEMU has managed to avoid the problem by shipping its own
> version of Meson. However, the next release of QEMU will face a breaking
> point in that Meson 0.63 does not work with the 3.6 version of Python
> that is provided by CentOS Stream 8 and OpenSUSE LEAP 15.3.
> 
> Implement locally the functionality provided by
> https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/341, so that
> QEMU can override the mappings and target paths that are used for its CI.

I'd like to just push ahead with getting that merged so we
use the lcitool --data-dir arg to do what QEMU needs, and
stay away from the internal python code.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


