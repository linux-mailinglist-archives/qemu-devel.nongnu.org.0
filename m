Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CE82ECE8A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:19:29 +0100 (CET)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxTKC-0001nw-9q
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxTIF-0000aK-Ly
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:17:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxTIE-0006xg-46
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610018245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sY8ePCK/rUwNpZJbsS46Lw/tlMgVge6e0ZPh2u2ml4o=;
 b=bXbhrOEjmRmk0Z57oaLYl6dYUrFKtJm4CI/XBMqc5ZUxBCMF/fIADC4CyZWGzKxBRrfQ2/
 MATwpwxqUMR7GU4bpsWGvCCudZITEpT6RJiuTudUAH+P28ChgyTNS/iuB1/3Q/kT+2/66R
 mgm+Y1OklS9hnQ9MBQ/KtLia4usLyJ0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-VoyhYdtzOQOCaRifZdt_Jg-1; Thu, 07 Jan 2021 06:17:23 -0500
X-MC-Unique: VoyhYdtzOQOCaRifZdt_Jg-1
Received: by mail-wm1-f71.google.com with SMTP id c2so1615999wme.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 03:17:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sY8ePCK/rUwNpZJbsS46Lw/tlMgVge6e0ZPh2u2ml4o=;
 b=bHjjB58Y3c0xAEoq+JxO6z3woOIve6NaJJd7YgMYZ2rW5qlSmbpMUjEi0C1W/hyPsf
 N/GMVJhyYKgfCcckunuWC7Sr4N37ueQfuT5Y3yHdI1DvQfzbLNJKqkLU+ny+Drete0/b
 FJlCIFh8qenS1En/oZiEf3Lgs5D+CdhQnsSTRJMh5/zdR3O12g+O3zpyDPygUsGel5er
 BV72DVZijVbLvESFEheVZBG+WWGxbqbug375pHbxXR+mbhFvyvuiv3qvLjl/b3xztpTw
 YgvpDSXbWzjWjQmLNEOowCruwTBOJDYfrtIIEbKKNI9BzdRbuvipfEaMotcrVdb73UY9
 XjUw==
X-Gm-Message-State: AOAM530ZDWFGZTuCYmNVRCQkzXWTkND0h7WR/DZK/A1d24vhJ4QJebI/
 jSOFdSE/e502UsE5mbRsjUHQcCMHfjvmeAdo2y7Sw+Yzf/7q9ivfzFATbk5RtwkWK3K32W1TX8l
 2vIUtg8jfaFgEgoo=
X-Received: by 2002:a05:600c:40ca:: with SMTP id
 m10mr7494444wmh.54.1610018242240; 
 Thu, 07 Jan 2021 03:17:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPtkQMXNrvKRifnccH38BN9XMwcyCQvAqqJ/ySd5KDyvDnteM3nlUrY3T2luORvCiZl8ujgA==
X-Received: by 2002:a05:600c:40ca:: with SMTP id
 m10mr7494434wmh.54.1610018242033; 
 Thu, 07 Jan 2021 03:17:22 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id t1sm8339990wro.27.2021.01.07.03.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 03:17:21 -0800 (PST)
Subject: Re: [PATCH v4 3/5] maintainers: Add me as Windows Hosted Continuous
 Integration maintainer
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20210107101919.80-1-luoyonggang@gmail.com>
 <20210107101919.80-4-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <69be74e0-9202-7755-c84a-bae800ff89f6@redhat.com>
Date: Thu, 7 Jan 2021 12:17:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107101919.80-4-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 11:19 AM, Yonggang Luo wrote:
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)

Again:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


