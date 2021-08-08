Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBEF3E38B4
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 06:49:57 +0200 (CEST)
Received: from localhost ([::1]:51326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCal1-0007Fj-Tz
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 00:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCajl-00062x-Ey
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:48:37 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:45604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCajk-0003KA-5B
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:48:37 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d17so12796677plr.12
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 21:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yLQxp7E4OvpyNp5nW8k0hUDNpYw1Kh1RcS2sF3KXJ7g=;
 b=CvslvgjY/OMLHDUOKm4HDS9WNjQfBHeDWJv91LItLWVuM69ZQxsAIj+izY5U8dLejd
 22v2K3z/LHe4R4Zz87fx5rj9WkzHhNwUWGDZRUNiu2J0CLYOLF4Go4fbxfC00+xwegzm
 IhRRbxJUWwVzR5MwAyfwPA8iF/LNwk9HTHJyHfPuYGvmmmtLKKbWzVWyBw9tDVRCyNvp
 azdRPAsTHBvoR+QYwRUSmlf8jFpZGzGdxcLSgjm9WIq2MJJxDohzUUlTHg4ipyz2Geny
 6sbXd69nvsZ4S1iXOu4S+Yq5D+Jyk+AgYMrb/szbMZeufT5P7ZTdcopa3mkaMz5332Ik
 PmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yLQxp7E4OvpyNp5nW8k0hUDNpYw1Kh1RcS2sF3KXJ7g=;
 b=Mz5q3vf50kMzIPh3u+mKH98wPuRf/33ntBkwyJx/w83JE3mImKMXlGNSa+yPS7tasG
 bA/MRZHPU6i32Klx6nAEE5ilPICUEqLuFurSYfPc9xQ6PdSnvAsb4u2EkRp2nHIv/EkE
 gmYzwhjKkIwMwr9+gVPad/UeDK/mlfE7ucD9Vn7Bb0gA5ZyTAVa5CSpeTUxUBLdlcrqZ
 dcbDEIVTTbtnTTqrrCy38kfZMW4gBcWxLqeHV9AylgohmyaooT3cd5BywSiVesI2dEjw
 4pmzGiD1LGCWtybM8n827eDRko33KhO13UiVXzXTvH5xwRRB9SomT8nLE0nqtFrGKj0Y
 PMSg==
X-Gm-Message-State: AOAM531UkGEl+1L26ia5EaoP/C80vZ8SuHGIQQpfAjZuJ33gUvbQSBv8
 HUm2gYOaSqXKHVsNJpIw8RRqcA==
X-Google-Smtp-Source: ABdhPJwsPKVLLyxlBWFx3lvoB6dTOJaTQ32DPhl8SGaXtC9XHGmYV7mh5ZnzCiA14Ejy6BGFOO/AOA==
X-Received: by 2002:a63:b91d:: with SMTP id z29mr1442303pge.436.1628398114227; 
 Sat, 07 Aug 2021 21:48:34 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id v10sm16888273pjd.29.2021.08.07.21.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 21:48:33 -0700 (PDT)
Subject: Re: [PATCH for 6.2 10/49] bsd-user: pass the bsd_param into
 loader_exec
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e9e8f433-756a-efef-4900-73b5309865c1@linaro.org>
Date: Sat, 7 Aug 2021 18:48:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-11-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> Pass the bsd_param into loader_exec, and adjust.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsdload.c | 37 +++++++++++++++++++------------------
>   bsd-user/main.c    |  7 ++++++-
>   bsd-user/qemu.h    |  3 ++-
>   3 files changed, 27 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

