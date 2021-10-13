Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CBC42BA0F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 10:18:11 +0200 (CEST)
Received: from localhost ([::1]:52950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maZSk-0006KY-Nz
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 04:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maZPl-00045l-49
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:15:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maZPj-0007HO-B6
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634112902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwPbyZzY1ENW6ywrhjxLd9x4pK4MkO2EXG7iRMH2D6U=;
 b=L8Td6A+gsjb9vSUPy5/d1VulgmlB6D34RlHJtZ1COi0PrUgk3LHmvNdf70UfB4ieLmgFHM
 c8J04S97la+5IlEfbRBNoEiJh7OU0MffSRFgUlQ6fUsMGtP50MWC4xoyyT8d0BQLnwd2uO
 1prA5oX+4rAlqDoWlMWy+2frpLZpHA8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-xYXmkarXPW-tJLluIIAE_w-1; Wed, 13 Oct 2021 04:15:00 -0400
X-MC-Unique: xYXmkarXPW-tJLluIIAE_w-1
Received: by mail-ed1-f72.google.com with SMTP id
 14-20020a508e4e000000b003d84544f33eso1559861edx.2
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 01:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qwPbyZzY1ENW6ywrhjxLd9x4pK4MkO2EXG7iRMH2D6U=;
 b=jTIHeyWUCK9HllhXFkz6EYirZg0bVXF5fNQ/2cvtmjcet028ZaM7ja4DlpaX0kb9vc
 uP/J8tZbf2JF7dT6rn55cbaZAWbfgEACo6c37JrlS5KjSJLkaI5sXZCUnl8cSc4FOL0T
 l1+eeFm2h8Lan3RMwiVAuDLJGER1MO4lfkqqavGACTyolJDXn3U++sMOsZ/MHfK4ye/w
 ba4moo1QaWYdpiXWqRUXdAUtPL1Jo4lfIi1Pe/bNJDXZNVu4dlN9zCWyU1W+Q80uUEiY
 GEfKpyeL4CwsFOCsjddt638U68IaWLhaeT5m/Zg6b/wZndraiqE4a8QFoUsq4ct0Gp3z
 Q3yw==
X-Gm-Message-State: AOAM532dvNTVErgsZzN/ulgr+Jk3jY58LaWa5KyelqgHp98+jauG1eH6
 HTCoFIPC8iusV8ruIbHGo6zpoKMl7ZeQCgeK8EPeUhyYDpQAhaWhvk1EQs6csq2jzCRpUNXiMiA
 EuWlte/AshoNlKFI=
X-Received: by 2002:a17:906:7a0c:: with SMTP id
 d12mr38300274ejo.442.1634112899832; 
 Wed, 13 Oct 2021 01:14:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFueLAi7tLmcwBzaLxFOtFP5dOalAhdwxvzdB0J7T5zpSGYv0KSKKtdvlgAXiJOFHewguBQA==
X-Received: by 2002:a17:906:7a0c:: with SMTP id
 d12mr38300252ejo.442.1634112899563; 
 Wed, 13 Oct 2021 01:14:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u23sm7147077edq.36.2021.10.13.01.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 01:14:58 -0700 (PDT)
Message-ID: <5f89e525-3727-8052-83c2-fe42a9eec792@redhat.com>
Date: Wed, 13 Oct 2021 10:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 14/24] configure, meson: move pthread_setname_np checks
 to Meson
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-15-pbonzini@redhat.com>
 <c7c6aeea-9fb7-200a-43ac-2a257b3cfc01@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c7c6aeea-9fb7-200a-43ac-2a257b3cfc01@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@redhat.com, "Daniel P. Berrange" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 15:35, Thomas Huth wrote:
>> -# pthread probe
>> -PTHREADLIBS_LIST="-pthread -lpthread -lpthreadGC2"
> 
> Looks like the variants in PTHREADLIBS_LIST were not taking into account 
> for linking anymore since the switch to meson? Are there still recent 
> systems around where this is needed? I guess not, otherwise people would 
> have complained with QEMU v6.x already, thus:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Yes, QEMU has not needed pthreads on Windows for a long time (so no 
-lpthreadGC2 is needed), and everything else is covered simply by

   threads = dependency('threads')

Paolo


