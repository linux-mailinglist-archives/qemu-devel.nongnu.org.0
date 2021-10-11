Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E42428AF4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 12:42:20 +0200 (CEST)
Received: from localhost ([::1]:42748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZsl9-00032L-49
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 06:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mZsj8-0001pM-VL
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 06:40:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mZsj4-0007Rl-PK
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 06:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633948809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/wK6pozg1mX3Bn/1MBYBMUvizNehIz1zzRUeDqmIUY=;
 b=iKZN7GmBRxn1+LdA1t2w3Wwy8oSdXFomBcaLpcf4JG0r0woCvtHWlt9uzn4JzKuiQpEagF
 +w8DODX9lIaGQDBQbz2MlFAcQCP9JKzp9M2J9O5SuMob5lqA7OtHZmNNLB/fUnGwi/GoKp
 rNYuxky9Y27jwsL7xOyrAFS7/xs66uU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-5dWhswDHPqi_peoYG6btlA-1; Mon, 11 Oct 2021 06:40:07 -0400
X-MC-Unique: 5dWhswDHPqi_peoYG6btlA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so12948275wrb.14
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 03:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0/wK6pozg1mX3Bn/1MBYBMUvizNehIz1zzRUeDqmIUY=;
 b=ELsEBrDe1B11TWkXIZFKS01MTc9xWxb/aDudhuhM3DlE3FQFXTWz3GOSK7u80KF1LU
 VOdIrnk7cRnV1ge15R0emSV5xqbM+jOhQUTQLYdaZY0ee3PI4vV5IqiXXllZ2TlJUtFl
 NzoW2rgbpgGU/ZrgtB7N0tbaHkFBgrS3yTcKUfFxjSa+uMoeUZp+P0GtJjGc5yMLB0m3
 XX/I7GQHfjxU4I25ujWvmBEPhukOOB+sy0U3E1yCckG6AU5k1HoJbIlHc6P8hDZVFm2u
 4nWH87c081B2F2GF3OpNBEGPjuBcoY6a2rNFpf1lBm1tzo1D9P2x/QZeK1q7dkgfzKD/
 EPww==
X-Gm-Message-State: AOAM530MpMQ9KAw4XZ3oLMFnPeaM7Nb3CWJjN6XLP0M5uo6ezQInUPcm
 CayaK3RVtV1r/G32ghHck1Smf/IMtgAHnOZ2nbRyZZd02l9JsasaYhmvisRfo73v70dOINZVM/H
 ovMDEeVCV2PLRvFw=
X-Received: by 2002:a1c:c906:: with SMTP id f6mr20467099wmb.136.1633948806703; 
 Mon, 11 Oct 2021 03:40:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGbqyWznBmwHMkUw64TmMzoJM6uhCtn5WvCv37xFp47KXmw1xjH5Q1OGxj87i3Q6XNzU+3tw==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr20467065wmb.136.1633948806443; 
 Mon, 11 Oct 2021 03:40:06 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id f184sm7290251wmf.22.2021.10.11.03.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 03:40:06 -0700 (PDT)
Message-ID: <46ec0ebe-f0a3-cba3-7d72-e2edd9613ec6@redhat.com>
Date: Mon, 11 Oct 2021 12:40:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] qemu-img: Consistent docs for convert -F
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210921142812.2631605-1-eblake@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20210921142812.2631605-1-eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.09.21 16:28, Eric Blake wrote:
> Use consistent capitalization, and fix a missed line (we duplicate the
> qemu-img synopses in too many places).
>
> Fixes: 1899bf4737 (qemu-img: Add -F shorthand to convert)
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   docs/tools/qemu-img.rst | 2 +-
>   qemu-img-cmds.hx        | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Speaking of duplicating in too many places, comparing the lines in 
qemu-img.rst and qemu-img-cmds.hx I noticed that `--skip-broken-bitmaps` 
too is missing from qemu-img-cmds.hx, so perhaps that’s also something 
we want to fix.

Hanna


