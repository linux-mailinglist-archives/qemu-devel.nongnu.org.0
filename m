Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8754EEE63
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:44:22 +0200 (CEST)
Received: from localhost ([::1]:36514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHZd-00066J-Ld
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:44:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHSA-0003Ye-S0
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:36:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHS9-0000p4-Cd
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648820196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3KyCiJEMayZzjkNh0vtJ+euoCf9OEVw86vQ9aZY8Wo=;
 b=bGkCpdELrYnEJ3AA/kGrMVosjd4YZKN9341siTOoQGgVI08JkaqpxkAMDFOcIZgBXUoKLS
 BvGwJ1cVzrOG7quj2NmL0p676rtMxUwTvNH2FJiDl5niWPvmSgSNIM78n5wNAF/800Lm71
 f6+tD2B09zfC6dTgKM0slAWUszuygbI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-q1RimVXPOFSFzTY6xirsZQ-1; Fri, 01 Apr 2022 09:36:36 -0400
X-MC-Unique: q1RimVXPOFSFzTY6xirsZQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 m12-20020a1709062acc00b006cfc98179e2so1608047eje.6
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q3KyCiJEMayZzjkNh0vtJ+euoCf9OEVw86vQ9aZY8Wo=;
 b=rq+WmPwW3qU/KRabKGIfpx5VnChuQh+DHub3DhqSXAO2jzuSS1gdjr20pC3ZWNsuBV
 X8OldHjbBazCeZYAvVo0zlkp9FwKNKWLcUGsH+zWFXXD9CrL0iri75wXftYJL1amKftn
 AFg6XF29wxGQ/cEs4ToYZWEdgcE13eLUgR8xfOE2wrXoj1THUgmd7dEXEapzjSXF8c4T
 NRPFiA9YQxjp73DkIrPI7UZIg7RtS6leiYMARWsReEeTuhATrm/TLAIvxZpxzhvzhGh0
 VQ1pGRhS2yJfx+YjslRBmm3hKxYDkH9khNXokqcjdHRtx7AMJsNVllOQXIVSsA7EWMEf
 4eQg==
X-Gm-Message-State: AOAM531L/X0yAUwoAYTULaldYyenBYXM8kvXo1W9pIT5OxSC/08daFjT
 QnUbEo/TOmNdqLsJfQb4dqCoTgAiB5tFUBlpIq+AkD4jD4V4t0TaaPs+ddKrszh1/ltJ1qj/iZc
 QqNx7Bu5yidmHwdg=
X-Received: by 2002:a17:907:8a1e:b0:6e0:fec7:5ba1 with SMTP id
 sc30-20020a1709078a1e00b006e0fec75ba1mr9660638ejc.237.1648820194518; 
 Fri, 01 Apr 2022 06:36:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9RmfOdFXcbIMzKQvwA7coHmM2XzkpyIYuAnBael4xF8NRHcIbPxBg2Suz64Zq52PPfi9hdg==
X-Received: by 2002:a17:907:8a1e:b0:6e0:fec7:5ba1 with SMTP id
 sc30-20020a1709078a1e00b006e0fec75ba1mr9660620ejc.237.1648820194321; 
 Fri, 01 Apr 2022 06:36:34 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a50fe81000000b004197f2ecdc2sm1196462edt.89.2022.04.01.06.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:36:33 -0700 (PDT)
Message-ID: <830479ed-6bb7-771e-0d4a-db3c3346670c@redhat.com>
Date: Fri, 1 Apr 2022 15:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 7/7] iotests: copy-before-write: add cases for
 cbw-timeout option
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-8-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220401091920.287612-8-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
> Add two simple test-cases: timeout failure with
> break-snapshot-on-cbw-error behavior and similar with
> break-guest-write-on-cbw-error behavior.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   tests/qemu-iotests/tests/copy-before-write    | 78 +++++++++++++++++++
>   .../qemu-iotests/tests/copy-before-write.out  |  4 +-
>   2 files changed, 80 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


