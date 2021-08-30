Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F76B3FB7EC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 16:24:12 +0200 (CEST)
Received: from localhost ([::1]:47050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKiCp-0006e3-M3
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 10:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1mKiAT-0004Rb-Qs
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 10:21:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1mKiAR-0004VX-OT
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 10:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630333302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pvrQTgKWxrlzERh6JcVfpK6Kkrgtif55AhqUTy820Y=;
 b=XkVKPIn3V6KQHl5drIT8k/vp/HxZYeM87od9FitLYcKrACePoWjK7xUe8zocGhAFbAif4l
 FgGNh49RHFmU2R2q35srRANAnDzIoCfJEmQeHPQOhacEOzE083L6r7wPANaTZ9bg5YCSgn
 Ltg2PjLEif5BkMUsGh91ImesK5n8JpI=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-71fMOhAuMPagOrpw6jrtJQ-1; Mon, 30 Aug 2021 10:21:39 -0400
X-MC-Unique: 71fMOhAuMPagOrpw6jrtJQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 x13-20020a54400d0000b029026825ff437cso5589815oie.6
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 07:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6pvrQTgKWxrlzERh6JcVfpK6Kkrgtif55AhqUTy820Y=;
 b=AGrroBXw4OTCfXpkqGGABk1U3OTOiSIMU0NLIloqFBPzp+2shiTlCPbt9qdhR9suvk
 Mh1QErr6MVkPxvTVSnOsljgdpH3vjXp++/WG7E7hVehUrYRSaQJulxaKygZ0YDVcHGfY
 Mv/CBTzOd8X1PFP6SeOY2trmWu1YflQUgJeI10P72PZ84BJQdwWp2DbUwAGpNUZQv/aR
 pVk3AUXsVt76UaxQgMYczO9UQ2ZI1n8a06lhp8t2DOPbieB3CpZq4v7doKTuW/Ku0AwY
 zYM2jZyNRcTlnXMhxSmhvW7taN5md01bsLVJrUXs/AM2+imiZAKEnXanzQK2uJ18jDiJ
 G5tQ==
X-Gm-Message-State: AOAM531/lNEwVebmok6u6X+h7TqhWAFPKoPlNKBdxRVWydYwUrxcLuHz
 t1466bqFwmIpoLw8W9cqfumg/I/Rpas09Buj5hWoyvMZzszJgToSpz12to1AfHbPKNDuQj4yU10
 cNIeRS3yAbr7TsLQ=
X-Received: by 2002:a9d:5f82:: with SMTP id g2mr7949986oti.318.1630333298330; 
 Mon, 30 Aug 2021 07:21:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkw7JkDxEYXxItV//nWc1GiKrOV2w+aHxU5MHi0oPLRdTSZ09KHvsmIQ4xzVJab35/6aGzNQ==
X-Received: by 2002:a9d:5f82:: with SMTP id g2mr7949957oti.318.1630333298161; 
 Mon, 30 Aug 2021 07:21:38 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-24-81.ks.ok.cox.net. [68.102.24.81])
 by smtp.gmail.com with ESMTPSA id
 33sm3226025otx.19.2021.08.30.07.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 07:21:37 -0700 (PDT)
Subject: Re: [PATCH v2 01/23] MAINTAINERS: Add Connor Kuehl as reviewer for
 AMD SEV
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-2-philmd@redhat.com>
 <980f9ccb-39d7-23ec-4aa8-830e93dd0ff2@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <c8dc1ca2-ca47-61f3-1309-0b78edddc08a@redhat.com>
Date: Mon, 30 Aug 2021 09:21:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <980f9ccb-39d7-23ec-4aa8-830e93dd0ff2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 9:18 AM, Philippe Mathieu-Daudé wrote:
>>  
>> +AMD Secure Encrypted Virtualization (SEV)
>> +R: Connor Kuehl <ckuehl@redhat.com>
> 
> Is this patch still valid?

Thank you for championing it, but due to recent changes, no, it is
no longer valid.

Thank you,

Connor


