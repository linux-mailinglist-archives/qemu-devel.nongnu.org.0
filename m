Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AD12EA84C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 11:13:30 +0100 (CET)
Received: from localhost ([::1]:50310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwjLF-0005Lx-Fk
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 05:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwjKC-0004rF-Pw
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 05:12:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwjK9-0002W3-Rb
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 05:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609841540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YE37l81EdNvJFzULVFl+/GH4S7l7COJ/VMWGJrejulQ=;
 b=EC1m78F7aC5bDUm67lVf/x8IXUKnTZftVwT8T/qPenKVqMt6WY6a871cCaa6Hz5hzaNbLw
 tRhxKX0iLPNZW/hF+xYgo3/5a4kwbH+vB2NZ6hAPX3TLoJMEeBBR6btsjuuCaSWqYyeoxk
 sd8KR2cWPh81hdQsT2UVlPXVCcDScos=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-BGcf5xTaP5W0Ymf1KMrBtQ-1; Tue, 05 Jan 2021 05:12:17 -0500
X-MC-Unique: BGcf5xTaP5W0Ymf1KMrBtQ-1
Received: by mail-wm1-f69.google.com with SMTP id r1so1030075wmn.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 02:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YE37l81EdNvJFzULVFl+/GH4S7l7COJ/VMWGJrejulQ=;
 b=YF8enDKoSUSvPww34B7I1e/qInku0O4656DYaUzQRvJWQC4I1KkjOEwKsTc54O3OC7
 +6hdsRgpgAOO1UEYzUB059JOpruvLapJt9RY1G9qHXJ16x9MgduIWRyW4OVi9CMjRbtN
 K6LMMYeF0vE4O8bzFi5TT0ZBNc3zI70rTVV5WlNVCgitAqeiWHT80ggCY5Sq0/xOBQAY
 4VptcKwy+IUe90QkHUcuvO7iHykIXvHezkxXTLy+FRgtgCVuLB+2rE3BRCXHdA9Xqi1Q
 Wx0ynRnyJW3eCIsmST0zF557KWVK8N8R4c2joxjzKVuY0PIZ2v5PwdCwtlnLE9EZjCph
 hhaw==
X-Gm-Message-State: AOAM5300CL412KDmYbxpCmpya+vk0OQQfUzbZCC4Az9QncmKc7szj0VO
 xIrETjSXh/tDKv6PKIblKF83cIi2OC6od1VvgBEKZwgtHXaS9TVhDaeiyAq1Uoo4ea8jvaaWtvV
 AG65DRYf4LL45VHw=
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr2803486wmm.110.1609841536078; 
 Tue, 05 Jan 2021 02:12:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMnq8b3yxF4bMeT8ifR5XNP28S2ZHzRNFj+3GgP6VUeA0cVEJER6nuoQg8GPvY8cXJYWPZsA==
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr2803472wmm.110.1609841535924; 
 Tue, 05 Jan 2021 02:12:15 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id z2sm3456309wml.23.2021.01.05.02.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 02:12:15 -0800 (PST)
Subject: Re: [PATCH] tests/iotests: drop test 312 from auto group
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210105100402.12350-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2f01d619-b83d-4854-ff15-857264e04e95@redhat.com>
Date: Tue, 5 Jan 2021 11:12:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105100402.12350-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 11:04 AM, Alex Bennée wrote:
> The "auto" documentation states:
> 
>   That means they should run with every QEMU binary (also non-x86)
> 
> which is not the case as the check-system-fedora build which only
> includes a rag tag group of rare and deprecated targets doesn't
> support the virtio device required.
> 

Fixes: ef9bba1484b ("quorum: Implement bdrv_co_block_status()")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/qemu-iotests/group | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
> index e4fb6327ae..bc5bc324fe 100644
> --- a/tests/qemu-iotests/group
> +++ b/tests/qemu-iotests/group
> @@ -318,4 +318,4 @@
>  307 rw quick export
>  308 rw
>  309 rw auto quick
> -312 rw auto quick
> +312 rw quick
> 


