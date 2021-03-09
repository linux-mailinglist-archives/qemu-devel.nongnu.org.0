Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CA7332839
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:11:45 +0100 (CET)
Received: from localhost ([::1]:56554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJd5M-000390-0t
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJd3i-0001kJ-FM
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:10:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJd3f-0006ew-5S
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:10:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615298997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnLdid+P9mrBNBiNgCnNRM5VYYEDwvE4I6sxLZBl8uo=;
 b=JBEHHp2Lt4AvAfEYH8J23h7PjboNXUKTXdpuQgRBVPvMskAu/5eapwI3gkU8lBM2SFPT3n
 oYW2Dih0UCjhpdkEiU8zB8OulUICbI9lsss7C0ZgQ1Q04qHG3B6+eryiMFLij8Kbw1HcRn
 RyE5GJbe5wVTaw07zq0dSLFyjGlXCU4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-xcpvbFSPOg2YFIY2-nO8aQ-1; Tue, 09 Mar 2021 09:09:53 -0500
X-MC-Unique: xcpvbFSPOg2YFIY2-nO8aQ-1
Received: by mail-ed1-f71.google.com with SMTP id p6so6748463edq.21
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:09:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mnLdid+P9mrBNBiNgCnNRM5VYYEDwvE4I6sxLZBl8uo=;
 b=UEREYumpxjl7+tWnLRO/BJpRdoRjSspKHZII6GU3Cl4bAKTne5lvTnWwwGPMZ5BHu7
 KAIQX736jb15YDfyvybhLOJGVmPLQkB8Ro/BqdBNUxkya064gguFZhEqW5ua5aG14eBB
 1IDgF4A6kIV2SFcWMTn6abc+sggEkJMIeEzitAAaZYHIPu88T2J0e5AxNpiC3dplmaWP
 HEFvJmDAf0jZo4/u9RCCwWDWhOyZP/owMNCl+o1UrzlHHS1089s45oBaVPNKHQn7IZW5
 ldk3ciwqNsoGkPF823Q9yHZ8pF7nU6Sk0dCekPd554g8RIgS5YWsUqoJVHc7tPljGO1T
 Z92Q==
X-Gm-Message-State: AOAM532fxkr8u1OjNkXwLpbJ+mOMawKTM/My8YJV+bggjFTj9RROya8U
 vi1c0oRheHKRj3rcvcciznawpd3T/eM88XEl7YrHl4IzJVrKyb6+w1rUyl8hI6NBQT1iQYRb/s6
 TdlvST9M+zqHZk8M=
X-Received: by 2002:aa7:dd99:: with SMTP id g25mr4260702edv.230.1615298992313; 
 Tue, 09 Mar 2021 06:09:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOxttWNHVMfCWdoezVxRmIGnuFKy+hdu4GCkRfmjaYvE/cpLHgbaNQB+mkkjpNXH1ziPwCDw==
X-Received: by 2002:aa7:dd99:: with SMTP id g25mr4260683edv.230.1615298992158; 
 Tue, 09 Mar 2021 06:09:52 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bx24sm8656583ejc.88.2021.03.09.06.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:09:51 -0800 (PST)
Subject: Re: [PATCH v2 4/4] slirp: feature detection for smbd
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20210309002741.85057-1-j@getutm.app>
 <20210309002741.85057-5-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b1c93f8e-5c4c-9ad8-e9b3-a846fe9f5661@redhat.com>
Date: Tue, 9 Mar 2021 15:09:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309002741.85057-5-j@getutm.app>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Joelle,

On 3/9/21 1:27 AM, Joelle van Dyne wrote:
> Replace Windows specific macro with a more generic feature detection
> macro. Allows slirp smb feature to be disabled manually as well.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure   | 26 +++++++++++++++++++++++---
>  meson.build |  2 +-
>  net/slirp.c | 16 ++++++++--------
>  3 files changed, 32 insertions(+), 12 deletions(-)

Hmm v1 had: Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
did you change something to not include Samuel A-b tag?


