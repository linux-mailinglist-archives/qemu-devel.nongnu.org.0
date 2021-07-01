Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E53B3B9667
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 21:19:12 +0200 (CEST)
Received: from localhost ([::1]:36190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz2DP-0003Ep-Ah
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 15:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lz2Bg-0001ia-Ue
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lz2Bf-0008NL-Cs
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625167042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dX83rIFx0d2QI8CTVI+SkcwgAnx1NMvJSxfmPX84nc=;
 b=FV2Ncz7QHUIkQAyFmcYb/4lsyjNBQzsMk1TuzuPg0GCSQBvJ9PCELIJp3T6JeuvycF94jI
 n62BD+csipOm+jegDCuebFTInjBE+ITksna43wp2X9lZICSzvURT9gLbvw8kRP6yPDG0FG
 DRkWPZ9hAJuxH6rzbAoUkVq6zQKDG4g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-VTGoFoWQOBuOPZzRhbARxg-1; Thu, 01 Jul 2021 15:17:21 -0400
X-MC-Unique: VTGoFoWQOBuOPZzRhbARxg-1
Received: by mail-wm1-f70.google.com with SMTP id
 t12-20020a7bc3cc0000b02901f290c9c44eso2428112wmj.7
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 12:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5dX83rIFx0d2QI8CTVI+SkcwgAnx1NMvJSxfmPX84nc=;
 b=d2viVWLcIqzRaqUYwLkYChf6WMHepkhzHo8kPdku9PMMc6WbE4Q32atdQIhL5LGL5Y
 afxF46j03dlfz26mzIiiEKWgAKeWQfakCorGlXXkFCwrd55DiU4jVUupsmkDe2ASG7bp
 6ukoEH0OVQFNprsSWKk6n5Fsx5yFIt+uKZXmjckPYOtmJM5ERQyJA66O9LqAqzdTvEqw
 uMSjS6PsbWpCv9CR1bxFcqXmd0bnyWxV04zc3pKlw12wo3qSM2hjJOuDNkI565sEACLM
 1+7mJS6eGaYDNyedOAxWeh7NOC+DEOQ/3A74KR3hf38UEMfytk66Pc0vIuDxnAV2jo4b
 TeSQ==
X-Gm-Message-State: AOAM532cSuhGPFZj/JCAKgB6+BOEyMWt85jiCEGhW1QStVQKir86jasJ
 80s68ax6u/rKr2utppvtFKRSW1x7lA2b6msNXfFqfSnbdKjRvG6VSzXs4N3B96FqaZ8d9cudfMK
 ZCj19ffEwn6xffA4=
X-Received: by 2002:a05:600c:3b8a:: with SMTP id
 n10mr1282665wms.123.1625167040619; 
 Thu, 01 Jul 2021 12:17:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwpPYpsSX1Ov7lKpxUBhL0qO2gElnoG+cQxVz8vs+3bV61vSEsT8GDhwqqzJO6KC7wG06cng==
X-Received: by 2002:a05:600c:3b8a:: with SMTP id
 n10mr1282659wms.123.1625167040498; 
 Thu, 01 Jul 2021 12:17:20 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id a16sm1022206wrx.72.2021.07.01.12.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 12:17:20 -0700 (PDT)
Subject: Re: [RFC v6 11/13] target/s390x: remove kvm-stub.c
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-12-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <63561d44-41e1-2bd1-30e6-1707cf6e887c@redhat.com>
Date: Thu, 1 Jul 2021 21:17:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-12-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: cfontana@suse.com, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> all function calls are protected by kvm_enabled(),
> so we do not need the stubs.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>   MAINTAINERS              |   1 -
>   target/s390x/kvm-stub.c  | 121 ---------------------------------------
>   target/s390x/meson.build |   2 +-
>   3 files changed, 1 insertion(+), 123 deletions(-)
>   delete mode 100644 target/s390x/kvm-stub.c

Reviewed-by: Thomas Huth <thuth@redhat.com>


