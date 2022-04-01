Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E424EEBFF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:05:08 +0200 (CEST)
Received: from localhost ([::1]:36394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naF5W-0002bx-Ti
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:05:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naF2I-0000p1-FL
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:01:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naF2G-0006mN-Gw
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648810903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5kl2v3pMs0GECEKMzuvXjteSbterczGemfw9e0cwnCU=;
 b=YK7Z8dakSZLy0VfVHTjTwp3HpI7O/gN/W7A2L+ZP7H5geQKC9Mjwjla/l5B6kj2ebqpq4m
 PFwqcV0LHc5wl7OVCTb0nIf3Z251mjuJPALZ0eyF9dKGo81RE3qsAvMfjZ0uE5ZG/LFKLQ
 0DbBXE9lztZkiYX+UGR3hlEEdiGnnjg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-xwbJVMi3OmGR8pY93BRWHQ-1; Fri, 01 Apr 2022 07:01:40 -0400
X-MC-Unique: xwbJVMi3OmGR8pY93BRWHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDB332800965;
 Fri,  1 Apr 2022 11:01:34 +0000 (UTC)
Received: from [10.39.192.17] (unknown [10.39.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD4DF1400C2B;
 Fri,  1 Apr 2022 11:01:32 +0000 (UTC)
Message-ID: <fa63b692-a1be-d4f9-d2ee-e8e4c1af4890@redhat.com>
Date: Fri, 1 Apr 2022 13:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] 9p: move P9_XATTR_SIZE_MAX from 9p.h to 9p.c
To: Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20220331182651.887-1-wwcohen@gmail.com>
 <CAFEAcA9Ab_+8K-RcJeCFAmGkeu6xqL-dsAQuTETqRhCM6ncZmA@mail.gmail.com>
 <CAB26zV2UkS4unxXkTLiF8T5aY9YaCpcUd2DRbzb0_FHTt+uyyw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAB26zV2UkS4unxXkTLiF8T5aY9YaCpcUd2DRbzb0_FHTt+uyyw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fabian Franz <fabianfranz.oss@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/03/2022 22.06, Will Cohen wrote:
> On Thu, Mar 31, 2022 at 4:00 PM Peter Maydell <peter.maydell@linaro.org 
> <mailto:peter.maydell@linaro.org>> wrote:
> 
>     On Thu, 31 Mar 2022 at 19:27, Will Cohen <wwcohen@gmail.com
>     <mailto:wwcohen@gmail.com>> wrote:
>      >
>      > The patch set adding 9p functionality to darwin introduced an issue
>      > where limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c,
>      > though the referenced constant is needed in 9p.h. This commit fixes that
>      > issue by moving the definition of P9_XATTR_SIZE_MAX, which uses
>      > XATTR_SIZE_MAX, to also be in 9p.c.
>      >
>      > Additionally, this commit moves the location of the system headers
>      > include in 9p.c to occur before the project headers.
>      >
>      > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/950
>     <https://gitlab.com/qemu-project/qemu/-/issues/950>
>      > Fixes: 38d7fd68b0 ("9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX")
>      >
>      > Signed-off-by: Will Cohen <wwcohen@gmail.com <mailto:wwcohen@gmail.com>>
>      > ---
>      >  hw/9pfs/9p.c | 28 +++++++++++++++++++++++-----
>      >  hw/9pfs/9p.h | 18 ------------------
>      >  2 files changed, 23 insertions(+), 23 deletions(-)
>      >
>      > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
>      > index dcaa602d4c..b9152c7882 100644
>      > --- a/hw/9pfs/9p.c
>      > +++ b/hw/9pfs/9p.c
>      > @@ -16,6 +16,11 @@
>      >   * https://wiki.qemu.org/Documentation/9p
>     <https://wiki.qemu.org/Documentation/9p>
>      >   */
>      >
>      > +#ifdef CONFIG_LINUX
>      > +#include <linux/limits.h>
>      > +#else
>      > +#include <limits.h>
>      > +#endif
>      >  #include "qemu/osdep.h"
> 
>     osdep.h must always be the first include line in any .c file.
> 
> Understood, apologies -- if there's other changes for a v3 I can resubmit 
> accordingly, but if this otherwise looks okay then I would be fine with a 
> QEMU maintainer adjusting the header placement as needed when preparing for 
> submission to the main tree.

Makes sense. I'm currently assembling a pull req with some misc fixes for 
7.0 ... if Christian & Greg do not have any other patches pending right now, 
I could throw this in, with the osdep.h location fixed.

  Thomas


