Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E113D45A45E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 15:04:25 +0100 (CET)
Received: from localhost ([::1]:55078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpWPI-0003n2-LL
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 09:04:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpWKZ-0000Bp-Bh
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:59:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpWKU-00064n-Ik
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637675965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/50y5MA7FPUS6leTI0Gj4euydpwPzg4qpn2TW5Ww4fs=;
 b=f2zn5yBhqO06lzAzSOjam+fCROXEW4JMP9seTp/jbnfApDIwWA40WjMu9+2RuXIQMTrGlS
 sLb6P+ZL4nbEDxDS08Z5ufFhfEcbSLs+KPRnyEW0aNe4m8+alT6kDm8F1JP3ARB0AzTUND
 WdzJZ3i/vujfszDLiKd1uxfzHE0BCmM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-xxUBMzm_Mjibtbx0sZQmXA-1; Tue, 23 Nov 2021 08:59:24 -0500
X-MC-Unique: xxUBMzm_Mjibtbx0sZQmXA-1
Received: by mail-wm1-f71.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so1280635wmg.2
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 05:59:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/50y5MA7FPUS6leTI0Gj4euydpwPzg4qpn2TW5Ww4fs=;
 b=JZ8VnKKbUwPSW+7tBiivLKvG2XARyBnw3CMRlNzNPJixh8MuxRUE0eNP7aIidwlDj3
 D+4PACuQW0ccc7DdrMK5LWSmDnMSwYPJ3gJG/wbLKHsAAV/iEVm9VvCWJ/oarZHjHzfr
 7xJeF9sWBDI9MTfFqLEkT7oTmOt6o+C/LlBpPk5Z6ksz0xFut2OjzYLhG6bIGJcAu7hz
 Un/FFYeBZDKeMK/PqcHPtvJy/FZ87e8X3Cr+1anYi/jRY9ASIv57dcln5ePjLoCdi8+3
 +FxsjQPAWqbVeKbqrXAs/y9k75L/7S7Q09G5O670wqclsPIzvUQ0aSyosCUjl4EJIN5v
 +NqA==
X-Gm-Message-State: AOAM532RkMVe7EPEkSSbp7kT7rbfdbkoj0KZ4cJ/H0bp0HyhmCzD7HQu
 f1x2dn5tN2pXV/W9DcZvuUdhkPWOrmdGAa7wKnbB4HkIC9KigDixXXmJ6dEjQoxOLElZLOlOqM4
 ibgOSy3VoPHGAETg=
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr3366268wmd.184.1637675963419; 
 Tue, 23 Nov 2021 05:59:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxN/Rso6wGSczoIpF2NhpPQrius+MARJfDXepyULOsS8HytEF/Wjf94EN7zlZHvngJBPDOlwA==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr3366246wmd.184.1637675963299; 
 Tue, 23 Nov 2021 05:59:23 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n7sm12002469wro.68.2021.11.23.05.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 05:59:22 -0800 (PST)
Message-ID: <10055971-b85b-1506-a419-070ac1599b37@redhat.com>
Date: Tue, 23 Nov 2021 14:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] ui: avoid compiler warnings from unused clipboard
 info variable
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211123134302.45741-1-berrange@redhat.com>
 <20211123134302.45741-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211123134302.45741-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 14:43, Daniel P. Berrangé wrote:
> With latest clang 13.0.0 we get
> 
> ../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
>     g_autoptr(QemuClipboardInfo) old = NULL;
>                                  ^
> 
> The compiler can't tell that we only declared this variable in
> order to get the side effect of free'ing it when out of scope.
> 
> This pattern is a little dubious for a use of g_autoptr, so
> rewrite the code to avoid it.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  ui/clipboard.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


