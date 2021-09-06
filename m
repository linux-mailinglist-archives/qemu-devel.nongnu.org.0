Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C055A401E01
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 18:04:08 +0200 (CEST)
Received: from localhost ([::1]:47504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNH6N-0007Mq-Pq
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 12:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNH2T-0003w8-S8
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 12:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNH2R-0000Ng-MG
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 12:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630944002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rg/mtq6hYUe917kmw8iKTCFdrvXW6PEkg8f3j9btno8=;
 b=Yiuui4UbcYEv83AESfJSDWKmRxZB/rGVbwjwGrqHtVzptzfv480doda2kY8zuX2q8wlfK6
 +krunJYRwSujnt/70aJYXvgXqgyMEJO5D+xSQOf6Ro9WIr9bEYBiZlhXYi7qlKxVzZ31O/
 Nr0fnBWw7BW2KbDkUSkY2zUwJCRWfuk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-ijvrVNKYO6CBeiRFdLWSPA-1; Mon, 06 Sep 2021 11:59:59 -0400
X-MC-Unique: ijvrVNKYO6CBeiRFdLWSPA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so2483278wmj.8
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 08:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rg/mtq6hYUe917kmw8iKTCFdrvXW6PEkg8f3j9btno8=;
 b=Z6B4nusEH2BuWcOP+mndbeQfJROj/LtttndwfrCOtERMVZn3JdKmPxQMV3yWVshJD+
 AYw6t7LGkZX+1avc5XFiIcVmcTK/mywgCHcX7B3+DDrY/NTJVDOtZ5H+Ap1PnsqPJVS+
 WnmFwQ4/U3Y4qHIKQaTXsvLAGFUseI4rc7crn2DuGbzdQjDc5LSy+NuBklC8wSYextGG
 qNTkGJnmKyQ7TGtWqhBgIfcm+i4s4iJUVo70XjkmVXgcaoVRSUxVIfpfHUPlUn7ok0DR
 zrSuVPJtuVi78HZ4jioKR7SUylXXLfIYyKRR5anoC2H+eC0ajHOSpYWC0waoPehCUeM/
 yNpw==
X-Gm-Message-State: AOAM530OergQEyiIEd4/oZWCHEZbErWXw1JLaerWAXZJruBHpuzGVRxx
 44lWfJ8PPrjp06QGVtC5PT4wEk9740TJq+S9DoaP3pg5/qI9G8qeRVPy0DlnNsNnnWV2WaOu0On
 0fDpG7j47OdLpReU=
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr12081917wmg.36.1630943998380; 
 Mon, 06 Sep 2021 08:59:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDHAwR6gevyafRgdHoBUDYJDTqtpyeEirV079JEM0Nx6i/vjoov3VifbBi3nDxlP4iR5Q4vw==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr12081893wmg.36.1630943998155; 
 Mon, 06 Sep 2021 08:59:58 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id g5sm8188863wrq.80.2021.09.06.08.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 08:59:57 -0700 (PDT)
Subject: Re: [PATCH] meson.build: Do not look for VNC-related libraries if
 have_system is not set
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210906153939.165567-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fe8c56cd-1d4c-1699-03be-1926d0bcd62b@redhat.com>
Date: Mon, 6 Sep 2021 17:59:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906153939.165567-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/21 5:39 PM, Thomas Huth wrote:
> When running "./configure --static --disable-system" there is currently
> a warning if the static version of libpng is missing:
> 
>  WARNING: Static library 'png16' not found for dependency 'libpng', may not
>  be statically linked
> 
> Since it does not make sense to look for the VNC-related libraries at all
> when we're building without system emulator binaries, let's add a check
> for have_system here to silence this warning.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


