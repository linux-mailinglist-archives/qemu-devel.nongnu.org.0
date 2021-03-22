Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F40344662
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:00:26 +0100 (CET)
Received: from localhost ([::1]:50690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOL6W-0001Zf-RQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOL0v-0005bg-A7
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:54:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOL0t-0000S6-PN
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616421274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTPQWG4L8hpbn4jepf8byCEIva0s+LEF8Vx2DYaxmDk=;
 b=THrSk8JG85BKBS97t0RtZZjR1IhO/DJTZg7WJKdCvD7ZweQHQs4eKYmnDpxY8W5OeEOJJX
 vVQCplKs0/SSSvy+6xbgcv9RuI6gZyUigjieM8TKsgkqu+u5d1Z7hpUdPfHu6qg6eCZpzq
 +wnqjFdc/FyqcR16AZtTnmuDhm7w+EI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-5n8irmykOTCt9ylHqCgzlQ-1; Mon, 22 Mar 2021 09:54:32 -0400
X-MC-Unique: 5n8irmykOTCt9ylHqCgzlQ-1
Received: by mail-wr1-f70.google.com with SMTP id b6so10721750wrq.22
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VTPQWG4L8hpbn4jepf8byCEIva0s+LEF8Vx2DYaxmDk=;
 b=TDlDCXGOFRdJ5kXjcYfDla0AB7OcLHkHNCyfg5heYosIiscZ6aDF9A4S41xe1mebe1
 tyHdIbM29ZN6wEqXPdyWhRfxc0HWx1MV2pGkJ14Oosf70de3GbgWr0V+KP9SKyC6qpL0
 Bcxbx1imtJcygVLqeX6AtDAUuvyjrZZ7oKDp730EfcAr6elhacfozlfR+cx5lX9Fshz5
 CSU8HQekcwESNOQDg+SC1aSSVp1y977v2TlWAaM8lVkUqN93Tom3z62+d9P7XXt+P0TT
 tF8uo74n7TOoZDiTlQF7HKny9URf35Ds+RLX1HoLx85tAN6SkoYAVwrRlYyBe3R/tP8K
 +xIA==
X-Gm-Message-State: AOAM530QRkEFs0ar2EfjtpZas0LPfVLUgJfpLXnIChFHVCCRo1RF7rR4
 FIvcCdIFu1ULXiGlTgNLaLxC3ydImXUftSJSZ5jLO1zgtWYqaAJcXLgQK5m2AedUkc6COY6/L8a
 lwEFMwtMNCVm1mJY=
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr5130109wrs.395.1616421271882; 
 Mon, 22 Mar 2021 06:54:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyAodF8+yVzsVirMaKLj7BiF1aS810UeSxPfuOEHyfeWn+/Pk6XJZs+xy6W8Ip4KDgf6i+ew==
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr5130098wrs.395.1616421271739; 
 Mon, 22 Mar 2021 06:54:31 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s12sm16247576wmj.28.2021.03.22.06.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 06:54:31 -0700 (PDT)
Subject: Re: [PATCH v5 02/10] KVM: Use a big lock to replace per-kml slots_lock
To: Keqian Zhu <zhukeqian1@huawei.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
References: <20210310203301.194842-1-peterx@redhat.com>
 <20210310203301.194842-3-peterx@redhat.com>
 <71e85a52-7385-e88a-f51f-9371bc371d06@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b1f2727e-2583-6bfc-bb34-4ebd8da1216d@redhat.com>
Date: Mon, 22 Mar 2021 14:54:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <71e85a52-7385-e88a-f51f-9371bc371d06@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/21 11:47, Keqian Zhu wrote:
>> +    qemu_mutex_init(&kml_slots_lock);
> As you said, x86 has two address spaces, is it a problem that we may have multi initialization for kml_slots_lock?

Agreed, the lock can be initialized (if only for cleanliness) in kvm_init.

Paolo


