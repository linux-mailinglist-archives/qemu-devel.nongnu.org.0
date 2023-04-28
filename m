Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3F6F1CB9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:38:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psR5Y-0006L1-02; Fri, 28 Apr 2023 12:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1psR5W-0006Kj-N4
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:36:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1psR5V-000376-21
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682699808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1LJ8LpxL7hT/HJ2QDTLeN3qDBH/m+XDjdTYyNvSd6k=;
 b=A0+w/UK7sFQBF3+hqcfonoTF9CzRtkeSDOaBDBly2mIuu1/onP5lTWgV2v9zrs4M8iTWtb
 Chq8wXY1B29P5KFR3acfN68DruzM7nLtaji2D4Mg+X3rgNBMhDJFvrLUQCcxaARX1ojdIe
 TsCSFq+tVleTYI51Inl5jVC50XH4O5M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-QSbFxU2qPTiyygdTR6QCVw-1; Fri, 28 Apr 2023 12:36:45 -0400
X-MC-Unique: QSbFxU2qPTiyygdTR6QCVw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9532170e7d3so963158266b.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682699794; x=1685291794;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U1LJ8LpxL7hT/HJ2QDTLeN3qDBH/m+XDjdTYyNvSd6k=;
 b=Vgu5cp6d6okjURokHmz+J05BaW2gczf83cU/MMotVFZ3oXhOSghNN7KYsM4WQsqV7n
 j0YG74y1zNc2lXEICRfaWNlnDjkRs11PBsY519BXqkrEPhnVMTUjKPyR5bZHboVpCktu
 TRPtrBpefLaDJY+fphBz2kzcar+8NO4Bec4hEEQlmwGSwAAb38+kZNsmA34b6Z+oEHxZ
 nmJ6fyYIBJiDEMVP5qRlzvcPjPv3yK/GBDaq0SttCXG5Xpb5z2D9IQPzAB9SXMI+CfQI
 OSWG1ImfF46k7G3h2zRi2v8V9TsXpzM/pJuzR2/0nTxq7hYECahbkSoVApwOXCNEKnAn
 RuPw==
X-Gm-Message-State: AC+VfDyXmsIew5XY0XLITKOte/YTmYfMpo6rsefXrhE4Jhst/MfZKPn4
 HucsT/DL/4j0XAYDNFUDoCbKzcV0Od7bJ9T2L3N/5GdE74CoZMhxUxcwmjpg2iTTbJlLsqambpR
 TiwbNbvwvsxKRogE=
X-Received: by 2002:a17:907:16a9:b0:94a:4fc5:4c2e with SMTP id
 hc41-20020a17090716a900b0094a4fc54c2emr6359374ejc.49.1682699793922; 
 Fri, 28 Apr 2023 09:36:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4lnVZwxKgwpZ/6TrMsTRNNhwDVu+3ejWVsz+5zGXQfgJNh2f8N6kmIVHjiUktc5kCPBPf5mg==
X-Received: by 2002:a17:907:16a9:b0:94a:4fc5:4c2e with SMTP id
 hc41-20020a17090716a900b0094a4fc54c2emr6359350ejc.49.1682699793577; 
 Fri, 28 Apr 2023 09:36:33 -0700 (PDT)
Received: from ?IPV6:2003:cf:d741:bf09:7bd7:9744:2009:333a?
 (p200300cfd741bf097bd797442009333a.dip0.t-ipconnect.de.
 [2003:cf:d741:bf09:7bd7:9744:2009:333a])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a170906394b00b0094f4f2db7e0sm11629992eje.143.2023.04.28.09.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 09:36:32 -0700 (PDT)
Message-ID: <45b9a36f-e701-a273-5089-868257aab62a@redhat.com>
Date: Fri, 28 Apr 2023 18:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 00/12] parallels: Refactor the code of images checks
 and fix a bug
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24.04.23 11:31, Alexander Ivanov wrote:
> Fix image inflation when offset in BAT is out of image.
>
> Replace whole BAT syncing by flushing only dirty blocks.
>
> Move all the checks outside the main check function in
> separate functions
>
> Use WITH_QEMU_LOCK_GUARD for simplier code.
>
> Fix incorrect condition in out-of-image check.

Reviewed-by: Hanna Czenczek <hreitz@redhat.com>


