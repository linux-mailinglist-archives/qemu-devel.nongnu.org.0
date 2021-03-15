Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A774133C9DC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:26:15 +0100 (CET)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwbE-0006bG-I5
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwZx-00065u-PQ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:24:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwZu-0000pH-0N
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615850686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2gLDhELuMsQw1Ba4o2BASd5GzRnl6g0EFE0U5mqwSvE=;
 b=LtJl/gUwNPI9ut51VoMzdMV3O5dI95dMLnm7/PrLR5cyTTjTv9JYXmpEJ4TPJsxh8omOUX
 gTYo1lPZLatwlextB2udENM6iVH+DRsHqwm9iIv19fbpvVQ6TZzjgg1bDg8bo2zwgEH79w
 XY6il/0SFxvQciYBKVNSKS+POnxovvI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-ljKK4qVfMKyC6uCoGiJ-OQ-1; Mon, 15 Mar 2021 19:24:32 -0400
X-MC-Unique: ljKK4qVfMKyC6uCoGiJ-OQ-1
Received: by mail-wm1-f70.google.com with SMTP id a65so3118137wmh.1
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2gLDhELuMsQw1Ba4o2BASd5GzRnl6g0EFE0U5mqwSvE=;
 b=PE5a1XLk7RAgUfnM4tWm4XJcjzsARHO+L+5Ua8fJtK7a7Cl+UR52T8fXt0T6Yigxu/
 ApBeX3GlQ7NsWC66oLt8IysqL58xk/vcMoU4zQI5BbH/zNgQ7gzxaNqwMRBa4Pbkgo6A
 aPAoFU78uWMIL3slS5KDwomUi1uKS0TLF6Sah5mSC98x52dhn5YXLAa6R72LBz0h3/Sm
 WrtfZG1o7sTuXiSD+TD3IFQ5zFfr9F5u4FZwbs8geqN5poY9JhquGeUxEd1GOQBzzFM3
 8LCvBwusYytEf+RnhMP9jpWhXf6Yjd4C4ivuA2STjZJAVX0bFEtihGgANA7ZYmERcOSm
 MjdA==
X-Gm-Message-State: AOAM531xomWLinFltD4RHj7bqaiSjSmATW+c/J2wBS+SeeTmmYp0tkyR
 FJ0qqbsLI6rMXA6D82C26dGfyY+1Sc6+hD6+hjfMEffndo0GY39U4qg8G1lTZJyRQfIDjqzB6sO
 tvVIIBtnLrhCYUvI=
X-Received: by 2002:a7b:c316:: with SMTP id k22mr1800286wmj.176.1615850671231; 
 Mon, 15 Mar 2021 16:24:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuYaCnC1A/rDgiqWVJaI19igENXnDhkFgdNtIBmE6M2n28NuPqVz0jGreN+nfAX//RN3yflQ==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr1800268wmj.176.1615850670949; 
 Mon, 15 Mar 2021 16:24:30 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j203sm1217404wmj.40.2021.03.15.16.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 16:24:30 -0700 (PDT)
Subject: Re: [PATCH v2 00/12] hw/block/pflash: Refactors around setting the
 device in read-array mode
To: qemu-devel@nongnu.org
References: <20210310170528.1184868-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b3e41dfe-dd43-bbcb-87b1-29f2d50e1396@redhat.com>
Date: Tue, 16 Mar 2021 00:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310170528.1184868-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 6:05 PM, Philippe Mathieu-Daudé wrote:
> I remembered this almost 2 years old series while reviewing
> David Edmondson's patches... (which are included at the end).
> 
> Basically we move things around to make the code easier to maintain.
> 
> David Edmondson (2):
>   hw/block/pflash_cfi01: Correct the type of PFlashCFI01.ro
>   hw/block/pflash_cfi: Replace DPRINTF with trace events
> 
> Philippe Mathieu-Daudé (10):
>   hw/block/pflash_cfi: Fix code style for checkpatch.pl
>   hw/block/pflash_cfi01: Extract pflash_cfi01_fill_cfi_table()
>   hw/block/pflash_cfi02: Extract pflash_cfi02_fill_cfi_table()
>   hw/block/pflash_cfi02: Set rom_mode to true in pflash_setup_mappings()
>   hw/block/pflash_cfi02: Open-code pflash_register_memory(rom=false)
>   hw/block/pflash_cfi02: Rename register_memory(true) as mode_read_array
>   hw/block/pflash_cfi02: Factor out pflash_reset_state_machine()
>   hw/block/pflash_cfi02: Add DeviceReset method
>   hw/block/pflash_cfi01: Clarify trace events
>   hw/block/pflash_cfi01: Extract pflash_mode_read_array()

Thanks, patches 1-10 & 12 queued to pflash-next.


