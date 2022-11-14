Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1096628E08
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:11:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiji-00045Q-Ef; Mon, 14 Nov 2022 18:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouieV-00025D-Qb
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oue3Z-0004Uq-95
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 13:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668449980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TiWZfzUchbiPt14Dsd5r3OiHQwultVPEeNqUDVjYYoQ=;
 b=iym6GX9gA61L3FuEWR3ADgHXS8tdBBObBJpE+xOKv0nj7WWElmFwN5LKm82SMuJXprQomA
 QLop9DEL/+34hiBqtzcM05qk/LcrP3ne7+pJ2S5fYLobjRaO+ic2BB1ClmfeC8wo/cx7p6
 lcvUPEZLF9gTR4bnafmvre2S1AUiBlQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-60-nrZg99_OOC2rcj6hZPGCtw-1; Mon, 14 Nov 2022 13:19:39 -0500
X-MC-Unique: nrZg99_OOC2rcj6hZPGCtw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b14-20020a056402278e00b004621a2642d7so8661636ede.1
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 10:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TiWZfzUchbiPt14Dsd5r3OiHQwultVPEeNqUDVjYYoQ=;
 b=W4Bpw0r+cAo8I4SdoHdxdM85s9Z6shAM3hi1Yhtp7OCNk/dNm2I/LyQh3M2lYDkjRI
 jowV15l/0tKsaCAzYSUMjcePPkNpOrS9aoYYj1o1W0Heitr3mDwULU7sr+pNJySp0HHE
 vJjufUsvDY5lkDrLFSau+nRspeHrd3k/ZTeb3NClDdVtLvOOXAKe7IyeC2OvWc+/iYpU
 wEsfDn6/EdDlfVjbaS/vlw1Ww4Nc+UnxSYmum0FdRq6XcHoxzFz7YaskeYVYooGazUPS
 isEHmVxaIobv5FrZpmZy4J2t7IdrgNKDalaiYLeIFTJzAC03siy3PYbXHFHpTwgv/9W7
 /6uQ==
X-Gm-Message-State: ANoB5pkytz0wypveS/sG3oWEkf2FfchGHIzZ712fUDNAHVhpJY749oLU
 kEpbbyR7EIvv+SAvkgtAsW8kInqS/8+b5LUTbjyV22Y6SqHZtomaPd4RUvkcEEDdlGQK8+rU1Gc
 ZkY24dYX3Fs1TvoA=
X-Received: by 2002:a05:6402:1682:b0:45c:a9d3:d535 with SMTP id
 a2-20020a056402168200b0045ca9d3d535mr12137863edv.0.1668449978185; 
 Mon, 14 Nov 2022 10:19:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4z90EoMdcHJtkmQ3HXa3519UZo/W9rdR+SU0LXyn3mU9hnPweXAs8qbEbtCi4shbecOxNKdw==
X-Received: by 2002:a05:6402:1682:b0:45c:a9d3:d535 with SMTP id
 a2-20020a056402168200b0045ca9d3d535mr12137853edv.0.1668449978036; 
 Mon, 14 Nov 2022 10:19:38 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a1709061da100b0078e0973d1f5sm4509049ejh.0.2022.11.14.10.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 10:19:37 -0800 (PST)
Message-ID: <c2d80b69-22d7-9015-e705-71286e1e5ab3@redhat.com>
Date: Mon, 14 Nov 2022 19:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/13] block: Inline bdrv_drain_invoke()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-6-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221108123738.530873-6-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08.11.22 13:37, Kevin Wolf wrote:
> bdrv_drain_invoke() has now two entirely separate cases that share no
> code any more and are selected depending on a bool parameter. Each case
> has only one caller. Just inline the function.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block/io.c | 23 ++++++-----------------
>   1 file changed, 6 insertions(+), 17 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


