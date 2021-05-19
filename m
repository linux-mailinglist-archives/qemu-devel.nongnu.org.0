Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CB7388E35
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 14:37:23 +0200 (CEST)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLRy-0002JS-5T
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 08:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljLQp-0001SR-59
 for qemu-devel@nongnu.org; Wed, 19 May 2021 08:36:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljLQj-0007nZ-5j
 for qemu-devel@nongnu.org; Wed, 19 May 2021 08:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621427763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WwOy+3Cu0OcoEk0EjFd0azQnW2UiAPSndV4QK1AAsM=;
 b=U5nAHlyVE2bP2Jq0ctyyDfTd4e7/PPxgGX6QA/px77jW/uA0VxOVBUIY4FtZ6BMt9lmUtD
 F9t9X5g8ujTUNm4tE17yja1JmIqloJ78FiGAcv2YhC84oGfsMXL5xVj8tnFsdDUzRGKioi
 OtapXUyICa/L18e0LcMrJCkYXX92XrY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-cCv-9FF9NLOBeiWZbxIPiQ-1; Wed, 19 May 2021 08:36:02 -0400
X-MC-Unique: cCv-9FF9NLOBeiWZbxIPiQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w22-20020a05640234d6b029038d04376b6aso7551997edc.21
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 05:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5WwOy+3Cu0OcoEk0EjFd0azQnW2UiAPSndV4QK1AAsM=;
 b=i96VKqct0ZLa9YVQ6JXfb5TilXA7Qd5ZhmFNdAvaDI4afDnEHV5ms2VBtPLJgctPz2
 4O5tzZOtoAXG1C8066M0ASTjPKeOs1zHIojeX155gTXT0J8R4dC8jkdXm/MnvsXMHtTb
 q+lGv/6W/5TZjOkxLcGzNOkCbHo2gjykp3tJFcKXr80J0Zy9imozOMi8S+myzWc4yD3+
 HouWdVmpIGp8pB9PpLzgkfYLCzgkWLXbnOQzjE/74i8aua/sQKgxGYSsqrsE97/WSlSJ
 X/3d8wK808aCEU0uJIe1QloUOvIo1kSN4CHaB5T/T8qR8WIC4KyHuAv0EbOW451jzhOt
 0ABA==
X-Gm-Message-State: AOAM532U6/Giw34fqW6qvuMC4Pb7ePo6LgvF9evVp+x7ZUlkMOFvKMhF
 cibOq99/u4Z+9ImjdAC3Csu+l3O4atu8rnwtH48Nh4/nKmMABXBpAN66n4Gg42pv/EcD6rJrp1O
 D0jW96Gt5rXh0COY=
X-Received: by 2002:a05:6402:696:: with SMTP id
 f22mr13885181edy.131.1621427760976; 
 Wed, 19 May 2021 05:36:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdMHDW+wbTZgBdyiZvXULt9XeDg3fJEHQZ3nkt6zNioV0F1s+uVnhAIN607riZsFRa4Tukhw==
X-Received: by 2002:a05:6402:696:: with SMTP id
 f22mr13885163edy.131.1621427760784; 
 Wed, 19 May 2021 05:36:00 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id w19sm15925684edd.52.2021.05.19.05.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 05:36:00 -0700 (PDT)
Subject: Re: [PATCH v2] configure: Avoid error messages about missing
 *-config-*.h files
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210519113840.298174-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8ee40976-4f27-0189-7e7a-0e62d022aa6b@redhat.com>
Date: Wed, 19 May 2021 14:35:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519113840.298174-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 1:38 PM, Thomas Huth wrote:
> When compiling with --disable-system there is a harmless yet still
> annoying error message at the end of the "configure" step:
> 
>  sed: can't read *-config-devices.h: No such file or directory
> 
> When only building the tools or docs, without any emulator at all,
> there is even an additional message about missing *-config-target.h
> files.
> 
> Fix it by checking whether any of these files are available before
> using them.
> 
> Fixes: e0447a834d ("configure: Poison all current target-specific #defines")
> Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Use ":>" instead of "touch" as suggested by Philippe
> 
>  configure | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


