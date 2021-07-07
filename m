Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF29D3BF16F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 23:37:52 +0200 (CEST)
Received: from localhost ([::1]:56298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1FEs-0007ou-Ro
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 17:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m1FE6-00079g-5v
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m1FE3-00075l-Ar
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625693817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SzAl90AxQ9l7JjwPuv7JL2YYtP8TJaZlXf+QmabIjac=;
 b=Wt8vavdj+/rik4GSAND03M4SzpcBXeBG0Pf5u43c8CJBCZRecWuxywfe9y0fCo+DmefQnP
 RH3QuEbsEiYd3dyagr8/eME2iAfsfMr8iq3yJXQ49Yt5kOpSkDcbWAEhJ7n8VaJiloUxrG
 YfFsgcc80Ob350yIQT2++Nc3BgdtCRo=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-dGrXQN7BOGeROYnltdJD0w-1; Wed, 07 Jul 2021 17:36:56 -0400
X-MC-Unique: dGrXQN7BOGeROYnltdJD0w-1
Received: by mail-pj1-f70.google.com with SMTP id
 x1-20020a17090ab001b02901726198443cso4615236pjq.8
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 14:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SzAl90AxQ9l7JjwPuv7JL2YYtP8TJaZlXf+QmabIjac=;
 b=aTxGXTpU3bQiagppNaUKghjw51/pzRWyBCJoOTjJVmFLyl/wFamni7jtXeNV0B9TJe
 0gWmOLuO3NpLTXJjEa24jY0BwZy97PUEZ+h8FxdO/WKNiPrb6U7A39CvlVIUY8TkoaDv
 yaIECjwu4iPoY6EV/G9rixhj6zYFT2Z5glAFTOzF0c8UDGNEHXkRACsFTpWzLWiYi4VU
 bNJE0vuP/U34PFJIyJvQqMLPwZ5Y+epcYO3i6RMXaKs9Ukei/o2hV0C8f1G7TQRRhLmx
 urr9vWccmrKwXO5vYWq4BF7H6uFax3EGuQET9S5sEe5GqHNzi26LymiQ93GpJCL8iaiX
 Ynyg==
X-Gm-Message-State: AOAM533z5ffWg+bdskLVUUmEBDuwVrhWy6lL8znRMP8DRF95iz6dziYJ
 gkjpJ1mEEePj/wjhHl+8b2siucb1mjEvrDJH51ILmi88SZHK01/fyOhQe6W+aCxkd6hAZc8vT8/
 tR5zM7eLb0u8jXJqpgVWw96Ltzv7+pD9CY2ynTivXJCy2WZFZHRBrdxIDYvBCJWQb
X-Received: by 2002:a63:d915:: with SMTP id r21mr28323648pgg.283.1625693815248; 
 Wed, 07 Jul 2021 14:36:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy56s/wZP9XX3aTplGGSohTQunwMXibJCVoOFGqtkUc3Rj7/LpJ4lI1nhh6cG6eZK9be6SHWg==
X-Received: by 2002:a63:d915:: with SMTP id r21mr28323627pgg.283.1625693814907; 
 Wed, 07 Jul 2021 14:36:54 -0700 (PDT)
Received: from [192.168.1.183] (c-76-27-223-100.hsd1.or.comcast.net.
 [76.27.223.100])
 by smtp.gmail.com with ESMTPSA id k141sm136609pfd.189.2021.07.07.14.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 14:36:54 -0700 (PDT)
Subject: Re: [PATCH 0/2] Remove deprecated qemu-img backing file without format
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210503213600.569128-1-eblake@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <d71cd3aa-bbe5-5fa5-ea9d-098e879d72f5@redhat.com>
Date: Wed, 7 Jul 2021 14:36:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210503213600.569128-1-eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 2:35 PM, Eric Blake wrote:
> We've gone enough release cycles without noticeable pushback on our
> intentions, so time to make it harder to create images that can form a
> security hole due to a need for format probing rather than an explicit
> format.
> 
> Eric Blake (2):
>   qcow2: Prohibit backing file changes in 'qemu-img amend'
>   qemu-img: Require -F with -b backing image
> 
>  docs/system/deprecated.rst       | 32 ---------------------------
>  docs/system/removed-features.rst | 31 ++++++++++++++++++++++++++
>  block.c                          | 37 ++++++++++----------------------
>  block/qcow2.c                    | 13 ++++-------
>  qemu-img.c                       |  6 ++++--
>  tests/qemu-iotests/061           |  3 +++
>  tests/qemu-iotests/061.out       |  3 ++-
>  tests/qemu-iotests/082.out       |  6 ++++--
>  tests/qemu-iotests/114           | 18 ++++++++--------
>  tests/qemu-iotests/114.out       | 11 ++++------
>  tests/qemu-iotests/301           |  4 +---
>  tests/qemu-iotests/301.out       | 16 ++------------
>  12 files changed, 75 insertions(+), 105 deletions(-)
> 

For the series + the squash attached to patch 2:

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


