Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2646FD60F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 07:15:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwc9N-0004qT-U2; Wed, 10 May 2023 01:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwc9L-0004qK-Tc
 for qemu-devel@nongnu.org; Wed, 10 May 2023 01:14:03 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwc9J-0007dx-OR
 for qemu-devel@nongnu.org; Wed, 10 May 2023 01:14:03 -0400
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3f475366522so2211275e9.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 22:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683695578; x=1686287578;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V4xTPek+E+cmXusTT6QE30Ny+H1Ki1C1FHx82xA0pKQ=;
 b=URnKQb97QBi/pRY2G+XSZ98Ima4QfshBoFXevs5B6xq1KsVGIm3IR3yv58DisBGUO4
 oKOzGfvX583YHjh4NIDGWfdb3jkc/He9jfmV7mvoGL1yzP2W7HX1oOdPTkPlUBkqJb1J
 R+s/UWvgYbjury8yc4aPE8XOLH1otVEMBF6zdk2+NPhjZEbB04BNO+pjmQtf56IbUYTM
 XjRxYMOANDk1+STA2EmKn4vKweehLPsg42OavjVZp8ajcGK93nImF08M4e+Ubz1WR3lj
 I3CEUEFy/V9LdnAE6vcneh8aQUeq4Ed0G1JdQsdAXKjctMcjvWEUsyqJwcoKj++6Ay4F
 iV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683695578; x=1686287578;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V4xTPek+E+cmXusTT6QE30Ny+H1Ki1C1FHx82xA0pKQ=;
 b=Ud3hYWzxDAp1iT1TRYCcfLwhjhMXxhjwI3NF0aB6AEOe7xkqmgJAnDL8ymkqJXfoil
 o85MY6tOGo6D5G+x2wFgTKkPLLW+KEDwGC+umivo6IkbSgkxUhcyb/BatjI8CnUFZDGC
 FIIXp4tec/6rRUcKmKkX8YetDo5Mso6w2+lsyRzXFGLOKrnLFqbxgR3Cv4mmomL/khEd
 LbYSrPL0zDAdX5XGDyer7T152e6pCDnT9ppOtGIR3+NChmijmh37lWeEYXPqm11C5gHj
 h0o78aJ+oyiB8EWgM6Ivr3tAgMleiLkch5mLFp7uS+KG4NvdRbwFzDu+lDE/ErcI1jqk
 ZF+Q==
X-Gm-Message-State: AC+VfDwRN1iSfq3HQrAaYgwRQQE3+P9nV7LSDB25BcYFPdxOwu8NSiPs
 2DsyadIcLKHnNFwGshZr+ieCaQ==
X-Google-Smtp-Source: ACHHUZ5/FYD5DcyCYGPu0jSyybsQqUAZwK8290bl3qXnutvw4KFY58IzIf5Pyh/b6fxm2FN/zueEjA==
X-Received: by 2002:a7b:c314:0:b0:3ef:6b97:f0c3 with SMTP id
 k20-20020a7bc314000000b003ef6b97f0c3mr11104263wmj.15.1683695577984; 
 Tue, 09 May 2023 22:12:57 -0700 (PDT)
Received: from [192.168.10.24] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f42bb3a5adsm3747677wmc.4.2023.05.09.22.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 22:12:57 -0700 (PDT)
Message-ID: <0f257394-dded-fc80-c7e4-de2d9945cec4@linaro.org>
Date: Wed, 10 May 2023 06:12:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/16] Misc patches for 2023-05-09
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230509090453.37884-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.128.48;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-f48.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/9/23 10:04, Paolo Bonzini wrote:
> The following changes since commit 792f77f376adef944f9a03e601f6ad90c2f891b2:
> 
>    Merge tag 'pull-loongarch-20230506' ofhttps://gitlab.com/gaosong/qemu  into staging (2023-05-06 08:11:52 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git  tags/for-upstream
> 
> for you to fetch changes up to ef709860ea12ec59c4cd7373bd2fd7a4e50143ee:
> 
>    meson: leave unnecessary modules out of the build (2023-05-08 19:04:52 +0200)
> 
> ----------------------------------------------------------------
> * target/i386: improved EPYC models
> * more removal of mb_read/mb_set
> * bump _WIN32_WINNT to the Windows 8 API
> * fix for modular builds with --disable-system

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


