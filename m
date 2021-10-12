Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA61429E3C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 09:00:13 +0200 (CEST)
Received: from localhost ([::1]:52380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maBlj-0007oU-Rl
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 03:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maBkh-00079c-Cl
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maBka-0006f1-UC
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634021939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpY6yDox2S+sW0BMm9L+VkjlxwZw61jrG/1GpFRQf/Q=;
 b=GNscGhObI5kR+85knfO2cYw5i+cLsBJ4L7szxcI8YY+YgY7RXNUMhW3yvGVSD/JrP87thL
 49rbtuvwJN60MwZnI7zjmZoN7OHrMWONmIBvNTT5TGUcv/BhtNS6pAixWZPKwdqy8rSHEe
 w5aUmTCaUGgYLuAJ0+G98Ct0KMH8eQ4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-OAiXgRPHO669sWQYyYqVEQ-1; Tue, 12 Oct 2021 02:58:58 -0400
X-MC-Unique: OAiXgRPHO669sWQYyYqVEQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso14934588wrb.20
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 23:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hpY6yDox2S+sW0BMm9L+VkjlxwZw61jrG/1GpFRQf/Q=;
 b=c6VOMdnKRA/V2LMNHitPZH6Z3QYIYf/d8T+MwbqSDq3ERoRatXNvA7D0OjAtZmfOcg
 pAVmdeqMgpZJvqnQ0MOY/W7TRuhQ1IU2Gyukp8VlVabBU+FNKgPtrvI90zmOegRsHtiv
 +8SbhfqoK/mZrQJ13tAqXCT/IvpA5h3ddx0gG+EbTaCDnNmPvdY1Sjd6r+q1FgSIn4Hz
 D1wNqUXnK2EQE4yPmimri0+8k8yErQT3892GPJfkAHT19DBmTFDr9CE0TeL+u3Z+7W8E
 G52V22loLzhLFeqG/r+qXh+slVNIkUZCQ58lMUC/ccXqw2ZfRMuGPEgZCcqbzoV70B22
 wYIg==
X-Gm-Message-State: AOAM5311Rujy2BR/7L9lmFL91HeHuWKgf71SxWmT0JjhFK8TrPtmmXEv
 z0DfOj+E5UqjHIwnX/kgqVeOSkiekRZPvl4zf6GvLXouVMKe04Vnen5rzhkQ573OJ0NYNs+FlZo
 PowmPcQhxwyRle+JB7GF5kRGB76vAlhabos/PYKy69MC4oFjY0R8f+V9uC9V3Gsk=
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr13277329wrs.370.1634021937315; 
 Mon, 11 Oct 2021 23:58:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLTchdMXEQEPzg30NIC/MrP9kJDNrCuME3Dy97rTeAz81H7VD+oBJxHWVglLdU7K+DP0JZ4A==
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr13277317wrs.370.1634021937055; 
 Mon, 11 Oct 2021 23:58:57 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id k188sm1611937wme.44.2021.10.11.23.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 23:58:56 -0700 (PDT)
Subject: Re: [RFC PATCH v1 0/2] Improvements to SIGP handling [QEMU]
To: Eric Farman <farman@linux.ibm.com>
References: <20211008203811.1980478-1-farman@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <44008cf5-5e63-5003-0c2c-861bc7050a55@redhat.com>
Date: Tue, 12 Oct 2021 08:58:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008203811.1980478-1-farman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/10/2021 22.38, Eric Farman wrote:
> I'm cleaning up some of the SIGP code in KVM and QEMU,
> and would like to propose the following changes.
> 
> Patch 1 should be less concerning than its KVM counterpart,
> since the CZAM bit in question is already present in QEMU.
> 
> Patch 2 provides some handshaking with KVM. Since QEMU
> injects a Stop IRQ for a couple of the SIGP orders, we
> can provide the flags associated with it, to provide some
> direction for how KVM should process it.
> 
> While this has no dependency on the KVM code, the KVM series
> that I'm working on in parallel is here:
> 
> https://lore.kernel.org/r/20211008203112.1979843-1-farman@linux.ibm.com/
> 
> Eric Farman (2):
>    s390x: sigp: Force Set Architecture to return Invalid Parameter
>    s390x/kvm: Pass SIGP Stop flags
> 
>   target/s390x/kvm/kvm.c |  4 ++++
>   target/s390x/sigp.c    | 18 +-----------------
>   2 files changed, 5 insertions(+), 17 deletions(-)
> 

FYI, I've queued the first patch to my s390x-next branch:

https://gitlab.com/thuth/qemu/-/commits/s390x-next

... for the second patch, I'll wait for the discussion to settle.

  Thomas


