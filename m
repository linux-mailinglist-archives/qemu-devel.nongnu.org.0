Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A973B6DAB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 06:35:26 +0200 (CEST)
Received: from localhost ([::1]:35608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly5T3-0008HL-0H
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 00:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ly5SF-0007VD-OS
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ly5SD-0000cS-GI
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624941271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=reAdgYknzo5/V8TJs7UHUZUExxB6QPeiOYdvPR++qOA=;
 b=FMMJWbswFPaIzeUzEeNH+rMBCMrOD1zsNRgjT+mWOOKCRoj0P+tD6PDJstxfgRhpxNDsFn
 K84t0CGZQTJFnmNb3x0VqGzixxuBC4CnWaMXprww6e283lynBN4Q0lXzGICmN6Eyotqzb0
 AFwnWUsbhRN2ACBrc/5d8lskQYA/DS8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-a3D_MEaXO66TKT7JhPKGrg-1; Tue, 29 Jun 2021 00:34:30 -0400
X-MC-Unique: a3D_MEaXO66TKT7JhPKGrg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so5454417wrs.3
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 21:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=reAdgYknzo5/V8TJs7UHUZUExxB6QPeiOYdvPR++qOA=;
 b=duZ1T56tvG+R8BCUMEsCg+Fas/Exl0nYTfUQSKZDCBEy3r4A1ML0kDzYcDQ2/PObgz
 oDbrUQdTvj8OrNNNoH4lN1H+WEpPQCzca1kswjAcL0J87+N4gX9DpuAlmYwucZf2QmB3
 2nbUbmHVu2ebfydd9hW7ARZY3AVqU+0Mgi9LY4bBYCeKUIQ0UjHrgmDBItxFi7xd744P
 gqBdN0WRahf5Zam3mYJ3iZxyk/nfBbnU999N+lEgsM6Xfb01mqqkSgPZNmc6vIBJSLO3
 cOI4ueT3lJrEfoDEJsXK/OpOXy82HN8iAfWvuCNfD24Zie/HREZRsbU/auNxmeZs0q+R
 onag==
X-Gm-Message-State: AOAM530plmmSN8Qy8rVVv8DzUfVqM38qysNwoiFMnzKpiq2WeM/wXNJL
 hpfa4+MPU2YPv8U8HPbcUhNJLypJdqt2slCY6moeA0i/5tr0rMnrWvKWk5PSb5BF1YeojAubY1f
 mUjHAlQzirQoZHag=
X-Received: by 2002:a5d:564c:: with SMTP id j12mr31372382wrw.37.1624941267869; 
 Mon, 28 Jun 2021 21:34:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwTv9jMjEKsFqPvhLrRO5nYL+UmTJEfNkVqHxfqJGPYXnt8f4uIspD34JBrHTzZiRt9SBBdQ==
X-Received: by 2002:a5d:564c:: with SMTP id j12mr31372361wrw.37.1624941267707; 
 Mon, 28 Jun 2021 21:34:27 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l5sm1361121wmq.9.2021.06.28.21.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 21:34:27 -0700 (PDT)
Subject: Re: [PATCH 1/1] util/uri: do not check argument of uri_free()
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, qemu-devel@nongnu.org
References: <20210628215526.50324-1-xypron.glpk@gmx.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <451d1c59-9043-15b6-af97-87880978f7e3@redhat.com>
Date: Tue, 29 Jun 2021 06:34:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628215526.50324-1-xypron.glpk@gmx.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Richard W . M . Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 11:55 PM, Heinrich Schuchardt wrote:
> uri_free() checks if its argument is NULL in uri_clean() and g_free().
> There is no need to check the argument before the call.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  block/nfs.c |  4 +---
>  block/ssh.c |  4 +---
>  capstone    |  2 +-
>  util/uri.c  | 22 ++++++----------------
>  4 files changed, 9 insertions(+), 23 deletions(-)

Looks good ...

> diff --git a/capstone b/capstone
> index f8b1b83301..31254f17e3 160000
> --- a/capstone
> +++ b/capstone
> @@ -1 +1 @@
> -Subproject commit f8b1b833015a4ae47110ed068e0deb7106ced66d
> +Subproject commit 31254f17e3c6025f3465d1c974a8c96e338ddbe0

... except this change.


