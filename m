Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE98C59142F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 18:45:52 +0200 (CEST)
Received: from localhost ([::1]:38030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMXnD-0004SB-L9
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 12:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oMXXx-00017a-79
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 12:30:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oMXXt-0008RD-MM
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 12:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660321800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nul/L14LVJGmSoKk9jRKbJpSiPNJPuolWbE5su9XgAY=;
 b=E/cTF+DLWOZO2znTorU88hU22wO1Dvkmc1LU/nM0HNYed2aFMbubZKYft0xdu5AlKIEezo
 WN6rKFuByCv5hvSbtCcurwsmDFGfdbiQkrkwcwnoqdYO4pQ+1K/qXir+4C7thOtic17fDl
 XOByT9SVLItH6nnQXGnyVJwqDGOTXhI=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-114-v1l-wWwqMJCWPbLpSqCQRg-1; Fri, 12 Aug 2022 12:29:58 -0400
X-MC-Unique: v1l-wWwqMJCWPbLpSqCQRg-1
Received: by mail-il1-f200.google.com with SMTP id
 a19-20020a921a13000000b002df8a28c30dso888843ila.9
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 09:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=nul/L14LVJGmSoKk9jRKbJpSiPNJPuolWbE5su9XgAY=;
 b=D7rHGPbyYEbCOjd8Eh1JOhkc0M/z+d1xMDjXwfEfSrY92YhAPdAYfJN0h9s/K/p271
 2LM14OkCBhTFEdBx+GEkw4m8kWbTngFtkBDcuz/JSuMwTW9xMZPGLCc6JZyEu5uyXnLq
 sAOjEUmKV16DvvsFlRFoBh/HEUuP0JHqgPpZz4Z8LOWJCt0n7kT07zCR1GeJkxbwfAng
 izZS5ov35koeQbng73Gs1nmeyLOOxtI7yveFvl8oK+Cl7d5/Ck3oJjXZVumVwb28tVKw
 8HCmJ+7asGV/Fnxf7Zv8QtwVne9k0QRSxnct7Nqyx5FzQ4Z1+7abYmCVCF8k4lta25bb
 ikhQ==
X-Gm-Message-State: ACgBeo2BjgzzK6lGkJle2E1dOZzEY+DO/bZJEbcjxjp/airxeApY3QcT
 hZdOD50YuroxEyo5TByu3iBHaMWcrCTyacTCs3wHj/zAow7bGnGVlQbhl/Warlt0pG9v0H/ytB7
 poeZ75wscV1FM73xjhdBMzDUAvo9fka8=
X-Received: by 2002:a05:6602:1355:b0:669:40a5:9c26 with SMTP id
 i21-20020a056602135500b0066940a59c26mr2137559iov.105.1660321797986; 
 Fri, 12 Aug 2022 09:29:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4hWTbeT1ytr7xbhX2e6Bc60xFonAWoAOKbYEg/4n/uXeT/dotMKPEVxy7fup0poHNOp+6b1VydDhsLwYBe7Pw=
X-Received: by 2002:a05:6602:1355:b0:669:40a5:9c26 with SMTP id
 i21-20020a056602135500b0066940a59c26mr2137505iov.105.1660321797700; Fri, 12
 Aug 2022 09:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220729130040.1428779-1-afaria@redhat.com>
 <20220729130040.1428779-3-afaria@redhat.com>
 <YupSAhFRK962i+nL@work-vm>
 <CAELaAXyh0MzuVzDCfhC8hJNAwb=niwFRsXqhc63JiWGxxitkqg@mail.gmail.com>
 <20220803111520.GO1127@redhat.com>
In-Reply-To: <20220803111520.GO1127@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Fri, 12 Aug 2022 17:29:21 +0100
Message-ID: <CAELaAXxm3whnSLeiMXqUsZPyp-n-aJcVfbkdiUxJyUthVSyO4w@mail.gmail.com>
Subject: Re: [RFC v2 02/10] Drop unused static function return values
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Hannes Reinecke <hare@suse.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, Peter Lieven <pl@kamp.de>,
 kvm@vger.kernel.org, 
 Xie Yongji <xieyongji@bytedance.com>, Eric Auger <eric.auger@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Eric Blake <eblake@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Stefan Weil <sw@weilnetz.de>, 
 Klaus Jensen <its@irrelevant.dk>, Laurent Vivier <lvivier@redhat.com>, 
 Alberto Garcia <berto@igalia.com>, Michael Roth <michael.roth@amd.com>, 
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-block@nongnu.org, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Greg Kurz <groug@kaod.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Jason Wang <jasowang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 3, 2022 at 12:15 PM Richard W.M. Jones <rjones@redhat.com> wrote:
> If it helps to think about this, Coverity checks for consistency.
> Across the whole code base, is the return value of a function used or
> ignored consistently.  You will see Coverity errors like:
>
>       Error: CHECKED_RETURN (CWE-252): [#def37]
>       libnbd-1.12.5/fuse/operations.c:180: check_return: Calling "nbd_poll" without checking return value (as is done elsewhere 5 out of 6 times).
>       libnbd-1.12.5/examples/aio-connect-read.c:96: example_checked: Example 1: "nbd_poll(nbd, -1)" has its value checked in "nbd_poll(nbd, -1) == -1".
>       libnbd-1.12.5/examples/aio-connect-read.c:128: example_checked: Example 2: "nbd_poll(nbd, -1)" has its value checked in "nbd_poll(nbd, -1) == -1".
>       libnbd-1.12.5/examples/strict-structured-reads.c:246: example_checked: Example 3: "nbd_poll(nbd, -1)" has its value checked in "nbd_poll(nbd, -1) == -1".
>       libnbd-1.12.5/ocaml/nbd-c.c:2599: example_assign: Example 4: Assigning: "r" = return value from "nbd_poll(h, timeout)".
>       libnbd-1.12.5/ocaml/nbd-c.c:2602: example_checked: Example 4 (cont.): "r" has its value checked in "r == -1".
>       libnbd-1.12.5/python/methods.c:2806: example_assign: Example 5: Assigning: "ret" = return value from "nbd_poll(h, timeout)".
>       libnbd-1.12.5/python/methods.c:2808: example_checked: Example 5 (cont.): "ret" has its value checked in "ret == -1".
>       #  178|       /* Dispatch work while there are commands in flight. */
>       #  179|       while (thread->in_flight > 0)
>       #  180|->       nbd_poll (h, -1);
>       #  181|     }
>       #  182|
>
> What it's saying is that in this code base, nbd_poll's return value
> was checked by the caller 5 out of 6 times, but ignored here.  (This
> turned out to be a real bug which we fixed).
>
> It seems like the check implemented in your patch is: If the return
> value is used 0 times anywhere in the code base, change the return
> value to 'void'.  Coverity would not flag this.
>
> Maybe a consistent use check is better?

Note that the analyzer is currently limited to analyzing a single
translation unit at a time, so we would only be able to implement a
consistent use check for static functions (this is why the current
"return-value-never-used" check only applies to static functions).

It may be worthwhile exploring cross-translation unit analysis,
although it may be difficult to accomplish while also avoiding
reanalyzing the entire tree every time a single translation unit is
modified.

Alberto


