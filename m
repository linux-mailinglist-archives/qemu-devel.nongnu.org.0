Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C70E39944A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 22:09:07 +0200 (CEST)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loXAo-0001DH-7N
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 16:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1loX8y-0000Tv-P7
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 16:07:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1loX8v-0003vW-Nb
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 16:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622664428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3v52PfsaT30sKUAAy/WRNne/iT+HV2M6SwWP2fJ8GSA=;
 b=bbK+DFgovVX2KWoXXW48DIdtbGfjxzBIA7MCDdWI1l9BwCeDFft1o38HnXv1FZTybKvPVT
 CQ4QZvp7e+P5r97bfm926pLOgof4dHeBG1/ozrJG/ccNDmtLT4A9oOhlXt7TFIx5DofGzv
 2pVa/7QVkT1hzY5eHANKY90Q8mOGJmU=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-EJjImnsJPC2i9A5tqYtJ1Q-1; Wed, 02 Jun 2021 16:07:06 -0400
X-MC-Unique: EJjImnsJPC2i9A5tqYtJ1Q-1
Received: by mail-oo1-f71.google.com with SMTP id
 f8-20020a4ab6480000b029023de979bd74so2113494ooo.7
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 13:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3v52PfsaT30sKUAAy/WRNne/iT+HV2M6SwWP2fJ8GSA=;
 b=cRAV9XvOOlS2tF7ZuU16VpdgaA+S/GTkps7pFCUHaaF9sfzVkyRnm6rWdvFWiDw6J8
 fx77fhlMEdTRD0b5eYn0qPbo/pK5LZxMSbUID/DgWNbdMVgHj+h5VUJHUyM/c+UVI4/t
 rrFktoaqqybbWZdMyuSw33MownF2p+qCV9vv8Al9AGMsYVV3bdATYGGwSz+pMMlTVIkb
 1d5A6IlPrbuEL7ubv14okJhYABAqbpwTJ6tgrzIUxK0FvUOYavv0fOXC6uT2gX++8KaM
 DqAwPfrjEu+q0yYP4bhWRV/O9CWgBqKkfoupyWfvbOv7yR40v3tHFNAIaJ09iWbguHDB
 FwRg==
X-Gm-Message-State: AOAM532iqfuImBRQXWF8WDNYIrW+n/tu7x2/U9VcxinVR06Pf/Qsc7WS
 IMei7nXYzIQkJphkT0+DJMEM2QOEjRQZw2XCLb+Ih9bqXkhXYHg5Z2+xX7g8XFozSGyDzkpLIOH
 V3jz+Dcl8vYK3tUo=
X-Received: by 2002:a05:6830:308a:: with SMTP id
 f10mr26957957ots.147.1622664425858; 
 Wed, 02 Jun 2021 13:07:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKevnl+n1wEzLkMjMfbyAHDYzhS7NebeW/H90pEKdSed1evCGuoFHPUN4bds2IlPtYli93RQ==
X-Received: by 2002:a05:6830:308a:: with SMTP id
 f10mr26957949ots.147.1622664425682; 
 Wed, 02 Jun 2021 13:07:05 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 f2sm181379otp.77.2021.06.02.13.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 13:07:05 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] doc: Fix some mistakes in the SEV documentation
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
References: <a7c5ee6c056d840f46028f4a817c16a9862bdd9e.1619208498.git.thomas.lendacky@amd.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <ca2ed16c-536c-1e8e-1392-5ba944c3d6ca@redhat.com>
Date: Wed, 2 Jun 2021 15:07:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a7c5ee6c056d840f46028f4a817c16a9862bdd9e.1619208498.git.thomas.lendacky@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Pavel Hrdina <phrdina@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 3:08 PM, Tom Lendacky wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Fix some spelling and grammar mistakes in the amd-memory-encryption.txt
> file. No new information added.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

For the series:

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


