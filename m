Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BA568D5EE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMSB-0001QB-0y; Tue, 07 Feb 2023 06:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPMS2-0001MD-9l
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:47:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPMS0-0006Ur-P7
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675770472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20WIvb41OEopt3xr1xHZMfmGiWV1qhI3ARmEvDFgl18=;
 b=EX6BRPvjJNrubD+rYXfQBLRpWnrdA/A18ewBGhPtQ827VZoncekWM6pKzTUxh6JvxBJKLP
 YQptXGJxQYPes8kNjcOYr0p4wlDaWEgZzmqu2G0eqF359ANPfLLl22TUaR/H9iT/8dlP/r
 FQiwasCAClxRC8gz+uq7pxo+7skppr0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-135-tdVWy8YKMm2qmjV9aZlS3Q-1; Tue, 07 Feb 2023 06:47:50 -0500
X-MC-Unique: tdVWy8YKMm2qmjV9aZlS3Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 b9-20020adfc749000000b002c3dede475cso1089838wrh.6
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=20WIvb41OEopt3xr1xHZMfmGiWV1qhI3ARmEvDFgl18=;
 b=nC7Baj9RA5dDerC607K+Ee0weOfGiFYWqNENbBe6uSamO1kspO2TBZvPBosxqXImXd
 akvJTtOkotP817HPwBetMa0xmo1UZRoRoAWBjjjDB0hIq3Rq7ZUnBS4qbVcVae0TpZTl
 Yr4AsGHPwPvpBOhL4O6oY1gi5X/kXs+3AKhj7SM3iBz9+VNuNf7Q/xOh98iUgGC0xqUU
 2vCO13JcupGvRXJ2gSbkcRP9y/OkQgKUmToH7RGavYyVQakiIUerdSRKw+rUmkYgZ+gu
 SpTcFmaHWRVSbKrT9rURJ2YSyzzp3yVI27grJIo09azgdIE8g1/RWBjk3Q87FWC2wkUR
 1kFw==
X-Gm-Message-State: AO0yUKU1MhIVKbvnsbQT2aTpoJ+BsE1UDZPkGQSbxIuVsbAJ+O2iyUF3
 xHihIedrwNqXFhaUp2rebnPYmdNXRgyyW0SRT+kcJP0q05RnYu3kUaOF0sLvWQuvZENPoP0bHXm
 kSdANxfRuj8C8A0M=
X-Received: by 2002:a05:600c:308a:b0:3dc:43a0:83bb with SMTP id
 g10-20020a05600c308a00b003dc43a083bbmr2916695wmn.3.1675770469616; 
 Tue, 07 Feb 2023 03:47:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+BqGyL4eQS/2ErRwOh9GZYD+Dkhc6+fc9piDvmeZXLU9Yn1vsBief0ai7wsdJ4DY8bUYZRCg==
X-Received: by 2002:a05:600c:308a:b0:3dc:43a0:83bb with SMTP id
 g10-20020a05600c308a00b003dc43a083bbmr2916683wmn.3.1675770469454; 
 Tue, 07 Feb 2023 03:47:49 -0800 (PST)
Received: from ?IPV6:2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f?
 (p200300cfd7084b2cf69ddcc680c89f6f.dip0.t-ipconnect.de.
 [2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b003da28dfdedcsm14885407wmo.5.2023.02.07.03.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 03:47:48 -0800 (PST)
Message-ID: <96fbe66c-53ed-fa78-0db8-e8047d230c63@redhat.com>
Date: Tue, 7 Feb 2023 12:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/4] qemu-io: use BdrvRequestFlags instead of int
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Fiona Ebner <f.ebner@proxmox.com>,
 Eric Blake <eblake@redhat.com>
References: <20230201152751.270508-1-stefanha@redhat.com>
 <20230201152751.270508-3-stefanha@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230201152751.270508-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01.02.23 16:27, Stefan Hajnoczi wrote:
> The block layer APIs use BdrvRequestFlags while qemu-io code uses int.
> Although the code compiles and runs fine, BdrvRequestFlags is clearer
> because it differentiates between other types of flags like bdrv_open()
> flags.
>
> This is purely refactoring.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   qemu-io-cmds.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)

With a rebase on264dcbb2b1e5b66d7a5b08662b200c2b315dce0f:

Reviewed-by: Hanna Czenczek <hreitz@redhat.com>


