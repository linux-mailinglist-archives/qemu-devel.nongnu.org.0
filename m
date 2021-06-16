Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCF23A9EA6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:11:21 +0200 (CEST)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXCK-0005hk-Sg
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltXAe-0004Hj-3E
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:09:36 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltXAZ-0005Ud-In
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:09:35 -0400
Received: by mail-pf1-x433.google.com with SMTP id k6so2429670pfk.12
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HLYfgZ1fr3PqhKtLKBPwwl4PBSGlt+6gcU0zuQLW3Jk=;
 b=S2/qFcsCuerr0oUN7zzw/AmCkE8iSn8EnW4k7zXL+U3i7TSrNqJfi2ETLXDVAmQarp
 Xmtx+67Bp/+6A10XWunFV33uiuxDLxbG7VxcfB/VJyx30UBjpT2Rf8G1/d9DWxOLpLX5
 dlTZY3xcVNNFbDh2z7XjRXm2b5j51I37voRdHGSQaCBIypzBOURzK2f4GalfEkZp6oxF
 WErPhCCB5glDD94oH7Cu/Alh1lrfSW+ju0zfqlFkg0LIRgKUtuDvuR3JN3iuKqRehMzF
 Uy3EMQH7guPWSbIXdpAY4N9xYoP/TQEvGIuPxKs0U+jzPs/d6lB1sWk4TKBRf/hACj5j
 YSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HLYfgZ1fr3PqhKtLKBPwwl4PBSGlt+6gcU0zuQLW3Jk=;
 b=bhfzoJUKNy/mPbKs9BVXnruDGVgCCJWSlorzTazXON3CjHuak81zzEvfQfjkXpTTGI
 aAlyfeq7V5FcYRmpIX33l1O6v+3oPIy5qOya/goVnWHMtxzDTtgkagASjuMcIY6Asxbn
 uPCtlBuUrMTOUd0/YwoygEi1XBLMJeeChU0e90EN48ygDV95M+rsWWegeoc89QNx5IAp
 CqoFTE7h0LzzFzf59d8nPbZ2IMSMjZQegw0p42GsgdYBJca+kDk86YBKZw6ec6RA+wN8
 z+enuXK+Ku7cn4fAo7vf1hVoPw5Ton2vHpq92Rb/Mx8HDdZud5UOE5Yl714OpGdpil3L
 4rbw==
X-Gm-Message-State: AOAM531hp7OvRnKbTW9/zCVDS38ks46h5JjeegeJx1nyx63Lq1B1l85O
 hbOrXaiRBnTPEi46UlWFTWNu4Q==
X-Google-Smtp-Source: ABdhPJwaLsPSAJROYQiJbK44hLuZUt57rB57hZPtSxOCkRbaWEx+W0LbDl/MFqRThnhyTshXHwBtQQ==
X-Received: by 2002:a62:dd83:0:b029:2e8:e511:c32f with SMTP id
 w125-20020a62dd830000b02902e8e511c32fmr204283pff.49.1623856170087; 
 Wed, 16 Jun 2021 08:09:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k1sm2483920pfa.30.2021.06.16.08.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 08:09:29 -0700 (PDT)
Subject: Re: [PATCH 00/21] linux-user: Move signal trampolines to new page
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <87pmwlg88j.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55b09291-bcd1-3336-3bb7-9ca3c14b7f80@linaro.org>
Date: Wed, 16 Jun 2021 08:09:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87pmwlg88j.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 8:05 AM, Alex Bennée wrote:
> However qemu-hppa (on x86_64 host) still has the stuborn 1% failure rate...

Have a squizzle at patch 8.  I wasn't able to do anything with hppa yet.


r~

