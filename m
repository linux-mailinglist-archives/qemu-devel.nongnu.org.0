Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A735D3B9556
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 19:18:13 +0200 (CEST)
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz0KK-0002L2-7E
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 13:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wmoschet@redhat.com>)
 id 1lyz1W-0000wV-2N
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wmoschet@redhat.com>)
 id 1lyz1S-0002Ja-St
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625154876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hTojRBCyUozwHaKG1xgx8+apc8U2D4GzUQ2T6RK5+Y=;
 b=U28bVKKkrRwsCWpFDLJkY9+vA5Jvzlipd/q3iJNQKArbyrp02hKmom6zgppN8P3GNVr44L
 qSebyJdgBx1Ktq47rDGlhxRx58lV8Xh/ig+0UMFpKySU/UjqFUP9w5tAhvc784jId39pj9
 MQ+p2RS7uL7R8MP1q0NBvsoGTqQJZUI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-pdOvzJE6OXmkKf2hQ9vPgA-1; Thu, 01 Jul 2021 11:54:29 -0400
X-MC-Unique: pdOvzJE6OXmkKf2hQ9vPgA-1
Received: by mail-pg1-f199.google.com with SMTP id
 x15-20020a63310f0000b02902280f0483f8so4425029pgx.12
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7hTojRBCyUozwHaKG1xgx8+apc8U2D4GzUQ2T6RK5+Y=;
 b=mSucqxpxpHk4oTW3RyYub2uSzRFIoGbVkcyJ12/khCu6lKUNo/rahKeB7IFSMXsokd
 bg/4o217XrceHgv2ki3E9pRgb/Tj0U4gcEbx85U/dNwHYMP8lJyjp7Nob5LAPAA4T8vO
 pysdvx0lDHewgrHlP86cuFoToIu6dMJNCliwKGKXY2Wd/dTm5q+vZ/3BHw22qy8/KjdD
 okKvykUZAI7UzuUm5JmlA7UKNXmC1uQyrX8UN/QAG7qVFPPyzbBIhHp22ofYQG2vZsfh
 UNW2W6vikGaL8pBBNwNAZquhcoTzxl+lvXJwckOIY9LYR3rvFrZ58nie3Dx66GvJdf3c
 wf4Q==
X-Gm-Message-State: AOAM530JrdQCMq27cFwz7pHJDESe8eW0YDntcBxLsJxqS+qUJxthZ247
 pmxIPISmEHAMnaxn7Zk/2cIumD2tJCWdUWXoBCEQVZ+VnMHPSsfa4rlegIm5s3kLO4gOZ7Ph8Wm
 NbmcxItbNHH/RPN8=
X-Received: by 2002:a63:dc03:: with SMTP id s3mr289395pgg.354.1625154867668;
 Thu, 01 Jul 2021 08:54:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYTKcxkBIGB1T/O+/rSSt0nM5iW8jZ+U6m1s0GlfHOVTHbbDaOaU0pN18v3slzzV+tiKis0w==
X-Received: by 2002:a63:dc03:: with SMTP id s3mr289383pgg.354.1625154867411;
 Thu, 01 Jul 2021 08:54:27 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id a130sm454219pfa.90.2021.07.01.08.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 08:54:26 -0700 (PDT)
Subject: Re: [PATCH] tests/vm: update NetBSD to 9.2
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
From: Wainer dos Santos Moschetta <wmoschet@redhat.com>
Message-ID: <357fdc8d-8298-9342-2d87-071ecdfe767d@redhat.com>
Date: Thu, 1 Jul 2021 12:54:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wmoschet@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wmoschet@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Jul 2021 13:16:39 -0400
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
Cc: Philippe =?unknown-8bit?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/2/21 2:21 PM, Brad Smith wrote:
> tests/vm: update NetBSD to 9.2
>
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>   tests/vm/netbsd | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/tests/vm/netbsd b/tests/vm/netbsd
> index b9efc269d2..4cc58df130 100755
> --- a/tests/vm/netbsd
> +++ b/tests/vm/netbsd
> @@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
>       name = "netbsd"
>       arch = "x86_64"
>   
> -    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.1/images/NetBSD-9.1-amd64.iso"
> -    csum = "65bddc95945991c3b2021f9c8ded7f34c25f0a7611b7aa15a15fe23399e902307e926ae97fcd01dc1662ac67b5f6e4be643c6a2b581692ddcb616d30125066f9"
> +    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.2/images/NetBSD-9.2-amd64.iso"
> +    csum = "5ee0ea101f73386b9b424f5d1041e371db3c42fdd6f4e4518dc79c4a08f31d43091ebe93425c9f0dcaaed2b51131836fe6774f33f89030b58d64709b35fda72f"
>       size = "20G"
>       pkgs = [
>           # tools


