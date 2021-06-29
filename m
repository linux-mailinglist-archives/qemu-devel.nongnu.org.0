Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB3E3B6D62
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 06:13:31 +0200 (CEST)
Received: from localhost ([::1]:53906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly57p-0000SZ-FH
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 00:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ly572-0008EO-Ot
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:12:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ly56y-00082F-Jq
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624939955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+90OUSqtcC1YaK9syT00a4X9k629Sd24QWcYaGBkMuc=;
 b=aDoVxRuznOvRbQ4Dn1cs+uK9/MMU1xsoPkPCCWG1kechrUCXN/8D+NdlwoZhjC2ofaM807
 IpYpcSeDI7Ch86+OyR6iVyapa4uFEdEc78qQPB/c5qdC/zTWy8D+RoCS/2rgrYVmjnIVR7
 oV6JqP+q/9bT3bB4zDEcFFZFU172030=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-LoPo8TMZN6CgR-qAQLooNA-1; Tue, 29 Jun 2021 00:12:33 -0400
X-MC-Unique: LoPo8TMZN6CgR-qAQLooNA-1
Received: by mail-wr1-f70.google.com with SMTP id
 x8-20020a5d54c80000b029012583535285so1726606wrv.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 21:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+90OUSqtcC1YaK9syT00a4X9k629Sd24QWcYaGBkMuc=;
 b=otnrMsnbvrqcnJzdN743GJfejjUEyNz4UW6ycTABu3f9sG1LgFER8LPqgGiHCC6Wy0
 zHDvMCgQ3HeXFzIHhcI63DgYDS+KY+0T3hlQiqESrR7Dy7gEb3b1Q0pDGD1NKDarKs21
 5o6smCEslGoJrZGMJvxi3IA/qKZc4FKcca2hrpN32c3OEmZYwWDIUF9Y/RBLcCWN0QOg
 vdjbgzUIYBvCiAcWcLoM7fvDNp+/2jUt7HKNms2kjEfhlye+BXSBa+zewr3LFCzpPJBf
 I+yeCsiVSEc02W7Yd4VwOmr3YpDKo5jRTXl6mvXAwBIAd1CmPgmxtg7nOBVKq4GQoBUq
 UWqw==
X-Gm-Message-State: AOAM530Rx81q9lUaQriOX9QzolVfF58rmTLK8ujq9xFB8NZJc8wGLUit
 SlPR2yoKNgbZI0U7Hu8/vpnV+drWwvXYivv3os6CIE4yCR6YhrZ3R0U38gGl3UbaU57efG3BfoB
 P/HOPMTJOnW6fl5T9D8Fzvq08QRmSt9RJAVLlIxXqF3fqqQ7Ts1XgPLnjiu3mg3mT
X-Received: by 2002:a1c:7415:: with SMTP id p21mr29857132wmc.88.1624939951801; 
 Mon, 28 Jun 2021 21:12:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrbakL3pat1g5KeRv+Z2QrfAob8PahIGYDXZ+OImuBhCWnz0UR7pAAyMval0x5dI0rNtp3Aw==
X-Received: by 2002:a1c:7415:: with SMTP id p21mr29857111wmc.88.1624939951545; 
 Mon, 28 Jun 2021 21:12:31 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k15sm1276372wms.21.2021.06.28.21.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 21:12:31 -0700 (PDT)
Subject: Re: [PULL 15/28] osdep: provide ROUND_DOWN macro
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210625141822.1368639-1-pbonzini@redhat.com>
 <20210625141822.1368639-16-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0d56c6a3-3893-2727-bd86-21e4c51989ab@redhat.com>
Date: Tue, 29 Jun 2021 06:12:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625141822.1368639-16-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 4:18 PM, Paolo Bonzini wrote:
> osdep.h provides a ROUND_UP macro to hide bitwise operations for the
> purpose of rounding a number up to a power of two; add a ROUND_DOWN
> macro that does the same with truncation towards zero.
> 
> While at it, change the formatting of some comments.
> 

Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/osdep.h | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)


