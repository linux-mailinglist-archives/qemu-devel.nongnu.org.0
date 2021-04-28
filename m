Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF136D937
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:05:01 +0200 (CEST)
Received: from localhost ([::1]:51742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkoG-0000QO-N6
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkfo-0001H2-Di
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkfl-0007ML-OP
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619618173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3bBM0Qfcw2b9bCR5Jv0euELeD9PGOhX2rdKo7lRy54=;
 b=OR9oNL95dmoa8jB7Dbev65LfL+aE2LnVeWWjtlfcIc0RYv/+Qg9xJFL7dUdf0DUf54Haok
 0SHK50w0mATV3pcUN442s0DDXAz1rO2nICGmsmmLOUzNrQe/EmB1JvN40EHqt0dF/RW4Aa
 6intETQKKOJua++3i7L6gpncHdmdivc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-2BKkINbkOBy6I4DKXvkWSg-1; Wed, 28 Apr 2021 09:56:10 -0400
X-MC-Unique: 2BKkINbkOBy6I4DKXvkWSg-1
Received: by mail-wm1-f70.google.com with SMTP id
 c2-20020a1cb3020000b029013850c82dbcso5179676wmf.5
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 06:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+3bBM0Qfcw2b9bCR5Jv0euELeD9PGOhX2rdKo7lRy54=;
 b=gVMfu7Axw/LXwp37qpo6HkkPc4q4soGJ2e6B9r6WGmAnf5LSji/CrqJX/UQfVcIAwE
 9oDitlreV0nZRWWI7dbWRlKjUG0Bi3bX556fRM2WzuvxEqCx/hXM1njix9WXUpoOFI1z
 AWUmjTONYl0bv7ROzNsxJQbkPtdgFQiyiKTbbMC2Zo3nDGMS57vtQQKrZHiAhQCZVAjo
 mEG0xkana4EI71zmI2JhUbwPYRR4qeUcpaMBD/1eoT3pWceDCg7ml/bEQB4LFRFP4zG5
 je5oc+5bR3IYYy6IcyVcm4bY7SopQmzZ8nXV/sduuR2hoiGJCR9hbwSA0okSVOIopIZJ
 SE/A==
X-Gm-Message-State: AOAM531xpmsAAC905CTyjXHP3oCtLD5dXtdJYNBZVlb84U1L+fr9OUsL
 lWtnZeYcfo4WRZwtz6ri8/CygCN0BhqTz4SshJnFPGU1w2JUKP8dqqnVKTjQxMD4SPPBJQJQ20z
 LohxMBtnjkrAMx3Q=
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr31354735wmj.46.1619618169711; 
 Wed, 28 Apr 2021 06:56:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI9iMkYWOuCthnXrY2weVl9vjnjEZzwlL8B2esKPKpAz775Ckwpakk/mzb9rC6NbtXIrgDxQ==
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr31354709wmj.46.1619618169477; 
 Wed, 28 Apr 2021 06:56:09 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f38:2400:62f4:c5fa:ba13:ac32?
 (p200300d82f38240062f4c5faba13ac32.dip0.t-ipconnect.de.
 [2003:d8:2f38:2400:62f4:c5fa:ba13:ac32])
 by smtp.gmail.com with ESMTPSA id b202sm6846174wmb.5.2021.04.28.06.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 06:56:09 -0700 (PDT)
Subject: Re: [PATCH 2/3] linux-user/s390x: Clean up signal.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428033204.133471-1-richard.henderson@linaro.org>
 <20210428033204.133471-3-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <6de1399d-a945-62d0-190f-a7ebeceef833@redhat.com>
Date: Wed, 28 Apr 2021 15:56:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428033204.133471-3-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.04.21 05:32, Richard Henderson wrote:
> The "save" routines from the kernel, which are currently
> commented out, are unnecessary in qemu.  We can copy from
> env where the kernel needs special instructions.
> 
> Drop the return value from restore_sigregs, as it cannot fail.
> Use __get_user return as input to trace, so that we properly
> bswap the value for the host.
> 
> Reorder the function bodies to correspond to the kernel source.
> Fix the use of host addresses where guest addresses are needed.
> Drop the use of PSW_ADDR_AMODE, since we only support 64-bit.
> Set psw.mask properly for the signal handler.
> Use tswap_sigset in setup_rt_frame.

This would be a lot easier to review if this would be split up into 
individual patches.

-- 
Thanks,

David / dhildenb


