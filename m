Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B258346673
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:33:25 +0100 (CET)
Received: from localhost ([::1]:37944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOku8-0005VX-T1
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOjuZ-0000Vw-Hw
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:29:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOjuW-0007DO-6I
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616516979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1s0EmkqTk4APxyBcUHHHZTUgyRDUT7xF9yh6r8qZZk=;
 b=AUaLefhGphG7Q8F+Q108O4aXHeUAi+42sA+zwE2sl5EhAEz2lbLnGrvsq8utdmIXg87nsa
 nITmIl8Fkn+9uZKw6JSTKywqpHn/Do9mi4x0l/WXMHWj4QOIzZdcMzZzuC+KDD77gC7yDL
 PehlXvqp9bO8D794AE7Lqxqk3mmm8Jo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-yEQmSQuiPsmRuDjFHVIDww-1; Tue, 23 Mar 2021 12:29:34 -0400
X-MC-Unique: yEQmSQuiPsmRuDjFHVIDww-1
Received: by mail-wm1-f72.google.com with SMTP id i14so971231wmq.7
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y1s0EmkqTk4APxyBcUHHHZTUgyRDUT7xF9yh6r8qZZk=;
 b=lWp3tUUu7Oc53IIPrCWC7OottyMD1UdkMCANf6WjtoB16v2np8+asUQCYcAnVh1HTF
 ciCyZFUuthG1L9zA4VNG69JW81fWc6EQIDaxwbRpSHf1LckQOJbu/4PqojY7AFWvXFmo
 596l5kCbtpfgtILUcDgegcOI0QX7vIG4mRzLsybp0a/crjghE33QMJlQFjPOGoO91A/n
 SG3B/J6Kz4kt7bV8qZ7WgJlr9Spz/rq/fQqKtZ77nIcgcHwYPsNyH91Ai1WsgKiA/FHg
 x35W1Z22EeI6oZuFFwgS/bf8nRO9AClPWGUHPLJeS8i4EVfCvai219iO3NHjveJi3LRu
 W5GQ==
X-Gm-Message-State: AOAM532k+k9a3GVUjt8B17CPyzKkQbmpg+r+v9QvB4IDb4sfzGqFv7l0
 aLoyk34wEeVof7AiZxp4KlrUHtNgyylR1eJ/hGr0zohD5BP+Sqd3mZpiw7Y5SdzLw3gJ/yn8W5f
 WRq0HGhqkef4qBcM=
X-Received: by 2002:a5d:628c:: with SMTP id k12mr4823142wru.316.1616516972808; 
 Tue, 23 Mar 2021 09:29:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWqpscmznvDq3R7+LH+yfjfD7oq2Tb12U6Oc9jeRdOiyB5BfpswhcOcdzmco7rSgn+XR5Rig==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr4823124wru.316.1616516972627; 
 Tue, 23 Mar 2021 09:29:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p17sm2835912wmd.42.2021.03.23.09.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 09:29:32 -0700 (PDT)
Subject: Re: [RFC PATCH 05/13] blobs: Only install npcm7xx bootrom if ARM
 system targets are built
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-6-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c491282f-5872-86f6-33a0-d385a2fb6b85@redhat.com>
Date: Tue, 23 Mar 2021 17:29:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323155132.238193-6-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/21 16:51, Philippe Mathieu-Daudé wrote:
>       install_edk2_blobs = install_edk2_blobs or target in edk2_targets
>       install_blobs_alpha = install_blobs_alpha or target in ['alpha-softmmu']
> +    install_blobs_arm = install_blobs_hppa or target in ['arm-softmmu', 'aarch64-softmmu']
>     endforeach

Typo (hppa instead of alpha).

Paolo


