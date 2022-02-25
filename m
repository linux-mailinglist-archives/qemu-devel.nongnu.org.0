Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1EC4C41D4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:54:57 +0100 (CET)
Received: from localhost ([::1]:38128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXJP-0004QG-Pz
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:54:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nNW7f-0000Tl-6a
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nNW7c-0003m0-6I
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645778319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XyoBzNuBjbFrXyWiyXL/sZikTrTg/nXanqdjCdeMwCc=;
 b=idDtJ8Iv9LAxyH6CxrVFXbZSndnuhO35aL7JwCyxqwKW2Y1rNWkqyXkJbtwWqKWJcv1GJW
 72XMiDf+0BYS9g9iTn/3wYkyBMxMlpI6BRKaEMw9/2Nhrj6HHBURwj6UXwyR2gIC+F8YGy
 yxdGJnIGmtzQdDfavxFIUQZie5xbLqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-DSNWbNX8MW6ZvGhZH-4ffw-1; Fri, 25 Feb 2022 03:38:36 -0500
X-MC-Unique: DSNWbNX8MW6ZvGhZH-4ffw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C9A91091DA3;
 Fri, 25 Feb 2022 08:38:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D6A9691B5;
 Fri, 25 Feb 2022 08:38:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EAF9B21E6A00; Fri, 25 Feb 2022 09:38:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 0/3] qapi: Move RTC_CHANGE back out of target schema
References: <20220221192123.749970-1-peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 09:38:21 +0100
In-Reply-To: <20220221192123.749970-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Mon, 21 Feb 2022 19:21:20 +0000")
Message-ID: <8735k7nxxe.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> This patchset moves RTC_CHANGE back to misc.json, effectively
> reverting commit 183e4281a30962, which moved the RTC_CHANGE event to
> the target schema.  That change was an attempt to make the event
> target-specific to improve introspection, but the event isn't really
> target-specific: it's machine or device specific.  Putting RTC_CHANGE
> in the target schema with an ifdef list reduces maintainability (by
> adding an if: list with a long list of targets that needs to be
> manually updated as architectures are added or removed or as new
> devices gain the RTC_CHANGE functionality) and increases compile time
> (by preventing RTC devices which emit the event from being "compile
> once" rather than "compile once per target", because
> qapi-events-misc-target.h uses TARGET_* ifdefs, which are poisoned in
> "compile once" files.)
>
> Patch 2 fixes some minor documentation issues for the RTC_CHANGE
> event, noticed during development of the patchset.
>
> Patch 3 makes the pl031 a build-once file again, which was the
> initial motivation for the series.

Queued including my PATCH 4.  Happy to unqueue it if there are
objections, or the entire thing if you'd rather take it through the ARM
tree.  Thanks!


