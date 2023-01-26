Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E443767CB3D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 13:48:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL1fz-0000LL-DK; Thu, 26 Jan 2023 07:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pL1fx-0000Kv-LI
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:48:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pL1fv-0007oy-V5
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674737299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojybWeqLasBMhOFh18irYgUzKoQ636U5pV8oCeWvIRM=;
 b=Yzrmr366SmwZlpD0mddYReoGNPmwrszy55J3jeF/Sp39ezplwfl/gta2NqhLU1vSRIy+HW
 2pDGn14h6QTRXoeVo1ZzTTd5xxEyFiysZ89KrY4BDDAoDyb3PvZXkoegw69dArfU654pRX
 Hu9ythvIwUUPefGCVkYQkIOVBAXcf4U=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-255-SwYXpTcIPT2Nibu9AxPOMA-1; Thu, 26 Jan 2023 07:48:17 -0500
X-MC-Unique: SwYXpTcIPT2Nibu9AxPOMA-1
Received: by mail-qk1-f197.google.com with SMTP id
 a3-20020a05620a438300b007069b068069so967606qkp.2
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 04:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ojybWeqLasBMhOFh18irYgUzKoQ636U5pV8oCeWvIRM=;
 b=AMJoAAEoSY/Cc/sj8MrkftPC6Aqz6h1fuT/Zm7f4oDvIe6eh2QSBB/2qiugKV9h2eB
 bMah/MPTAILIBb2JBpMjhKwNPVhNpYOvxUNZcnrybFz1dCg7RnzpgbCOPqXh+wO8lwUb
 6Y5TDdqspBMUejBAJQKF1731AKJlHyDqNkQ1u/RFy1x9c0U1QBebzbk9ARUFcTADUCf2
 8Krk6vDzz1PYkq/HTCnKLDXjxfOE2Xb8V0FnsezSd8uc0sPm6BcSv2EFnyvJTHaQ37ci
 mLJvZxRL7tzpSHGzcwr/bKhsQuZeRA5O8VWTFOndCEZ/2lQSGVDhVSoQ38+QEZODvaA7
 mDiA==
X-Gm-Message-State: AFqh2koYG+vwb+CymaCIgrQqN3tAA7HzZmQuGKFkep/8T6RQkDImnmJ5
 e5MY9atG6bwjNoLX0xGrkdaElV75JKckDqQU16qjtfFJenaLtqxjyQzzUqKC9+O4wOrKs6FIVue
 hmuB0BOaYrTEGW6o=
X-Received: by 2002:a05:622a:1b05:b0:3b6:9817:18e4 with SMTP id
 bb5-20020a05622a1b0500b003b6981718e4mr35225918qtb.49.1674737297237; 
 Thu, 26 Jan 2023 04:48:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtcljCLNaGleQny2LZt280r7Njc50ZVhDzgDQ4Qn2mO+8rHZVMllvL3ktGXnWGJIKNXEkIYLw==
X-Received: by 2002:a05:622a:1b05:b0:3b6:9817:18e4 with SMTP id
 bb5-20020a05622a1b0500b003b6981718e4mr35225902qtb.49.1674737297009; 
 Thu, 26 Jan 2023 04:48:17 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-174.web.vodafone.de.
 [109.43.177.174]) by smtp.gmail.com with ESMTPSA id
 bi7-20020a05620a318700b006e42a8e9f9bsm813584qkb.121.2023.01.26.04.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 04:48:16 -0800 (PST)
Message-ID: <158b485a-54f8-b921-51f9-97e7c1cb6848@redhat.com>
Date: Thu, 26 Jan 2023 13:48:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20230118120405.1876329-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230118120405.1876329-1-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 18/01/2023 13.04, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
> 
> Notes:
>      v7:
>        - disable test_dgram_mcast() on windows
>        - disable test_dgram_unix() on windows as it also fails
>          (we test for unix support dynamically but the test is done with
>           SOCK_STREAM, and it fails here with SOCK_DGRAM)
>        - Tested with cirrus-ci (Thank you Thomas)

Thanks, added to my staging branch:

  https://gitlab.com/thuth/qemu/-/commits/staging

   Thomas


