Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0CF3479DE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 14:47:37 +0100 (CET)
Received: from localhost ([::1]:56472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP3rE-0002qo-CC
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 09:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lP3oz-0001tE-3i
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:45:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lP3os-0005A1-An
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616593508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNX3cUEJEvvitchZ4JiICyTbhnRmdCtN6N6kmuEXzAQ=;
 b=DYnyXmCgDb09O5G4cEqSRqOFwrSio/MuKIyBDW4C0zaZHPopiGmU4+c07zIgLLlx6EDSDk
 gl75RncPbrBsjACn3NcCRtNURCMQk8EzHJXH7EC2YsslKbkWmLnJYVY/ZJ3paCx1TCGkf1
 GQ3AwTeLg68nDFFCbCFjLNM1aBWlAmU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-HE81UMOYOLqJrxrnCaT_Rg-1; Wed, 24 Mar 2021 09:45:04 -0400
X-MC-Unique: HE81UMOYOLqJrxrnCaT_Rg-1
Received: by mail-wm1-f71.google.com with SMTP id i14so530509wmq.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 06:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sNX3cUEJEvvitchZ4JiICyTbhnRmdCtN6N6kmuEXzAQ=;
 b=IqhO+9PmNu5RNHaTRaZMX1QqE8qtf7sIEMLmsgtAiSTcGo4ffUDguKM4Rk+zGyt4Li
 W/ypOR3vvChf57hjZ0ILRvHYXDDukURqxlhOzSWg88S64aEzwffinHKEsQFhwGdxCYeG
 kzAlxU6ZrQ6YjPpa56L+uOJcNSfun8jJ/VQfkCGeDtpD2nTpXsR+mhEqSoJKWhTPPj+U
 g6EUIBDRiwyYXC9FDci58LXjazzmGDOZ7Qoa7UhuhVPKBYWRrjI6aW5jyr4CZ6uaYS3w
 LwF4kA9kiGovTG6jPjjfY0esU4UaMJoNAT/QIZcylQO3NX/puMKbI4I5sd7I3HZeXGiK
 692w==
X-Gm-Message-State: AOAM533TSm+eQJ/VwSJCZg2k7PeOXDfb5W76UAoWLbHMw3fEG2mxwZhF
 FcFPo0pHS+F/K5GI5AiGQcd9wVAC2dX5TB4mn9DaSKp9mhTB9Gs39S7H5p1ctsz2M/eHmW2+U7X
 ASxftH8T6JQmW1sg=
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr3013425wmi.88.1616593503473; 
 Wed, 24 Mar 2021 06:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdKwGMdMJ6Z7fj8XISovW3Ng8H3ajrRgtYCYoVBSYBWWDKemE3QuKziSl7K0rTjfnDziKVWw==
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr3013401wmi.88.1616593503159; 
 Wed, 24 Mar 2021 06:45:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e17sm3488513wra.65.2021.03.24.06.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 06:45:01 -0700 (PDT)
Subject: Re: [PATCH v2] meson: Propagate gnutls dependency to migration
To: Jessica Clarke <jrtc27@jrtc27.com>, qemu-devel@nongnu.org
References: <20210320164730.33285-1-jrtc27@jrtc27.com>
 <20210320171221.37437-1-jrtc27@jrtc27.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a803e5f6-61d6-3656-ca62-d2399aefc09b@redhat.com>
Date: Wed, 24 Mar 2021 14:45:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210320171221.37437-1-jrtc27@jrtc27.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/03/21 18:12, Jessica Clarke wrote:
> Commit 3eacf70bb5a83e4775ad8003cbca63a40f70c8c2 neglected to fix this
> for softmmu configs, which pull in migration's use of gnutls.
> 
> This fixes the following compilation failure on Arm-based Macs:
> 
>    In file included from migration/multifd.c:23:
>    In file included from migration/tls.h:25:
>    In file included from include/io/channel-tls.h:26:
>    In file included from include/crypto/tlssession.h:24:
>    include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
>    #include <gnutls/gnutls.h>
>             ^~~~~~~~~~~~~~~~~
>    1 error generated.
> 
> (as well as for channel.c and tls.c)
> 
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
> Changes in v2:
>   * Added error to commit message
> 
>   migration/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/meson.build b/migration/meson.build
> index 9645f44005..6fa2f8745d 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -24,7 +24,7 @@ softmmu_ss.add(files(
>     'savevm.c',
>     'socket.c',
>     'tls.c',
> -))
> +), gnutls)
>   
>   softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
>   softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
> 

Queued, thanks.

Paolo


