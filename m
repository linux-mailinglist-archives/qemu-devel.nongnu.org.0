Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7C845D56E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:28:29 +0100 (CET)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9BD-0002cF-Kh
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:28:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mq98z-0000rb-7b
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:26:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mq98w-0007Hl-Rp
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637825166;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Z2DMQSrcs1LwROk+BUmepwKEg3ase1zqY25Cc35wUiA=;
 b=VYSl11G9ZrDPizqUSmwgPvXGB/jYwfYBZZrt6tHH800Wu+gs8SCM3eTDUGFexJK3h2ITD1
 Q0Mb9eha/Opy0u5GenVYaHTlwH7FyuRwZz+J84i3K7bDWBzbwJoo9Yx4EO4lvSgmjogLdP
 VEt394n9yhytKE092wcYyrZ2Y+8EiGw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-415-CXrgIC8YMTmnjAud6I-kcw-1; Thu, 25 Nov 2021 02:26:04 -0500
X-MC-Unique: CXrgIC8YMTmnjAud6I-kcw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r6-20020a1c4406000000b0033119c22fdbso2711922wma.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 23:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Z2DMQSrcs1LwROk+BUmepwKEg3ase1zqY25Cc35wUiA=;
 b=z7yBgne0En9S1udllpBd3S7jzbBX+9orGVNZGg9pLsesl2p4032Fiw9gZxrP582ax7
 aRPGJ56I83c8/7XRNFd+b96og45BPSxYkju8lxuMFXMo1K8yHUA3ralcPDp1+ZUHr84Z
 OXtzPj31pdDff9GVakdXsy32iLse7x03bJmcr48VojudRKwhu9pyFp9LUqlJzVY7W3Ai
 WlX1hK2xhVuusURs0wY1FSsMkkx5pvvYIDR8jm2Q/mai//5qzJS6Wnb40vHPHdhjsQG7
 e+0KPoX1l8XmLDAs8ba3o0XtjcG/43TsZJg0e+MJEOjI4EdEkbiVHD3EUgeWu2ZIl10n
 t81A==
X-Gm-Message-State: AOAM530ADly2Rt+0wj8YrEyo6tOHQkh/h2mkQiSmqYnSsPjuEJOB7ibD
 VRizQZEIVlvx66jkBJ1shfIvEE4Bekut86UdIrnDCO7Ln3qPuRtd9SoBjoDezK50xCCTARXbftA
 c9W8p8LkvS/9vs+A=
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr4582986wmq.109.1637825163555; 
 Wed, 24 Nov 2021 23:26:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfs6ROxaqTT0KvjuZOieEuZfdnMQFOBKnQnABXsR/iIKeTkoB+FZ5yXmmgKlKDbLqJkMe4Yg==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr4582960wmq.109.1637825163381; 
 Wed, 24 Nov 2021 23:26:03 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id p27sm1975327wmi.28.2021.11.24.23.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 23:26:02 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 02/23] migration: Never call twice
 qemu_target_page_size()
In-Reply-To: <YZ6J6DIhNRheL+OO@work-vm> (David Alan Gilbert's message of "Wed, 
 24 Nov 2021 18:52:24 +0000")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-3-quintela@redhat.com>
 <YZ6J6DIhNRheL+OO@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 25 Nov 2021 08:26:02 +0100
Message-ID: <87ee74g0hh.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> OK, not much difference

This was after "finishing" the series I realised that I was calling that
function around 30 times or so in that three files.  And as Richard
complained when I put that inside a loop, I just decided to optimize
all.  Once that I optimized it.

O:-)

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks, Juan.


