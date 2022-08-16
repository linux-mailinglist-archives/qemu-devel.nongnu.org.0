Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5D3595EA9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 16:59:29 +0200 (CEST)
Received: from localhost ([::1]:45418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNy2S-0007G7-E4
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 10:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNy0a-0005a6-Mg
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 10:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNy0Z-0002bU-7u
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 10:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660661850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLr2xoAKXtsOkGQ3Hi2IR5Zj8XO/OUhfb/JgmnkiTF8=;
 b=Ayqabn/ZSAaqg6br2fAQ0Fh3xVDSM2Q9s3PNU2nNSHISqB84ZCRKfTKkh2t7YcOy/doDrR
 YiPNm+fQhVX7EFnqQi4gn5/VMDPbtRt4UBb8sg8cifpQsRadP3YLhQGJuQjpAfeqFUSgo7
 cK9YWRDqsoBEAVmWSW6w3h93wCYPtGc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-191-n16u9Vz-N6GIQvcTPcF9AQ-1; Tue, 16 Aug 2022 10:57:25 -0400
X-MC-Unique: n16u9Vz-N6GIQvcTPcF9AQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 hf13-20020a05622a608d00b003214b6b3777so8559563qtb.13
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 07:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=mLr2xoAKXtsOkGQ3Hi2IR5Zj8XO/OUhfb/JgmnkiTF8=;
 b=GMxC7qiMhJrTBd1djA4iPekpI8c1qc3mhBtgou7RyRL8GRslmiLwlnFxGM4DymqkGK
 stwDF4F0UlCa1cWeY+5etyqv7xdhe0zFrFT1zbcNCIx1S8IQ6buBh+HHuDsD8kgpyjTd
 YLf4MdRTCvG96tQrOkoubQeeIOtMDDrc3PRWcloBkHqhGIQ5Xgj3/5mmK6P0rFMK6XIS
 3PfSNCbzn8BYr+Yl58t76ZQvm5KmOpd1+WNkV2KBng2+JX7OrxbIe4MFG1KcKTD+Bvj8
 XYt+q6nUWloKC4116RVCq6bhemI/RyUGZjUTxb26IQwyK0jUwZ42PkdEq1UGIc5Ud3wC
 Z3LA==
X-Gm-Message-State: ACgBeo1rbfKdJDt/JnCFIMvQzD17WxdeICpN3nWuxPm1PF7afZNQqdfS
 oS0+UiqCsaq7vKkADmjEHozcIjO4sFd5NnWx/1nTkv8upohkAFZk1peA8LSG4b8ASRRuij2kE37
 g29hp4YqTRgyP0fI=
X-Received: by 2002:a05:620a:3194:b0:6b8:f0e9:fc96 with SMTP id
 bi20-20020a05620a319400b006b8f0e9fc96mr15341695qkb.733.1660661842902; 
 Tue, 16 Aug 2022 07:57:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6fsFNPwNtddmPphU6D6OucmJdZRHdTnhMF+y9WfyyowTgmselRD0chR22+UGwVrEeY69E3Ig==
X-Received: by 2002:a05:620a:3194:b0:6b8:f0e9:fc96 with SMTP id
 bi20-20020a05620a319400b006b8f0e9fc96mr15341679qkb.733.1660661842664; 
 Tue, 16 Aug 2022 07:57:22 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a05620a0f1300b006b9c9b7db8bsm12715279qkl.82.2022.08.16.07.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 07:57:22 -0700 (PDT)
Message-ID: <1d437c8c-6f11-08aa-c5f4-8981e94b7cb7@redhat.com>
Date: Tue, 16 Aug 2022 16:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 12/21] commit and mirror: create new nodes using
 bdrv_get_aio_context, and not the job aiocontext
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-13-eesposit@redhat.com> <YuzRXKdh/+AbQWJu@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YuzRXKdh/+AbQWJu@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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



Am 05/08/2022 um 10:14 schrieb Kevin Wolf:
> Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
>> We are always using the given bs AioContext, so there is no need
>> to take the job ones (which is identical anyways).
>> This also reduces the point we need to check when protecting
>> job.aio_context field.
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> I'm not sure against which scenario this is actually protecting. The
> only reason for not using job.aio_context seems to be if someone else
> can change the job AioContext in parallel. However, if that is the case
> (I don't think it is, but for the hypothetical case this patch seems to
> address), the AioContext is not identical any more and the change is
> wrong because we actually want things to run in the job AioContext -
> otherwise accessing the BlockBackend from the job coroutine wouldn't be
> possible.
> 
> So I believe the current code expresses how we actually want to use the
> BlockBackend and the change doesn't only protect nothing, but is even
> misleading because it implies that the job can work with any AioContext,
> which is not true.
> 
> Kevin
> 
Ok, dropped


