Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DF566527
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:37:31 +0200 (CEST)
Received: from localhost ([::1]:51728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8e3m-0005Ag-2b
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8dqy-0006jG-Ne
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:24:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8dqv-0002V4-6y
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657009452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4hSr5669IkGXRdtgVfs5KfWDPabUKQSBtImGI24f3IU=;
 b=IfLG2WMv3u57sImwRVARsYIVkUWFLlNxy+ZYnLxI+DJuhzCYYh66CtGGSQ+bANoSMrIY5N
 xdHqosWs4hrVvd/4WmUg/uBQUxaJSuNLYuc2ppGtjFpNPT4INpMov2xiOFAPQYOZ+t/sff
 F6RDVlzSH0YwRS/6hRnue7UqRwl0naU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-FxTTp74NPxW5Vu_092u_ig-1; Tue, 05 Jul 2022 04:24:10 -0400
X-MC-Unique: FxTTp74NPxW5Vu_092u_ig-1
Received: by mail-ej1-f71.google.com with SMTP id
 qk8-20020a1709077f8800b00722fcbfdcf7so2463359ejc.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4hSr5669IkGXRdtgVfs5KfWDPabUKQSBtImGI24f3IU=;
 b=jZsb2iVWAmC49MIfn6eVfa2TDWcz5fviZ7uRIbArEHcvMyN5l320ZB0Ndau1bJPHGN
 o1nrZL9xEGBc7yzXvw9K/JFVCYdxuapz2EOSOSNsEXLrwtrnk8Oxoj/rbUb27XL/cK2o
 kbZ/IL/4Dhz4jPn97zHtTxQTTKt1jp7jiS9WGPecDtcOi7lLv75SIhlnLM0sa1I+KbL1
 89I81pBLRit6Y0SSsep3wnCyYQC+wLCL5T+FaWRPk/0XPKSBE2nEwubfpcPOjJZvuFca
 ycn1rPqUSvW9Y1CDm+a7UHP5K+Y2Uf378PLNm1mCWih2mw/T5Mj8NWtljTBlQUOEPgBV
 wzWw==
X-Gm-Message-State: AJIora9n3XD2LXNR7myV36ozrQPQlOjofHDO1A3SI33/M/wV+oiPqPHE
 NVadiryFOiSGJ2Xh9np8d3Ug0u4j6PCezQhm0m8dAhAPAvTtAzfOSPBk5ppU1go7/dMcuPCYrC+
 AGtfN9ZwUUP5Nnvc=
X-Received: by 2002:a05:6402:2706:b0:437:75f2:402c with SMTP id
 y6-20020a056402270600b0043775f2402cmr44175306edd.245.1657009449790; 
 Tue, 05 Jul 2022 01:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tpnjHIbxchrZz0xfmk/pOgRFlDgjslUOhhdBNL6Mw7FrAUkPqQ4Uso8ZLTLghc1Gs8P4CSjQ==
X-Received: by 2002:a05:6402:2706:b0:437:75f2:402c with SMTP id
 y6-20020a056402270600b0043775f2402cmr44175292edd.245.1657009449594; 
 Tue, 05 Jul 2022 01:24:09 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 jw14-20020a170906e94e00b007263481a43fsm15121357ejb.81.2022.07.05.01.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:24:08 -0700 (PDT)
Message-ID: <7c080258-8ecc-c763-0afc-0d6d9dec49da@redhat.com>
Date: Tue, 5 Jul 2022 10:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 09/18] block: Export blk_pwritev_part() in
 block-backend-io.h
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-5-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113837.199696-5-afaria@redhat.com>
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

On 17.05.22 13:38, Alberto Faria wrote:
> Also convert it into a generated_co_wrapper.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 14 --------------
>   block/coroutines.h                |  5 -----
>   include/sysemu/block-backend-io.h |  4 ++++
>   tests/unit/test-block-iothread.c  | 19 +++++++++++++++++++
>   4 files changed, 23 insertions(+), 19 deletions(-)

[...]

> diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
> index 2fa1248445..6061762c97 100644
> --- a/tests/unit/test-block-iothread.c
> +++ b/tests/unit/test-block-iothread.c
> @@ -183,6 +183,21 @@ static void test_sync_op_blk_preadv_part(BlockBackend *blk)
>       g_assert_cmpint(ret, ==, -EIO);
>   }
>   
> +static void test_sync_op_blk_pwritev_part(BlockBackend *blk)
> +{
> +    uint8_t buf[512];

Given you’ve initialized this in test_sync_op_blk_pwritev(), I think it 
should be initialized here, too.

With that done:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> +    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
> +    int ret;
> +
> +    /* Success */
> +    ret = blk_pwritev_part(blk, 0, sizeof(buf), &qiov, 0, 0);
> +    g_assert_cmpint(ret, ==, 0);
> +
> +    /* Early error: Negative offset */
> +    ret = blk_pwritev_part(blk, -2, sizeof(buf), &qiov, 0, 0);
> +    g_assert_cmpint(ret, ==, -EIO);
> +}
> +


