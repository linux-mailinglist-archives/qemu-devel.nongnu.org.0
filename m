Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE092C9FAC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:36:55 +0100 (CET)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk31i-0002Zd-E1
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk2zU-0001Nn-UO
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:34:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk2zT-0003bu-9i
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hBA528xwRYSSjSKVEtg5kW900NXokfg/UwFhMGbUR+U=;
 b=S+0pXpxLopg1RbYXW1QH1sCHnsm9trlBglv4JMrKiAmGKPAeOikvo4ggi2MyU+ZCz5UC/X
 Gj3NRAOfadNIICLmDZSVNaSAu9ihNGFrACzc522uKWUNL/KZh7xP7+2R9hCXd6CP+x1a5v
 L9+f6LxJmAZOri3YrqyMMorzXMEKu/M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517--PgW7q_YNNWlWdo3oZW2EA-1; Tue, 01 Dec 2020 05:34:31 -0500
X-MC-Unique: -PgW7q_YNNWlWdo3oZW2EA-1
Received: by mail-wm1-f69.google.com with SMTP id l5so546644wmi.4
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 02:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hBA528xwRYSSjSKVEtg5kW900NXokfg/UwFhMGbUR+U=;
 b=qC4YpftWbdUlvqgKTKLB/nFyBdxMbspagYoWzBtl3Nv949535UMyGwKuLUtu7zoPzs
 O5xSCQklsbV8d2S2eIq4gxSEIk8ad/8yKgFnHk3hHRV2KtOqIKgzHkZhFEJMB0HR+BrN
 H9xB79eeB+bjBMNb93hV+tJa2qPCsCTXn4sw8wmfvBqa7WdjcPjIzk2mM/eo5Fm9WCMA
 k5aYNnqSnjlUDDjeax55iexWK6eo2Fr7D/wT5GHItKENfC9GeUyVNleJKXClUDlIGE5M
 kRIns6IAzwrvyHowzNOE4qfQ/N1J+zBpLM0JgLdW4PaRQJQuuuDSSls04dytpMJfnE6k
 zwWA==
X-Gm-Message-State: AOAM532oyRSuXy3R5cJmeFTiUHD65BFqIMTmiV0kuBzbvHth5N45WTrW
 z8WP/bB7nJ3eOFyM1D9YHXBZ0//B8GPRZUGHfAOmXcQq+ZawsOnIQwSrkHQEaEzZtZa9p7cglCt
 iZ6ur4IXh6kNctYo=
X-Received: by 2002:a7b:cb8f:: with SMTP id m15mr1989204wmi.95.1606818870285; 
 Tue, 01 Dec 2020 02:34:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4YqLECvFwTTiyRMcDZNkiQKYdagTNy3WQyRu5fO77xZ+HbYUdEHEtt2PcNVW105ifEMWQzg==
X-Received: by 2002:a7b:cb8f:: with SMTP id m15mr1989173wmi.95.1606818869954; 
 Tue, 01 Dec 2020 02:34:29 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id w5sm2497821wrm.29.2020.12.01.02.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 02:34:29 -0800 (PST)
Subject: Re: [PATCH v2] hw/nvme: Move NVMe emulation out of hw/block/ directory
To: Klaus Jensen <its@irrelevant.dk>
References: <20201130145238.2509405-1-philmd@redhat.com>
 <X8VblCummS/6aRMf@apples.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <741e46c7-5783-c616-c996-2ffdad733c89@redhat.com>
Date: Tue, 1 Dec 2020 11:34:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <X8VblCummS/6aRMf@apples.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 9:52 PM, Klaus Jensen wrote:
> On Nov 30 15:52, Philippe Mathieu-Daudé wrote:
>> As IDE used to be, NVMe emulation is becoming an active
>> subsystem. Move it into its own namespace.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v2: Rebased after nvme-ns got merged in commit 8680d6e3646
>> ---
>>  meson.build                               |   1 +
>>  hw/{block/nvme.h => nvme/nvme-internal.h} |   4 +-
>>  hw/{block => nvme}/nvme-ns.h              |   0
>>  hw/{block/nvme.c => nvme/core.c}          |   2 +-
>>  hw/{block => nvme}/nvme-ns.c              |   0
>>  MAINTAINERS                               |   2 +-
>>  hw/Kconfig                                |   1 +
>>  hw/block/Kconfig                          |   5 -
>>  hw/block/meson.build                      |   1 -
>>  hw/block/trace-events                     | 132 ---------------------
>>  hw/meson.build                            |   1 +
>>  hw/nvme/Kconfig                           |   4 +
>>  hw/nvme/meson.build                       |   1 +
>>  hw/nvme/trace-events                      | 133 ++++++++++++++++++++++
>>  14 files changed, 145 insertions(+), 142 deletions(-)
>>  rename hw/{block/nvme.h => nvme/nvme-internal.h} (98%)
>>  rename hw/{block => nvme}/nvme-ns.h (100%)
>>  rename hw/{block/nvme.c => nvme/core.c} (99%)
>>  rename hw/{block => nvme}/nvme-ns.c (100%)
> 
> Would we want to consider renaming nvme-ns.c to namespace.c? And maybe
> also follow up with consolidating nvme-ns.h into nvme-internal.h?

Yes, good idea!

I'll respin.

Thanks,

Phil.


