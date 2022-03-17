Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051234DC944
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:51:44 +0100 (CET)
Received: from localhost ([::1]:51004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrTa-0005Jz-VV
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:51:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUrMg-0006vz-Fh
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUrMd-0002vX-DK
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647528270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sr9ijEJeoFDCJ1htd9orZ/el+l0rLcWPmPgcwbPVwac=;
 b=AboyAILo5z5wCsM4WlyT096BxEp3JtITCfSTSeTEftrhsAUB7ZUmkC52pAghG88CScyCOz
 0mim4P0UliqLwyhUPUalMLI0ypa5LZEv/NuPwe+Mi4kNUGVxW/N8vLQJ+/hKsvbwzGcMkR
 MBZ+0HaMOCyXl/rwJsGmGDbJKHeu/xQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-leHkUwuxODWlDPCGAZ50Zw-1; Thu, 17 Mar 2022 10:44:29 -0400
X-MC-Unique: leHkUwuxODWlDPCGAZ50Zw-1
Received: by mail-ej1-f69.google.com with SMTP id
 h22-20020a1709060f5600b006b11a2d3dcfso3049578ejj.4
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 07:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sr9ijEJeoFDCJ1htd9orZ/el+l0rLcWPmPgcwbPVwac=;
 b=1wEgSM84YGAzFxEEQTE07mALsXOoayYGl5UGgWpErjKyuSMuO9hq4T6DpGEJ1dUoJT
 ZgWcSxUI9yGxmWgI51pdKAjgztbyUnqYmoKM5Q4+fHdgcbyguEH1gQafqqsqf7Jfr/IU
 9QK7sEwc/UfDjs9PCzKQqbajRu3T8n6m1AG54L/Q6FPCB9CrB50FBvpVCwWUWXkxrFaV
 9MEgCipXdqpC3TQVEGbwICd75EFY63j5VNu526uL+Hd9cKjKZmJ9urPod4La12WnNySe
 e811g+K/NZ8CQqLUxJnfMTJoqqSCQATsG7gwUnGIh3w+uRQ0y9NvuNeFXPLodUKYBZxC
 7zew==
X-Gm-Message-State: AOAM530KjU7ku1/ENPQldo+9eOoU1nfzIPMybZgA91V5cgTEZB1ZueqJ
 8vczBVBHCGhxB+hCXB2ZRe4mFwh1yb3rwggEnrsvt1JbwiSaUEM6mgbw2W6td/rcvOkGmVZ5d4S
 dctceWivIXqiyAR0=
X-Received: by 2002:a05:6402:27ca:b0:418:8e8f:a095 with SMTP id
 c10-20020a05640227ca00b004188e8fa095mr4897417ede.378.1647528267500; 
 Thu, 17 Mar 2022 07:44:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4re2Gxw/lqoUxdWtbsqP10g8LT6jNyG0Y31v3rhcpSMCwQoiBGawePlbJWjLTzPDQQRKegA==
X-Received: by 2002:a05:6402:27ca:b0:418:8e8f:a095 with SMTP id
 c10-20020a05640227ca00b004188e8fa095mr4897399ede.378.1647528267310; 
 Thu, 17 Mar 2022 07:44:27 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 js20-20020a17090797d400b006dfad24c5efsm173340ejc.44.2022.03.17.07.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 07:44:27 -0700 (PDT)
Message-ID: <99f68b93-7865-9fd1-e0da-3b14d0e3f2f8@redhat.com>
Date: Thu, 17 Mar 2022 15:44:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/14] iotests: replace qemu_img_log('create', ...) calls
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-12-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-12-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:54, John Snow wrote:
> qemu_img_log() calls into qemu_img_pipe(), which always removes output
> for 'create' commands on success anyway. Replace all of these calls to
> the simpler qemu_img_create(...) which doesn't log, but raises a
> detailed exception object on failure instead.
>
> Blank lines are removed from output files where appropriate.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/255     |  8 ++++----
>   tests/qemu-iotests/255.out |  4 ----
>   tests/qemu-iotests/274     | 17 ++++++++---------
>   tests/qemu-iotests/274.out | 29 -----------------------------
>   tests/qemu-iotests/280     |  2 +-
>   tests/qemu-iotests/280.out |  1 -
>   6 files changed, 13 insertions(+), 48 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


