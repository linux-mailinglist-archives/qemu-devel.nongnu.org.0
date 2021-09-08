Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B07740383C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:52:32 +0200 (CEST)
Received: from localhost ([::1]:37508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNvBv-0003oH-CR
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNv4e-0000VV-1M
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:45:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNv4N-0001Om-IY
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631097882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NfxnZRoNEBbXZyZTffxoqsT8FYI0ck8BahPw/wlYR8=;
 b=YPTi4Ax4/br23lkkjKFzCMeim2gdx3Ldf1N3WlLP3E9deZnCEh8U5smYBPrYTFGyOjJU/y
 EOO5GS9jNJDCaMpuLGP9mVmJJWDi0NA93CkvKV95Q85Nfu4jvK3p6jcfSqM0HTJX2B/Nfd
 FScbSdOuvJ/CSfOiUC0Co4UCYM2RnUw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-BXG8d2FSPNqG3DfkX4bQlg-1; Wed, 08 Sep 2021 06:44:41 -0400
X-MC-Unique: BXG8d2FSPNqG3DfkX4bQlg-1
Received: by mail-wr1-f69.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso370394wrn.19
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6NfxnZRoNEBbXZyZTffxoqsT8FYI0ck8BahPw/wlYR8=;
 b=1v+czkJf5CMPljR2mvgSJkvUKnO1rrpY5eTNvIKVCyscDTqU57yog/X64Lt8fyZWDb
 Ko0vLMsGJHsBLGELtr3bum+KyUxJBNsbREwKKNgb40d6JWFNe45UFZDgmIwWdbuW5tjl
 OqOK6zGBbNwRdWWusUYufaWD+aXZ1jsdThK9bf6AHOhEvMDNuGBw8Zf1hYrG1BB82cjI
 +8SpWrf4l8WHDPNFkrDOuK20RCBmS/Bp6o/xapi8V9jYmI0UK6hA+Xj4F+7m1K2D5jI1
 XcmbbiZ0IkMY4KWGQBz/FaU4kNG8Jv6piW2R7Rfx9n+zkkwbPpVr4frWuaSAkXn8YSph
 DH5Q==
X-Gm-Message-State: AOAM530eVxBjQzgUTrdS+36qTv2FE2RsbeUipdkM1xuklBzznGH0ssOd
 J3pOyAYEVnREipe/JDP7C+cN5yEgl58B5s3p/+ReaHGZE2fRFPEk0Zes2vHPOJGu5ue0ZBnOhyR
 OBOIpw7l6bSbUYRE=
X-Received: by 2002:adf:c40f:: with SMTP id v15mr3173035wrf.316.1631097880695; 
 Wed, 08 Sep 2021 03:44:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjZ4FOGlBohCJA6JV45Qw9/yVTH1VCVCCOHnvzk0/Q9IKHdeJXqBHmcaIzEoCs2ciiYtTQoA==
X-Received: by 2002:adf:c40f:: with SMTP id v15mr3173015wrf.316.1631097880527; 
 Wed, 08 Sep 2021 03:44:40 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o7sm1598516wmq.36.2021.09.08.03.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 03:44:40 -0700 (PDT)
Subject: Re: [PATCH] meson: do not use python.full_path() unnecessarily
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210908101332.272955-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <41181075-ead8-4e20-12e2-bfe37927e2d1@redhat.com>
Date: Wed, 8 Sep 2021 12:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908101332.272955-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 12:13 PM, Paolo Bonzini wrote:
> The "python" variable is an external program and can be passed
> directly to custom_target.  This avoids the need to look it up
> multiple times, which was previously silent but is now explicit
> in recent Meson versions.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  ui/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


