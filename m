Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D2C65C00E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 13:43:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCgco-0002ku-1Q; Tue, 03 Jan 2023 07:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCgcf-0002jZ-Sa
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:42:29 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCgce-0004p2-8p
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:42:29 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso23026968wmb.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 04:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KoZ1cN36t7x1aEHQTkdCdbzlR6kvEEEvvwkaHyKlcgk=;
 b=sK4nogXsG9XyMDRLamR69lh0AlzZ2aEl0jU1o0VxWd5lsVpki+Bqc9pQcIwwmOIAhm
 1bW4Ij8cgBKOVwK4X4u/VFQQ8tGPIGExm0z1xrIjG1W8AxeTYfDk5v0gVojpEUioMD7k
 TE4xNhnrGrtWRMiawmu4ujSI3nTmr79pL9PG/IA+QjPU3+V+1sbNbBm58nU8QwGLPNkr
 OrRKri1WibKJXmr1CPRdwzB+AcOp4L0ePfQa0E7rS0eCz80iJAOvwV91TgnTQWgb0kuj
 ldiRZ/C6pzhYcSLJNoYgpjXhQHLKev/+StNYTQYSpA3nUcY+oLvD3CJ338BFEDWCd8g/
 Ks8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KoZ1cN36t7x1aEHQTkdCdbzlR6kvEEEvvwkaHyKlcgk=;
 b=5Tsi76eER+IcTyjvoRaru5VNpUz/OGsJTFEC7Ib/s6q1HDBlDI2Yg3wsHqAsUG8nNI
 uUmgdnD0f7GS4Pn9xzD22G7WBk/IzX0t++EaYa78aMYqqAlrlD9U2uuUFM2lmGvYVdqc
 YGlTcEZB2U2emZTaJ7bQ4B5XMBWLUTPXg4X12KzpYr6wrooXl4SFlIgsGscHXk7JhCJc
 xagM2M0wAZmCmvbvPnSNB8ZTCmk6khKjW8wpQlBBDfYvKH6NLYgMkBPHCwORItTTxxdG
 Yw1TQjgfkTTYUYbi7EVKxhYeZ7+TFtgK407HGUa5LmGWmPCrb7hJcp39Hacpcpz5hjvB
 zpZg==
X-Gm-Message-State: AFqh2kq0FvCeK5uDYMR//fm5o0LwVkjGDAqEzvZWBG6ek/U2BCyaMiXn
 qCCFUBrmKQzLquBP19VtZEz+zg==
X-Google-Smtp-Source: AMrXdXtejiNfPS2Lb/TDiM8BrLQkx7Fc7gBPTW23ESU7IngSCG5R2eEf5bDmwWtO4N1b65tdRui8Og==
X-Received: by 2002:a05:600c:3589:b0:3d0:6c60:b4d1 with SMTP id
 p9-20020a05600c358900b003d06c60b4d1mr38186049wmq.6.1672749746890; 
 Tue, 03 Jan 2023 04:42:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l27-20020a05600c1d1b00b003cfd4e6400csm45707865wms.19.2023.01.03.04.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 04:42:26 -0800 (PST)
Message-ID: <5f0e1f03-abcc-f193-3b9e-8bfc3133bebf@linaro.org>
Date: Tue, 3 Jan 2023 13:42:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 07/10] qmp: 'add_client' actually expects sockets
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
 <20230103110814.3726795-8-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103110814.3726795-8-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/1/23 12:08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Whether it is SPICE, VNC, D-Bus, or the socket chardev, they all
> actually expect a socket kind or will fail in different ways at runtime.
> 
> Throw an error early if the given 'add_client' fd is not a socket, and
> close it to avoid leaks.
> 
> This allows to replace the close() call with a more correct & portable
> closesocket() version.
> 
> (this will allow importing sockets on Windows with a specialized command
> in the following patch, while keeping the remaining monitor associated
> sockets/add_client code & usage untouched)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   monitor/qmp-cmds.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


