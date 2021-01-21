Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245B2FE569
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 09:52:51 +0100 (CET)
Received: from localhost ([::1]:54778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Vhy-0001He-5N
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 03:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2VgA-0008Pl-TY
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 03:50:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Vg9-000341-Fk
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 03:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611219056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lkcRSGXu69fkWMIqaZM+j3TLHHxebvdTeL8IdimZHo=;
 b=Jj0v2mMnrLF1KQHdmMGbD7jUr+a317DZjkHBkUy0hIPqMmu95f621G41GCVbl6a3jrgOYP
 L+wkC3qrzZ6tLA5G75RZw5ujzzmer02iA3tj46+e/je/fJJeYxZQfGNE15w/UtCJqUFiKY
 esWxSt9lghWyGqorsRweOkcvCTBXIIs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-eVYArUNbOTGCxQzX1b5uIA-1; Thu, 21 Jan 2021 03:50:52 -0500
X-MC-Unique: eVYArUNbOTGCxQzX1b5uIA-1
Received: by mail-ej1-f70.google.com with SMTP id x22so483143ejb.10
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 00:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0lkcRSGXu69fkWMIqaZM+j3TLHHxebvdTeL8IdimZHo=;
 b=GBxcXZEU5erX9hrdMiUY8IM1Fr+8V5vBEgcGy9aBLCjG346JuLNuLAZNtlrUGJRvJ+
 VDkRbAzFsyJcOkaEFYI/xvK/nrdIX4RirLFLqzULcdpp6a6t6lLtEVw6cubT8OOdkIoI
 VFPZ4n4BBNo82EN91sIaFonQCfrXAmzn3hZsMZRHHlo6XV2l6S/iSn30+6YX+NQSzTIe
 NCEEFw28rZRQNBPBq0rcnVxxX2mWvm1fkUa4s4WcZIlLQFX59DwPBb0OmgLqtJbTrfBx
 4BefkWJpoLS2bf5F5EyENgL4g//l/svHa0sj/ZjlUoo4j+OWjVCxl3IfATcEkLidgQwn
 937Q==
X-Gm-Message-State: AOAM531FkHYf8dIZIV0S/tKyIJSdEwf6sDMvJWNFDqKYCh0ejQ0Jdp5t
 ftGCNw2pJv9TxyXFBvOcVYJy3SfbSg6A7ITmiz4aOXzby+ztjuZn+JOnGSCYu9EAJ56239Ws8uR
 vOAa3jTs5Q2dAoFJJMcPBpXuFN00fWTX2BNF46gUwbt3NtYYIH4zsDNqD5SVziKYo
X-Received: by 2002:a50:d7c7:: with SMTP id m7mr9932707edj.260.1611219051272; 
 Thu, 21 Jan 2021 00:50:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWYmyek3Voekxvtzk4U+iIuvJnqLfr1P4vJYJoeLfJ6F4HKhl8N9jIP5PWu6/LicJ7mhs21Q==
X-Received: by 2002:a50:d7c7:: with SMTP id m7mr9932699edj.260.1611219051046; 
 Thu, 21 Jan 2021 00:50:51 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f16sm1934260ejh.88.2021.01.21.00.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 00:50:49 -0800 (PST)
Subject: Re: [PATCH 0/2] meson: Further cleanup of summary
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210120172320.26742-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a25cfaa1-4b23-e18c-8a9c-157eb41c9f61@redhat.com>
Date: Thu, 21 Jan 2021 09:50:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120172320.26742-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On 1/20/21 6:23 PM, Paolo Bonzini wrote:
> Inspired by Philippe's "meson: Clarify summary" and based on it.
> 
> Paolo Bonzini (2):
>   meson: Summarize configurable features together
>   meson: split the summary in multiple sections
> 
>  meson.build | 90 ++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 51 insertions(+), 39 deletions(-)
> 

I couldn't find on what it is based on exactly, so I included
your changes in my previous patches and will repost the series.

Thanks,

Phil.


