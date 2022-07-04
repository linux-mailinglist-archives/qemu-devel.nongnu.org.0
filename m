Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB95654AD
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:14:45 +0200 (CEST)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8KyS-0007Yt-4r
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8Kqb-0006Sa-OQ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:06:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KqZ-00067V-6s
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656936394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjHTusqIZqrW1zxl47DZ77aCOlX81iWrEianxWymhf4=;
 b=VqmQ+9BSy3fOjBI55sTKgRA2YGizndnfT8tvLJc/YxxACC8Z3mOtkcQFOEKXIrAOd5V9oh
 ZFXsf3ZU80D60IxPF+pt/a9QeIuaC32yAKNxC0qk2rZ7u+Vs+nuD1777WWIlrInZJ3Rc/D
 G10OiIONTuOzGnKtjM25CUQJwC5/35E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-yZd1SO0XOb2PRn3UFo68Dg-1; Mon, 04 Jul 2022 08:06:33 -0400
X-MC-Unique: yZd1SO0XOb2PRn3UFo68Dg-1
Received: by mail-ed1-f71.google.com with SMTP id
 s1-20020a056402520100b00439658fad14so7208910edd.20
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vjHTusqIZqrW1zxl47DZ77aCOlX81iWrEianxWymhf4=;
 b=C2lZoh4oWCHj/JMydtxtm5ghc7QdHlns6IKF7GPkH80dEwVIpJ0Ya0vWk8kb7JxMxX
 FOTtHi2NflxTqZP5YYMeBGuhtmvW0yxRBOcMC2AQzp6qnM2PGbIkf/0GMwRvysxI9H5l
 9+71t2++VjVqGvD/ZgNTvaSRCLN75gmZn92bDFJiXjgNqV4XBsxif+vg2DWGrSWaRJNC
 C+gwol6YEhhv6BgzRiQb2ocdQgAxhAn+v7En4G1yTcxeMUhKVIRRJryP3NtWNbvUS6st
 modZ3XVfQgqZlPox4xr1zkgfikgVhGFM9DfkYRsFSc3qutkNj+dkIjm2ilGLx3ITH4wL
 sjrw==
X-Gm-Message-State: AJIora/bPR3L/6vtWHyk3ub4neIYIEBB2Z7Z0Vgo9m+c0e5n386h6fqk
 3ljNNNcn/oaokW6kRzeR1Q/LsrkTjEpTdKCXneR1jteOQkfM+3GfsyJF9TrEGXO8bwSRKEPbKlD
 EtgWKJ18x2M2t6/Q=
X-Received: by 2002:a05:6402:3685:b0:435:8069:e44 with SMTP id
 ej5-20020a056402368500b0043580690e44mr38311745edb.202.1656936392234; 
 Mon, 04 Jul 2022 05:06:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tx+93E0G47WQBa3Zh0YaiFm1mDTVsyxnyMHV0vpqWIngu909FZ+rrJiLXDFG4VlPhmfhaiHQ==
X-Received: by 2002:a05:6402:3685:b0:435:8069:e44 with SMTP id
 ej5-20020a056402368500b0043580690e44mr38311691edb.202.1656936391901; 
 Mon, 04 Jul 2022 05:06:31 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 pv1-20020a170907208100b00726abf9cd8esm9744605ejb.125.2022.07.04.05.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 05:06:31 -0700 (PDT)
Message-ID: <02c2be50-9beb-0ebd-a261-b6cf459aa8e7@redhat.com>
Date: Mon, 4 Jul 2022 14:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 07/10] block: Implement
 bdrv_{pread,pwrite,pwrite_zeroes}() using generated_co_wrapper
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy
 <v.sementsov-og@mail.ru>, Stefan Weil <sw@weilnetz.de>
References: <20220609152744.3891847-1-afaria@redhat.com>
 <20220609152744.3891847-8-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609152744.3891847-8-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.06.22 17:27, Alberto Faria wrote:
> bdrv_{pread,pwrite}() now return -EIO instead of -EINVAL when 'bytes' is
> negative, making them consistent with bdrv_{preadv,pwritev}() and
> bdrv_co_{pread,pwrite,preadv,pwritev}().
>
> bdrv_pwrite_zeroes() now also calls trace_bdrv_co_pwrite_zeroes() and
> clears the BDRV_REQ_MAY_UNMAP flag when appropriate, which it didn't
> previously.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>
> I audited all bdrv_{pread,pwrite}() callers to make sure that changing
> the -EINVAL return code to -EIO wont't break things. However, there are
> about 140 call sites, so the probability of me having missed something
> isn't negligible. If someone more accustomed to the code base is able to
> double-check this, that would be very much appreciated.

FWIW I checked all call sits when reviewing patch 3, and I can’t 
remember any case where the follow-up check was anything but `ret < 0`.  
The only difference should be a couple of error_setg_errno() calls, 
which will change from “Invalid argument” to “I/O error”.

I guess the real problem wouldn’t be checking the immediate call sites, 
but the fact that most call sites just pass the error code to their 
caller in turn, and that’s really something that’s unreasonable to 
check, I believe.

Honestly, I don’t think it really matters (how likely is `bytes < 0`?), 
nor could I imagine a case where EINVAL vs. EIO would cause any 
difference in behavior.  That’s to say, I’d be disappointed if it did.

(Grepping for 'if.*EINVAL' and 'if.*EIO' in block/ only yields one case 
in block/nbd.c where I can’t quickly absolutely rule out it won’t make a 
difference, but I think that check is only for error codes coming from 
handling network requests.)

> As a precaution, I also dropped Paolo's R-b.
>
>   block/io.c               | 41 ----------------------------------------
>   include/block/block-io.h | 15 +++++++++------
>   2 files changed, 9 insertions(+), 47 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


