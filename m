Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41592F6B7C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:51:33 +0100 (CET)
Received: from localhost ([::1]:47622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08ea-0003nk-RV
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l08Zt-0000g5-PM
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:46:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l08Zs-0002OF-4n
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610653599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DLYDQE4H/w3gRJ51MmkP5+cl3qKMXx+p0dPSpBZSPGQ=;
 b=UJYP4ObVFwcTLuTdSG/rBFCVmesGej1dzP0QYshPM1VvnIGOaDStS4vALZ0ibnrWGc3HW1
 0sXI5f1YosVGnbs7SkDYoMSHfvS4Qd5/eT32gdAQ4ybbkv5UBiR1hErZOw7GuKyArFQEwd
 TW2Z3OPbGU0ZFtPY3bXuUXg6LVWePL0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-9JUAIDCaMceB0HwG49lmgA-1; Thu, 14 Jan 2021 14:46:36 -0500
X-MC-Unique: 9JUAIDCaMceB0HwG49lmgA-1
Received: by mail-ej1-f70.google.com with SMTP id s22so2628132eju.21
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DLYDQE4H/w3gRJ51MmkP5+cl3qKMXx+p0dPSpBZSPGQ=;
 b=pcsqodh+a4naMWb2foaTkhsMtMDHmSkAovFTAKVcAzeUXi4iummTgRhQ5BNw4OfCn9
 OKlq3DBpDKfM1YXhAZZDJcg+nbTkqFejsYcFcYVNyNWbKn2jHL41T1V6kHS4tSjZYnnk
 2qVWGosyOVymjRxWLrHVd5GIpC+H87TiTNj2js06hTKXDq5qJMYPse3i/qOCQmUcOecs
 RC+/1kvdjIzQ3WdR2jR30uhw29O94xIXOmtQvW5eCqH1/xwzhbYVEDdIWXrlETBm1m2y
 /2GHz9O9WLmxv/Gb0z1trUskEkm2q7LOLjDBj2HHI+FLGycCjGE0ySECUWxs7wxbDZ1A
 0hgg==
X-Gm-Message-State: AOAM531UPQ+k2PSmJ3DDEnt6VgulykJQBoAvnuJyTRWOso4UX5SEuB+y
 eBxt3ZKt7xkkw4fwAU064WVSLNjv4jdc5M5likz2q2smg5dZhICaCurgLm7hxi/Gs8zHby4G9R0
 vQxUfxDVcJndo4bQ=
X-Received: by 2002:aa7:c1d2:: with SMTP id d18mr6854837edp.261.1610653595216; 
 Thu, 14 Jan 2021 11:46:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcjCBvZIXfo9FCNnrgdUMdr8ml8U6rysTgUAteGkuO2cfM5PlrcvuD3+mIdxVVYxWWrKdZ6w==
X-Received: by 2002:aa7:c1d2:: with SMTP id d18mr6854826edp.261.1610653595055; 
 Thu, 14 Jan 2021 11:46:35 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z26sm2571298edl.71.2021.01.14.11.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 11:46:34 -0800 (PST)
Subject: Re: [PATCH 0/2] meson.build: Fix bzip2 program detection for EDK2
 blobs installation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114174509.2944817-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <415f981e-3a11-71cf-6472-d36a070983b1@redhat.com>
Date: Thu, 14 Jan 2021 20:46:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210114174509.2944817-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Laszlo Ersek <lersek@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/01/21 18:45, Philippe Mathieu-Daudé wrote:
> Fix the following error when bzip2 program is not installed:
> 
>    ../pc-bios/meson.build:5:2: ERROR: Program 'bzip2' not found
> 
> (First patch easier to review using 'git-diff --ignore-all-space').
> 
> Philippe Mathieu-Daudé (2):
>    meson.build: Declare global edk2_targets / install_edk2_blobs
>      variables
>    meson.build: Detect bzip2 program
> 
>   meson.build                     | 10 ++++++++++
>   pc-bios/descriptors/meson.build | 30 ++++++++++++++++--------------
>   pc-bios/meson.build             |  6 +-----
>   3 files changed, 27 insertions(+), 19 deletions(-)
> 

Queued, thanks.

Paolo


