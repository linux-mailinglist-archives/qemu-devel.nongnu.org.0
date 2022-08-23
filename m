Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB8559EC10
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 21:19:01 +0200 (CEST)
Received: from localhost ([::1]:36704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQZQS-0000fF-6r
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 15:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQZNp-0007V3-Eq
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 15:16:17 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQZNe-0002sV-CZ
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 15:16:17 -0400
Received: by mail-pl1-x62b.google.com with SMTP id v23so8380032plo.9
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=uGxArwSGAD+Hw2cznE68O7gWHPqGcT+Wv0sOclzA1p8=;
 b=BMmjT63i2GHXFSaQJ7S/iGzPNcIWG62PWTjLvuBGVOlFHrmzWEGxa2cHr8lF+Mi+Vs
 9WywisHBwPevipXdZ3lfH5Nh8Da8WnsaU00N4CmQHuBTt+Ep//Ij0kD5d3pmDbgRGOpp
 zOk/Rd0xdAFfAibZU5RlT1LiaKKwfjxntDhUI+GocmYzAM5KvEi15OOD4qzjg08S7web
 QvTTUr6HDn2ZtX4n70WykywV+Ma8yXHRbVXKSywqvkQOoH3fzbg44fLO73x1UZjhM03g
 cjO081+LBYbx79KwVynZYBLSOddxuwx68+51bAHnuSnBtFPwqdIiK6fvSu7m54l0Ft6K
 lp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=uGxArwSGAD+Hw2cznE68O7gWHPqGcT+Wv0sOclzA1p8=;
 b=sdLyZAveb1sINwghFTp7n1AoFRd7VKXgbgI7G8gCO3PstPPlt4HPc1Ge7kxlWD5RMW
 aLuCkspmeCjmCWajlAE2NQ9UJ4/ApM9OUYnrm+86a3qr9dYsq2hA4LAzF2xTVhdj2fYQ
 Jp7II/9C3TB88kxkMLtfwaRWZIVC9LYmmuIpicrGUJcFQgdVdvhsk8p4ItzSVi7QwMT0
 pcU20kpygO0dnALUVqA1Qpiw7t4N80Fme/8c7pXzNHbO8TnGMXY6wvAWnMoOwYGNfIfA
 r0deslUjmDFAdG6mGgduqx9iguPAd7XrKIctLKJe6pPryylY14VfpajN8fkT1+YMmSti
 H1Og==
X-Gm-Message-State: ACgBeo2YFCMKDLD1H98eFsKhg7WOJoyd4tqotHeSs1uqnWEFxO4vQ/Qu
 z8JU57TEWLwo+q+5gyKfnzI1KQ==
X-Google-Smtp-Source: AA6agR6H5hPODMLav+ziHhGOr5hbmGmfzMQxdj/BgcDIK4165FLJ0SHlBOuWFRX210J9GxyaBy7Vmg==
X-Received: by 2002:a17:902:e0d1:b0:172:b20d:e674 with SMTP id
 e17-20020a170902e0d100b00172b20de674mr25286258pla.104.1661282163881; 
 Tue, 23 Aug 2022 12:16:03 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 lt8-20020a17090b354800b001f5513f6fb9sm10368406pjb.14.2022.08.23.12.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 12:16:03 -0700 (PDT)
Message-ID: <a895c467-7149-b04d-2c67-a812fea01c8d@linaro.org>
Date: Tue, 23 Aug 2022 12:16:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/1] Block layer patches
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220823140406.73805-1-kwolf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220823140406.73805-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/22 07:04, Kevin Wolf wrote:
> The following changes since commit ba58ccbef60338d0b7334c714589a6423a3e7f91:
> 
>    Merge tag 'for-7.1-hppa' of https://github.com/hdeller/qemu-hppa into staging (2022-08-19 09:35:29 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to 51e15194b0a091e5c40aab2eb234a1d36c5c58ee:
> 
>    scsi-generic: Fix emulated block limits VPD page (2022-08-23 16:01:13 +0200)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - scsi-generic: Fix I/O errors due to wrong block limits

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



