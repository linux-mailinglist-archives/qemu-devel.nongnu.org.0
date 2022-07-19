Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147DF579F5A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:14:41 +0200 (CEST)
Received: from localhost ([::1]:60420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDn3f-0005XS-Pc
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDn2M-0004An-QR
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:13:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDn2I-0004Br-Ku
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658236393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80zf3ayqhwzPmXY500y8zLzK2j4gaw6VrAg+ot7Bm18=;
 b=fYVKAirOo/qt+Wt73o0p6ylklooqbT3BwNWREPp9a4RG+KNUECDUZQvHytcHPwJBTaD+0m
 WGcdawIgC9PDtx6mnRllquNH49JDNjPfIMe0kRarr5ixLfkvLMY0/0AGGoR9bTZM2w9xMv
 EhTImUz3AVCT1+tgKR1Fsb+28CDrO6A=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-pwJ3mArDOcOrqQQIJqGBlg-1; Tue, 19 Jul 2022 09:13:12 -0400
X-MC-Unique: pwJ3mArDOcOrqQQIJqGBlg-1
Received: by mail-qk1-f198.google.com with SMTP id
 e128-20020a376986000000b006af6adf035cso11645956qkc.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 06:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=80zf3ayqhwzPmXY500y8zLzK2j4gaw6VrAg+ot7Bm18=;
 b=082pzZfrVgQ8UdtgraDU47hOeU74lIECB6QTR6avMb/u0f9F43pn9s/HLdfPlkE6jQ
 UIaeIzuxQD8Oy7NmlBb/VyXBxklwD3ZKXt92erSw1EmJyXgO81jYhU5JvZY0S5SnsBaQ
 aIOQImJQ4h17Sp/DOmBoOMDrqfk2s0F8MLR0QD/CER67U4U+vMkIk/9g/Xs36FTdAVX/
 /rZXJNlnDC9+Ryiy790ioNf9IYB6c/BGRZA7tlJnaldeisCOC7tDg2iHJgL1IzoLIdbz
 sP1KL80u82JtQ4As07rfq02Zpj0/gKzCwL8EVgts5jB3ThcByKDEo7PzlOlFB54KOihz
 IGiA==
X-Gm-Message-State: AJIora/afJW51To7J8eTHYfv9pMExF19/4PLVB3NIdazqFxo0B7qYZp7
 a00wXiuBqNI3lfVG1VLXcZpgfRTTjF84bs4CSHFcucVrdDv7dagRInhcqaPk+C40LcCNhWuuNwf
 9GfB5nJOXyAci+8M=
X-Received: by 2002:a05:620a:248b:b0:6af:504d:c1e0 with SMTP id
 i11-20020a05620a248b00b006af504dc1e0mr20627552qkn.750.1658236392109; 
 Tue, 19 Jul 2022 06:13:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1taEv3d0TyhaHjfk7Yl/QuohPAoAkwcE0pQHRoPEDpx9SkVo8KelId+q/QlgtMdWw9t6qp8QA==
X-Received: by 2002:a05:620a:248b:b0:6af:504d:c1e0 with SMTP id
 i11-20020a05620a248b00b006af504dc1e0mr20627531qkn.750.1658236391743; 
 Tue, 19 Jul 2022 06:13:11 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a05620a408d00b006b5df4d2c81sm9126323qko.94.2022.07.19.06.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 06:13:11 -0700 (PDT)
Message-ID: <de989b9d-48b1-08a1-ba3f-efb664b533d8@redhat.com>
Date: Tue, 19 Jul 2022 15:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 00/21] job: replace AioContext lock with job_mutex
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220706201533.289775-1-eesposit@redhat.com>
 <5291284b-9740-16e1-d852-47bb5ac8be77@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <5291284b-9740-16e1-d852-47bb5ac8be77@yandex-team.ru>
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



Am 11/07/2022 um 17:57 schrieb Vladimir Sementsov-Ogievskiy:
> That seems a lot closer!
> 
> Now I'm going to vocation from tomorrow up to the end of week, so I'll
> return next Monday.
> 
> 
> On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
>> In this series, we want to remove the AioContext lock and instead
>> use the already existent job_mutex to protect the job structures
>> and list. This is part of the work to get rid of AioContext lock
>> usage in favour of smaller granularity locks.
>> [..]
> 
> 

Thank you for the review! Assume that all suggestion I did not reply
will be applied.

Apart from patch 12 and 19, all other patches should be reviewed :)

Emanuele


