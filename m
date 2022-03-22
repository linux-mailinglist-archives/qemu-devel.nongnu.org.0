Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA39A4E4114
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 15:24:18 +0100 (CET)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWfQn-0003pS-7r
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 10:24:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWfOk-0001r5-0N
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:22:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWfOh-0007It-GA
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647958926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Ws2It+wpDl84aynVEfqhFVcyPW/KeXlM5cOXLPnels=;
 b=WeLaN4UQmDRWqFRMDq3fHae7FI+OsLLvSldmqPvWl+kYhI+SDhJJVZ8L35DfLK5PFE2qcs
 YOr4nb2eLmD5hgr87LqgazG4Vva485ijtJ/urppnZUqa9rDb6aKRBons9s/LLjuZ+UEso3
 kWaXwtoFYB2sYkgJsHlOCsLMA4qMq/8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-ugMt2Yj2MiiIS5Cnq4qZLg-1; Tue, 22 Mar 2022 10:22:05 -0400
X-MC-Unique: ugMt2Yj2MiiIS5Cnq4qZLg-1
Received: by mail-ej1-f72.google.com with SMTP id
 w11-20020a170907270b00b006df8927010eso7559807ejk.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 07:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/Ws2It+wpDl84aynVEfqhFVcyPW/KeXlM5cOXLPnels=;
 b=o6T75siQ/ouiIiycQ6ACStNM1vhBIMQ+dLF90zvy63AqtaoW7nh/tocCGKQgGFCDbF
 iZmt8kkp5dfqaSFC0vdc3565F4L50j3myFn1cpto+Fp3g0JXTEd5VvLM872wnSKcTeGG
 MfZaSWIIwR6kRx2OlWqUso15kfrkQn4PP/nEbJB4+lAQJLExR/Ne5J2ot3JlvvjRiB1E
 w1BkZ4OkOYob3liWqVs8U4hfTk6sTSIG53EnygZbXoWNDi6CyVla9VhlgWjrheHsvTAj
 txkAbGMDFNI0Qs9CJH89OTWtn6AITfjY/SIKPfkzSr6IAZiUw46VpnOoDrWmbt3bzf9+
 BoWw==
X-Gm-Message-State: AOAM532zq1Db892/Y8IUWxN1QTTF5yiIVTywmL5ttOnZ6g/1NiuyzKCJ
 AmBVDaP/u0ixcDqM1HfhaHgaQUzB4lpkuINoIUZ/GjrOsaNyptomqXUlwtw1Bt8oEOnfmFc3+ZU
 6/iIL9gVpYMKTZgI=
X-Received: by 2002:a17:906:c149:b0:6df:f047:1698 with SMTP id
 dp9-20020a170906c14900b006dff0471698mr13409187ejc.16.1647958924503; 
 Tue, 22 Mar 2022 07:22:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcttHdqHAhd+UNwxvqtxo4q2yTJyCFLk72/HpE2Af2feszEBKVhKMcsxATegGMUjRLOq0LJQ==
X-Received: by 2002:a17:906:c149:b0:6df:f047:1698 with SMTP id
 dp9-20020a170906c14900b006dff0471698mr13409155ejc.16.1647958924252; 
 Tue, 22 Mar 2022 07:22:04 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a1709067a1800b006e021f4c1c3sm2198475ejo.166.2022.03.22.07.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 07:22:03 -0700 (PDT)
Message-ID: <df38293e-2b72-7678-e684-398514fce655@redhat.com>
Date: Tue, 22 Mar 2022 15:22:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/15] iotests/040: Don't check image pattern on
 zero-length image
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-5-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-5-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 21:36, John Snow wrote:
> qemu-io fails on read/write with zero-length raw images, so skip these
> when running the zero-length image tests.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/040 | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)

Doesn’t look specific to zero-length images, but the fact that we do I/O 
beyond the image size, i.e. any image below 1 MB would be affected.

Anyway, the zero-length image is the only one tested with a size of less 
than 1 MB, so this works.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


