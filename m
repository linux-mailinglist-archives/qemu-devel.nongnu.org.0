Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5873C1A72
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:17:32 +0200 (CEST)
Received: from localhost ([::1]:49014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1aSg-0001rn-Ut
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1aPn-0007Rn-Of
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:14:31 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1aPi-0007tG-W6
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:14:31 -0400
Received: by mail-pj1-x1029.google.com with SMTP id fs7so4426393pjb.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sl0t/ZbeSlRbz6zPcIHrqMLm+QPdWPVJ0nF2fogNLyQ=;
 b=vJK5xVUTBInaXCHDof6YLIZlly/hkjG7yJk6o86FTGGQrZ82yTE0hiyNLNZv4XfDPn
 u8OJ3izo+Fs6AzT29UlQnjXYKwqc8zQ2HDLW5Fz4DPZKBRRuUiJOTYD623A+RE9PUvJh
 7K+0dZ2ARqnIBBrSHemNJVSbIN77MAibE0E1W5F3wKCvB2oP0iJptQ/DBA68aW13ldzH
 dmoox/ySfqNt7ymVMTbyAhGX0E4Ou8I4vRNHl3lYdowhLZ1+MV0us5YHe2Dhomyc9FJP
 0lPO9Uq8ZxC6k2mBV01ugg3EA2uo51TmFSeV8Ik1S5rrXXL862f44/X+dutNXnIMacYb
 VEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sl0t/ZbeSlRbz6zPcIHrqMLm+QPdWPVJ0nF2fogNLyQ=;
 b=ONxoPqQVITSMUm8m7i4BWsmbObr9WLvdiCvYN46bKWxaueoNhr1ZzwP2jrg8l+3qgO
 50Xb2rRX+4nGeqSV03Zm+wZAagVh3SLjUx2b/r7pO/GVjLuHXSyxL+veehhBynlqLWWj
 psgmuG7b7aP0g8lbjRoda4oYyTorH9WfKEZbe9f2mHAQ6qTI9XL8kxNN1WkHry98+Wad
 uwal/JZcPzEqAmQiuQY5oNtQXkHopleM0Fx7N9H0kCAKlCuf6cENs4mHf6hAvn9le3UW
 wRkxHzVTtZMXIz3Bp84qgQLaxa/2lNSONORFkjWL45dyEfDdijggK5Iq2erswFmCwNnh
 9GrQ==
X-Gm-Message-State: AOAM533qVYUCgpBYj7ewGSXK2ANIk1ySOn3OEDL6zuWibZblfnm8TALJ
 4D7qevHREQQ8sLGG3DQjK8dQJQ==
X-Google-Smtp-Source: ABdhPJwGT1XV1jyNMufcolaD2fQNgKknayO/UW2SoMhJquwoYC4suWpREGVvaq8alalDpNnsyvbuHA==
X-Received: by 2002:a17:90a:8596:: with SMTP id
 m22mr6643405pjn.110.1625775265269; 
 Thu, 08 Jul 2021 13:14:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id f6sm3448889pfj.28.2021.07.08.13.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:14:25 -0700 (PDT)
Subject: Re: [PATCH v2 06/39] build: validate that system capstone works
 before using it
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210708190941.16980-1-alex.bennee@linaro.org>
 <20210708190941.16980-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce705c10-42c3-7ec9-a4f7-1b6f7df7718a@linaro.org>
Date: Thu, 8 Jul 2021 13:14:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708190941.16980-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 12:09 PM, Alex Bennée wrote:
> +      error('system capstone requested, it it does not appear to work')

"it it"

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

