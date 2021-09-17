Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF2740F85C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 14:52:33 +0200 (CEST)
Received: from localhost ([::1]:54806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRDLz-0003eI-B7
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 08:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRDL8-0002qW-BD
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 08:51:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRDL5-0005uw-9j
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 08:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631883093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t9MNLHx2X+pIQTk/SARhgbl/Vh6NygwKk3faw7vEr/4=;
 b=HCi6L/EjwPziFu17dS6ABvRC1aq1i+wvtyh1KdKIEyIpS7t9sfBcaO8czh9GRDlnvdIc6g
 U9XQwnUBsSv6MHX8V3g/GyJLIvXgsBn98MgKMb+D2XR+vEyA93YLQTW7kfzubtLB7s+D8K
 sQ3Zde1kdDSgsXfFTxZNu6cqwKYG7Gw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-mWF3-p9fOE2hYBIp4pD5eg-1; Fri, 17 Sep 2021 08:51:32 -0400
X-MC-Unique: mWF3-p9fOE2hYBIp4pD5eg-1
Received: by mail-wm1-f70.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so4613730wmc.3
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 05:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=t9MNLHx2X+pIQTk/SARhgbl/Vh6NygwKk3faw7vEr/4=;
 b=WSY3npbwDvZdZuZtwvkdB161sjnRuzvzQYLP+R+V1IBYQAHhukkVG+a62cpPrmEq66
 Sxq2JWjG+BBB4U32IY2LZJE7K2QWLx7ej4dU4U9SxwYqw53pwF8drtQuhQ4l9/wiH13j
 zI5zhH5fe+n6oy5qND3ABdYU7Y6aGe7qPr6Wdw9qq1VYiavpbSr3LCr2fy1FI5noI4ID
 cl8/rGpOit1LmGHoi9Im73X80Bf4MBCotUYV8CqCd31V7KNvm/qMqlV1VSOFy9Pi+M0q
 aNxsr3DXCwyiupTyH7Jzudu8zxMkr8rIpD6AKWgbQlodCMfK/xeYrg+wksA91hTHK+vg
 ZOYQ==
X-Gm-Message-State: AOAM531z9HOLN/sg0uGYUSolAq94A42hAUNwm6jFfOYWpQF7RkvIz376
 KbxYaqpfXxTQEQ5CjZamDElRILjiiVPWnC6vbdMsP7ESKZLzaf1Ny+yJRLcU4bI2Bvya2elFMaH
 2XfezAdTtUEPQkMs=
X-Received: by 2002:a1c:183:: with SMTP id 125mr9931048wmb.186.1631883091412; 
 Fri, 17 Sep 2021 05:51:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf+qQWFml0SoOrlrLzIE/eKQehV+BA3I930AHDd8CjiN11FK0r3rDRL10zqWwJkAQdU59TEQ==
X-Received: by 2002:a1c:183:: with SMTP id 125mr9931023wmb.186.1631883091166; 
 Fri, 17 Sep 2021 05:51:31 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id a25sm10647842wmj.34.2021.09.17.05.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 05:51:30 -0700 (PDT)
Subject: Re: [PATCH 04/15] python/qmp: clear events on get_events() call
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-5-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <bc3f4366-6fa9-750d-3e33-ac8c3deaad2b@redhat.com>
Date: Fri, 17 Sep 2021 14:51:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-5-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.09.21 07:40, John Snow wrote:
> All callers in the tree *already* clear the events after a call to
> get_events(). Do it automatically instead and update callsites to remove
> the manual clear call.
>
> These semantics are quite a bit easier to emulate with async QMP, and
> nobody appears to be abusing some emergent properties of what happens if
> you decide not to clear them, so let's dial down to the dumber, simpler
> thing.
>
> Specifically: callers of clear() right after a call to get_events() are
> more likely expressing their desire to not see any events they just
> retrieved, whereas callers of clear_events() not in relation to a recent
> call to pull_event/get_events are likely expressing their desire to
> simply drop *all* pending events straight onto the floor. In the sync
> world, this is safe enough; in the async world it's nearly impossible to
> promise that nothing happens between getting and clearing the
> events.
>
> Making the retrieval also clear the queue is vastly simpler.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/machine/machine.py | 1 -
>   python/qemu/qmp/__init__.py    | 4 +++-
>   python/qemu/qmp/qmp_shell.py   | 1 -
>   3 files changed, 3 insertions(+), 3 deletions(-)

[...]

> diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py
> index 269516a79b..ba15668c25 100644
> --- a/python/qemu/qmp/__init__.py
> +++ b/python/qemu/qmp/__init__.py
> @@ -374,7 +374,9 @@ def get_events(self, wait: bool = False) -> List[QMPMessage]:
>           @return The list of available QMP events.
>           """
>           self.__get_events(wait)
> -        return self.__events
> +        events = self.__events
> +        self.__events = []
> +        return events

Maybe it’s worth updating the doc string that right now just says “Get a 
list of available QMP events”?

(Also, perhaps renaming it to get_new_events, but that’s an even weaker 
suggestion.)

Anyway:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


