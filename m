Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B513F59D1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:24:53 +0200 (CEST)
Received: from localhost ([::1]:58994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIRji-0006I7-NO
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIRi6-00049r-Tb
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:23:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIRi3-0004F1-DQ
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629793379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Os0OaXnrhH1x+OO3QqfLUaOalcCaYJ19vp1l9bXUjoI=;
 b=JsivIJLaXmbL1qv+NzoSf+iYVmB2zMyke5S/20mP0eG6SbKsc0CwA9lqGf83fX5WAugWm1
 IZljr7m7Xy9jfGx3PiNvGWBkDG78S9MhB3FUw5ZcIQ1miQZB3x/QFiP+Nk4u7hQtwkQQUn
 NyaFWw0Amqfq1p/8JK2myQD4n+L9WdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-NBy4z9hBPgGeKrR3law0Wg-1; Tue, 24 Aug 2021 04:22:55 -0400
X-MC-Unique: NBy4z9hBPgGeKrR3law0Wg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99D021853024;
 Tue, 24 Aug 2021 08:22:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 586112C00F;
 Tue, 24 Aug 2021 08:22:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A795311380A9; Tue, 24 Aug 2021 10:22:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/5] qemu/qarray.h: introduce QArray
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
 <42e8b7fec3f03487e322be42ef5ca0e09fd9edea.1629638507.git.qemu_oss@crudebyte.com>
Date: Tue, 24 Aug 2021 10:22:52 +0200
In-Reply-To: <42e8b7fec3f03487e322be42ef5ca0e09fd9edea.1629638507.git.qemu_oss@crudebyte.com>
 (Christian Schoenebeck's message of "Sun, 22 Aug 2021 15:16:46 +0200")
Message-ID: <87eeajnter.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian Schoenebeck <qemu_oss@crudebyte.com> writes:

> Implements deep auto free of arrays while retaining common C-style
> squared bracket access.
>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

You provide some motivation for this, but only in your cover letter:

    Patches 1 and 2 introduce include/qemu/qarray.h which implements a deep auto
    free mechanism for arrays. Unlike GArray it does not require special macros,
    function calls or member dereferencing to access the individual array
    elements. So existing C-style array code can be retained with only very
    little changes.

    In this initial version QArray only supports the concept of unique pointers,
    i.e. it does not support reference counting. The array (and all dynamically
    allocated memory of individual array elements) is auto freed once execution
    leaves the scope of the reference variable (unique pointer) associated with
    the array.

Please put it into the commit message, so it gets committed.

An example to illustrate how QArray is better than GArray (for some
value of "better") would help make your case that QArray is worth its
maintenance cost.

> ---
>  include/qemu/qarray.h | 150 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 include/qemu/qarray.h
>
> diff --git a/include/qemu/qarray.h b/include/qemu/qarray.h
> new file mode 100644
> index 0000000000..9885e5e9ed
> --- /dev/null
> +++ b/include/qemu/qarray.h
> @@ -0,0 +1,150 @@
> +/*
> + * QArray - deep auto free C-array
> + *
> + * Copyright (c) 2021 Crudebyte
> + *
> + * Authors:
> + *   Christian Schoenebeck <qemu_oss@crudebyte.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */

Please use GPLv2+ unless you have a compelling reason not to.

[...]


