Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832892F9EE1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:58:21 +0100 (CET)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1TAq-0007VA-K1
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1T9n-00072F-2D
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1T9j-00033b-2U
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610971029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TcEY3pYDwFjtnxcjqjsKE03vxQ7uZBFnc59Q61v8Fqw=;
 b=hq6MJ8svnZtwxDWrqkzQ6pILz+dFwf3CRfYMGRDYchY7iKwkCf8S8wrihfAwK9KIyzyvNW
 tngmiFQzhuROularvI3W3H55WAgLFMF0qIGchnQpZkJT+Nqv13hYd79xJ/J9W8XLdWUm6K
 wPSzMhGGavBUrDri+rd1dSpVvvgldpU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-RSgdpguPO4atRC7c3FFfKQ-1; Mon, 18 Jan 2021 06:57:08 -0500
X-MC-Unique: RSgdpguPO4atRC7c3FFfKQ-1
Received: by mail-wm1-f72.google.com with SMTP id u18so4360077wmu.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 03:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TcEY3pYDwFjtnxcjqjsKE03vxQ7uZBFnc59Q61v8Fqw=;
 b=V/wZLyS9B7bJVQrLNF6aptyfp7Fz7r8jjzzw0qZpxT4Jo+u9NYTq0/AWMzIiX8jr7l
 Bw5b6shog5MpKVUhZ4sT1Cb5Q9SHFKDceCXMlJxzx4KOb3Bwry0Tif+quy1tVP60rlwZ
 dahZUWH/O9oqOLnRfLS0MY96KN24VYObPD+nIEzQ9cOgixz4a/D4KA3H9a/XcrNQdwig
 32+sz+jw8LkFsa2fToC8qyljHnFcOzWBGirmiN5OyiRlalywWMnV6A8BASnvfK+zQxVX
 OqdeFOc9UWLMeiJ9rLfbpMbI2WP7c1tYOfuyF/mymy7F/kTEmcUAD0tzERvOLNU13yzL
 3aFw==
X-Gm-Message-State: AOAM532bJh/0bDQRC4UTe3NYvbjmpWbfenkgTjjpw2Qw1JmxcdreQnaR
 R7D77aELAvJfLHaJtldU/SaukbYB0/yw3zyvoTC+NvjqgiK/9jI9x3gMPhS3srI7+z2ajpfSR0o
 AXUU2NxbLrs7HkAY=
X-Received: by 2002:adf:e44f:: with SMTP id t15mr25387622wrm.74.1610971026652; 
 Mon, 18 Jan 2021 03:57:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlXrhPusS/0XHCY2sogGLwB6SQLUSvFSS9nxNQedzfPjjFcBaHl8pSuKtJgXVqOZu3KdPoMw==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr25387604wrm.74.1610971026487; 
 Mon, 18 Jan 2021 03:57:06 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q16sm20178443wme.1.2021.01.18.03.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 03:57:05 -0800 (PST)
Subject: Re: [PATCH v2] ide: atapi: check logical block address and read size
 (CVE-2020-29443)
To: P J P <ppandit@redhat.com>
References: <20210118063229.442350-1-ppandit@redhat.com>
 <cdd8168a-3362-e038-8e7e-0a082a2f1917@redhat.com>
 <4q98o1s-r5r4-14s9-nnr4-4p2q16roqro@erqung.pbz>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7b7771b7-cdba-01a4-67a7-c9cb3e9e33ca@redhat.com>
Date: Mon, 18 Jan 2021 12:57:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4q98o1s-r5r4-14s9-nnr4-4p2q16roqro@erqung.pbz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Wenxiang Qian <leonwxqian@gmail.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/21 12:44, P J P wrote:
> To confirm:
> 
>    * (uint64_t)INT_MAX << 2 is => 8589934588 ~= 8.5G sectors ?
>      Media size would be:
>        8.5G * 512B(sector) => ~4TB
>        8.5G * 4096B(sector) => ~32TB
> 
>    * We are limiting IDE media size to ~4TB/~32TB ?

s->nb_sectors is in units of 512B, so the limit would be 4TB.  The 
purpose is to limit the lba and nb_sectors arguments (which are in 2048B 
units) of ide_atapi_cmd_read_{dma,pio} to INT_MAX.

Paolo


