Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464772B434C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:08:00 +0100 (CET)
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedId-0005R5-Ab
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kedAF-0000Wd-Ma
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:59:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kedAD-0002lu-3D
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:59:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605527954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O1KHHGZJNijji+A7BbaYYYe/bPi7pnt0Qw+SHdO2dsI=;
 b=fvkJSz6XKgcuFuaBDdfL7l45Cna0K7tos7r/yw8XiHyojoXv+oel2jsbkPAhE9mbC2XiPx
 qZs2+jWsazMOhxN3CIDffy7jDyHYQJKafqSEZK6aK86T5h5KlyZbnZQckumSsOPT3yvEdW
 X86nqAjvVJ+ivfOR6iVqGHk+CQznrk0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-vvy_n-efPSuzSW4TOGF47A-1; Mon, 16 Nov 2020 06:59:12 -0500
X-MC-Unique: vvy_n-efPSuzSW4TOGF47A-1
Received: by mail-wr1-f72.google.com with SMTP id d8so10975806wrr.10
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 03:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O1KHHGZJNijji+A7BbaYYYe/bPi7pnt0Qw+SHdO2dsI=;
 b=i9UzUtb/PtnTVa5e2DDswBkrv8ZinGJSLVvXARQ+nBnotkq+Qptze1zvPndycMgg6q
 6XU6JNJhqT8e32LUwXQNfKsjIk3Tz1R78z7lWxnnUlWQy8QtdreqBNRhU41MR2ljJpoy
 v0PGiOZQn03zJzVz8OPWApucdV0yaftvK6ZzIN5zTQNTGq+KS/FqkJu2Bzo78ytzBjoF
 Y7d3JlxMpsJZ46dUxMF1aQB/zc80yZ1VIIn7yA54NGvJQJKplh3mjnLYEiwDCK0M/eBZ
 31IzrurWwOcW8d73597fpQjKrtnn9UKT7/zqXhMy3Zyjap3jiPpNCgTTUpxbiRIQcEm0
 j5mQ==
X-Gm-Message-State: AOAM530S/o/jyLx9rG+A8y3GTKBMfXUxpkjPmzpK+Sv2IZoZQ5b7cIfA
 RWRPssUof/tBiKJF1wJTlXPNuNUYBktn9S6D1gmoSo5186Z5xu3DWWa7URS8/uGYdBRDXiahq6j
 t4lpgpUm0Yeo7gAltaupx39RsHVF8+xY+/hy5em2TBOtLMZqkco145A6Hfqy0u/px
X-Received: by 2002:a5d:474f:: with SMTP id o15mr19075339wrs.100.1605527951205; 
 Mon, 16 Nov 2020 03:59:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYTJ8cUDHjPQ4kkmnzoLsoyyVCwpRUSxJcUYAzgzGnerlMUqzLHhMrOH/1nY5pz0zwwVbSQQ==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr19075312wrs.100.1605527950889; 
 Mon, 16 Nov 2020 03:59:10 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id d10sm22534500wro.89.2020.11.16.03.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 03:59:10 -0800 (PST)
Subject: Re: [PATCH-for-5.2 1/1] gitlab-ci: Use $CI_REGISTRY instead of
 hard-coding registry.gitlab.com
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20201113172519.31056-1-rebecca@nuviainc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <42a57502-3a85-0215-8af6-b76620b3a88a@redhat.com>
Date: Mon, 16 Nov 2020 12:59:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113172519.31056-1-rebecca@nuviainc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/13/20 6:25 PM, Rebecca Cran wrote:
> Update containers.yml to use the $CI_REGISTRY variable as other files
> such as edk2.yml do.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  .gitlab-ci.d/containers.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 11d079ea5810..892ca8d838ce 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -8,7 +8,7 @@
>      - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
>      - apk add python3
>      - docker info
> -    - docker login registry.gitlab.com -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
> +    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
>    script:
>      - echo "TAG:$TAG"
>      - echo "COMMON_TAG:$COMMON_TAG"
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


