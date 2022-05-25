Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0480B533784
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 09:39:16 +0200 (CEST)
Received: from localhost ([::1]:37448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntlbu-0002A4-I7
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 03:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntlXJ-0000Q6-LT
 for qemu-devel@nongnu.org; Wed, 25 May 2022 03:34:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntlXG-0005rt-CX
 for qemu-devel@nongnu.org; Wed, 25 May 2022 03:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653464064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rsAYc0buxdxyv9tVtC3mKJQ5ybQhInk5BeNBq0+cYw=;
 b=JITVsy8RbXXnqf/CCz8/yU9x2w/t2g+un+4AuBU8EGySnLnQUecRPqnog6Ea8c5bDgveoc
 xAk6quxCRUVJCup6lDrDhaupBkqtf9lkWzXzbQdv4uruv8ObRKDf40QkoZGSvL18PItbss
 moek2Y+HBKtHR5g1D1MAlrEdwvBFkKA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-XOIrWu4oNpuKGNTLRPMGDw-1; Wed, 25 May 2022 03:34:23 -0400
X-MC-Unique: XOIrWu4oNpuKGNTLRPMGDw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d15-20020adf9b8f000000b00210014d2b41so101480wrc.4
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 00:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9rsAYc0buxdxyv9tVtC3mKJQ5ybQhInk5BeNBq0+cYw=;
 b=bmS5MSPPsHh9T4AG5S/RqO6ff2Jzay7N5kjmRl3uqRk17VsAC37KdQHe7txcJYq1UN
 wd9qFtiUb5ggkpmdsXM0sQnU5mjmFWAHtS8KtZdRtTGqz8JfMvH6ldEoOcz7Itp37re2
 xB0GKHsHnT8d1u4vDx5qVY+7LcCp8yU5HImh01g9jfrU/94leU39TTWqPKz7a9v6/FKa
 HNZvAHc6oWCgStmDYlmMiy+t/ggG68BpJMIEQRNoAKfmxjPC/nDU4vNaJ1J5SxPPYzHV
 JIFf1NNcgTP1q3N2oNAHx4F2j4pjV9UV5qOzm75uIk05Q5mY/kjL6JVcAx/vAc7GjfBE
 L/kg==
X-Gm-Message-State: AOAM5318sHOcfOsIeFHWT6Ute3pwkMGgFY79yWGenyzbSxbo1x+U+clR
 MS1PlmmZkJx63+LgHU6M48H3NRJwIa5ckXWDwzYDNpm8fzUWACUaYUR33JCQPs6dmQRrrcKibjY
 BsbLcG47GQdzR/70=
X-Received: by 2002:adf:dd09:0:b0:20e:6231:51e7 with SMTP id
 a9-20020adfdd09000000b0020e623151e7mr26255071wrm.251.1653464062045; 
 Wed, 25 May 2022 00:34:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2P7p+P5lo2LkAudW63oy0ONUnJeRNh16IrI+K4iLMNuKAYKnSi+7BNl+igMqTogn0imdi6w==
X-Received: by 2002:adf:dd09:0:b0:20e:6231:51e7 with SMTP id
 a9-20020adfdd09000000b0020e623151e7mr26255055wrm.251.1653464061870; 
 Wed, 25 May 2022 00:34:21 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-69.web.vodafone.de.
 [109.43.179.69]) by smtp.gmail.com with ESMTPSA id
 p18-20020adfe612000000b0020c5253d91asm1234304wrm.102.2022.05.25.00.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 00:34:21 -0700 (PDT)
Message-ID: <01511f8f-b090-e3a6-a0ce-0e4e2a18d2b0@redhat.com>
Date: Wed, 25 May 2022 09:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] tests: Bump Fedora image version for cross-compilation
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220524181111.922031-1-kkostiuk@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220524181111.922031-1-kkostiuk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/05/2022 20.11, Konstantin Kostiuk wrote:
> There are 2 reason for the bump:
>   - Fedora 33 is unsupported anymore

s/unsupported/not supported/
?

>   - Some changes in the guest agent required updates of
>     mingw-headers
> 
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> ---
>   tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
>   tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


