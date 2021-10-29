Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A058043FAA3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 12:21:22 +0200 (CEST)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgP0j-0000O6-OC
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 06:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgOFf-0002Ft-TZ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:32:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgOFb-0003Np-8d
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635499956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2afHX5iDST0Jq3uxg5VqZPOetKxaOPDOSv5D8WlB+4=;
 b=F+AU0/h2y8zThdjPrmt044RAiUG4hLvkS1uroSI7wLQ7W8vHWvvW302BM1/4+MCd7p2SFF
 xe+B2GXzI6+a97UwChVMpfQvBTlkAleeiAsgHQe8DiWko5lulawfeLC1jRe8LktUGsmETO
 nqftE+mkfIXgzLOoXx6sVYcM3ZmTC5Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-W_TmsNlxNHCAjmKcIhUOcQ-1; Fri, 29 Oct 2021 05:32:31 -0400
X-MC-Unique: W_TmsNlxNHCAjmKcIhUOcQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso3498969wmq.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g2afHX5iDST0Jq3uxg5VqZPOetKxaOPDOSv5D8WlB+4=;
 b=iM06HdCUKJVeOG6hZDTmrbW1TQv/w3u2K+UsZpCZGuHSMfIP2rKZxGUCJczcX1FwEB
 bFg+t1eZYXJ+YCmP5E2kVZ2iy1YmtFkr1GJH5zJdV86M+iwcmRN/UOp0MwnPoZ1RipNN
 kaU2/A/l3zBMKKJMCTHCUfluw3PTZfopggOw6dP4JenpM1IJ20ozLfmRXkL/2Az4qLKi
 6KumnYYhDsrlDz5d25IPEs5ISaUi5xd55oFXiEuztuJcnZIDf/9Km5MsQBcMEawWWiAc
 yKrqbzqDU6cAoVPo3qYo4EK0y2QevxC+4ET446/WIXxM//iKDXgbMzY0L91ZOhCulzQM
 reaA==
X-Gm-Message-State: AOAM531A+iAY33o2NMzEW/oyhhuXZrGynZPbwPIv0kRpjmRUeuP2CspB
 TbyAlun8Q9Nvh3PwlBtxmN3QFA3HI7x7eNA75IHb2HgZBfHgY1euxRCJmiOAIX+dRnWhXH1Foop
 GWzQHd6pCqaVZ8YU=
X-Received: by 2002:a7b:c1ca:: with SMTP id a10mr18630868wmj.91.1635499950459; 
 Fri, 29 Oct 2021 02:32:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+7/6hvA3hVk+NO9Ur1CIy9oZyLO3ioe73/pHdZkkcTI35Oui9xhR7uSvMp8N4MK5aWZ2bFQ==
X-Received: by 2002:a7b:c1ca:: with SMTP id a10mr18630847wmj.91.1635499950250; 
 Fri, 29 Oct 2021 02:32:30 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o9sm2458862wrs.4.2021.10.29.02.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 02:32:29 -0700 (PDT)
Message-ID: <21ebce18-cd60-3fa9-4b0a-97acc7fbc7c2@redhat.com>
Date: Fri, 29 Oct 2021 11:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] meson.build: Allow to disable OSS again
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211029071318.1780098-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211029071318.1780098-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 09:13, Thomas Huth wrote:
> If sys/soundcard.h is available, it is currently not possible to
> disable OSS with the --disable-oss or --without-default-features
> configure switches. Improve the check in meson.build to fix this.
> 
> Fixes: 87430d5b13 ("configure, meson: move audio driver detection to Meson")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

>  oss = not_found
> -if not get_option('oss').auto() or have_system
> +if get_option('oss').enabled() or (get_option('oss').auto() and have_system)

Shouldn't this be 'if have_system and (enabled or auto)' ?

>    if not cc.has_header('sys/soundcard.h')
>      # not found
>    elif targetos == 'netbsd'
> 


