Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B03E38EF
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 07:12:22 +0200 (CEST)
Received: from localhost ([::1]:35970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCb6j-0000Pz-Ak
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 01:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCb5n-0008C5-U8
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:11:23 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCb5m-0005cX-An
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:11:23 -0400
Received: by mail-pl1-x632.google.com with SMTP id a20so12917078plm.0
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 22:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H9lMSWMtfDH9CZNVvGEUZ79X7WJqnDJQUW5iJxhxVm0=;
 b=rhHR/t+0cjgC9Ucc86yjRkvcNhzzirFlVgtufpYo6GS23UyQ0TC/txSoChzRp0K2qF
 bBvdnFiRFuSTPjxsXDy3Nrf3skU0ILVcyKMv2dYIKxSTKrnFH3DgzOJN7jeVE+L85BDD
 cYXChvE4DNbOSJamitV3rLzVIf3Y68yC0zt9tHwrfzJlugGBvC1igRNaY2O9TN3eOvHf
 RKtNBTCtsiBKLryKf7UXtQCnKSbjTacHQm61VvxhwcVueK9MUOsJiZeDYxvgUUNcew4g
 zOBUAAqaHXxJlRkJ5RS2h/CTHWMWT1zAmKHbaVODW8lWegUeWXVXcfmUdFWupslPnWfu
 VhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H9lMSWMtfDH9CZNVvGEUZ79X7WJqnDJQUW5iJxhxVm0=;
 b=CTFbMkeOKr4chmbIGZckoHKPpDq5AKWws13ICli6HJMMVaoJ722Gyi0iibT0SK3Odh
 e4D7jru25XQUbUFVgZPQhI3oRTNkX9hk7EBtFJFMwnBBlqg1/vYqeDgCjk/tP59jR0u2
 nsTYPUcSZFU8gvGR1x14kqDtr3gF/rhMeFIgVkpBu/UC091QmCZ0/XoYQ7eWe9J3D8jB
 Ag4hAPcE38K2sHQr4WX+rUIhujshilX9z1C/DRqIvzuk0jYNWnqfk90m+X/r+3Dqf3Q0
 JSlGhwET5PW5nhoj2a0X8WxePhFt6f2dGbKaiRf4fem3+oXmL59ftrkjWoQ1dspWPROQ
 YkiA==
X-Gm-Message-State: AOAM530aiCM/DPCySI+i+qiqQ6K77CGzHs4ugUIOV1mHuFzrrZpUBHA0
 Yb1/12lZHEdg8RYMloJSd8e4BQ==
X-Google-Smtp-Source: ABdhPJy/+pzx31SMCJWq7rF2PXtHtG2u+qBOWFhqFMhe2rtkXvQrCaqmDtWj9+Cnrat4Q4c3Z9at9w==
X-Received: by 2002:a62:d404:0:b029:3a1:8a54:728 with SMTP id
 a4-20020a62d4040000b02903a18a540728mr12384982pfh.37.1628399480038; 
 Sat, 07 Aug 2021 22:11:20 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id s22sm15074695pfu.52.2021.08.07.22.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 22:11:19 -0700 (PDT)
Subject: Re: [PATCH for 6.2 12/49] bsd-user: implement path searching
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-13-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bde1f44f-d8a1-4900-e0c6-c6f699d3a8e8@linaro.org>
Date: Sat, 7 Aug 2021 19:11:16 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-13-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: kevans@freebsd.org, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> +        path = g_strdup(p);
> +        if (path == NULL) {

Only returns null when the input is null, which you've already eliminated.

> +static bool find_in_path(char *path, const char *filename, char *retpath,
> +                         size_t rpsize)
> +{
> +    const char *d;
> +
> +    while ((d = strsep(&path, ":")) != NULL) {
> +        if (*d == '\0') {
> +            d = ".";
> +        }
> +        if (snprintf(retpath, rpsize, "%s/%s", d, filename) >= (int)rpsize) {
> +            continue;
> +        }
> +        if (is_there((const char *)retpath)) {
> +            return true;
> +        }
> +    }
> +    return false;

Hmm.  Fixed size retpath buffer isn't ideal.
Any reason not to use g_find_program_in_path?

I note that we don't search the path at all in linux-user/.


r~

