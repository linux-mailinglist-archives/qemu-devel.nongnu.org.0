Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C25388C56
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 13:06:57 +0200 (CEST)
Received: from localhost ([::1]:34830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljK2S-00024U-Kt
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 07:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljK1T-0001Jm-7A
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljK1Q-000453-MV
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621422352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkFewwZfXm2onHIritr5NfnguQz1TLHzdqpR8qSGHt8=;
 b=MsMqfhDbw9A6YLB3FsPLCv3qW0QjEp9JdW6P9zpJVxuTflRMCxCfP07d2xdBNNhHFhc/QL
 vcgeualb3QYIdF253NxzH4SyffQwnCh0N8EmpMTZfM2cxVlt7y1r2r830ZOOVsVrZ7dA25
 9ZRji6Sfsa2tC19IBAOlhjbe//Ycczg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-mJ74pTPpN065xQpdecRUoA-1; Wed, 19 May 2021 07:05:50 -0400
X-MC-Unique: mJ74pTPpN065xQpdecRUoA-1
Received: by mail-ed1-f70.google.com with SMTP id
 d4-20020aa7ce040000b029038d1d0524d0so6708033edv.3
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 04:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nkFewwZfXm2onHIritr5NfnguQz1TLHzdqpR8qSGHt8=;
 b=I7FzmYE7tNorM2w98s6Eil53uVYL+k3Qyoqoosjn0/EyA77GtQqSVDovG1lgNiRh4H
 872Y4TPlOmWmXYpYhwY0jP2VlU1cFsUy9ilOOPpe4RnTzQyVqBG+oJuE3btotmlIsmQ/
 XnFNlRIwZawh1Ozy3300hS0BRP+rboYSqoLYBYHWg0TJ4xvU5ttkymNBBKLwvHNhRlYN
 EFhkCkaF27FB1+W2CbVHxCUO445Mz/e2k6btlNQVborSwpr3gafTusfRvUIXDXJE5Y3w
 bit44Pjr31+Bkl4pleVq46kKgVVemx3TRt8PrFhAsI0s5pW1XK3Ms6Vvf15PpjfrIcUU
 R4Qg==
X-Gm-Message-State: AOAM531MxZ9UsD9vma9jLLGCQITgTEb9A5SiYLmJxymiD0X3pxgNVKVU
 KlIb/gP9aM4Ps8taednzueAvbvDebXEtxvyj6JLXtWF2ASlmTNdhr/BUypluaqs5bZWn/1EZGMq
 oCIKcGA2b8lcpn3U=
X-Received: by 2002:a17:907:105e:: with SMTP id
 oy30mr12013287ejb.258.1621422349047; 
 Wed, 19 May 2021 04:05:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKmuMw0oO5dW8BBMaNGbeEc9sw6Z+7uCm061k/SRx4sDDdxu6q1Gk3AmEuO+Vfb3te7KaqQQ==
X-Received: by 2002:a17:907:105e:: with SMTP id
 oy30mr12013261ejb.258.1621422348835; 
 Wed, 19 May 2021 04:05:48 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id dh21sm4356946edb.28.2021.05.19.04.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 04:05:48 -0700 (PDT)
Subject: Re: [PATCH v5 1/6] hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO
 -> FDC
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>
References: <20210518193239.1725624-1-philmd@redhat.com>
 <20210518193239.1725624-2-philmd@redhat.com>
 <977f921f-7dfe-707b-51d4-85e6c7aba164@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1888fae1-5546-490c-b564-68be17904fca@redhat.com>
Date: Wed, 19 May 2021 13:05:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <977f921f-7dfe-707b-51d4-85e6c7aba164@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 10:23 AM, Thomas Huth wrote:
> On 18/05/2021 21.32, Philippe Mathieu-Daudé wrote:
>> isa_superio_realize() calls isa_fdc_init_drives(), which is defined
>> in hw/block/fdc.c, so ISA_SUPERIO needs to select the FDC symbol.
> 
> If I get that right, not all superio chipsets provide a floppy drive
> (there's this "k->floppy.is_enabled" check in there) ... but for boards
> that don't need the FDC, this would currently require a stub for that
> function

Good point. I'll try to get it right.


