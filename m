Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3259400A6E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 11:24:51 +0200 (CEST)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMRus-0003TI-At
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 05:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRtg-0002Yw-Qr
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 05:23:36 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRtf-0000VQ-AM
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 05:23:36 -0400
Received: by mail-wm1-x334.google.com with SMTP id e26so857306wmk.2
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 02:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h4ulo0LF+GPXZiewFveTEOA2SuSjsFaNK7NO7056wL8=;
 b=J683LH8StH4YDlAn/61MBGWZ+wyxrkA0YsqTHwXlm4lx9AE0Z5jWAqF8tZNLsx2O2T
 YtlUOL3HR8JIHrlSrz/8J8oGhWF3rbBhxbOUoYtWfbYTFyD8Wi9vq1sfoGW0e4y5t8z3
 65m1iNwhgOZt1BVwur9IbV9504rPe47XakRYW9w0DbTW78S8mz0S4C0O2/Zq3kWDBN+t
 P7eklSK6nFUMzma4q7w7QsqfPLxBOYoiwmFIhOhXH+2YrS/LuEuA0c/U6i/X6jaqZ3CN
 17W2fTJN8Kg6bQVu7NhkAHoYH6mVvsKw5l1f5Knb9B7IAWS2SQvXJize/bSbylwHbn0Q
 cDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h4ulo0LF+GPXZiewFveTEOA2SuSjsFaNK7NO7056wL8=;
 b=l/gyQia53l35SefNJ88kMH6qePj8kEwZug+zTTd8cW4dN5wFIvJ/kTeKPswtt5tznO
 OoEZzl9CpHZZ+OgCj4aIQBzfWJVZgcaYT+C9jMyh+f3UrEVxBqmF3blfzicOyucnPD+2
 Dp27csitZJSzDOK+CUmkQoUJEGYPinsmdnPXK5upP6ESez+aFTERta1UaLHEmooZHNVe
 rqGlH/bmA8KBk1f4/bq7pXAgceIlx87XvfwaB/Lz5Vyawp6dfvVIz042HqWamMX/GINq
 ruaqHE0zE3InzdIezNZksqBufkjDcqNUxbtiGhFovQb7grYUV5+BPQ1lzNz2/IbOLXR6
 BkfQ==
X-Gm-Message-State: AOAM530ybtPDsG/pY/N74sy36D+MVkX50MbuykevgDcflGdhGfA03MCv
 IA553D7IfR/sIMNvqnNONKNXKw==
X-Google-Smtp-Source: ABdhPJxLrnnker1NLYtJrPBX5pfXv3NkbUjheSOvYoAyxaj5Spg1YYwCkgFZAVcuoLWLc2/zuytweg==
X-Received: by 2002:a05:600c:14c6:: with SMTP id
 i6mr2497472wmh.99.1630747413581; 
 Sat, 04 Sep 2021 02:23:33 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id c4sm1885030wme.14.2021.09.04.02.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 02:23:33 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] memory: Extract mtree_info_flatview() from
 mtree_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210901161943.4174212-1-philmd@redhat.com>
 <20210901161943.4174212-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b59ff08-248a-243d-9690-0051d59044bd@linaro.org>
Date: Sat, 4 Sep 2021 11:23:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901161943.4174212-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 6:19 PM, Philippe Mathieu-Daudé wrote:
> While mtree_info() handles both ASes and flatviews cases,
> the two cases share basically no code. Split mtree_info_flatview()
> out of mtree_info() to simplify.
> 
> Note: Patch easier to review using 'git-diff --color-moved=blocks'.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   softmmu/memory.c | 72 ++++++++++++++++++++++++++----------------------
>   1 file changed, 39 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

