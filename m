Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D9F2AEE06
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:44:19 +0100 (CET)
Received: from localhost ([::1]:38990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmfq-0000s6-Pz
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcmcz-0007Gu-V9
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:41:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcmcy-0004mM-AD
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605087678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oxOyc+SDuMf3caz4PaSxMoeLVXvvyHfWdgWtyvTzTm8=;
 b=QfsPU9Lu6y0/xPicKLWQVNq3eDAMMk3TPvCGuo8HmlKoyBcSMFb0fT7L0WPKaYcZXF7uqs
 4nny794x8igTfzNDYaWSuANWDn6je9xK3uavIPttxgSEimrqCUlxNThiDhgMtABq223UJy
 OXFbgKlDkjvUOz6rj0BwlR4lpmPnxRo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-QZB8VrQwPQ2_CRQw5XSECg-1; Wed, 11 Nov 2020 04:41:13 -0500
X-MC-Unique: QZB8VrQwPQ2_CRQw5XSECg-1
Received: by mail-wm1-f71.google.com with SMTP id 3so661281wms.9
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 01:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oxOyc+SDuMf3caz4PaSxMoeLVXvvyHfWdgWtyvTzTm8=;
 b=oKSRD3lbr4SJx+Es3NE+m/PGX4yUIGTdXnzE8wzooDIbM0qie/NSR8FErgdef0+ZvO
 Bx1hxpJt2er5mniEZw7YnxC7MbvUCegdek2I/rix5PD+YlUeePyErGZvdQtS7owQbkJ2
 ltFLSzgFSu4q55+ahFHkH2dhPxPyGGMQWOIyTfhrGnHFGbFI1oiKbYOOMhwSm6E2HFKO
 vC893xIAd6EtIBLE2D1k6qcMMtX8TH5t27W0JwprHqP/WzXbVzA0HytkQQnOehWTXHSN
 YtI3jKP6onqO3LNipYtbcLJC24iLGDvymLumzPNAO71wsiZA+aiVok61gG8wJRVzVeO+
 pHYA==
X-Gm-Message-State: AOAM532dA6CtOAe8hqJVi2BbXPRZT8fIXI6/32p7HiFnAbKSopTfu6P+
 6cwwrHWdZdRWBRPkB4+JgtnMlYViGmzpFJsfmMMcZMyRpCx21ruhGOI2oiVcnaVAmYnZXIbNm2k
 SFeX0DKQslly/F20=
X-Received: by 2002:adf:e512:: with SMTP id j18mr27047953wrm.390.1605087672409; 
 Wed, 11 Nov 2020 01:41:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrLWb6CTVkDCGIlJnzPwbRLNwvqW0ngxb+6cUwmXMr+TkDMCeuCQUoUaKElVETJ6DLEHsoZw==
X-Received: by 2002:adf:e512:: with SMTP id j18mr27047926wrm.390.1605087672187; 
 Wed, 11 Nov 2020 01:41:12 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id i5sm1930506wrw.45.2020.11.11.01.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 01:41:11 -0800 (PST)
Subject: Re: [PATCH 1/3] meson: move vhost_user_blk_server to meson.build
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201110171121.1265142-1-stefanha@redhat.com>
 <20201110171121.1265142-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ad4be626-c950-6131-adc3-369f9a405ad4@redhat.com>
Date: Wed, 11 Nov 2020 10:41:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110171121.1265142-2-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 6:11 PM, Stefan Hajnoczi wrote:
> The --enable/disable-vhost-user-blk-server options were implemented in
> ./configure. There has been confusion about them and part of the problem
> is that the shell syntax used for setting the default value is not easy
> to read. Move the option over to meson where the conditions are easier
> to understand:
> 
>   have_vhost_user_blk_server = (targetos == 'linux')
> 
>   if get_option('vhost_user_blk_server').enabled()
>       if targetos != 'linux'
>           error('vhost_user_blk_server requires linux')
>       endif
>   elif get_option('vhost_user_blk_server').disabled() or not have_system
>       have_vhost_user_blk_server = false
>   endif

Something is odd:

$ ../configure --disable-system --enable-vhost-user-blk-server
$ make

-> no binary.

Anyhow:
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> This patch does not change behavior.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  meson_options.txt        |  2 ++
>  configure                | 16 ++++------------
>  meson.build              | 12 ++++++++++++
>  block/export/meson.build |  5 ++++-
>  4 files changed, 22 insertions(+), 13 deletions(-)


