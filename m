Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A214A890C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:49:41 +0100 (CET)
Received: from localhost ([::1]:44870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFfIi-0002pG-A8
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:49:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFfEW-00085u-18
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:45:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFfEQ-0005Wb-NU
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643906713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/pw3S2KAenX3LpFVwMowXa+xj/0sUqvcRqGDYvYnTY=;
 b=WL7dSAuChIMNKmEN/vdcZrtD56bWUb/9HbOoyom614TVoJe+z+oGVU4Ok6EXgvXsxhHoMc
 YaBJovOxLbG/qcffsEhGhqKo0/X3OpiFYKmYh/ol1Y4+cjkyo52IeshSCdmwJvPgTJyN2/
 MQM2CfMMsyr/pHsp/sOQxGqP4ElyiZA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-ZOz_5pzVNF2Z8a-CuFFtUQ-1; Thu, 03 Feb 2022 11:45:12 -0500
X-MC-Unique: ZOz_5pzVNF2Z8a-CuFFtUQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w23-20020a50d797000000b00406d33c039dso1753651edi.11
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 08:45:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O/pw3S2KAenX3LpFVwMowXa+xj/0sUqvcRqGDYvYnTY=;
 b=AAfTC3bYFbH6/kwej+JmBPrNkfWoKEzqvPNCkR2ixxKr45Ijf3OE6LF7JNUJy5A9r0
 nlYnOmelcvDSOkjv5UhPt58PaMcTOiua3YN9yaSCZVVtY8hHe/E0BOr2QCsLX6an1q25
 PKg0d3N22eR8ro63dskMNLISpbThXMXkOOhTINBpUqVAR6j+EUaFGzL6OhDO5vxju9CD
 ud65aSnf3L6jMnB7YFNkIltkIUIefuezQBPSndCTPRYWE5dym81M+LMVbpf7umLbBrpA
 nTqk32jFnJBxEHKMTl53nI2hVlQK/ZCLuhzh66KUWy5WLsXJPsmdZt/E8kvyebd4fBmp
 6GIQ==
X-Gm-Message-State: AOAM533F15BW78gIp2djbrcAdZSZ5cl7olHo72qCmCJcKMqN3ycPxExz
 RdEyytx3Aebb96W4ixbe5ABLcMVnwn3tqXKnniY6yMMMv4ko5jpbzwOk4smmelhKh7ZHH0bdjdg
 s+CVG0DmGyud3TsU=
X-Received: by 2002:aa7:cc09:: with SMTP id q9mr35965551edt.101.1643906711404; 
 Thu, 03 Feb 2022 08:45:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2Ik2ppnbyJWv0CLRkhQUPS1Hixkf49sczeZO551hwy/P9Wl1hwdFov+SBxuNpb6Xbog4igQ==
X-Received: by 2002:aa7:cc09:: with SMTP id q9mr35965538edt.101.1643906711176; 
 Thu, 03 Feb 2022 08:45:11 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id k7sm16868259ejp.182.2022.02.03.08.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 08:45:10 -0800 (PST)
Message-ID: <1a3fc51d-ac2c-9c97-cb8c-673183ed2291@redhat.com>
Date: Thu, 3 Feb 2022 17:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] iotests: Test blockdev-reopen with iothreads and
 throttling
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220203140534.36522-1-kwolf@redhat.com>
 <20220203140534.36522-3-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220203140534.36522-3-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: vsementsov@virtuozzo.com, qinwang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.02.22 15:05, Kevin Wolf wrote:
> The 'throttle' block driver implements .bdrv_co_drain_end, so
> blockdev-reopen will have to wait for it to complete in the polling
> loop at the end of qmp_blockdev_reopen(). This makes AIO_WAIT_WHILE()
> release the AioContext lock, which causes a crash if the lock hasn't
> correctly been taken.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   tests/qemu-iotests/245     | 36 +++++++++++++++++++++++++++++++++---
>   tests/qemu-iotests/245.out |  4 ++--
>   2 files changed, 35 insertions(+), 5 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


