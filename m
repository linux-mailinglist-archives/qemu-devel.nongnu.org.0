Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806483344D1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:09:51 +0100 (CET)
Received: from localhost ([::1]:43210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2LG-0007f3-GG
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1nY-0003sy-Sa
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:35:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1nW-0006Be-4s
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615394097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0ATF9tUOsDWspAfbB4+A9s86K3SmTgdhIpdiqq0aE8=;
 b=hrFt1our6eb/Z/YSt7VwTqTLZR7ktklkfpMJ2jqR3NM7lJsRGqVIRF49de2G4yd239PrnB
 LgF5Di339P71Lvogb+BVxwL7/Ck/hDm5pEvaEn3k3o3fCRbQ+Wyl4uOoO9CqyC8TyT2p6+
 GjofFq32gFZJ4PMHSkW4F5aQFwbJLh4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-AV6KoyaFNNevvTF7mtyLpA-1; Wed, 10 Mar 2021 11:34:55 -0500
X-MC-Unique: AV6KoyaFNNevvTF7mtyLpA-1
Received: by mail-ej1-f71.google.com with SMTP id jo6so7463344ejb.13
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f0ATF9tUOsDWspAfbB4+A9s86K3SmTgdhIpdiqq0aE8=;
 b=QIeLTO6ZH4OcnXhjdW2djfddVoyLqFUvUy39bbbhYriOYSK0+yPOaPRRCkeL80GHNV
 2JM0mi+T09J0jFdE6kVKWUWa6q6jKtyzp/cvyetHoyr7GauUgKUmLSXdSW2Y28zkLsL5
 2F6iy6Pbns7ft5ceQyJwghBsypyxz3eLmgceDrVRPze9WLqMASvCIWKshx1RQi3mTu+d
 5q+0v1boN4MYplDhSlBRhE6nEkYJ+eyEXFPqcttQeQG2ngf5UwnCp0S+9q/Qva4CzbVZ
 A9ql43rN+rEECN7CgaPEI3HzXs/7akLo4Wb2QpbkGkRwywdOr7L7ky1zqCgJBMyq+tXY
 zC4Q==
X-Gm-Message-State: AOAM530Iw6ERwUxILAZo3iZG9b0cz74QC+l8G4ehAK/R8d+xi5YamU1G
 /JzCECZcLCKFOR8HPL8l6gYrvpQbN3ZHCuOFIGEdkO1IpKfjWh+8QG6AFFzUVW0IGX74daV+Plg
 WZDbOMCg48HmbhJ4=
X-Received: by 2002:a05:6402:84b:: with SMTP id
 b11mr4247285edz.56.1615394094166; 
 Wed, 10 Mar 2021 08:34:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXeAF/5G2fdS7uoUwMKfTnotFS05i7bmR2fiGUfyKafAhMMbiJXMCRj0blT4lf2aHwYAT9cA==
X-Received: by 2002:a05:6402:84b:: with SMTP id
 b11mr4247264edz.56.1615394093996; 
 Wed, 10 Mar 2021 08:34:53 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s13sm11558982edr.86.2021.03.10.08.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 08:34:53 -0800 (PST)
Subject: Re: [PATCH 6/9] hw/block/pflash_cfi02: Rename register_memory(true)
 as mode_read_array
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-7-philmd@redhat.com> <m2o8frff4x.fsf@oracle.com>
 <14b6a741-7d54-01df-84c2-8dc9c3f0dd47@redhat.com>
Message-ID: <cbdb8501-649f-5995-ab51-d4e1231bef26@redhat.com>
Date: Wed, 10 Mar 2021 17:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <14b6a741-7d54-01df-84c2-8dc9c3f0dd47@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 5:31 PM, Philippe Mathieu-Daudé wrote:
> On 3/10/21 11:59 AM, David Edmondson wrote:
>> On Wednesday, 2021-03-10 at 00:50:25 +01, Philippe Mathieu-Daudé wrote:
>>
>>> The same pattern is used when setting the flash in READ_ARRAY mode:
>>> - Set the state machine command to READ_ARRAY
>>> - Reset the write_cycle counter
>>> - Reset the memory region in ROMD
>>>
>>> Refactor the current code by extracting this pattern.
>>> It is used three times:
>>>
>>> - When the timer expires and not in bypass mode
>>>
>>> - On a read access (on invalid command).
>>>
>>> - When the device is initialized. Here the ROMD mode is hidden
>>>   by the memory_region_init_rom_device() call.
>>>
>>> pflash_register_memory(rom_mode=true) already sets the ROM device
>>> in "read array" mode (from I/O device to ROM one). Explicit that
>>> by renaming the function as pflash_mode_read_array(), adding
>>> a trace event and resetting wcycle.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
>>
>> Okay, I see that pflash_register_memory() was going to lose its second
>> argument anyway, so perhaps no need to fix it in the previous patch.
> 
> It makes the previous patch more complex, so I'll keep it that way.

OK by previous I understood #5 but now I read your comment on patch #4.
I'll update #4 then.

> 
> Thanks for your review!
> 
> Phil.
> 


