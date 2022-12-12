Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFA2649E5F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:03:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hDu-0005jt-QH; Mon, 12 Dec 2022 06:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4hDm-0005j0-LM
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:43:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4hDk-0003Hd-V4
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670845422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mCXhacbFgrNawDNfj2mihAB29oocsMTwOZEHs32cv+M=;
 b=hhtQu1aGCwPQFs9PW8Y4soAuXu+Wqe+1bBVxMZtVIDKk5qAAytmKfcBSpOlEBYROMVunk0
 qpqNsYEgtHYciIfOr9zuJn/SnJ1IA8fUIiul6+O5wGsILUCJtdDm3m40SyzwIxEiIxMem3
 LnnAp1OddoyXFvfkJexBW0hvpXPFnAQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-220-S4LshnkSMLicdslhx05ang-1; Mon, 12 Dec 2022 06:43:41 -0500
X-MC-Unique: S4LshnkSMLicdslhx05ang-1
Received: by mail-wr1-f70.google.com with SMTP id
 w11-20020adfbacb000000b002418a90da01so2150816wrg.16
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 03:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mCXhacbFgrNawDNfj2mihAB29oocsMTwOZEHs32cv+M=;
 b=4j+UsNp/RJBb/WDmsxSlGuurivzqZUNU4TtjaZhA9aRppcw6tfnNeE4fN7LL6uDHUP
 qGrnO2UQNeYCXU7YKU3A4+qP5NhSIA943oF1DD7tA56JWg8LCpNA0/tHs2am0IryevV8
 L2xLlXOeD1E/UAbiirsIuv4U/jADJNyjElpFMobw+YoeNF/AG+X+Dx8sRTNuCpB2vAkQ
 wmIYtKiHPjlMBFnT+kUzPa/0mqzXkaqcUCRhfoWj7MiT6YrbBnOgdi1RPs+ajCmBriNT
 m6FcDPmdvnrvphxAI+AmKDiUqmuROZGbY1Gffkiu/oK7vIoA/V7ijk3sAdHpSgKkDIBr
 hGEQ==
X-Gm-Message-State: ANoB5pl9kcf4ssuEdKqOyl9kZMkf5RokUqa3cBx4HEGVQoZHPn4TF3Fz
 AoLTF8lo6tTZfQEfgHq33i1CPDOlHVinLEBmq8+6Zls7sdA6w3r9kMe0z0vdTw4N3j5u9xFU5OU
 JbydGN9kezyrLaYQ=
X-Received: by 2002:a1c:6a01:0:b0:3cf:d365:1e86 with SMTP id
 f1-20020a1c6a01000000b003cfd3651e86mr15415529wmc.31.1670845420262; 
 Mon, 12 Dec 2022 03:43:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf54H2BOcwGRk0KDzcjr9CNDqAGhnctQYhJ2XDSot4WcvpXwI1ser8Q9xP8ciB9Ihkoguvlezw==
X-Received: by 2002:a1c:6a01:0:b0:3cf:d365:1e86 with SMTP id
 f1-20020a1c6a01000000b003cfd3651e86mr15415513wmc.31.1670845420045; 
 Mon, 12 Dec 2022 03:43:40 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-127.web.vodafone.de.
 [109.43.178.127]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c4f0800b003cf54b77bfesm9308735wmq.28.2022.12.12.03.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 03:43:39 -0800 (PST)
Message-ID: <82b094fa-01de-8e40-8a79-b1ad72e938ab@redhat.com>
Date: Mon, 12 Dec 2022 12:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/libqos/e1000e: Remove "other" interrupts
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221110114045.65544-1-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221110114045.65544-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 10/11/2022 12.40, Akihiko Odaki wrote:
> The "other" kind of interrupts are not used in the tests.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/libqos/e1000e.h | 1 -
>   tests/qtest/libqos/e1000e.c | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/tests/qtest/libqos/e1000e.h b/tests/qtest/libqos/e1000e.h
> index a22f5fdbad..3bf285af42 100644
> --- a/tests/qtest/libqos/e1000e.h
> +++ b/tests/qtest/libqos/e1000e.h
> @@ -24,7 +24,6 @@
>   
>   #define E1000E_RX0_MSG_ID           (0)
>   #define E1000E_TX0_MSG_ID           (1)
> -#define E1000E_OTHER_MSG_ID         (2)
>   
>   #define E1000E_TDLEN    (0x3808)
>   #define E1000E_TDT      (0x3818)
> diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
> index 80b3e3db90..3b51bafcb7 100644
> --- a/tests/qtest/libqos/e1000e.c
> +++ b/tests/qtest/libqos/e1000e.c
> @@ -32,7 +32,6 @@
>   #define E1000E_IVAR_TEST_CFG \
>       (((E1000E_RX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_RXQ0_SHIFT) | \
>        ((E1000E_TX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_TXQ0_SHIFT) | \
> -     ((E1000E_OTHER_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_OTHER_SHIFT) | \
>        E1000_IVAR_TX_INT_EVERY_WB)

Thanks, queued to my testing-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas


