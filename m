Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBBB6FD857
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:35:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweLv-0002qR-QV; Wed, 10 May 2023 03:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pweLt-0002pw-8V
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:35:09 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pweLr-0006VH-O4
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:35:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b51eso1594635e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 00:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683704106; x=1686296106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dR0orx78lr2346VhXppnmYVKWqmK7bifFfnH69WHEPc=;
 b=dGEc0cm9aeRXd0DJp6m7b4f/teSrAmsh6ZY9qhdPAnCBKZ9Un2eVNwMR38TAHpWWsi
 V778TK12DjfTxf+MyrDhnu1XgVdMCckWHd4wusZ3ctbURzHN8f9ODUYDTlc4srywnMW9
 eSHgQR7Wj5BmJ+LYH24B9apkT5uVJXZzsVKG+AgGeOmJNkCY7gIgf6uU+DORKEWSDbBJ
 9j4J4M/DKMde/0qkFsdWpCqrpvmGBcjctwLrt9iTeYhHVRqrkK1rAyWSM3sLjn0WTA9n
 6/0U8wx/uBpY8+/PMfhx5Ku9bdhGyQ5fRkPGI5GbOMv6+7+YBSnmDLJQFIbvr1cmA3m2
 SbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683704106; x=1686296106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dR0orx78lr2346VhXppnmYVKWqmK7bifFfnH69WHEPc=;
 b=dnxQ6lb3oHrs7ERbfoeYnIWL9VyVM9R1IFDEPUKfOK+z+EQjNQkVBacDHqlVUQHEWw
 D73m6f1nUMY/AqLLElvIyykW0fgIpk8Y9/5CU1uFdlri07IofYUhxlyEmWZ1mGKbqRvH
 z1AxG8fGCGaKOEG0ENx3Fid71+XodiIuTf5xei1H5ETmcAmn4ZhMtu9WFoCfMt/MR97b
 KuJiDMUKe2ffrnEgSe+a8/PC7eRxNTZsL4gE8ks2RtbiChY8n/n9f0ewl2YlU0Xy5fPN
 zCrFH4mncyyHSlpHZ3/Fo85X1dCt3fqs1q0SHmKM9RTAAjA1fK5wBVgioW/bazI6vCaW
 E5Ig==
X-Gm-Message-State: AC+VfDzkGPjE/2MBL8JTomjF6k/gG3XqFJQRFgNcYT+ft8HZQPcJjiRz
 /IZGCCZbq6C4XI+0Q1sthFjpJg==
X-Google-Smtp-Source: ACHHUZ4SV1/wRB4ARl9AUQNYegRVEaduGvI4gRFcjwTFXk0vl2qhkvleAJZCXcrgkE6A0tTFxDr51g==
X-Received: by 2002:adf:dbc7:0:b0:307:a5cb:fe69 with SMTP id
 e7-20020adfdbc7000000b00307a5cbfe69mr3535505wrj.57.1683704105726; 
 Wed, 10 May 2023 00:35:05 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 e15-20020adfe38f000000b00307b5376b2csm949237wrm.90.2023.05.10.00.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 00:35:05 -0700 (PDT)
Message-ID: <d19174ad-41fd-ce25-e7ec-c0ef327cdcd7@linaro.org>
Date: Wed, 10 May 2023 09:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 02/12] tests/lcitool: add pipewire
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, dbassey@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
 <20230506163735.3481387-3-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230506163735.3481387-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

On 6/5/23 18:37, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>

Maybe a bit more verbose:

"Add pipewire dependency to the lcitool mapping and run
  'make lcitool-refresh' to generate the updated files."

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/docker/dockerfiles/alpine.docker                | 1 +
>   tests/docker/dockerfiles/centos8.docker               | 1 +
>   tests/docker/dockerfiles/debian-amd64-cross.docker    | 1 +
>   tests/docker/dockerfiles/debian-amd64.docker          | 1 +
>   tests/docker/dockerfiles/debian-arm64-cross.docker    | 1 +
>   tests/docker/dockerfiles/debian-armel-cross.docker    | 1 +
>   tests/docker/dockerfiles/debian-armhf-cross.docker    | 1 +
>   tests/docker/dockerfiles/debian-mips64el-cross.docker | 1 +
>   tests/docker/dockerfiles/debian-mipsel-cross.docker   | 1 +
>   tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 1 +
>   tests/docker/dockerfiles/debian-s390x-cross.docker    | 1 +
>   tests/docker/dockerfiles/fedora.docker                | 1 +
>   tests/docker/dockerfiles/opensuse-leap.docker         | 1 +
>   tests/docker/dockerfiles/ubuntu2204.docker            | 1 +
>   tests/lcitool/projects/qemu.yml                       | 1 +
>   15 files changed, 15 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


