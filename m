Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4343326FD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:24:45 +0100 (CET)
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcLs-0007O4-RV
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJc5C-0001oX-4d
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:07:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJc55-0002C3-SU
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615295243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pAqcI1xZK1RToPzwz4SRoWGitAD1zVFMC091we+ERJo=;
 b=TzJStvRmrZW1E6AQM7JY4+DMRrHfcReWchag5utAlCrc707tU2AFn/zjTKw91CO8eXbq45
 NrA0wixG0fcHQZ3q2GZdHUfV7eyjK5Qw7kSLFqHgWx7zjuzj3jWa4VxQ2Q2GYxk33V4Nl8
 e/cheUsdNdF7hwePR4xNPwKPPvI/ds8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-gwlrakc_OgCib1Rv8GJYPQ-1; Tue, 09 Mar 2021 08:07:20 -0500
X-MC-Unique: gwlrakc_OgCib1Rv8GJYPQ-1
Received: by mail-wr1-f69.google.com with SMTP id h5so6384062wrr.17
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 05:07:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pAqcI1xZK1RToPzwz4SRoWGitAD1zVFMC091we+ERJo=;
 b=aMjwcyiE2lfHL/SOq62yjzzY2T+k8YnF8Cmzor8h74ReD6Fphjuk5MLXehs7zUdcnB
 +ilSFI4reEcZmNXA+UYTgJfzQ0b1wYat+Iini412410BVQ20kleZye9fikjZtfCpUcx+
 EL1WuJU3YmPH+B+IDDRE0yICB+OZkgR9vupA1ahDtn3HVcWKucL4OCv+K6QMXbHhrkF7
 r0qZNqL6Qm6thegdIaBU8Bs9orHW/Sbewq1AgVDzj8KXPZQd1bz3em+CU9q7lwMnWP41
 Q/4x1RuYD2wXjKsSwf36UytlZA/ALJPZbolrKoAN4M00qnbT+tsg7MXdt8VAuouIZ8sg
 177g==
X-Gm-Message-State: AOAM532nMYVNw7ZkZfhqoORdMwcj7QiMTrZ3xs3slaw4DQeNtM0rOmkK
 fttvmW5hjOLDKta11lcBozhgP2dzan13zjfDBZA0zzk7vCg5BqNRGHupfRn3yh/MzAH9Q3CFC3Z
 aH9dFG1AST2Prx/8=
X-Received: by 2002:a05:600c:2312:: with SMTP id
 18mr3979800wmo.8.1615295239189; 
 Tue, 09 Mar 2021 05:07:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxC6wwkAhGzZMxWzOUVO3Y4raD7Uo1t9K6TrLiaegmIlYapNxzOUeKgAvXoQ9EzX9hcQYfh9g==
X-Received: by 2002:a05:600c:2312:: with SMTP id
 18mr3979774wmo.8.1615295238904; 
 Tue, 09 Mar 2021 05:07:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p27sm4255105wmi.12.2021.03.09.05.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 05:07:18 -0800 (PST)
Subject: Re: [PATCH V2 trivial] Various spelling fixes
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20210309111510.79495-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8042a47a-eb4b-3c5b-1d86-481bad70a4ce@redhat.com>
Date: Tue, 9 Mar 2021 14:07:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309111510.79495-1-mjt@msgid.tls.msk.ru>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 12:15 PM, Michael Tokarev wrote:
> An assorted set of spelling fixes in various places.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> ---
> V1: https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg05959.html
> Changes: incorporated suggestions by Stefan Weil and added his R-b.
> 
> Please note: this also patches one file in disas/
> 
>  disas/nanomips.cpp            | 2 +-
>  hw/misc/trace-events          | 2 +-
>  hw/net/allwinner-sun8i-emac.c | 2 +-
>  hw/ppc/pnv_bmc.c              | 2 +-
>  hw/usb/ccid-card-emulated.c   | 2 +-
>  hw/usb/hcd-ohci.c             | 2 +-
>  hw/virtio/vhost.c             | 2 +-
>  include/hw/s390x/css.h        | 2 +-
>  qemu-options.hx               | 4 ++--
>  target/i386/cpu.c             | 2 +-
>  target/i386/machine.c         | 2 +-
>  target/m68k/op_helper.c       | 2 +-
>  target/riscv/cpu.c            | 2 +-
>  13 files changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


