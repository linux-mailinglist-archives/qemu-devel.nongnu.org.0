Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060924817CE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 00:46:17 +0100 (CET)
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2ie6-0000VY-O6
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 18:46:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2ick-0008AB-Bp
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 18:44:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2ici-0005HY-F9
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 18:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640821487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnzsXZ1+OHeS/Mms3W9A3svBTo0olr8TZ0k05JKH99A=;
 b=IJK5gnbyidNMD0Q587ttbcS7R58GYot3uRX2a8cAUJRFB0jVKVswShjkOzUQI1n1bkfxBl
 t5a5oX3cPWbX50FgH7gvizR0WB5qSLeBISZzgRmDM306inU05hZZkzIXVkGJY06XvVTBtZ
 eWro04+ly2VOPbaGU136a6nmGkYFsVw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-RzKZJM5CPrWhNuPylO5s1A-1; Wed, 29 Dec 2021 18:44:46 -0500
X-MC-Unique: RzKZJM5CPrWhNuPylO5s1A-1
Received: by mail-wr1-f71.google.com with SMTP id
 s30-20020adfa29e000000b001a25caee635so5464172wra.19
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 15:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nnzsXZ1+OHeS/Mms3W9A3svBTo0olr8TZ0k05JKH99A=;
 b=CmRd7zwQyn1ubqu34fmrZDy700rJamOwNFbl9PeusHeqzsQmLHILLbgQfOhgpbXryx
 BQYdhZBwFqYCK2GjuQ/ynyf56DWSUH8YKLuSGn8gBoERhJx5B5kPHgfWoibfhUGoM2+A
 0uXbyVy6nVr9PJyej9v3D1V9h07rnhDWssEgfAYr61ZlTgtJ4stULDOc05dFJ6RgKD56
 99q8uD+kei4Izq83YwszA7Wt7e/EPeAdfZ1+SEB4BgUaxLIf8G1zR3WlGVo/Sb0XbWf6
 xgJOUURTr8DiWb8vL3d/9Qy5hPPAug6Gn4ht0x2nu/0DCZiAm9fTDOsOKnZZweYhSaId
 Lqzw==
X-Gm-Message-State: AOAM5327KpknjUR9XlY2FiKB6Z8flmXBrPUkmgoLKUycT5Vwd5drgR5I
 EsOgF7qJBYtDEI/P0IPL+trdLbeL9WZKHIV99Ru1oUSI8VXD2R+A1H+6S3rKocMY59abCZmJwG4
 6cm2gSQXHBGqge9U=
X-Received: by 2002:adf:ba8b:: with SMTP id p11mr22257558wrg.390.1640821484927; 
 Wed, 29 Dec 2021 15:44:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz53QYy+t6rX72jtyQuoXwRQdLPczkC7ZMW0Qv0ktiQaluVZlCtjanHKvEAGLsZmgLjm5iA1A==
X-Received: by 2002:adf:ba8b:: with SMTP id p11mr22257544wrg.390.1640821484712; 
 Wed, 29 Dec 2021 15:44:44 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id b1sm24758647wrd.92.2021.12.29.15.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 15:44:44 -0800 (PST)
Message-ID: <d908967c-c7bb-2323-f506-2ae5b41fd197@redhat.com>
Date: Thu, 30 Dec 2021 00:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/2] dump: add 32-bit guest Windows support
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com, qemu-devel@nongnu.org
References: <20211229175255.133073-1-viktor.prutyanov@phystech.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211229175255.133073-1-viktor.prutyanov@phystech.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Viktor,

On 12/29/21 18:52, Viktor Prutyanov wrote:
> Since 32-bit versions of Windows still exist, there is a need to take
> live and crash dumps of such guests along with 64-bit guests. So, add
> an ability for 'dump-guest-memory -w' to take dumps from 32-bit guest.
> When running the command QEMU consumes 32-bit Complete Memory Dump
> header passed by guest driver through vmcoreinfo device as it was
> previously done for 64-bit headers. 32-bit vmcoreinfo guest driver in
> upstream virtio-win can fill such a header.
> 
> Viktor Prutyanov (2):
>   include/qemu: add 32-bit Windows dump structures and definitions
>   dump/win_dump: add 32-bit guest Windows support for dump-guest-memory

Looking at your series, the patches are doing a bit too much.

Suggestion to ease review:
- Rename WinContext -> WinContext64 (+ add union) in a preliminary patch
- Rename WinDumpHeader -> WinDumpHeader64 in another patch
- Add *WIN_DUMP_FIELD* macros only using the 64-bit
- Add 32-bit structures
- Add 32-bit code
  (better name 'bool x64', maybe 'is_64bit' or 'guest64'?)

Otherwise LGTM.

Regards,

Phil.


