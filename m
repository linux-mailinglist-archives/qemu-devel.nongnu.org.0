Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D66443408
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:53:39 +0100 (CET)
Received: from localhost ([::1]:36794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhx2Y-0000sA-Ht
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhwzp-0006Rx-Iy
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:50:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhwzn-0006zs-SB
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635871844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XEys/Zqz49lGKFCwMYLrBOcxHBVwmUyxIJJe5qomNQ=;
 b=Ox2gmx7BQCrtgc/Ewri2Yrme3jKoladIhV+uZvKIYtoowKEsqMCSnXIhxRMxcXgTRGqJby
 9n9+dnSTOYuRzeZyuzGvWjkeJstCVlgZj8hX2lQ5rsNt+YqV3UBJlfL4btUS7bwAVrI8pW
 5i6sWNURhpztksqcbCokhUxDKyp+H1o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-gIq_JWy7PyuvoodG5mwBQg-1; Tue, 02 Nov 2021 12:50:43 -0400
X-MC-Unique: gIq_JWy7PyuvoodG5mwBQg-1
Received: by mail-wm1-f71.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so815891wmb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4XEys/Zqz49lGKFCwMYLrBOcxHBVwmUyxIJJe5qomNQ=;
 b=C5dZ8W4QcV+E00BBW6QVx/mk7o1OG91lpn3eCz8ndA/rEiQvZS/MN5nJ90FaSiWUfB
 gSblmMssGnTeW9Ey8JNbky1lMeMI1/5izthUYgUSLw6WYFAAQ7BYMf+SGFkD1pMeuCeV
 hFJKJSQC0E747YhKUI7/C2K62j7LDJoLpDNvT0s5NLiaNUpdbF4rv2B5wYNneTu2eNxR
 mWXA9POYDqXmINIdQeuMg42QNAQTLk8hnMbluV8r+/iKHAiFdOwLIXPCT5SgcqMuR6Z7
 OEqVyO4bw0ielhWBf2oZMN0oZ9tqc6Jm3rRZZvYfnyH3IijWd+++h0xdpwtqBBgK6VIJ
 ev1Q==
X-Gm-Message-State: AOAM532JjA0YfF4D0p4I4yRZYqKYALVqvKVc11vEK75fNh4prjJzzyJt
 hwH20N07+ilNv9Dmur8ZBEufI41LCkOi5M3gmx8CL5CXqrnKgdj5F4ChVYIObfBFFsSoigOxEDB
 Hjs44gRglXlSGO7U=
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr8275939wmk.93.1635871842019;
 Tue, 02 Nov 2021 09:50:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaYi6G6iAk0ydGXycWI/KVVKmsafC/32ISOVjjzIdt4N+F977JgRNsFT99y1Grw+fuEi34Ag==
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr8275926wmk.93.1635871841879;
 Tue, 02 Nov 2021 09:50:41 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j134sm3255480wmj.3.2021.11.02.09.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 09:50:41 -0700 (PDT)
Message-ID: <825819de-5847-c1b7-a6ea-a13829c8ae94@redhat.com>
Date: Tue, 2 Nov 2021 17:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20211102163342.31162-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211102163342.31162-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 17:33, Stefan Hajnoczi wrote:
> Reported by Coverity (CID 1465222).
> 
> Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd ("softmmu/qdev-monitor: add error handling in qdev_set_id")
> Cc: Damien Hedde <damien.hedde@greensocs.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  softmmu/qdev-monitor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 4851de51a5..06f86a1a96 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -581,8 +581,8 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
>          if (prop) {
>              dev->id = id;
>          } else {
> -            g_free(id);
>              error_setg(errp, "Duplicate device ID '%s'", id);
> +            g_free(id);
>              return NULL;
>          }

Ouch.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


