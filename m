Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA7A4754E7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 10:13:27 +0100 (CET)
Received: from localhost ([::1]:51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxQLm-0005e4-Oa
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 04:13:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxQJD-0000BX-Rx
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:10:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxQJB-0006ov-Nd
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639559444;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RvSGPXSziqhbzX6PuTa8oHUYLrmQ0SliOQGH0Y92CkI=;
 b=HiDA3cKftx3lvdD7X1o8sRyyDlN/GJohTkvnPoF/cQCf5IcyCjgshZEe6oZF5CWDOCojya
 jNGI6bQ2ABQendEq4NUZhGBX5C0F9MK18EfzsNXar1aSf47I5zYsefIXjU9vbjwLVBxqgB
 GWF5qHFxsR5WEpDo7aPNnsdb+wBPDWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-279Gyf-RP2-2W5vzFNE9NA-1; Wed, 15 Dec 2021 04:10:43 -0500
X-MC-Unique: 279Gyf-RP2-2W5vzFNE9NA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBCF9B0021;
 Wed, 15 Dec 2021 09:10:22 +0000 (UTC)
Received: from redhat.com (unknown [10.22.8.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B9810841E3;
 Wed, 15 Dec 2021 09:10:19 +0000 (UTC)
Date: Wed, 15 Dec 2021 09:10:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2] monitor: move x-query-profile into accel/tcg to fix
 build
Message-ID: <Ybmw+MhScugEy8bm@redhat.com>
References: <20211214195048.1438209-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211214195048.1438209-1-alex.bennee@linaro.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 07:50:48PM +0000, Alex Bennée wrote:
> As --enable-profiler isn't defended in CI we missed this breakage.
> Move the qmp handler into accel/tcg so we have access to the helpers
> we need. While we are at it ensure we gate the feature on CONFIG_TCG.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 37087fde0e ("qapi: introduce x-query-profile QMP command")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/773
> 
> ---
> v2
>   - enclosed in #ifndef CONFIG_USER_ONLY section
> ---
>  qapi/machine.json    |  1 +
>  accel/tcg/cpu-exec.c | 31 +++++++++++++++++++++++++++++++
>  monitor/qmp-cmds.c   | 31 -------------------------------
>  3 files changed, 32 insertions(+), 31 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Sorry about the mess up I introduced in refactoring, and thanks for
fixing it for me.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


