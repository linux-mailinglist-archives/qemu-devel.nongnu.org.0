Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4639FB26
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:46:51 +0200 (CEST)
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqdwI-0008PD-91
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqdu2-0006vj-K0
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:44:31 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:43835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqdtz-0003TT-Lg
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:44:29 -0400
Received: by mail-pf1-x42b.google.com with SMTP id m7so3070164pfa.10
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 08:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QUvIIl4ps7ItzFB1OhtxGQsoziUBim5yEh4m1+ySsU4=;
 b=p6KdQttUDJbt2JfzLsIJpN1yJn1IVIP43uIn7COgjXZ4kNwCrsgvGkoBQwRpYI/1ID
 eVIUsCVdgKA3jG2pJRYKg0HLhytGqO/Qr1BwAPcWJvWkJz40WbTVjTF42K2ybXQ0DMI3
 JPIYplrZ2M/V3bnOspSjSfroeIQ+GIXRFT5RGRanniajcxvGgwGZS/QUmhE4rfxG98zy
 57OV9lg3aDki39Z4oX0y20+dyiuaTaOB5WtBoX1AcghQFMbP4cLj2qKI4oC0B5OhkoY6
 7inYIMd7lTQrAIGBIyXiritR+TrAGIIh1Iv6usyDPAAF8fppp+Dz4ElZEvwxvfqJCc71
 vHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QUvIIl4ps7ItzFB1OhtxGQsoziUBim5yEh4m1+ySsU4=;
 b=GZB+PfovbGFNyvJMKVz2eQM0sjOACdd9oLvC86z4WmCu3R2f4fAgQv2gTxf+8aLBxA
 W+8LfH1CVOEluxYCC3eFcp9Q/0YGFHyl46mC94da4m9jQk79mWYc2fWFZXRnsNBb1YjO
 Gw55N5+eeq9OnjBFcrWdrqDml8CQPmbBmfIdmWuXKnY4WkCkGW/qlp9m4ShkoSDKRpjz
 aWp35GyEQQDy8KjWRzboi9Xv7+ZWEyLpnDVRNHsxQ4fzd3UONNgwmp+YslnUkxGiw2ly
 R97iTixDo2f7VS9f8DdD3uS1BcWvwtSqobGoMhxw3yJvo8qQbW1xSWoLIHjOZv0VPGJN
 U7rw==
X-Gm-Message-State: AOAM533XkaXkLobCGbIgwpVj0yZO1uKWuSEC9Xlw/AT0mk7AMS/iIPM8
 zIQ+6JzfzZNoXfEgbCXqu/D1xlmUrSYsNw==
X-Google-Smtp-Source: ABdhPJx/0F6v/FpPLupoI1oVIU+tVTijsUavJD1ns2gzJqJ60rmGDWAqAR5qNf+m3WZ7i9uebPp4Og==
X-Received: by 2002:aa7:860a:0:b029:2e9:f8cb:489c with SMTP id
 p10-20020aa7860a0000b02902e9f8cb489cmr268642pfn.50.1623167065857; 
 Tue, 08 Jun 2021 08:44:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a11sm7513806pjq.45.2021.06.08.08.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 08:44:25 -0700 (PDT)
Subject: Re: [PATCH v3 04/28] tcg: Remove error return from
 tcg_region_initial_alloc__locked
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-5-richard.henderson@linaro.org>
 <87eedcmx4v.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3743c7f3-7c06-b70d-5598-a11a14030df4@linaro.org>
Date: Tue, 8 Jun 2021 08:44:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87eedcmx4v.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 4:04 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> All callers immediately assert on error, so move the assert
>> into the function itself.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> The change itself seems reasonable although I do find the return values
> of the underlying tcg_region_alloc__locked a little confusing. What we
> are saying is the initial allocation should never fail but subsequent
> allocations aren't actually fails but creation of new regions?

Sort of.  If we get a failure during initial allocation, it's because we didn't 
actually create enough regions (ncpu > nregions).

During the normal course of events, a failure indicates that we've run out of 
clean regions and need to flush the entire buffer.


r~

