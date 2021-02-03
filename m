Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EE830D609
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 10:17:27 +0100 (CET)
Received: from localhost ([::1]:48916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7EHu-0008AJ-LE
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 04:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7EFg-0007B8-GN
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 04:15:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7EFe-0008IY-Ts
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 04:15:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612343705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RaVwxGt96s4ZGvreNmq0jPBb70fILMUVJP927xSq/os=;
 b=S2vnkVczWbXtQNdcCZkcviCs5yYDgTXPriOFqZGTaucEek4BfADElpy508mS3P/q3hLkKg
 YBj9gynJrEqcBZnjotjlvM4X46tzZc76N4U+AmgYGsirVO6v7uNiZoirsSjp0IoUST1PGq
 LkXc7W4TC+QoTtpaj+Q3yhVe1hgDnfI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-A51CayFBNkOYo6qXHHdTMA-1; Wed, 03 Feb 2021 04:15:00 -0500
X-MC-Unique: A51CayFBNkOYo6qXHHdTMA-1
Received: by mail-ed1-f69.google.com with SMTP id j12so11038768edq.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 01:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RaVwxGt96s4ZGvreNmq0jPBb70fILMUVJP927xSq/os=;
 b=oE7/o6o0XZ2D5WPTDi2ymDYH9hjfZ/wFhaE6fJ1PMZLlDRfYmpivOcvgZXnWcCMyHv
 LgnWhMP/RcLsx2dznPDAxO/+X68DuA7ZwcfiwdYmYIR4Q8mvJjg47kyHVly72tVM32UZ
 iKpjviS3WrbxpmEw87ug9PToVgc4YiUM+A5IdWPJtUXpOv3/FSXKOAuWuK6DxXi3441P
 6FWwvMxrYKBkXOhwOyFVwEDL8KPIQ27YGup/ldB5w0LM5I492dKF2rpGcYMWkWyCwv8j
 K4I6yWK2CaL8Xr0ewuElwil048cXHVkNdynhPJeriw1J2dXKZxjZjwZhnkimQE/PVBXH
 kzZA==
X-Gm-Message-State: AOAM531WB2+0Srza//is3DPDUM77qrJcYXVCnlr2IpKlkLo5i0XcCEgP
 WJyJtIzWQ47kAeTFXzPuxxKUQ9A/eebZicnvKwi2+oEJqJyKyOEsoBkmSRbwk/0mxkimfBj55X8
 EGPNfqKfW0/SLRmE=
X-Received: by 2002:a17:906:364b:: with SMTP id
 r11mr2255330ejb.447.1612343698757; 
 Wed, 03 Feb 2021 01:14:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPI1Ty2c7xkhGQPlAqhuz/Y2YudRi/8UhJXOwjVYJaZiKqq1ft6V/wnaRo1RvXDt/wWUSxug==
X-Received: by 2002:a17:906:364b:: with SMTP id
 r11mr2255296ejb.447.1612343698463; 
 Wed, 03 Feb 2021 01:14:58 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id z2sm706331ejd.44.2021.02.03.01.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 01:14:57 -0800 (PST)
Subject: Re: [PATCH 07/12] scripts/device-crash-test: Replace the word
 'whitelist'
To: qemu-devel@nongnu.org
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-8-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d0df88a5-db8e-4799-eb88-060adf65f6f6@redhat.com>
Date: Wed, 3 Feb 2021 10:14:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202205824.1085853-8-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 9:58 PM, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the word "whitelist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  scripts/device-crash-test | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Eduardo already sent a clever patch:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg778534.html


