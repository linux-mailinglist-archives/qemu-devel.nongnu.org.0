Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE13A51AE71
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 21:54:58 +0200 (CEST)
Received: from localhost ([::1]:48904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmL5N-0000yv-C7
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 15:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nmL3j-00008K-Lp
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:53:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nmL3h-0003Nv-H7
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651693992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+sgWUL2CtZFTRpdmMUrlr2SlAEfN39jSnr9bDrYkMN0=;
 b=YkAE6Cs6rkSWXHXGg2/W4Ma/QacZsoXbSbHT7GbJk2YE0ffTmLPA9Wl+JsQuM1kmZwNhSC
 pvxfelfJmQFXjsta1ROozkVDzZHaTl4YaMsA3K3XuuU08tOtZAzwix3+jsNgWJswhskYQX
 RLx7z9lB18NnbZiln+g0b3EzqccTmOc=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-ZqRJBveMN5mNZRT8e77JRQ-1; Wed, 04 May 2022 15:53:11 -0400
X-MC-Unique: ZqRJBveMN5mNZRT8e77JRQ-1
Received: by mail-il1-f197.google.com with SMTP id
 m3-20020a056e02158300b002b6e3d1f97cso1238108ilu.19
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 12:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+sgWUL2CtZFTRpdmMUrlr2SlAEfN39jSnr9bDrYkMN0=;
 b=Gng8yde6r+lkdbTQMs+gzzw7YYiLSWCacR/bueuIVEak4SwxCMeBZkK9tl+yxqRLOL
 Ddr9nGRAqmuWC/DhXnEhrU2khXTP6Qym7VoWOgbAy3TQ98cVxKauD2OanDcBpGSO65/t
 7lafVIQxg8FBo6sOYYpJCo9DZmq99nx1VHhhQ4EOVDSszWWXN+lVDD4TaVhZ0V4h71N1
 TRlUs6Ru6Pe+be28mS3szXAGL+VIJNoqbRt5alpY4+73cz4/0h9wsVAnc3kRp/TzW8gw
 dCvZX6RddQgPH+dpjnIhihtkw7Vz7ICtN7V+2RP3wdiJ9abPMJ5CbuFgBWND9ADtDaIa
 tXeg==
X-Gm-Message-State: AOAM53254zPeMih1O5P9NmcJUXV1jznGPe2yomen5Epmgl62JDyMNhL0
 8mqidhyo2C/pEbSTZoLK91nDUOwFyoSk0V2Q8kbYV6VIgTeYgF8zVZ383Z9kl+gwySJhJ262ghM
 1m4SsZfSUyCXJrfQ=
X-Received: by 2002:a05:6e02:20ee:b0:2cf:38af:d466 with SMTP id
 q14-20020a056e0220ee00b002cf38afd466mr3736348ilv.64.1651693989610; 
 Wed, 04 May 2022 12:53:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFOxu6m8W+N0Zj6q7EhZ5BpTM4rMGOdPamwYYTOim9q4JXrWk6YXG6Cs0Ayw8+zpJ7e9cB3A==
X-Received: by 2002:a05:6e02:20ee:b0:2cf:38af:d466 with SMTP id
 q14-20020a056e0220ee00b002cf38afd466mr3736321ilv.64.1651693989067; 
 Wed, 04 May 2022 12:53:09 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a02a481000000b0032b3a781785sm4906527jam.73.2022.05.04.12.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 12:53:08 -0700 (PDT)
Date: Wed, 4 May 2022 15:53:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v11 2/7] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YnLZovDd8YCj/QxF@xz-m1.local>
References: <20220504191835.791580-1-leobras@redhat.com>
 <20220504191835.791580-3-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220504191835.791580-3-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 04, 2022 at 04:18:31PM -0300, Leonardo Bras wrote:
> +/*
> + * Zero-copy defines bellow are included to avoid breaking builds on systems
> + * that don't support MSG_ZEROCOPY, while keeping the functions more readable
> + * (without a lot of ifdefs).
> + */
> +#ifndef MSG_ZEROCOPY
> +#define MSG_ZEROCOPY 0x4000000
> +#endif
> +#ifndef SO_ZEROCOPY
> +#define SO_ZEROCOPY 60
> +#endif

So this will define these two values on e.g. FreeBSD, while they do not
make sense at all there because these numbers are pure magics and
meaningless outside Linux..

I don't think it's anything dangerous, but IMHO it's another way of being
not clean comparing of using some "#ifdef"s.  Comparing to this approach
the "use #ifdef" approach is actually slightly more cleaner to me. :)

Let's wait for some other inputs.

-- 
Peter Xu


