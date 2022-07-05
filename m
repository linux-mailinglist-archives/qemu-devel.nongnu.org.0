Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC93E5664F4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:23:51 +0200 (CEST)
Received: from localhost ([::1]:54878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dqX-0004JL-4F
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8diD-0003Lm-KM
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:15:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8di9-0001FR-Oa
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657008906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwGozfYYneRQm5+X/wJ1yc1d54OqD3IxdVtwO/v8aPw=;
 b=IwlazBglsJDQ7Z5qwZZNYolZUG3ugF5+LIX0Ux+eGnfEoKbE62gS1GAuwHeP0MmfvsIler
 2zDv4L/jW1MsRqaAxxm613+TZonmYQxNjMvtE/rHGgtfh6GCdtquJE4IlYbByChAwXNqcX
 Bd2UrjdgDSiGs0RHyNks1cev5MAFXoU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-BaqHH9VBMYK7y7o6UvuMOQ-1; Tue, 05 Jul 2022 04:15:05 -0400
X-MC-Unique: BaqHH9VBMYK7y7o6UvuMOQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 t14-20020a056402524e00b0043595a18b91so8733406edd.13
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IwGozfYYneRQm5+X/wJ1yc1d54OqD3IxdVtwO/v8aPw=;
 b=XyeMA5fUxHge6uS+e4Ci4t6DYIpVB44blbg+MkF9FLysQ9e9Lh8YSkD/izmIoilaCV
 7g+dCnOwjqn0ijLGVgcv2JJb1+xnWCNOOh3/LyDYhkZcOCiaWkhBys6VC0pzluf/k953
 hmEC5BFIZAeWxgRgdyvoUsUmfdjewO/+Mhb9paij+d6ZV6250ijFlEjEFvfbJWZpICvE
 uxP8cPV+uy4EfAO5MkquI8Wchte1u31qURPa7a9tys6/AOlIsG2grv7CxhwALwu7fo7N
 +rCSnBjQwrsLk/a02ynH+o/LTaupmpnA4HSF0HI7i7woqPGa3hvhL51Zs8V5OI3ZCkHo
 1Exg==
X-Gm-Message-State: AJIora8yqa6hdZHi/lHH1J2cgOgGEXOX4rzTssbcnK7upckxrC+fDgSF
 OCAuRsjfs/K4bENoDvFGZNo1TIMMj3tXP0qaqFZHwS5qmgypKuf/m2G+81nPC5lGtcfLzvkbTjV
 HR+T2r7XU+68iV2g=
X-Received: by 2002:a05:6402:5388:b0:435:71b:5d44 with SMTP id
 ew8-20020a056402538800b00435071b5d44mr43546049edb.364.1657008904233; 
 Tue, 05 Jul 2022 01:15:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1utgqnINbFqg0evwNTvHS9qIAVzW4HFTWg2H6PQArdqqLLhTKdP45X6ZFuV/WcpEpR02tF9bA==
X-Received: by 2002:a05:6402:5388:b0:435:71b:5d44 with SMTP id
 ew8-20020a056402538800b00435071b5d44mr43546012edb.364.1657008903893; 
 Tue, 05 Jul 2022 01:15:03 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 q21-20020aa7cc15000000b0042617ba638esm22510387edt.24.2022.07.05.01.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:15:03 -0700 (PDT)
Message-ID: <8c02f411-e9f9-7645-564d-91434125cb8c@redhat.com>
Date: Tue, 5 Jul 2022 10:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 08/18] block: Add blk_[co_]preadv_part()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-4-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113837.199696-4-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> Implement blk_preadv_part() using generated_co_wrapper.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 30 +++++++++++++++++++++++-------
>   block/coroutines.h                |  5 -----
>   include/sysemu/block-backend-io.h |  7 +++++++
>   tests/unit/test-block-iothread.c  | 19 +++++++++++++++++++
>   4 files changed, 49 insertions(+), 12 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


