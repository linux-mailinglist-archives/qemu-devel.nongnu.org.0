Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFA92F7513
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:19:45 +0100 (CET)
Received: from localhost ([::1]:35652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LGi-0005Rz-9X
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LEY-00005v-AH
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:17:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LEV-00026S-U6
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610702245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7FaUii4Z8q599LWCMW9n0PV9LmbWa5o4ErRIdr4F81A=;
 b=SwZZmmw25r5i8PCfpLduGXIWsDmmr0ZeOvxj3FZFnnSOuN+AELVpG+bBUDcyiTCTMBqzvv
 rs4XNs0wytHIrLRaabQZUYWkC9QZdMEGpn1A/AQFVWuwJhXo+Cd1TJEXgwZkkus2J6ZyNm
 i0NO5hEKDLD0Xn31IzDlDj9RKvJ/JL0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-4rB-z6MUPwCVCOil1eF4aQ-1; Fri, 15 Jan 2021 04:17:24 -0500
X-MC-Unique: 4rB-z6MUPwCVCOil1eF4aQ-1
Received: by mail-ed1-f69.google.com with SMTP id n18so3578100eds.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 01:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7FaUii4Z8q599LWCMW9n0PV9LmbWa5o4ErRIdr4F81A=;
 b=FwKDdaVHsgZ1hG/Uz4PsHcWEVLm4mRW3ha4/WOfVgWVdxO+ZTvxF+59FasSAyFdULy
 NwUTFkx+50qnLlvH5DG3f/H/mlaXJYoWFI1784ngFZJyZUuQcmbF0dM2ilmM9lznxo97
 hkcjtWnV7ZCq1oQ21AyiI/TtB1Vv+F25oSJ8JEMpVjpjjoMtxL67GnE4ZJYNioraAR4w
 1P4hrAmazkoHf2XSkv0N2uodqrMsDuRq55wbTUHvse5d9aAoQZiFnrJPhB/fngssQbOr
 2tTEowlhYJO8xTcp+p6rhxKRzsub5nM+iyaIAViH6XVihmq6BB8ooTTzTpFZ5if+FNsw
 tKCg==
X-Gm-Message-State: AOAM531en6y92E6i1TM1Y3ACplewJb9bnYsnfDUn3ZbHBhHjccwM4X9Y
 bPwj4i8dMF4xl8p9rtdc831/C8NBqnX0QYkHuq7rN2T4Gni+0f3CO8O71ezQM5ux6Hhr4gwo+KU
 ICfITpKlmOxRsR6vtXLJ1gnl6YpeFoZ2LB4evI5JfUAme4WVx4GtoHIgC4zYxdjP9
X-Received: by 2002:a50:b223:: with SMTP id o32mr8910340edd.79.1610702242957; 
 Fri, 15 Jan 2021 01:17:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXLPBDb201eMb2HryYnW3MgsJrwelUbNpESSrqur7lWQ6THwhXNwexAqx00DRogudiDP02TQ==
X-Received: by 2002:a50:b223:: with SMTP id o32mr8910326edd.79.1610702242766; 
 Fri, 15 Jan 2021 01:17:22 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e21sm3235983edv.96.2021.01.15.01.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 01:17:22 -0800 (PST)
Subject: Re: [PATCH v4 3/3] hw/blocl/nvme: trigger async event during
 injecting smart warning
To: zhenwei pi <pizhenwei@bytedance.com>, kbusch@kernel.org,
 its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
References: <20210115032702.466631-1-pizhenwei@bytedance.com>
 <20210115032702.466631-4-pizhenwei@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2aaa4523-eddf-1246-b48b-f0a0f0daf582@redhat.com>
Date: Fri, 15 Jan 2021 10:17:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115032702.466631-4-pizhenwei@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 4:27 AM, zhenwei pi wrote:
> During smart critical warning injection by setting property from QMP
> command, also try to trigger asynchronous event.
> 
> Suggested by Keith, if a event has already been raised, there is no
> need to enqueue the duplicate event any more.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  hw/block/nvme.c      | 48 +++++++++++++++++++++++++++++++++++++-------
>  include/block/nvme.h |  1 +
>  2 files changed, 42 insertions(+), 7 deletions(-)

Typo "blocl" in subject ;) No need to repost.


