Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4676E2699
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:14:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnL7b-0005Yk-P4; Fri, 14 Apr 2023 11:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnL7Z-0005Wf-2C
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:13:53 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnL7N-0004ks-Fa
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:13:52 -0400
Received: by mail-wm1-x32c.google.com with SMTP id he13so15546718wmb.2
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 08:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681485220; x=1684077220;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jfXm9LdQ+FoJvJK7BhW3RzpzOU9fmEU5TPyXFZhahlk=;
 b=EfviCkEoXdTUwGkDeZlt5f7IQ+7Qy5dDA2GxhT/J7TLy+pnNyoEBF8gsCtte4I12iZ
 zcsMMoXcxaVOoH2lb58ElEE5o3EXg+nkCIL9QbiBMCu/DXJ7Rane7akrKJLABvkvWvVz
 ogeL7it6kgkN5bf05SqAhj0k1UZ6A9kSLyvKI3RwTsw5zKfAql8q03/IeSwegNU4E9L5
 lxgEbGW22iJZ1gYTbmHKBU+66z7O601XrI5iIV47BXPFPxvoQMupvMsAU5R3bZbS5BSb
 /ipcfCQ9UbjXwGU7T+DGyogqBlDuH9MmTGXoIL5NWnCxTemx/yS4j2LiqXFyyJuriSTQ
 9BOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681485220; x=1684077220;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jfXm9LdQ+FoJvJK7BhW3RzpzOU9fmEU5TPyXFZhahlk=;
 b=c95447/yaB2pbcYSAiOPRQUZVkXwzflitJ2Bvhwnc/yINFMDzTkIBGgUJuFVIgxYOv
 kIFG8wDRCRj3IxEfVfCAWex1iczGUqDyWct6p75BQ6/194ItBnKxCyJ2qWD1NXzQ1EEE
 YJ5bT1m9Yz2zr6lmrWHYMsL8sFASiZiCNz29RVVyKodAUlaZdo4zvefW+XkOBKxg0kvJ
 wqEmFa8+pexEZt2vQTrWpLw+2L4rLfW8Ryqkch0n+p6+SSegIQa50JfUSININ3lv1v8F
 HsbT2NAV7Czjux+ASsLG9rX0JG1MQSaaUKVpeV0w5/3irGiMN7+sFwf6UYh0Hhdrv4PN
 j8Gw==
X-Gm-Message-State: AAQBX9c6ApNj15wazHHTq+wZ2PHb1rxrWPShsWWlIMut3M3KflS47q6G
 2r8USvuTdu9xA/Wlx4CG7fCJPA==
X-Google-Smtp-Source: AKy350Zyd/OqH14sVAfqjgkMm57MYpEhnWBLThZ+kTpERUGHQM20Y9SfqVo2kQZ7jNS/X+imbqnfpw==
X-Received: by 2002:a7b:cb88:0:b0:3ed:8c60:c512 with SMTP id
 m8-20020a7bcb88000000b003ed8c60c512mr4365617wmi.17.1681485219895; 
 Fri, 14 Apr 2023 08:13:39 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c2cad00b003ede2c4701dsm8082380wmc.14.2023.04.14.08.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:13:39 -0700 (PDT)
Message-ID: <fcbbf122-ac5c-7648-f125-896cbe20efbb@linaro.org>
Date: Fri, 14 Apr 2023 17:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 39/40] MAINTAINERS: Add a reviewer for network packet
 abstractions
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-40-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414113737.62803-40-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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

On 14/4/23 13:37, Akihiko Odaki wrote:
> I have made significant changes for network packet abstractions so add
> me as a reviewer.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


