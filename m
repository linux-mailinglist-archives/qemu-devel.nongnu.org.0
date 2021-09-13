Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625BC409637
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:49:35 +0200 (CEST)
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnH4-0006cF-Ce
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPnDy-000451-KK
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPnDv-0005Tv-TE
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631544377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5RuWZRCgxwA/aUj/BiprwCH/W9I/8rvD5lmibhJ55Y=;
 b=KanS+xXTn1JcX1ESaYACTZbe+xUQ5Iu/WNFD55+/07gGO7h5f6AsIjc2M59ismUuYt3e28
 kzWTGpuobYcLhRAdSGTn9TBn+6ZlYhDBw2sM9nlc8v8Ei+Vj5V4Kc14JnxlkgGLFFvdwMA
 2V3klbbbVM/nufL+shO3wMzpNOuY6j4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-4clPrEOLNeKZqEukbvtb3Q-1; Mon, 13 Sep 2021 10:46:15 -0400
X-MC-Unique: 4clPrEOLNeKZqEukbvtb3Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 u30-20020adfa19e000000b00159aba4fe42so2758087wru.9
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=t5RuWZRCgxwA/aUj/BiprwCH/W9I/8rvD5lmibhJ55Y=;
 b=EmeYoaaoX49F29JHCLhZyQrxkTzYq4j/mgv3LnohFyMBzpBZK76KXDR0DsFmnPeHNe
 Sfjvk8cO5XL51Smm5kmuFRVpDSoJiNCKWFE6RRmWJxRNEtBcYMyLdLN5P822EenM2uXh
 2Tt86eQDa63u6C8JLDn7gM/C3R8XPIIKGdBrAy/z3XUw55IB4od8bg6zX/FF6feDMsmh
 hGnfiiebT1+0oFyEKynUI09vJbZwHTjzn6vfXqAD3i1sd4H8qX8Car0M4pkVQS321UwI
 UjDMMwK9XgFMsO83CWDlqCS8UzVeGZvLZzCfn3Na7J0n3vxdKDOnZrZEyNBn3VcOB9cp
 V6lQ==
X-Gm-Message-State: AOAM530Wv6Sk5FCbxGPE57ph/E7M/mE6fxq+UaBpcFa8nZruoS6iqEKa
 y4j90Yrf0SJaqBRHLYhh0jIUdUoLImfnEUanMDZ1ZqjgCAzKafYMKhFfrP4dpjL+yq1eaYQ9q6n
 LgxcPoRNuuV5KRZ4=
X-Received: by 2002:a1c:9dd2:: with SMTP id g201mr11510846wme.46.1631544374713; 
 Mon, 13 Sep 2021 07:46:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwt05IyFK4Px6ArWu0nAeTwuvLor/S1YF0YeUGPBufFoMkVdWMHrq2OtmyhMdzhWb8q3d01aA==
X-Received: by 2002:a1c:9dd2:: with SMTP id g201mr11510830wme.46.1631544374559; 
 Mon, 13 Sep 2021 07:46:14 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id t9sm7865233wrg.4.2021.09.13.07.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 07:46:14 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] simplebench: add img_bench_templater.py
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210824101517.59802-1-vsementsov@virtuozzo.com>
 <20210824101517.59802-2-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <31c2e2ed-eb97-01c4-0d3d-6bfa112712ea@redhat.com>
Date: Mon, 13 Sep 2021 16:46:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824101517.59802-2-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, eblake@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 12:15, Vladimir Sementsov-Ogievskiy wrote:
> Add simple grammar-parsing template benchmark. New tool consume test
> template written in bash with some special grammar injections and
> produces multiple tests, run them and finally print a performance
> comparison table of different tests produced from one template.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   scripts/simplebench/img_bench_templater.py | 95 ++++++++++++++++++++++
>   scripts/simplebench/table_templater.py     | 62 ++++++++++++++
>   2 files changed, 157 insertions(+)
>   create mode 100755 scripts/simplebench/img_bench_templater.py
>   create mode 100644 scripts/simplebench/table_templater.py

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


