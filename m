Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96CC4BEBA0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 21:12:46 +0100 (CET)
Received: from localhost ([::1]:49236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMF37-0002II-II
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 15:12:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nMF1h-0001NA-9a
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 15:11:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nMF1d-0001t2-2q
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 15:11:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645474272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XcpQnC12mGMa0T6Sy35EF6aR7AjZ5NjU6XBGVlQnwro=;
 b=S358Kt0oaHaMFB40r3hxwzBo9cxBEYjVoyA2TctLU6x43m+y+hZHLOaZmi/FeqZZvo2j6o
 QVTlVrQNFjd1jTXZ4Zs6Z1H/72Y6Z/OhE32wzXqTOlaszcT2CB3CG61/jps6R06rsv+rhO
 e5cImc1rMNWK5qJP8LTq9oUdbzW+nCs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-CG-xEBBTO3WWHf1LT0-hQg-1; Mon, 21 Feb 2022 15:11:11 -0500
X-MC-Unique: CG-xEBBTO3WWHf1LT0-hQg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a8-20020a7bc1c8000000b0037bc4c62e97so23985wmj.0
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 12:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XcpQnC12mGMa0T6Sy35EF6aR7AjZ5NjU6XBGVlQnwro=;
 b=abGReAdZCSPUu4OFx+aHTl620RHmTkeGNUDYt9ikILmYPaEXVV6YF9+GL6unl8xOgC
 VfvWJhQSdkHxhQby1M+yzIXW9+bInWdxT/0aDHdu+nDNZ/mqPkPM+pXW/hcl0Xjp6LBS
 wNawyxS0/2BKcjxmHJo4QWqFqqX471MYHJRsmYUHaWbyanE1f6PswpxoI8eOlGzK6dhu
 bPiw9o0QsMIvqGBmkvVcb18/U/rDg9fwhzj296cLQL9Q0FcfnQOhTOh4vVvHRVbcf5Vc
 /qy+mMmu93lAM+NI2FVjWLNq4t1Tk+/mH7uSlyOW7aqadDHps6kbURJ7Kx4S0RVtldTn
 3InQ==
X-Gm-Message-State: AOAM531MrIE6EQhEd9kE1G8r0K45rW9jEZt6RntwQglqnktzeiFauIuY
 qbs6YMFyiKQC5JFxgTnDnndShoVlqDFtK4iYn0X0bUsQi8zmH0VYhWsvpg/UKClX051KwvH6mvJ
 B/mOkACp0zbTR0tw=
X-Received: by 2002:a5d:440b:0:b0:1e3:f66:bf59 with SMTP id
 z11-20020a5d440b000000b001e30f66bf59mr16801338wrq.250.1645474269829; 
 Mon, 21 Feb 2022 12:11:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSZTIRmnmlSO+RmZ8W6lWQszk/FSU0ZfeZFYE3OpeE9bhlkj1bBXx4LQdAdxdMaQOZiATYzg==
X-Received: by 2002:a5d:440b:0:b0:1e3:f66:bf59 with SMTP id
 z11-20020a5d440b000000b001e30f66bf59mr16801322wrq.250.1645474269430; 
 Mon, 21 Feb 2022 12:11:09 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id d13sm32897295wri.38.2022.02.21.12.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:11:08 -0800 (PST)
Subject: Re: [PATCH v2 0/3] qapi: Move RTC_CHANGE back out of target schema
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220221192123.749970-1-peter.maydell@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <6875ffb9-da1c-7e58-4606-6bc15340e407@redhat.com>
Date: Mon, 21 Feb 2022 21:11:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220221192123.749970-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2/21/22 8:21 PM, Peter Maydell wrote:
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
> 
> Changes v1->v2:
>  * patch 1 needs to change the #include line for pl031.c, now that
>    the change to make that device emit RTC_CHANGE has landed upstream
>  * patch 2 now also notes in the RTC_CHANGE documentation that
>    not all devices/systems will emit the event (suggested by Markus)
>  * patch 3 is new

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
> 
> My default assumption is that this series will go in via the
> qapi tree; let me know if you'd prefer me to take it via
> target-arm instead.
> 
> thanks
> -- PMM
> 
> Peter Maydell (3):
>   qapi: Move RTC_CHANGE back out of target schema
>   qapi: Document some missing details of RTC_CHANGE event
>   hw/rtc: Compile pl031 once-only
> 
>  qapi/misc-target.json | 33 ---------------------------------
>  qapi/misc.json        | 24 ++++++++++++++++++++++++
>  hw/ppc/spapr_rtc.c    |  2 +-
>  hw/rtc/mc146818rtc.c  |  2 +-
>  hw/rtc/pl031.c        |  2 +-
>  hw/rtc/meson.build    |  2 +-
>  6 files changed, 28 insertions(+), 37 deletions(-)
> 


