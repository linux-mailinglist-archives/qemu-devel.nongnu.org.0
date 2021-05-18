Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00733875D5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:55:56 +0200 (CEST)
Received: from localhost ([::1]:33786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwSB-0003fy-Qp
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw3V-0006yN-RV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw3U-0001EJ-6w
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=riWal6y3cud3U7uSBHk5CSpYDeiKOWhdDbvzej3/kSw=;
 b=H5cYrgW6JJgpBCaDeKHdttryI50Q2P1J8e5PXP5umAOTT0w4+AriuT9iXLq+9mOIKz7UPT
 h8uZGaOgcQYjIturi6muGOhxAnC8XmP22SQwwDNWafJPlyOD1hVGdNUSVU1SlNfg9LxHMN
 4VZpRtmyLvBEKFi62ERj9f7qgsQZ/tc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-1VqasrySN9edbp_OquKW6A-1; Tue, 18 May 2021 05:30:19 -0400
X-MC-Unique: 1VqasrySN9edbp_OquKW6A-1
Received: by mail-ej1-f72.google.com with SMTP id
 i8-20020a1709068508b02903d75f46b7aeso1788963ejx.18
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=riWal6y3cud3U7uSBHk5CSpYDeiKOWhdDbvzej3/kSw=;
 b=RGF9cD/3nUh21n15b30PDTcpfUun3uf/DeAI+/kdHSFS6RSdiMnghovQEXEh7a6R9o
 pHvejHID7kfqt+kiTZa8t6QuiR/lUMJJ33PSxBrO5wJoq9fuv/0OYkuIL+vJAJyKUH1m
 ye9zRtUP6KZ7MvFwTd2lqORjwWXnGRmR9OqEYaxgCTO9iAytw9Su4eFQ7lnDO1jHZoVN
 8ofHfOH8vMyV+gtfiFjmKDfIVLufSdptSDOad+PnGDZjpqhEUXnZpmoAoHzk/ygk6G5C
 OdXsDqZ2SdqMtfv2qym2N0mUmmdAtKumEkaXl3zpD/IZsbBcs5FH2718Ybt/8z3D0Tln
 8iaQ==
X-Gm-Message-State: AOAM532RE7TnXH2vy7P4GfN665TEtgCb5CjBBRUxmGDbYqnoxzKdg7F7
 Ap59IBV5+tDWMXIKEwv5CMUib2hk/rlnxMqvHMjNguy6Xj6uEZ/BrI7TmtpnytiAz+uSt8qsNLU
 y7PX2G4UivV+lmGc=
X-Received: by 2002:aa7:c499:: with SMTP id m25mr5807159edq.109.1621330213673; 
 Tue, 18 May 2021 02:30:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznpNkEpKP7K+0l73jjcIVUdSNlHutoRLjAPnwWjPFEfyPmDrSD6FTVyMVhr/0mZO2PIp5tiQ==
X-Received: by 2002:aa7:c499:: with SMTP id m25mr5807135edq.109.1621330213493; 
 Tue, 18 May 2021 02:30:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id me15sm9961415ejb.71.2021.05.18.02.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:30:12 -0700 (PDT)
Subject: Re: [PATCH v2 18/50] target/i386: Move rex_w into DisasContext
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-19-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5e682d48-6c07-a822-2e1c-d5ab6b1ad179@redhat.com>
Date: Tue, 18 May 2021 11:30:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-19-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Treat this flag exactly like we treat the other rex bits.
> The -1 initialization is unused; the two tests are > 0 and == 1,
> so the value can be reduced to a bool.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


