Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6105423FD7
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 16:09:56 +0200 (CEST)
Received: from localhost ([::1]:53772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY7cK-00021x-11
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 10:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY7b4-0001Le-RV
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:08:40 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY7b2-0007X0-D9
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:08:38 -0400
Received: by mail-pf1-x432.google.com with SMTP id p1so2459914pfh.8
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 07:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i85I+dYuVPAHuwbV0xX0Z9lha++hIdZh5g5ecFZ89uk=;
 b=fTsNYU6H4c5ujL7nKaRd5TbU8itU9zRDO3N8adJBcdEOcDxbymwYMOfl4d8OM/igi5
 BO652Tb5i1y+n6kc4p6nKsZyWDaEkJEJ3JS9SakIqwHP5gAgInCdJvo7PZrnkoNgwDTT
 xKm5oPC3I5FbMUNS2iWfPPlCoIBtcaiWrLoC42l2Bn5xB33aSN9NPS9ZWEmt/tt4hmWG
 3+KIUQHIzSF02k+DXcDHdyGuf/yG4XumMFyl/ICS8AntIhDlawMHzgx+/kdEPcz/Vol8
 3oxKVz+mCayHpH5jQHKiA3bQ1+SGm5aPyV7IAh3OFBte9NP//uGPBv1QYN3e+dOpqYkr
 T8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i85I+dYuVPAHuwbV0xX0Z9lha++hIdZh5g5ecFZ89uk=;
 b=dj7Lv5FtsRsupDGk9glr1ymPdExe2P43d0JDoc2+YkzQMRvJlRQO6eeLx9xnab8Msn
 oB8b58SV2NOW6HRGwIUMfGWn5jfJpzvg86wRvCRNiKCHBPCEsKFWuvQjiOjkYyrFt3IM
 1TP4EwnOcv8qqCl3igEudcZM29FHD2Ae9bwNxgIDU9W8a7xpVUgFq4FAgJRmnjwJH0nr
 dWXIK9BfOfntbm7zXn1X7MDEPaKh18RM7/Ng8MaFPBJH3Y5UXbU4ck3M9+9juc7kliK5
 mwX/gu1fNmc2BehBYIJep+cGpJSpVJuPi4zhZLgnI606Q2Kch2e2vizEmuoxXMhuLC+T
 JtkQ==
X-Gm-Message-State: AOAM5323olrFh/WGKpVdsOE/m9JaU+Dr7uT6OIV5lxIuSybxI7GFAyfI
 aIr9lMGNfCC2RrM8XjtSRtszTQ==
X-Google-Smtp-Source: ABdhPJxfZ1T3N3mPrCov8dHLk+esSoxr+fKsOVHAgdCXS222DwhDc/k4J865Tp2lBQsw5MiFmRMUaQ==
X-Received: by 2002:aa7:9203:0:b0:44c:aa4f:5496 with SMTP id
 3-20020aa79203000000b0044caa4f5496mr2260100pfo.60.1633529311404; 
 Wed, 06 Oct 2021 07:08:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c205sm2098790pfc.43.2021.10.06.07.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 07:08:30 -0700 (PDT)
Subject: Re: [PATCH] qemu-iotests: flush after every test
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211006092726.383737-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc385118-32ec-6d24-9303-f2475e928900@linaro.org>
Date: Wed, 6 Oct 2021 07:08:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006092726.383737-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 2:27 AM, Paolo Bonzini wrote:
> This makes it possible to see what is happening, even if the output of
> "make check-block" is not sent to a tty (for example if it is sent to
> grep or tee).
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   tests/qemu-iotests/testrunner.py | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

