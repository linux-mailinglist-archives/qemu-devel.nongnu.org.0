Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418BA662470
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:43:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqXE-0008CE-SY; Mon, 09 Jan 2023 06:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEqWw-0008AT-RO
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:41:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEqWv-0001qv-Bu
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673264488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Z8tb6dsV68tMRAwn6UDkw0nW923N99ddNc5a5qYkIo=;
 b=dI6I+5Eyh6iro/IcDZBSwp9P8QQLqqNt1TnCi62hdSb8VBI/kfOqpWRddGRJKCxKsTaQz2
 JagIVjOkQ6Tg7aV9wt8uxQ42yzaGPA6gWQqaLic1pwnIJqQXwWkOTovVBBXd6mgN5N+q9w
 p6SUYI8zx4AdiPlsCVxuaFqc67JaSRA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-282-yGhLpgQDMuWdWi8LBdMIWQ-1; Mon, 09 Jan 2023 06:41:26 -0500
X-MC-Unique: yGhLpgQDMuWdWi8LBdMIWQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 f13-20020a05620a408d00b006fc740f837eso6367993qko.20
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Z8tb6dsV68tMRAwn6UDkw0nW923N99ddNc5a5qYkIo=;
 b=x42TYWsi+6BjqvXgky6VkHZvD7OX/MzKirxbyABo3k2oltiSlnZfEN9jehjOV0TDUN
 CjqF6L+eTweutZvG32+f5L9YmmCmvIAUNJOIVQ0j0EL/zBDlvb9JNe/YHfYy3JHZbiu+
 /t4jzefUcFlI9Bwqym6ZcfQk2Y3wDpwqoElay+dxAnrzHpW3n/mkI+UYdbAy9svAGOpv
 w6RCrLecQ3PnskZbKsOVUvfKssPKSZae1wFrBVr1oK6GAdlQv7ZJ0PMdMnPJ2IFWnG4M
 iBvHP8VezUZ3kqW4o+DodW85bVHX3p7EhERn/ROx0KSEMipJ6Auu67wqX+9T0VN2w453
 YWkw==
X-Gm-Message-State: AFqh2kp4p6MzIRY+u1AxGCM6X44sPOJSg+XIiSWUXDP7sJAwTvyPRgFq
 O7XPbatisQwohgtc636Nk0J/GgkkpLE1DhEGjS4tozFQ3o7u8fRnMHiuy11BQ3DPW0NdqVEJxym
 hbO64wWm0l5MbtTw=
X-Received: by 2002:a05:622a:260c:b0:3a7:e0ba:7c23 with SMTP id
 ci12-20020a05622a260c00b003a7e0ba7c23mr99291764qtb.60.1673264486321; 
 Mon, 09 Jan 2023 03:41:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuxuhZWaRxtlzryrKLQ83S//GDSlkN1RtbnV9juEu7A2odSebo/Wf0rQFYR6uq2zmSbkbUfwQ==
X-Received: by 2002:a05:622a:260c:b0:3a7:e0ba:7c23 with SMTP id
 ci12-20020a05622a260c00b003a7e0ba7c23mr99291737qtb.60.1673264486067; 
 Mon, 09 Jan 2023 03:41:26 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-179-204.web.vodafone.de.
 [109.43.179.204]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05620a280900b006fcaa1eab0esm5270491qkp.123.2023.01.09.03.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 03:41:25 -0800 (PST)
Message-ID: <0b04303a-20a6-d4fe-d9bc-0940e475d24b@redhat.com>
Date: Mon, 9 Jan 2023 12:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] build-sys: fix crlf-ending C code
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, pbonzini@redhat.com,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 kraxel@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>
References: <20230109112110.128967-1-marcandre.lureau@redhat.com>
 <20230109112110.128967-2-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230109112110.128967-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 09/01/2023 12.21, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> On msys2, the shader-to-C script produces bad C:
> ./ui/shader/texture-blit-vert.h:2:5: error: missing terminating " character [-Werror]
> 
> Fix it by changing the line ending from crlf to lf, and convert the
> script to Python (qemu build seems perl-free after that).

If the build process does not depend on Perl anymore, would it make sense to 
also add a patch that removes perl from most of the containers (the ones 
that don't use check_patch.pl etc.)? ... that way we would make sure that 
the dependency does not creep in again later...

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build              |  2 +-
>   scripts/shaderinclude.pl | 16 ----------------
>   scripts/shaderinclude.py | 22 ++++++++++++++++++++++
>   3 files changed, 23 insertions(+), 17 deletions(-)
>   delete mode 100644 scripts/shaderinclude.pl
>   create mode 100755 scripts/shaderinclude.py

Acked-by: Thomas Huth <thuth@redhat.com>


