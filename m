Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE48C6A9C38
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:51:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8cZ-00006o-EI; Fri, 03 Mar 2023 11:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8cW-00006D-JC
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:51:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8cV-0003FJ-44
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:51:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677862257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yCPPOFkMVKFHRM8TXdlC9VjWNn4ClAqs9Z7p4aRO3JY=;
 b=YazsYjvYJFvS5i9IvfxCLfqwcSBrx/8C8NYqfC57PtBi2u3qUyxmddK/y+HfTVIRE68iCi
 hc1gqJEt17zxk4loQgEjcPkBqdwOTfjMeEaqlFMzWlfehlX1ZEF9pffaotuZnLDShjXab6
 BLlFUoU97ab6Oy4CiYAQxcdeuYH89SY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-KTvzNEU8MiyHtHb4-6TKRw-1; Fri, 03 Mar 2023 11:50:56 -0500
X-MC-Unique: KTvzNEU8MiyHtHb4-6TKRw-1
Received: by mail-wr1-f72.google.com with SMTP id
 a7-20020a056000188700b002cdd0562b11so482171wri.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yCPPOFkMVKFHRM8TXdlC9VjWNn4ClAqs9Z7p4aRO3JY=;
 b=c26yXZyNnC2HePML8QiCi3cBCp89BU9aVmSEiRyGBz0GydPwrUhz9OLJcZyMX7rgMS
 5V/2SSXrVT7QiZxMJRC92npbalONtOjPNQAULV1qxJrGPs8VngZXpiV+ktry66D7WSk6
 VwomrhBAh7io/lTSVyObMtgd5KZRnZEtFJqIDNMFjCE1F4UmiG+o62UHEyCqd6gVVoIX
 BXXLFv4ap+umtgz8H1jHC8SjaMzAWr8C6umsTzuJox9v7oFmx4GTclZHbKx1mcfNg5M/
 dVKzCcOKKzynN7Q8WKgCjz4QDLBeYAJG0Znkrkp858gvwmOKVLmuVMQ5pugnACccgNFu
 xGdQ==
X-Gm-Message-State: AO0yUKVxvgEzClCWCXDHEmljEGW7MUYVrlPdn1QgVLrg+VrTK/E0LjWs
 plUni6Z3R6M3/Fd1oqqWFYZuDNZSALs7rzuldNMDJel3GBw2x6I6CT1c7ax2OP1r6T8de02PmCg
 Ng493iyZCDkUwSAs=
X-Received: by 2002:a5d:4a4a:0:b0:2c7:434e:9a5a with SMTP id
 v10-20020a5d4a4a000000b002c7434e9a5amr1693771wrs.65.1677862255559; 
 Fri, 03 Mar 2023 08:50:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9EJtRieyFNvuwjZXhVoj/yMm/JRyfwxcOQekI3pXloTrlxTwCy7GQOurS9hfKWru6PYBUWbQ==
X-Received: by 2002:a5d:4a4a:0:b0:2c7:434e:9a5a with SMTP id
 v10-20020a5d4a4a000000b002c7434e9a5amr1693765wrs.65.1677862255310; 
 Fri, 03 Mar 2023 08:50:55 -0800 (PST)
Received: from [192.168.8.103] (tmo-099-97.customers.d1-online.com.
 [80.187.99.97]) by smtp.gmail.com with ESMTPSA id
 n1-20020adffe01000000b002c4084d3472sm2765954wrr.58.2023.03.03.08.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 08:50:54 -0800 (PST)
Message-ID: <02c59023-b63a-21dc-a2a8-6ae2398e3d6a@redhat.com>
Date: Fri, 3 Mar 2023 17:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 8/8] iotests: remove the check-block.sh script
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230303160727.3977246-1-berrange@redhat.com>
 <20230303160727.3977246-9-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230303160727.3977246-9-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 03/03/2023 17.07, Daniel P. Berrangé wrote:
> Now that meson directly invokes the individual I/O tests, the
> check-block.sh wrapper script is no longer required.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/check-block.sh | 43 -------------------------------------------
>   1 file changed, 43 deletions(-)
>   delete mode 100755 tests/check-block.sh

Reviewed-by: Thomas Huth <thuth@redhat.com>


