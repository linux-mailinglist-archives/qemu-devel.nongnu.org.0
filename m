Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CCC403412
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:04:49 +0200 (CEST)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNqhU-0006UU-2a
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqfg-0005kl-Uj
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqff-0002JH-Ew
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631080974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RhSJrKEkcKn8xQNKDJEEut9q/S13RhrrY5gAGB5DXOY=;
 b=DeuBGuSWo2ZbqCQgxDI1A1ssaJ7GpN+EHLYV51A/ffElRhFR0P3U3k2yP9CcTil5gcpojL
 wpgeneFmjdDa/YOH7KFZDzK4naMFdY0eLLjotdinVFeP8dG4Tt9wxaEiLT9ySP/M2/xQlN
 rVHXfLEAvWrVXq1Os88MOgSOreuonls=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-FdYHWegeOnu_zIzU7wN27Q-1; Wed, 08 Sep 2021 02:02:50 -0400
X-MC-Unique: FdYHWegeOnu_zIzU7wN27Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 i17-20020aa7c711000000b003c57b06a2caso503412edq.20
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 23:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RhSJrKEkcKn8xQNKDJEEut9q/S13RhrrY5gAGB5DXOY=;
 b=uN18VznyLsfHOfuzbjYydV4O9rro74zrgN1HyXsoSku/TPfomzw71dukmmIRGhT96A
 1ooVFmykso8y0hcpkGGQ5CX83Vwhej7DksBcZwxXWGzVpQ4F5go+SfOxePvM33Iyb5pw
 0KHsDL7uYTSpaNqkgi4uTS6RUh5NHCigf2CKaU+8/JOHOkG8pkfng+kH/F9XJDErN+eN
 2RDBLGB0TP55wbs33X3ziky95mJKQl816BcZC62aQdDNXmSBrYs9utkV9TxX2WlV3XMu
 K+o4kZN6WAXiWJ1vSySS+gMmf3plOklVzqmca+Xts9ZxmGdrdnzDJUV/e9yESrknhZSO
 XGAQ==
X-Gm-Message-State: AOAM533uMnDexCo/vRtD2NFppHZYv5xE/LTws2O6avXgjoeX4Hzu9bFm
 PGcPn5pRQ9kKxmxf40y/GoPlGwzNvmalwZHQmM0p+ZCy+/bxi9/VzDPQbxm3RvvrgdMpqG83r4m
 SbvJlNi0DLEXql33+5hJmpwLXvPc1XDmvL7nCQDb4vuV5nNqSNlIUBiYK93c0/FDkXmI=
X-Received: by 2002:aa7:d6d1:: with SMTP id x17mr2217971edr.64.1631080968733; 
 Tue, 07 Sep 2021 23:02:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdM0owN+pFlF9lvJMwGryl35cQ8Y5nNlDKnOBzH6Do98BDQbgfelCG8YVV1Vg9vJoV3/4SPw==
X-Received: by 2002:aa7:d6d1:: with SMTP id x17mr2217961edr.64.1631080968543; 
 Tue, 07 Sep 2021 23:02:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j24sm517413edj.56.2021.09.07.23.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 23:02:47 -0700 (PDT)
Subject: Re: [qemu-web RFC] CONTRIBUTING.md: Mention maintainers
To: Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
References: <20210906170038.26602-1-hreitz@redhat.com>
 <63441b5c-2262-3b7a-e0bd-e6f41401a64a@redhat.com>
 <2e3bd021-c4be-0ada-7965-f921c462b3bb@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0e24a378-da40-9bc6-8ee1-bd51d54819b5@redhat.com>
Date: Wed, 8 Sep 2021 08:02:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2e3bd021-c4be-0ada-7965-f921c462b3bb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/21 15:40, Thomas Huth wrote:
> we should maybe have a pointer to the information on 
> https://www.qemu.org/contribute/ instead?

Yes - right now contribute/ links to the old blog post for "Improve the 
web site", but I guess it couuld just go to 
https://gitlab.com/qemu-project/qemu-web/-/merge_requests; "whoever has 
ears, let them hear".

Paolo


