Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD35A42084F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:32:17 +0200 (CEST)
Received: from localhost ([::1]:34118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKKW-00089x-Rm
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXJsw-0003dv-LV
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:03:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXJsv-0006Xa-7h
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633338223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PwpAFk42yGbrnPlTAcBUjyLPwkD9LbY1LCO0fY1cJyw=;
 b=J4vCRiGGhthej30TUTATHucEWKDE95doRlit7oiyNAf0Igzluq0VuGmTfe5Jx+Ej97/9E4
 J9R/XqzkR8kAopwI1pndyu8jQ20UB+Js9veuuTzgkkMUz3cxN9v3A1BYdLH+tG7xnFyPVt
 gXvQ99/JG2wYsZbDm2KBQnuCzWvia5Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-3vzIvN72P4SaRDe4XHS7fQ-1; Mon, 04 Oct 2021 05:03:40 -0400
X-MC-Unique: 3vzIvN72P4SaRDe4XHS7fQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m9-20020a05600c4f4900b003057c761567so9706442wmq.1
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PwpAFk42yGbrnPlTAcBUjyLPwkD9LbY1LCO0fY1cJyw=;
 b=0T/PpZkk0GXeig1v6g5o1dPkZGeiZ2NscN5yxsJIOqog4F/+itQ06ZIQ7RI5CFkVyy
 iqNaGerQn/KRxcUzZufaHkETTMXvYQIF9MP1Zmm78B5e4PbrRyoxE2JmNMz75klYHQvL
 rgznPTx6G+4HR1ybgZ/TZnTCSunjOlM7mzzkw3Wwz5OoSuJHqdINIaHHw1zg1DaX9DWW
 oD1fYIeQDDcWWn9USP1PYngJzCztgzGVwB8a5hEdlBqYReMiwDaxvod+anLiritoYZ7o
 1DMcpNsSiWVKEdRV1nJU9kWlKx8/VYcIL5qMcTwQ6NSV4S13Zu64lh//XqPHypki70im
 WMuA==
X-Gm-Message-State: AOAM533QOtPd8ouqodjNldta4sohA2LPkEiuu8ZRpMQsPzL6ATyLR6iO
 dD6UvhD0g/6diLQsLnrfYHE1L5p7W7O7d+FmfuHOsqohW3Zff3D32QJos4C6eTQ/Fp+pqAEE2JN
 3L7/SmAwPeV+sZaI=
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr12606572wrs.262.1633338219734; 
 Mon, 04 Oct 2021 02:03:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMM3a0bRu8ClgD/XjGfXca66274rdmXcxXAkPOG9jUqlretcate9tzp7Gsd6ut/OX348ZI2A==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr12606548wrs.262.1633338219555; 
 Mon, 04 Oct 2021 02:03:39 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id g25sm13574373wrc.88.2021.10.04.02.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 02:03:39 -0700 (PDT)
Subject: Re: [PATCH 03/15] python/aqmp: Return cleared events from
 EventListener.clear()
To: John Snow <jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-4-jsnow@redhat.com>
 <19e00805-83cc-f0bf-beea-1ac6ca0472d8@redhat.com>
 <CAFn=p-Zdy9m5T55K4=ZXxttc_gAbNN5cZBAOi_P_swps-A=w4Q@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <5bfbc101-3c7e-0b91-0c1a-cf579743e86a@redhat.com>
Date: Mon, 4 Oct 2021 11:03:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-Zdy9m5T55K4=ZXxttc_gAbNN5cZBAOi_P_swps-A=w4Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.09.21 19:19, John Snow wrote:
>
>
> On Fri, Sep 17, 2021 at 8:36 AM Hanna Reitz <hreitz@redhat.com 
> <mailto:hreitz@redhat.com>> wrote:
>
>     On 17.09.21 07:40, John Snow wrote:
>     > This serves two purposes:
>     >
>     > (1) It is now possible to discern whether or not clear() removed any
>     > event(s) from the queue with absolute certainty, and
>     >
>     > (2) It is now very easy to get a List of all pending events in one
>     > chunk, which is useful for the sync bridge.
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com
>     <mailto:jsnow@redhat.com>>
>     > ---
>     >   python/qemu/aqmp/events.py | 9 +++++++--
>     >   1 file changed, 7 insertions(+), 2 deletions(-)
>
>     Not sure if `clear` is an ideal name then, but `drain` sounds like
>     something that would block, and `drop` is really much different from
>     `clear`.  Also, doesn’t matter, having Collection.delete return the
>     deleted element is a common thing in any language’s standard
>     library, so
>     why not have `clear` do the same.
>
>
> It isn't too late to change the name, but it sounds like you don't 
> necessarily prefer any of those others over what's there now.

Oh, no, I was just thinking aloud.

Hanna


