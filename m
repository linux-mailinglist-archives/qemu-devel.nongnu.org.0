Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC7D625B55
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:38:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otSz7-0007CS-HL; Fri, 11 Nov 2022 07:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otSz1-00078q-QN
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:18:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otSyz-00009n-7t
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668169084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aPyCcmmI0EUPwv4X1pWSoRg5r7xP8YENC89k7mlIiEc=;
 b=CfFjLhWlaakDyLmUQbXUuKPSkm/pNuW68ZK8AuVTjkknQsXR0HbsibDODbrtYOyMVjklE6
 2BB08y+/qFcMPEMjH0Sqncy3frtYwKJND6fABqOzcQaeLYJwGMAMqzbwjTPx5rvJK06zgd
 y9jpOu5FEiXdLWw3gmDvc92j7nVkd30=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-4WjSX3iLNvGqZT6Y_lsiTQ-1; Fri, 11 Nov 2022 07:18:03 -0500
X-MC-Unique: 4WjSX3iLNvGqZT6Y_lsiTQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 v7-20020a05620a0f0700b006faffce43b2so4566052qkl.9
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 04:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aPyCcmmI0EUPwv4X1pWSoRg5r7xP8YENC89k7mlIiEc=;
 b=FZouslzeZwub8z8npWcBuC0vSj+sdkzvpQG3L3JThoBpf9QQN1opkPaZgKRjRKSlTo
 UMW7CfI07lPxfagaHzMP90kwCjxFkExG4Fb5mwUYTXs0S+dO8D5qWsllpRdrvCK5JnHe
 JOXPCUA087Z8N/6WickG1AGq/5zj6K7SPLjAjaCoYZq+bLXdZ3RjR2aalTUBd7ce5KpA
 97CayaeD04AYVKoDrzsrCd5NDt/oEkGDtDWN/C41TqvZjyiFRmFhRKqJBf+ZEnBgv9Am
 5coFLXQRMmG5Bcf2nN01WMPs3MhyaD9b3nMoqVVPqhB0IBPA16zoGwfJQHCdWY/QOfl1
 y/sg==
X-Gm-Message-State: ANoB5pkkbQ1e/QB2u5HkXBrmlRZ6634Cgog1RqQMhad4wuQtJqTm7XBd
 WEaTJiW9/+NVOGppm6S0uS0cDWf2tj3cgaRwqrWr/lLA8pbhIfsvQMFq19CAvOhbLig61v3D9VI
 Win5uoIyhtMNhYz0=
X-Received: by 2002:a05:622a:6004:b0:39c:cb6a:300b with SMTP id
 he4-20020a05622a600400b0039ccb6a300bmr980679qtb.181.1668169082965; 
 Fri, 11 Nov 2022 04:18:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4LrxKbx353s8+CjITnDxUbpI9NvNunGnm0FPgw4wC3c8PPDKenhVOtAKwzWnPNcy5ZLasMfw==
X-Received: by 2002:a05:622a:6004:b0:39c:cb6a:300b with SMTP id
 he4-20020a05622a600400b0039ccb6a300bmr980665qtb.181.1668169082756; 
 Fri, 11 Nov 2022 04:18:02 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 ga16-20020a05622a591000b003a598fcddefsm1166450qtb.87.2022.11.11.04.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 04:18:02 -0800 (PST)
Message-ID: <dc4e80ae-67a4-45b2-6ad0-5eb32fb0d923@redhat.com>
Date: Fri, 11 Nov 2022 13:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/8] block-backend: enable_write_cache should be atomic
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20221108211930.876142-1-stefanha@redhat.com>
 <20221108211930.876142-3-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108211930.876142-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 08/11/2022 um 22:19 schrieb Stefan Hajnoczi:
> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>
> It is read from IO_CODE and written with BQL held,
> so setting it as atomic should be enough.
>
> Also remove the aiocontext lock that was sporadically
> taken around the set.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20220609143727.1151816-3-eesposit@redhat.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


