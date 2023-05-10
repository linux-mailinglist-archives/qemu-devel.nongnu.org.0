Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D246FDF31
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:52:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkEP-0006Md-5s; Wed, 10 May 2023 09:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwkEM-0006Lq-Ua
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:51:47 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwkEL-0002hd-6Q
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:51:46 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f42d937d61so15225185e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726703; x=1686318703;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9WzQGNJlAh8FssQbywGKFCjeQkuks9On8zuOSguyj5Y=;
 b=ITS4kQSDx52n46h/iTE+fRLDmAcb1UIqt2rXIhyrsFgeKTuE82cV1HSYxYVPnsXN0o
 Yj/owmS34KDx7xXdNO8XhN5xYyvQOlXt3pAn4tdYXxSbmS3GludEVLmNIbZNmnpPz2D4
 S6+LcJ2g3T6+zk3FAYa4qNntYQ3K9ig/UF/iQd+ximnf8QaOTKvklPDlvH1D77aGZJ1X
 RgKlrSiUC/ZNij26hEMp7D5GAGs/Fq/Xm1mkiD5LGby1pC8i2rmI3M/Ke4Q3b9AAjb/1
 tblUKXq0jlMC7ibG+qt2UgG5P4Rvbv8yuebbohUxuyOVz6pMiT9FvyxBFeYPqJD5OprC
 DlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726703; x=1686318703;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9WzQGNJlAh8FssQbywGKFCjeQkuks9On8zuOSguyj5Y=;
 b=NWeUBVfXn9LLDe7ZNmPJBWlkepY5myClcvB+ufzZYkZc5vnGWXeZy0g7nH/kzSuSam
 UPghBFXzv6bcTLBlQizJ/CFm1e4715ArSKpqGqn1vH55JE2npg6z367yJcxAi1aAy2xz
 ldd8U7shU421ZUeE7cy1aHQydNultdpx9Fs1sAd76WZgaddHM0l4JRXLEfHuCGipVZyb
 T0OXCRK/KtvohfpzvIHLE+iyK5cPPK/ydM4TtGafYGUgNMyM6PGZquxvZW79zJCRhEAO
 J+JF3R+p4mnCWb4CAwVBQBx0oN1NZrRpgJBPc5Jrd5ZCrcM6e4wXSVeqpBer1J0PrMxB
 FFQw==
X-Gm-Message-State: AC+VfDwosasAMymWCXfZjjxbYzjO7L/gg0jOxExe7iWVIyi/PE2e80e8
 J6kESymTOOEgaWjcxd0DxMo9yxNyuf0QrNG4hpmP0g==
X-Google-Smtp-Source: ACHHUZ7VsBGSdVxuJrcueQS+x5S15rWbUC8b6ZgnXeDRoCJ0lbhSQDnMxs5TjQyMePT8j26pqpsyVQ==
X-Received: by 2002:a1c:ed13:0:b0:3f1:662a:93c4 with SMTP id
 l19-20020a1ced13000000b003f1662a93c4mr12571650wmh.36.1683726703684; 
 Wed, 10 May 2023 06:51:43 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e1-20020adfdbc1000000b0030795249ffasm10000292wrj.92.2023.05.10.06.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 06:51:43 -0700 (PDT)
Message-ID: <818ecee7-69e9-bb35-d927-16834a15c001@linaro.org>
Date: Wed, 10 May 2023 14:51:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v2 00/17] QAPI patches patches for 2023-05-09
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20230510081224.3588673-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230510081224.3588673-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/10/23 09:12, Markus Armbruster wrote:
> The following changes since commit 792f77f376adef944f9a03e601f6ad90c2f891b2:
> 
>    Merge tag 'pull-loongarch-20230506' ofhttps://gitlab.com/gaosong/qemu  into staging (2023-05-06 08:11:52 +0100)
> 
> are available in the Git repository at:
> 
>    https://repo.or.cz/qemu/armbru.git  tags/pull-qapi-2023-05-09-v2
> 
> for you to fetch changes up to a937b6aa739f65f2cae2ad9a7eb65a309ad2a359:
> 
>    qapi: Reformat doc comments to conform to current conventions (2023-05-10 10:01:01 +0200)
> 
> ----------------------------------------------------------------
> QAPI patches patches for 2023-05-09

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

