Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8490D635C23
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:52:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxoCA-00054A-Iu; Wed, 23 Nov 2022 06:45:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxoC2-0004zB-P2
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:45:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxoBz-0006bX-W1
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:45:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669203927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nX29OfRVXYeANGjYV/ZGYSB29dF/R6fdW/N5ldTszAg=;
 b=TGmabXuPI/u5LsAPItRnMaRR/wVtdPkL1i7qOk5Bk+s/8qlBhtzDlAjsS0htRFioP0+EIe
 IXebGy59qTX+EMbd7YX3r/W2RXuCbIUuTtROTGhaLQQVpP5DPaknQqyj01uhl6jvDajJUo
 9VUOAQ1UPl/xq1CnRGlha0/lnlXePH0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-407-VrrJP_V9OyWk4hxK4ZZ5LQ-1; Wed, 23 Nov 2022 06:45:25 -0500
X-MC-Unique: VrrJP_V9OyWk4hxK4ZZ5LQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso9513381wmb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 03:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nX29OfRVXYeANGjYV/ZGYSB29dF/R6fdW/N5ldTszAg=;
 b=WUKWuO+qROSCVe9wIoxINJk08bgNhow9C7+tb/DKP2AiyC7xlFvPqzVWKQL7/qRf64
 WHYGlbE7KyAZdKef6aecMGU7i8bblZ22w+B229Cd6u9fwV7m6u0+r6MwCMx1tWQsK2Qv
 9GU42z3ubjTdtNcSw/bjtUZODctE2X8m35+Odrsi6JUKP+ZbaKMptLgoGFVe442xxPQD
 awxDHJBn3LiFfqxU48OiEFe+kf3eo94rVysIGvpMgi7CZwKWkUGNRUnSJ19oJ/R861ih
 BjipEJeCdi8NXeW8d8ktVXpgjWcH9cR6HzQCDK+tWkuYrfQVplxG8VYzJtPsn+M4M8AY
 bYYA==
X-Gm-Message-State: ANoB5pnNtor1jWXTKReO5Qs07NPNEvfnVNG42/E/PmvhdJJZ2vgpSmg9
 IYHhIn1C5ZvMmRfIe0vIdRXZ5RoHaUvaVYm7c1kZqryAqmck+/tf4TjHAFeKS2E3cST7BYfczwy
 MXg3yKKdd2VrbUoI=
X-Received: by 2002:a5d:604b:0:b0:236:6442:3a48 with SMTP id
 j11-20020a5d604b000000b0023664423a48mr7352229wrt.41.1669203924351; 
 Wed, 23 Nov 2022 03:45:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf44KC2rAIpBYZfwP13vWJwxHMJ1NT1SXF0dYiQrNGmo8Nw8+sxuASDHKuYucG3aAFv4v2EZMw==
X-Received: by 2002:a5d:604b:0:b0:236:6442:3a48 with SMTP id
 j11-20020a5d604b000000b0023664423a48mr7352206wrt.41.1669203924104; 
 Wed, 23 Nov 2022 03:45:24 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 p37-20020a05600c1da500b003cf4eac8e80sm2419870wms.23.2022.11.23.03.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 03:45:23 -0800 (PST)
Message-ID: <4a16c6dd-7806-429a-f62d-afd13bebc52c@redhat.com>
Date: Wed, 23 Nov 2022 12:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 00/15] Protect the block layer with a rwlock: part 3
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Alberto Garcia <berto@igalia.com>,
 Ilya Dryomov <idryomov@gmail.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 integration@gluster.org
References: <20221116140730.3056048-1-eesposit@redhat.com>
 <e218aa44-6c49-d53f-d377-58a90a84db46@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <e218aa44-6c49-d53f-d377-58a90a84db46@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 18/11/2022 um 11:57 schrieb Paolo Bonzini:
> On 11/16/22 15:07, Emanuele Giuseppe Esposito wrote:
>> Here we introduce generated_co_wrapper_simple, a simplification of
>> g_c_w that
>> only considers the case where the caller is not in a coroutine.
>> This simplifies and clarifies a lot when the caller is a coroutine or
>> not, and
>> in the future will hopefully replace g_c_w.
> 
> This is a good idea!
> 
> Just one thing, though it belongs more in the two series which
> introduced generated_co_wrapper_simple and generated_co_wrapper_blk - I
> would make this the "official" wrapper.  So perhaps:
> 
> - generated_co_wrapper_simple -> coroutine_wrapper
> - generated_co_wrapper_blk -> coroutine_wrapper_mixed
> - generated_co_wrapper -> coroutine_wrapper_mixed_bdrv

Ah damn I forgot about this, and of course I just sent v5 for "Still
more coroutine and various fixes in block layer".

To me it sounds good, but before I do a massive edit and then someone
asks to revert it, @Kevin and the others do you agree?

Thank you,
Emanuele

> 
> ?  It is not clear to me yet if you will have bdrv_* functions that take
> the rdlock as well - in which case however coroutine_wrapper_bdrv would
> not be hard to add.
> 
> Even without looking at the lock, the three series are going in the
> right direction of ultimately having more "simple" coroutine wrappers at
> the blk_* level and more coroutine functions (ultimately less wrappers,
> too) at the bdrv_* level.
> 
> Paolo
> 


