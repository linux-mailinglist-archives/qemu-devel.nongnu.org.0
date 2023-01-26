Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F87967CB12
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 13:46:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL1dm-0007Um-Pi; Thu, 26 Jan 2023 07:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pL1dS-0007S3-Oj
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:45:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pL1dQ-0005xX-Ko
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674737143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugJIe6/VsBAXGh1gMcD7lYlHwdby1mor5DnRfa331K0=;
 b=IzDpaydhYtiVKMCJaoqjFHKygKqHNtSvjGU++c2ALYvsIxKYq2qnHY2l6rZIZzLrWBZ0cs
 ZjDv8qlKsqmBr6lgSpvlZd1aJ3fUyfXb5FvRsAVfP6ioUBy6K8LP8YK+KMmOz/dKWke09U
 8HfjnoTqeJ6aGWdggLE6M5J3irZcz18=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-5VR-aFn7NvKye1-6g20RJg-1; Thu, 26 Jan 2023 07:45:41 -0500
X-MC-Unique: 5VR-aFn7NvKye1-6g20RJg-1
Received: by mail-qv1-f72.google.com with SMTP id
 b19-20020a0ccd13000000b005374d115edbso979943qvm.19
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 04:45:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ugJIe6/VsBAXGh1gMcD7lYlHwdby1mor5DnRfa331K0=;
 b=ZE+9NGHqyXh/OhRP/ALhhU5aT451B8rOnSkV7FmOIJrSAgJ7fN+wM+nAoDmyeHY68M
 7IGMkU7Jxq1VbeLGspIx6LXe5UR4/18jrahmMPcPKVdswBa6099P95R+o4wo9g4NSgwD
 wB13ZSry726fsjoEG5PC/CBSJxkERqbwKgJt84fXvxPjFdryPl3HJUBgoa8oOWcwJDFx
 5p2u38aclJy9Hl60WpbgEkFC3+nN9r2NF/HipkXxfZXWU8MubRTEuhPfpj05EalR9ju9
 1Y0ROUz5Vd4l2IgGwIIxkWJDo3Yjg2xYgZcA/ifXpShI7pQVaHgmBii2t2WDgMUGZlKR
 l+eA==
X-Gm-Message-State: AFqh2kpWr2bwyOS/ur3+ZngVlIW4e+eqTqkuBjGKUG8N5ntD4d8sOeQk
 ROP+/N1mM3gdA5wE/4uWovs7N6uFZGnC2mDETchhClQZ+F5CQzjgp4tvhITfYN2fKLpwLh/666P
 IoK7D636LBWDM/+s=
X-Received: by 2002:ac8:6bda:0:b0:3a8:26d:5f46 with SMTP id
 b26-20020ac86bda000000b003a8026d5f46mr50539568qtt.24.1674737141329; 
 Thu, 26 Jan 2023 04:45:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsDisryglBabKVHdBje3fey1b1nib53dxlYwBpYbWRTntY2CY/45gUbG4raf7NSxfVBCyYWUg==
X-Received: by 2002:ac8:6bda:0:b0:3a8:26d:5f46 with SMTP id
 b26-20020ac86bda000000b003a8026d5f46mr50539546qtt.24.1674737141095; 
 Thu, 26 Jan 2023 04:45:41 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-174.web.vodafone.de.
 [109.43.177.174]) by smtp.gmail.com with ESMTPSA id
 o14-20020ae9f50e000000b006fb8239db65sm836877qkg.43.2023.01.26.04.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 04:45:40 -0800 (PST)
Message-ID: <4412a746-079e-f8fe-1903-e1c8e20c11c1@redhat.com>
Date: Thu, 26 Jan 2023 13:45:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/3] tests/qtest/vnc-display-test: Silent warnings &
 explicit machine
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Laurent Vivier
 <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@gmail.com>
References: <20230119120514.28778-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119120514.28778-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 19/01/2023 13.05, Philippe Mathieu-Daudé wrote:
> - Silent warnings on Windows
> - Explicit the 'none' machine
> - Disable on Darwin Aarch64 host
> 
> Philippe Mathieu-Daudé (3):
>    tests/qtest/vnc-display-test: Suppress build warnings on Windows
>    tests/qtest/vnc-display-test: Use the 'none' machine
>    tests/qtest/vnc-display-test: Disable on Darwin
> 
>   tests/qtest/vnc-display-test.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

Thanks, added to my staging branch:

  https://gitlab.com/thuth/qemu/-/commits/staging

   Thomas



