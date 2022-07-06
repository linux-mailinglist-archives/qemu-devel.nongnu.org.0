Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F9567EE7
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 08:47:59 +0200 (CEST)
Received: from localhost ([::1]:57796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ypK-0007Fc-88
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 02:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8yZt-00020n-Il
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 02:32:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8yZr-0004H1-CO
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 02:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657089118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+aWu9JCF2t702BqIlem78PQVrx8xqOynPHVBBAZLtKQ=;
 b=JsBOQ1DWT1989YaPTCtc6HGCotz6e1B9M/VlqVj/eI4xhnZPUgZ/b6zNjHr4zquL8Us9JP
 B3rmTr1hKSfz65sHDL6uI0AKX8Yn/1nDDiYb9eXBlIp6h8NC2+KCMDgjQuh8op3IyhEnMV
 3AKOY1uhLD/Ax4802rSI8ya3JvHTb94=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-IeEb210XONWrKpGqUD5HoQ-1; Wed, 06 Jul 2022 02:31:57 -0400
X-MC-Unique: IeEb210XONWrKpGqUD5HoQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h125-20020a1c2183000000b003a03a8475c6so6215663wmh.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 23:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=+aWu9JCF2t702BqIlem78PQVrx8xqOynPHVBBAZLtKQ=;
 b=7YfD9XL3nEFfgXmUkEBoyjo8TIngLAYppW25x/IzNv2u5cfrnN9hCuHGJ2vLnNkTTF
 sk3rxnSOt4wCfAzE01GDWaGXZoX49yAuzyxHw0SRVVddbx1SbUoR8jboLzBq8cbcTNpM
 /r4EWM+Wnca7tlKYo1ThKld+pRcawf5+xVG4DJQNWCejtGQFkjDNI3++B5tLBKjZ4bup
 baM8PgB+kLIil3X5R+KPeS5+fNb571TBGkuicsmHS8VDVMwKiOKVpVlskDCE3R+Lso4L
 xFhfxgB9binVHZcq/cv4mTcX8QezmxIRyAGy5IDxbeFRz3ZHnQZmi/wlq8L2VnHSGTt0
 3Shw==
X-Gm-Message-State: AJIora/2UmO0V30kO4SOpmrUzCTwfgDVtG5dAL7guLbGIQp61jkDAbhG
 xYrS4u7xqWDScHQnVCQHsbBI2EOe3sX+IofRx7GsfGXYFQz9/gsWA0+84D+/bg4GfKP+JAPjGkd
 4HcZ7CwHZaHOO964=
X-Received: by 2002:a05:600c:154a:b0:3a1:7002:3486 with SMTP id
 f10-20020a05600c154a00b003a170023486mr37161002wmg.104.1657089116752; 
 Tue, 05 Jul 2022 23:31:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1shRVi3vXzgRreuXS9xm5wuo4xGW3YprGDALCMwuKmHGwj/cIAIhKc80F7Dv/czzOWg2ZHEMQ==
X-Received: by 2002:a05:600c:154a:b0:3a1:7002:3486 with SMTP id
 f10-20020a05600c154a00b003a170023486mr37160987wmg.104.1657089116519; 
 Tue, 05 Jul 2022 23:31:56 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 p11-20020a5d48cb000000b0021d65e9d449sm9709997wrs.73.2022.07.05.23.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 23:31:56 -0700 (PDT)
Message-ID: <8c343308-2cfe-6e45-2843-f832d607c773@redhat.com>
Date: Wed, 6 Jul 2022 08:31:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20220705151030.662140-1-thuth@redhat.com>
 <CAFEAcA99=bjEzS8=aF7GrHezWwK9BsQACSy73DV_104fvMaV1g@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] target/ppc/cpu-models: Remove the "default" CPU alias
In-Reply-To: <CAFEAcA99=bjEzS8=aF7GrHezWwK9BsQACSy73DV_104fvMaV1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2022 17.53, Peter Maydell wrote:
> On Tue, 5 Jul 2022 at 16:13, Thomas Huth <thuth@redhat.com> wrote:
>>
>> QEMU emulates a *lot* of PowerPC-based machines - having a CPU
>> that is named "default" and cannot be used with most of those
>> machines sounds just wrong. Thus let's remove this old and confusing
>> alias now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   target/ppc/cpu-models.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Do we need to document this in removed-features.rst ?

Honestly, I don't think that anybody ever really used this in the past 15 
years. It was likely used with the "prep" machine, but we removed that one a 
couple of years already. The only machine that is still using this class of 
PowerPC CPUs is its successor, the 40p machine, but it has a 604 by default 
anyway, and I've never seen anybody using "-cpu default" with that machine. 
So IMHO it's not necessary to document this - but if people here have a 
different feeling, then I can also respin the patch, just let me know.

  Thomas


