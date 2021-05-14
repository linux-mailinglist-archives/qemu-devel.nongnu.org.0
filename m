Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E7B3809CC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:43:07 +0200 (CEST)
Received: from localhost ([::1]:44496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhX9m-0001kU-KK
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWxH-00072U-9E
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWxE-0004DA-IM
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620995407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALRBnGF3PC/3E2tWo2lfOM6jJTl/JAOQBz5aoCBJ+GY=;
 b=Wr9INgtS0SUMeQfkun4RsYDI+bEV5jlfgd3wklc3H9/WeU56NNJlZz5FPxo6wwOLUNhiEO
 BMWRDoxrjFYRGaiq3/KjbRLjDhkMB5clt4AmP9wXVNGwEZ3iq0JnV5l/mwtENcsTyOe2ND
 AwvPcnjfk+aYOVDYX87Pl4b9oS7S/rM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-OxjrdqOPOaO4qhqExK1sCw-1; Fri, 14 May 2021 08:30:03 -0400
X-MC-Unique: OxjrdqOPOaO4qhqExK1sCw-1
Received: by mail-wr1-f71.google.com with SMTP id
 t5-20020adfb7c50000b029010dd0bb24cfso12664957wre.2
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 05:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ALRBnGF3PC/3E2tWo2lfOM6jJTl/JAOQBz5aoCBJ+GY=;
 b=fkgv/qXwLa9CxWdcVeaiY6RvwF1znNhm70ePRpKm/OXMceTcXCF73ooC7xY20XVjiE
 A2TFVtmnKFzw9uhZGtGqxH8lToGSzrJGzV5X+NXHmrgKI6gvmUn/YqNPKkohGUglFLZS
 N7k10Ou+EX8LCa98+ZAxBYZGKJO8f7K7oROuoITcqCLGqH0ZYpnaqTAf/lbAHL5venks
 T1JgnFn4t1aDKF7gskWDNSVT04JIgLC5K5+M0mXFlHUPV6BBSMuSy3cVaXT7Htw8JSJq
 Jii9wpDr5aNecQZ3o36uhTOqv6ElvfXsBV5GN9vyR7lVocw7kbUSG/AtqJASSihrlRIf
 sjfg==
X-Gm-Message-State: AOAM5331x+YNC3lW8pLWz5f+LSfJMPyAUuYs7CTa2HUe9lJKiU8E8hWn
 9IOtBkX8cYgR8E7eNwPnpSa2+lE9iBlCp48olHw9GW7zbPGYPEybDhNGIWh8965b3YHkbiawgtF
 ca8+yuLtTb6Dxrcs=
X-Received: by 2002:a05:600c:430a:: with SMTP id
 p10mr9391319wme.29.1620995402062; 
 Fri, 14 May 2021 05:30:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFeTo6Dzl38698UXRk0n9dblrwxXThqw1AsPHhMdEq6+q6RcBuU7BNFWNO0wrAWz/kU7Urow==
X-Received: by 2002:a05:600c:430a:: with SMTP id
 p10mr9391310wme.29.1620995401924; 
 Fri, 14 May 2021 05:30:01 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83cd9.dip0.t-ipconnect.de.
 [217.232.60.217])
 by smtp.gmail.com with ESMTPSA id m11sm5051243wmq.33.2021.05.14.05.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 05:30:01 -0700 (PDT)
Subject: Re: [PATCH v2 10/12] configure: bump min required glib version to 2.56
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-11-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <91dececd-09db-de99-6ba1-3c296078c531@redhat.com>
Date: Fri, 14 May 2021 14:29:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514120415.1368922-11-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/2021 14.04, Daniel P. Berrangé wrote:
> The glib version was not previously constrained by RHEL-7 since it
> rebases fairly often. Instead SLES 12 and Ubuntu 16.04 were the
> constraints in 00f2cfbbec63fb6f5a7789797a62ccedd22466ea. Both of
> these are old enough that they are outside our platform support
> matrix now.
> 
> Per repology, current shipping versions are:
> 
>               RHEL-8: 2.56.4
>        Debian Buster: 2.58.3
>   openSUSE Leap 15.2: 2.62.6
>     Ubuntu LTS 18.04: 2.56.4
>     Ubuntu LTS 20.04: 2.64.6
>              FreeBSD: 2.66.7
>            Fedora 33: 2.66.8
>            Fedora 34: 2.68.1
>              OpenBSD: 2.68.1
>       macOS HomeBrew: 2.68.1
> 
> Thus Ubuntu LTS 18.04 / RHEL-8 are the constraint for GLib version
> at 2.56
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   configure             |   2 +-
>   include/glib-compat.h |  13 +--
>   util/oslib-win32.c    | 204 ------------------------------------------
>   3 files changed, 3 insertions(+), 216 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



