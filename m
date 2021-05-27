Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906A63927B9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 08:37:29 +0200 (CEST)
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm9e3-0003DF-PH
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 02:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lm9c6-0002R7-7b
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lm9c0-0000sT-9e
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622097318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWKNTM8EfVGQMHU35BLkxmttr6yn4UDnRGTEb0evt1w=;
 b=BoMsy8Y7LA5FGdbkw+1UHFa7qRojuXhrxZB9WTQkb/2S5BsLo89YKfQpGAYOT518bQ7v5K
 BjI44oPqgfrauk9P7/qrleshOYoRLA0r3vngZk6vqt3cdnLxcF4x2+OJ2fb+WA1bHVfk3w
 bVapaNledL16f24VQZjYGeKT5MSi8iQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-XsXuzKpcO6uvfo2eZjXb5w-1; Thu, 27 May 2021 02:35:14 -0400
X-MC-Unique: XsXuzKpcO6uvfo2eZjXb5w-1
Received: by mail-pj1-f72.google.com with SMTP id
 ot13-20020a17090b3b4db029015d9ead4bc5so2222457pjb.7
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 23:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lWKNTM8EfVGQMHU35BLkxmttr6yn4UDnRGTEb0evt1w=;
 b=YRI1FG6oJOOW9QS71lt+4vABZV89z9YpLHECMe73VHoiUKCuztcVJeteZKjBO9/GpM
 dqBPbWs0SzuetDTjZglXD5kQ5FzRVJZr5Ikymk5bGcKQXtyvou9qDARKl86FWMYAblfq
 S67WaJG3m8SzitrOcFlsOnTcsnmtpMIi7hLmEJk1cmTu4Qs7wP38x8XxtIqqwYlhKTZm
 iFqrmwm+LSw8C2xub/8w3vIsMyIA2plGLhLch5lWzF/8FdxBCxegxUf46gE38tHpsDh8
 S0r0Ri7b8xxY5nUcKraWOAw1e1kAAeIZLJTK1RIsVFhMdBNFTHiHJZoLi4+W51a0AXDD
 5Xtw==
X-Gm-Message-State: AOAM532wVwoqA2cM4noHZ3FxnI4O4ymYGmZhMdSnMn3McrONfz1nNF2x
 34easIjvtVTyFOOdF8PuxPU6uKSx5c/OpgcAjOTYczRhv6AKbRbmbfXsWEgCmIbP0v0Dn9kM8x5
 xAHk2t7nkMBq/qVKxKAzPd8t1xiIDcZogR/Cq0kg0knAQDjZnBfYq0o8ddl0w2Kkd8+0=
X-Received: by 2002:a65:60da:: with SMTP id r26mr2290278pgv.133.1622097313067; 
 Wed, 26 May 2021 23:35:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKhWECkT5Ej3o/Y02D0FtAovwZoVvIaPDLUBeR4ZID6gF/vqFoqE2N+ipr9AnqHZrHR/ItBw==
X-Received: by 2002:a65:60da:: with SMTP id r26mr2290257pgv.133.1622097312727; 
 Wed, 26 May 2021 23:35:12 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id cu2sm926364pjb.43.2021.05.26.23.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 23:35:12 -0700 (PDT)
Subject: Re: [PULL V2 0/3] Net patches
To: Bin Meng <bmeng.cn@gmail.com>
References: <1622089478-5426-1-git-send-email-jasowang@redhat.com>
 <CAEUhbmW2dHstLd6gE43gdyBr+xpoGXjZSuh+6fwKwtSrQjmuWg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <43e3dd04-edac-f0a5-0b99-9a8c8b9d1a5f@redhat.com>
Date: Thu, 27 May 2021 14:35:05 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAEUhbmW2dHstLd6gE43gdyBr+xpoGXjZSuh+6fwKwtSrQjmuWg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/27 下午2:13, Bin Meng 写道:
> Hi Jason,
>
> On Thu, May 27, 2021 at 12:24 PM Jason Wang <jasowang@redhat.com> wrote:
>> The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:
>>
>>    Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)
>>
>> are available in the git repository at:
>>
>>    https://github.com/jasowang/qemu.git tags/net-pull-request
>>
>> for you to fetch changes up to 4f8a39494aded9f2026a26b137378ea2ee3d5338:
>>
>>    tap-bsd: Remove special casing for older OpenBSD releases (2021-05-27 11:03:55 +0800)
>>
>> ----------------------------------------------------------------
>>
>> ----------------------------------------------------------------
>> Brad Smith (1):
>>        tap-bsd: Remove special casing for older OpenBSD releases
>>
>> Guenter Roeck (1):
>>        hw/net/imx_fec: return 0xffff when accessing non-existing PHY
>>
>> Laurent Vivier (1):
>>        virtio-net: failover: add missing remove_migration_state_change_notifier()
>>
>>   hw/net/imx_fec.c    | 8 +++-----
>>   hw/net/trace-events | 2 ++
>>   hw/net/virtio-net.c | 1 +
>>   net/tap-bsd.c       | 8 --------
>>   4 files changed, 6 insertions(+), 13 deletions(-)
> What happened to patch 5-12 in the following series?
> http://patchwork.ozlabs.org/project/qemu-devel/cover/20210317062638.72626-1-bmeng.cn@gmail.com/


I want to do some test before the merging. Or if possible, could you 
please write a test for this function?

Thanks


>
> Regards,
> Bin
>


