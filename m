Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920BF2CC16C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:57:22 +0100 (CET)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkUVN-0006FF-Jm
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkUTf-000518-U3
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:55:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkUTd-0007mf-JY
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606924533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8MWOQChMievO9XmxOPfrvMQhvRndxaJMToOfsTpQHT8=;
 b=NtKHRRIaekS7wL85/hD8fNC66ZjYkQQNhDH8wobdKp0ZftiHAiXx/9Qy8/lXuSFnu7BS1K
 Od4UpwE8JEEzxJ0VFHFo7e/QqhR4DIFbu54oi4QBwe7nlEnCyb1Vp8NNspe8wSlrTVayub
 mCQTOUHdv510WG56l3hp9ywnWAtRDUs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-rxN6xfm6Njyg6QNgQeNhGA-1; Wed, 02 Dec 2020 10:55:29 -0500
X-MC-Unique: rxN6xfm6Njyg6QNgQeNhGA-1
Received: by mail-ej1-f69.google.com with SMTP id q11so3129288ejd.0
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 07:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8MWOQChMievO9XmxOPfrvMQhvRndxaJMToOfsTpQHT8=;
 b=C0tsxdBJup/kKRWhMqqA3rJ/nNed+2HdozxKiDaGP4u4MmXmM5XLqArdvVY0enD+K9
 BeVmd0ohZxOgf1p3jcVR8tGQhiZ9rJ0F7KEa83nC5WJCb8/kuf7tMPwuYuINLzVDfybh
 +lopf+4CYtBIo7Bd27XqToZljOOnsURuuWLemC22uSunlc3VqWMHh+bxtMnxK+oxBKuV
 EeBlBYd7mYdtZ8Ctbc/b9KgA8dW+6+sHxvaqC6YHfFLFKs/IsHXXRwkDhz4UUXHjq6Oy
 paDNhMqq9nWf74FuJikT/UYrnZGFbtDpFVjr0w49e05SLxJqk/zrfKa2KZHWxzAZjM4Z
 tYpA==
X-Gm-Message-State: AOAM532DpHN18YUgg332h0Lgz6PEOIxRmaEFgCpKoeWNzmeL18c2sfGk
 a0Mjp0rkrJ/OfsJpMCj+QRRP6fSSS4MbwEPAQw79K0AoW4nfkmWe1rLIA2344i7N7qW/CykW9io
 WZ8ButDVk+vrYYDI=
X-Received: by 2002:aa7:cc19:: with SMTP id q25mr518388edt.290.1606924528144; 
 Wed, 02 Dec 2020 07:55:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw35Me4ypf82fRYfVH4qop5PIiPzQGkCQEly1ir5lGrYxpbkgf3dZ+Sgq9TiDv0FJvU6GrdAw==
X-Received: by 2002:aa7:cc19:: with SMTP id q25mr518365edt.290.1606924527923; 
 Wed, 02 Dec 2020 07:55:27 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id m2sm252849edf.27.2020.12.02.07.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 07:55:27 -0800 (PST)
Subject: Re: [PATCH v2 1/4] contrib/vhost-user-blk: avoid g_return_val_if()
 input validation
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201202152611.677753-1-stefanha@redhat.com>
 <20201202152611.677753-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ad8b3152-6289-34a6-ad00-4647e204b1ee@redhat.com>
Date: Wed, 2 Dec 2020 16:55:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202152611.677753-2-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 4:26 PM, Stefan Hajnoczi wrote:
> Do not validate input with g_return_val_if(). This API is intended for
> checking programming errors and is compiled out with -DG_DISABLE_CHECKS.
> 
> Use an explicit if statement for input validation so it cannot
> accidentally be compiled out.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  contrib/vhost-user-blk/vhost-user-blk.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


