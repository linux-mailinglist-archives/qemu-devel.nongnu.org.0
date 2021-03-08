Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC8B330BF1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:07:38 +0100 (CET)
Received: from localhost ([::1]:59940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDjc-0002QN-Vo
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJDif-0001xY-O4
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:06:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJDic-0005nr-WF
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615201593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GgkJgxymXep5YPq7cau2hFF53XlvkVyu2QWB9GbP6Mw=;
 b=AllrcKnp3D0qo0co1es1HdSBlu7QXGKvXCmMVbbLfPKmxe9AIoXCT1KFyNEwE2Mkj6JGDq
 0mHitKwJqBQoxF1UJkV3n1RPKtJPpqaYoe/ThHhEe88KVoXzNmeCFO3ZYuv63LqPmjz8rD
 NN1fEvqixp7jd2F9QwlOvRxOpZNzvm8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-NV9McTCBMTKL5aE7RX2FzQ-1; Mon, 08 Mar 2021 06:06:29 -0500
X-MC-Unique: NV9McTCBMTKL5aE7RX2FzQ-1
Received: by mail-ej1-f72.google.com with SMTP id 11so3897444ejz.20
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 03:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GgkJgxymXep5YPq7cau2hFF53XlvkVyu2QWB9GbP6Mw=;
 b=igpG0GiRwLjA/KAL2AH4rDr1+TQdYbz786sdZkjk3jxdLkbtGq8nmyXwsq8G+1DAob
 eZlY7E6Sz9XdjUNltMLCVvbkRo9PNaJ5Gw/EU689+G/4K6mGKz2kUyi92go7D2uJiOZv
 azV4gddQRZOi1nuSbWeGUkuQp3n7un4DVMSqmk/zTGDnXdYvf5fj21WTDLbyt5t3NWr+
 C4KGP43fudVD4oIe8mHc4TWzoaeBWjmxI0gVEHjMLNtb0cH8ejz3Iq045lD5LSEy26Lv
 6r5xNlPqohoA8W17HItix4415ELKUMPQu/yYTEhWD+w7BXpwcZWY8bJrwLp2Xxmy7ljc
 tYIA==
X-Gm-Message-State: AOAM530t94Facstp2W379kgkbpTbhCyxqy96/AtAlg1bRBuvdLgBng3O
 /w53gl5VRTwIySmV6pVRYI6dB/jlJhoFHdPApUs987HG9tLOUyuH1kweGgg/DRjVwomE6Wm/hXM
 mEtfZSU2AnU/+cow=
X-Received: by 2002:a50:c00b:: with SMTP id r11mr21717616edb.35.1615201588023; 
 Mon, 08 Mar 2021 03:06:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpkwaLbsiKSca6nlzg3xwdpKLJiYq43Ep5GuzQ9Kxy7TitpJHIpKZjP9w8svaoYetILoDXoA==
X-Received: by 2002:a50:c00b:: with SMTP id r11mr21717588edb.35.1615201587831; 
 Mon, 08 Mar 2021 03:06:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ec18sm6431198ejb.24.2021.03.08.03.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 03:06:27 -0800 (PST)
Subject: Re: [qemu-web PATCH] pages: update deprecation policy links to
 "official" manual
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210308103049.3653-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c12c7f44-4358-4373-f5fb-8720ef5643c7@redhat.com>
Date: Mon, 8 Mar 2021 12:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308103049.3653-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: pbonzini@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 11:30 AM, Alex Bennée wrote:
> The links are broken now so lets point them at the right place.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  _posts/2017-08-10-deprecation.md | 2 +-
>  download.html                    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


