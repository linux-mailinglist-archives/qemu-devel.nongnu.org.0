Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445A6565435
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:58:09 +0200 (CEST)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8KiO-000596-CP
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KZ0-0006Zl-FK
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:48:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KYz-0002gK-05
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656935304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8cSJL3WXPm72XHrtezQrFYoQlkNeNAgyh34rE6zsqv0=;
 b=ZM5zRs7kA/tyqJKAb0yCb878d/9ZdSldkJC2FElJkKCFw0BMoenERjVtNxIdPhl4AmBq3u
 bBhnGmxss9ZA8RRXpZCSXiS66vHhqjY8b8Sm/BRIVixlz91PUPa48vht6MTw2n+DmT22k0
 hSfeuwEuH158pE+3IXxJ1UeWQR/6FNA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-9CMUzoazOGGamcFI1j-Z7A-1; Mon, 04 Jul 2022 07:48:15 -0400
X-MC-Unique: 9CMUzoazOGGamcFI1j-Z7A-1
Received: by mail-ej1-f70.google.com with SMTP id
 hd35-20020a17090796a300b0072a707cfac4so1938936ejc.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 04:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8cSJL3WXPm72XHrtezQrFYoQlkNeNAgyh34rE6zsqv0=;
 b=OrLVp/G37e2Y1bF/Rx2oJ+GUbqWBLF6v2Ggw20PRmoMTHameZBFnVdjpSv0ZkIybXI
 asbb9S+K465MshQUunEPVXUux0/MsFU2rcGlDjaunzIDBVlundskXBjkBveHw07YRg9q
 hpMU51/0lRKLY32Z4WU21nFu3EJ15HTYCnbaY3W0BPcYYpeIONLBgcjXJaMmvpTpvB1l
 oWIWPuNWMPg/DALSpTkVcldkpIzJFY7NgduGjTA9u6dpIn6mqvlX+1oCPWOQOwD+whv0
 mdGXjX43/NgzARcBPFK3gxaVs6aLAR+HhHOAbicRZjRf1uas3BohmwO1d8VdsPmPvZDd
 TIXA==
X-Gm-Message-State: AJIora+eIYCMys3TA0YfOpRbWs9OaLMisThrvsUzH0bo4vs7WCz5yHtd
 YbmR1PepgRuw5XTjigH8qL1SGbx10wsUBQ11SpEYPygvgn64mbHoiJpO7t8pXnehh9TB5kCzh1D
 9fMca7kJNioGErlQ=
X-Received: by 2002:a17:906:53c7:b0:711:d2e9:99d4 with SMTP id
 p7-20020a17090653c700b00711d2e999d4mr28574216ejo.716.1656935294310; 
 Mon, 04 Jul 2022 04:48:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1td0RRfgethbNatdK+CzhnUSXlSYivjYp5CBfOqbqpxyYzzcc1J3bIZvKtR+i63iD2/2KImuA==
X-Received: by 2002:a17:906:53c7:b0:711:d2e9:99d4 with SMTP id
 p7-20020a17090653c700b00711d2e999d4mr28574191ejo.716.1656935294161; 
 Mon, 04 Jul 2022 04:48:14 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a056402516100b0043a09f6fc24sm4038172ede.47.2022.07.04.04.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 04:48:13 -0700 (PDT)
Message-ID: <0b894cc0-d777-ee60-f065-4ec3358b543f@redhat.com>
Date: Mon, 4 Jul 2022 13:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 01/10] block: Add a 'flags' param to
 bdrv_{pread,pwrite,pwrite_sync}()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy
 <v.sementsov-og@mail.ru>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20220609152744.3891847-1-afaria@redhat.com>
 <20220609152744.3891847-2-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609152744.3891847-2-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On 09.06.22 17:27, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement them using generated_co_wrapper.
>
> Callers were updated using this Coccinelle script:
>
>      @@ expression child, offset, buf, bytes; @@
>      - bdrv_pread(child, offset, buf, bytes)
>      + bdrv_pread(child, offset, buf, bytes, 0)
>
>      @@ expression child, offset, buf, bytes; @@
>      - bdrv_pwrite(child, offset, buf, bytes)
>      + bdrv_pwrite(child, offset, buf, bytes, 0)
>
>      @@ expression child, offset, buf, bytes; @@
>      - bdrv_pwrite_sync(child, offset, buf, bytes)
>      + bdrv_pwrite_sync(child, offset, buf, bytes, 0)
>
> Resulting overly-long lines were then fixed by hand.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   block/blklogwrites.c             |  4 +--
>   block/bochs.c                    |  6 ++--
>   block/cloop.c                    | 10 +++---
>   block/crypto.c                   |  4 +--
>   block/dmg.c                      | 24 +++++++-------
>   block/io.c                       | 13 ++++----
>   block/parallels-ext.c            |  4 +--
>   block/parallels.c                | 12 +++----
>   block/qcow.c                     | 27 ++++++++-------
>   block/qcow2-bitmap.c             | 14 ++++----
>   block/qcow2-cache.c              |  7 ++--
>   block/qcow2-cluster.c            | 21 ++++++------
>   block/qcow2-refcount.c           | 42 +++++++++++------------
>   block/qcow2-snapshot.c           | 39 +++++++++++-----------
>   block/qcow2.c                    | 44 ++++++++++++------------
>   block/qed.c                      |  8 ++---
>   block/vdi.c                      | 10 +++---
>   block/vhdx-log.c                 | 19 +++++------
>   block/vhdx.c                     | 32 ++++++++++--------
>   block/vmdk.c                     | 57 ++++++++++++++------------------
>   block/vpc.c                      | 19 ++++++-----
>   block/vvfat.c                    |  7 ++--
>   include/block/block-io.h         |  7 ++--
>   tests/unit/test-block-iothread.c |  8 ++---
>   24 files changed, 219 insertions(+), 219 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


