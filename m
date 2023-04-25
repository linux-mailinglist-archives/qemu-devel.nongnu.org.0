Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EF66EE0FD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 13:17:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prGeB-0002Zl-KZ; Tue, 25 Apr 2023 07:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prGeA-0002ZO-11
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 07:15:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prGe7-0008FJ-23
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 07:15:44 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso3528286f8f.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 04:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682421339; x=1685013339;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mw1MlkJP0kYsCZYW8zfnlsq7aSFoFtNIMUQC78h9sCs=;
 b=I0NZ7SitW2rvW/S8ci7/aMiuTO/GEOVnm6B6oaQXAJe5C9dsO5PQF2bO825Q90yfLS
 keMOuqvODeL0/Ilck/D4RcGOaeC+QbAD/zvDc7hAfnELR+M0PI+SbfN0Pwk5BdbfrknJ
 V44QiAG99Dib+2Ln3Q63e0Na4Tp6BUqDdrBjXOhNuqPvFqXH3AJgads+jce7d4LbFbUU
 +Ddg7I/y+z0xD2v2oDgn/n+XiojgcH8A5Er3PwwOxrD9ah+rNR/X9YtDqfRZ/kYQh1jE
 RiwAdw/iCPJ0MiCto/08e1T6/GEeTRMoWLiU2/hr3sgh4VZt3tY0wbkVHgorqtXbJ6td
 L5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682421339; x=1685013339;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mw1MlkJP0kYsCZYW8zfnlsq7aSFoFtNIMUQC78h9sCs=;
 b=PcQWxgOjcp4ZT4XBn5RWkHZzPdQaqOBnqTSILk7ht/hVgWn0y4Ssl32oBtAVbwCT6Z
 WxNAttXLXVKcOQyEn8PgF2RnoddVf8KSKJLqom0xacydqMPpxMqz39Cdi/9oqYtvFfHe
 Qs2e8/FD11VE/PVgPVO8aKOfu478LrJxV4NR9/eHfarVST1qAdW/wEkl/cQhh/19OmV0
 wQE5AM/d/gdpy9Dlaq1jyYLNO2vDGhVThqqjCPoFXWKKzzRmHH0JAoqZxgbY89RpP/6b
 CMHbSZqhxGesX1AqhcXSe6rV7ZoxKAHgdhSI/TptsbP5cgl1X7Raw8zSqaxQzjhZxDIW
 ud9A==
X-Gm-Message-State: AAQBX9ecvcUnv4TVY4zCX8axVN0SGE59QnrVnsYDB8pKJc3zbnt7Pvcd
 xgl6p4fG9O7ZFIzPtNqNQlOqPg==
X-Google-Smtp-Source: AKy350aF5iNWff2YylNNGyy9A4pUNbIY6nykBk5HfKEnUhoiEhJif3n7pLqML12XwBXPCuH/yV0l7g==
X-Received: by 2002:adf:dc02:0:b0:2f7:53ff:723c with SMTP id
 t2-20020adfdc02000000b002f753ff723cmr10604735wri.66.1682421339103; 
 Tue, 25 Apr 2023 04:15:39 -0700 (PDT)
Received: from [172.27.244.113] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 ay37-20020a05600c1e2500b003f18b52c73asm14406951wmb.24.2023.04.25.04.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 04:15:38 -0700 (PDT)
Message-ID: <2fadc681-f310-f12d-fdfd-827213819096@linaro.org>
Date: Tue, 25 Apr 2023 12:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/2] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20230424175518.325931-1-stefanha@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230424175518.325931-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/24/23 18:55, Stefan Hajnoczi wrote:
> The following changes since commit ac5f7bf8e208cd7893dbb1a9520559e569a4677c:
> 
>    Merge tag 'migration-20230424-pull-request' ofhttps://gitlab.com/juan.quintela/qemu  into staging (2023-04-24 15:00:39 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git  tags/block-pull-request
> 
> for you to fetch changes up to 9d672e290475001fcecdcc9dc79ad088ff89d17f:
> 
>    tracetool: use relative paths for '#line' preprocessor directives (2023-04-24 13:53:44 -0400)
> 
> ----------------------------------------------------------------
> Pull request (v2)
> 
> I dropped the zoned storage patches that had CI failures. This pull request
> only contains fixes now.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


