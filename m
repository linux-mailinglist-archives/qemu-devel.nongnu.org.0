Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584FA3A828D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:19:03 +0200 (CEST)
Received: from localhost ([::1]:36042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9uA-0007bt-Dn
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9S1-0001gl-JO
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9Ry-0000Rf-Qz
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623764993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4Ymf8vBaupi5KALHiO3BbtFKLl/hdmtaAEm7TUO+Qs=;
 b=TQJEU0bdNUqdY09n6r4COjOv0vFKjT4nfJ5eylhlr6F8oVPnYfhb/35Hg9VHgu49wSCFYX
 ASljRxt0ytgtSSzEDNcdA3CVg2IcXoZwaEomh8uT8qaHgnPFB2Nmiky+O8rVXcCiTCEGDf
 OsFOUw0DDKSFXqQhUMkpRDg7VliFNMM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-rBdL0sF3MwqHoP8cRWftJg-1; Tue, 15 Jun 2021 09:49:52 -0400
X-MC-Unique: rBdL0sF3MwqHoP8cRWftJg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d5-20020a0560001865b0290119bba6e1c7so8621718wri.20
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y4Ymf8vBaupi5KALHiO3BbtFKLl/hdmtaAEm7TUO+Qs=;
 b=QuYjpFq1p0LIpFEg3qku4Mg6hmDguEPZo0I5DKnJLKBGIESp/+o9XLP/rFkvXOdQpg
 g1le1Cbpgh4+6GdBI153mmjBxRv7fXMfiIv3rPTEgAbB8mSPDcz4958mkehNNMqG3TKx
 rfAinPYLlCpeFhPEUdVgUj6jdtDFdNOvHUuGSPubrBUxSLsoFyfGyxJ9fx45J0NZFCt7
 2TUxlt1NVbUdj/HCzkBVM8ll3SVM9s96Jkid+m+xLTUvx/RMd5IwVWeIQagJVq9dXVWI
 VZ0Pvsnl31+lUcBGmXmwViBUsH6vjery4GhKSOjU9jzChU/8JeGptyGmGFg5b807DJCI
 FIEw==
X-Gm-Message-State: AOAM533rF0zR/GQwqOTz7yDIzSLpS1M8sgOmRrj6fuFxlVJir3McQ2Yx
 n2KVozTb4/1uUZkCkECszgu0y+IzIbk0SttK71cqoYmZpNfPv7jSHuZidn4Xhy9Spc62I8b+lJg
 yjSaPuLAvWaFIS4k=
X-Received: by 2002:adf:f842:: with SMTP id d2mr25241451wrq.52.1623764990988; 
 Tue, 15 Jun 2021 06:49:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiKtpRC2u230yqYQ905SCIYDHPLL6O+66OnE7Tvo+Ix57u6AmZPiJs8y6SaX2nxd1R6LPshg==
X-Received: by 2002:adf:f842:: with SMTP id d2mr25241430wrq.52.1623764990811; 
 Tue, 15 Jun 2021 06:49:50 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w13sm15563003wmi.48.2021.06.15.06.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 06:49:50 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] configure: Use -std=gnu11
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <86fa916c-dbf3-15c2-8b0c-32a8d013ef2e@redhat.com>
Date: Tue, 15 Jun 2021 15:49:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614233143.1221879-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 1:31 AM, Richard Henderson wrote:
> Now that the minimum gcc version is 7.5, we can use C11.
> This will allow lots of cleanups to the code, currently
> hidden behind macros in include/qemu/compiler.h.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure   | 4 ++--
>  meson.build | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


