Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E58939D51E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 08:39:38 +0200 (CEST)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq8vB-0000Az-B3
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 02:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lq8tk-0006sA-68
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:38:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lq8th-00052D-S8
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623047885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlPff1dO2jUNuXIXizOUeFds6VUcCs9RiqiyleaepgY=;
 b=DD74Cp1HRWwtssZCTdGtytiJiYA9kZ2vnMCaR5OZy1t1M3BGTXAyRBUConP3g9dY95lFsA
 L/zWiJX2V0MpfyPm9Unko5GoaoWLyIwRPDM03X6wzgWleeqSkrUNryMH8KDQa8/BkTFl3V
 YXfJzlDlEiQMTMCKynJPmcuhs+3M7WI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-Y7icJzymNm24nwu4JUb93Q-1; Mon, 07 Jun 2021 02:32:57 -0400
X-MC-Unique: Y7icJzymNm24nwu4JUb93Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 f22-20020a1c6a160000b029018f49a7efb7so2368361wmc.1
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 23:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YlPff1dO2jUNuXIXizOUeFds6VUcCs9RiqiyleaepgY=;
 b=HvoqEDynBowREVOpGD7Px3GcsP8Qfz9jVVIX70u0iT+aDkI/DqTcpG6ogO9aHjgiE8
 9i1Dke9c+ObWBSzQSCa0ucgA8UEYo1c6H1I43CTrx/WyswqFRysNxwTI/punYxwRBQUv
 rqKfnMPw3fMw32IH9KeiSiQU5/oOAX9W7kx3lrz16J47stIpVYW7l3P0NFHIalA/cmfQ
 vM2Fvbj7VfUtNHTRXLmCvylf7telfRIDzm/8WvfKCg5iD5y0vPA1lQnhz825MhoJKU+T
 GUw6o/vLc+WlDoOjqX2pi7uxwN+hCmoOccayN5HLcUxswUSiqh/9hqOIqG2v9vHPDhIu
 hEMQ==
X-Gm-Message-State: AOAM532jLCg6d6OzavjrT1KRScpOg9OSLhrrcKyINQmgF+j9WYM22Zzj
 Lcw8g83EPxIBzajgsmmDBjnfioDSertaoUqRJJPaSnR5s9nmCZF888UEZFCREnkcLMLjifbeV6p
 M2zM9VkH9I+VSdfA=
X-Received: by 2002:a1c:a917:: with SMTP id s23mr10932134wme.55.1623047576454; 
 Sun, 06 Jun 2021 23:32:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc91uNx/kY6F9jPoMvmz8nQV/rKluaaR7eaPgvNnsm4wLjMcOooLESzbfDFq3tvN0ptSu7Ow==
X-Received: by 2002:a1c:a917:: with SMTP id s23mr10932118wme.55.1623047576241; 
 Sun, 06 Jun 2021 23:32:56 -0700 (PDT)
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de.
 [217.87.83.110])
 by smtp.gmail.com with ESMTPSA id 62sm16128648wrm.1.2021.06.06.23.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 23:32:55 -0700 (PDT)
Subject: Re: [PATCH 1/2] Remove leading underscores from QEMU defines
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
References: <20210605174938.13782-1-email@aabouzied.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <909aa479-9e58-1672-ac34-108815688dd2@redhat.com>
Date: Mon, 7 Jun 2021 08:32:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210605174938.13782-1-email@aabouzied.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/06/2021 19.49, Ahmed Abouzied wrote:
> Leading underscores followed by a capital letter or underscore are
> reserved by the C standard.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/369
> 
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> ---
>   include/fpu/softfloat-helpers.h             | 4 ++--
>   include/hw/usb/dwc2-regs.h                  | 4 ++--
>   include/hw/usb/xlnx-usb-subsystem.h         | 4 ++--
>   include/hw/usb/xlnx-versal-usb2-ctrl-regs.h | 4 ++--
>   include/qemu/plugin-memory.h                | 4 ++--
>   include/qemu/selfmap.h                      | 4 ++--
>   include/user/syscall-trace.h                | 4 ++--
>   plugins/plugin.h                            | 4 ++--
>   tests/qtest/fuzz/qos_fuzz.h                 | 4 ++--
>   tests/tcg/minilib/minilib.h                 | 4 ++--
>   10 files changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


