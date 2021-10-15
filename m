Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D74F42F526
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 16:23:16 +0200 (CEST)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbO78-0005mW-SJ
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbO5A-0004Vo-JY
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:21:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbO56-0006yC-4v
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634307666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O85AhZJWgHRAT0WucQBWTJ+8VTYTNpgyZoNXnMl20eM=;
 b=XRxweBupHtgymQ5IT4GeMPdoQ7vomSJQh6ppWPDbI3IvVXRfLN4lmb2/o94G79m1dJIFrS
 sPWCX7YEUiAJiCGI+BLq0ntOekb6aUdH4k3nfCB2RQIcHo0JZjm4NawhJkVPm8Q5Fvron0
 VkHZWz5V4TqnSPzNO9PawqJ5hNTkf/Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-o2aeRMCDNr2lgck2dnGg7g-1; Fri, 15 Oct 2021 10:21:04 -0400
X-MC-Unique: o2aeRMCDNr2lgck2dnGg7g-1
Received: by mail-wr1-f69.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso6035054wrg.7
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 07:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O85AhZJWgHRAT0WucQBWTJ+8VTYTNpgyZoNXnMl20eM=;
 b=gB6fL3H04x+Z87I9C+ZxbVaoP7bnDbzY1ymsfNqxUcYyDmwo5y9lLaGOjLAmgz/w/H
 2csB1sBeSo2nmtVNxZ0pPrnDCXM7ODQgsKpvdaxjFwb3baoCeNHgc+tS/kvGYv+Clstt
 /K4yfoyiwIIJlt0GPz8Oq9npx2B55FuYgTjCGD1Qsvx2M6LZVo3+1rN1fTtUIK0WXfrS
 GAni3ZTtzhLl5wm8NykxKrKvCoU1M+H8SF9x2X8Qu+YpXAnJiU0feWxAVVJoL1/crXZU
 GgNPRwsEd2z7BvPOqD4vn28W1vciKO1g98vpXpquwNG/9Xx04twyWtms/7E/zwa6AgyV
 DT9w==
X-Gm-Message-State: AOAM533wj2/2SBhON4h2vJKHgtzO+o/5CzGzyVzOEqSVhw3GhUTVaj0g
 4ag/5QELFve+lgMZxA7CIp13rMaGy54xasen0KmAlRezdI6AsSUR1nvc2ascbjSMEsj71wjmrd9
 xuD8/wo4l21L5Kys=
X-Received: by 2002:a5d:698a:: with SMTP id g10mr14695460wru.14.1634307663480; 
 Fri, 15 Oct 2021 07:21:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ5bOdavsCWI2mqFQXFnYVMjXgit8JvvmvCXER23YUqkZbMchXF+oOJTVqU9TVvvtABfTxpA==
X-Received: by 2002:a5d:698a:: with SMTP id g10mr14695419wru.14.1634307663233; 
 Fri, 15 Oct 2021 07:21:03 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id r205sm4887725wma.3.2021.10.15.07.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 07:21:02 -0700 (PDT)
Message-ID: <25f4a871-36b7-dc14-929b-54e7d568f3be@redhat.com>
Date: Fri, 15 Oct 2021 16:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] analyze-migration.py: fix extract contents ('-x')
 errors
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211015131645.501281-1-lvivier@redhat.com>
 <20211015131645.501281-3-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211015131645.501281-3-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Eduardo Habkost <ehabkost@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 15:16, Laurent Vivier wrote:
> When we try to use 'analyze-migration.py -x' with python3,
> we have the following errors:
> 
>   Traceback (most recent call last):
>     File "scripts/analyze-migration.py", line 593, in <module>
>       f.write(jsonenc.encode(dump.vmsd_desc))
>   TypeError: a bytes-like object is required, not 'str'
> 
>   Traceback (most recent call last):
>     File "scripts/analyze-migration.py", line 601, in <module>
>       f.write(jsonenc.encode(dict))
>   TypeError: a bytes-like object is required, not 'str'
> 
> This happens because the file 'f' is open in binary mode while
> jsonenc.encode() returns a string.
> 
> The results are human-readable files, 'desc.json' and 'state.json',
> so there is no reason to use the binary mode.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  scripts/analyze-migration.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


