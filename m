Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1122F845F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:30:22 +0100 (CET)
Received: from localhost ([::1]:53316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TrZ-0000Yc-9d
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:30:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0Tpw-0008C8-Hb
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:28:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0Tpu-0000Ob-D1
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610735317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+lLRVDriaQHjjPwy0YXH50lNKhASe31W/uTwXiBy4zU=;
 b=SDv9+Rulefw+cIaSsVmgkcO23WaGksSfCwtYt/CCE1IEhO+zbQ7ta6sccFYfG69rVQEBCH
 ftH3CuyxufJRsRAmZ9Ca7C/zCkZwGA+/s+t7LKd8gELnyBQjrNd5PTvwXpPHoyegZR3GL9
 eYv+26rmny01ke2Y7I/y1jOg7/9BU00=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-kVbVhqFnOje1xdUBI2fNZg-1; Fri, 15 Jan 2021 13:28:36 -0500
X-MC-Unique: kVbVhqFnOje1xdUBI2fNZg-1
Received: by mail-vk1-f200.google.com with SMTP id h15so4488028vka.10
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 10:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+lLRVDriaQHjjPwy0YXH50lNKhASe31W/uTwXiBy4zU=;
 b=SIMk912ix/fnWAXpuFgiqMHQOome+ZDUBO1VjjzKb9dJ9DVCEXJnbbqyooza+WzQBs
 kFyyPJcDuxyJ72dUtEenlt7+w4Igj+VBOjydOY198u932TyeQnKCoNayk90feIIRBJa8
 0fQoXlFhOJuu99QZzL+5nS0zItBRR6k0nT0mGfbfe2NZRFKwjhy9gYf70d+gjJsDFu6i
 Ud4bffcMoBAnvaRk8g7w+pr0qtbOQ0VLQ8Zc7Qu7ItGpXWUyV0i7hlMZKj25Yr1YBtq2
 X479QTo/IT1JwtrqeRWEhMxJ26dMMhZOkgwld93q9/9HpwdhQ5Eakq3M8D6zk2BrU2bL
 0KWw==
X-Gm-Message-State: AOAM533XdtPeas7fwH9x2whX571KCOp10uVGGkXMQJ35fZRI2Y7Kd1rr
 +J81bWtEu/Sfg6yMAmKn1Kz+hm4S9fxKHXOrZ+G0kSCNl0bPzel/ZMLSOMVqaGH6GRDViWhwwpH
 CGF1S9F+Y7lX3TC+QvCeKt5v3gPWSl8A=
X-Received: by 2002:a05:6102:5f1:: with SMTP id
 w17mr11802305vsf.45.1610735315401; 
 Fri, 15 Jan 2021 10:28:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQVTo851Hn7cmmvmjfm2k2kHNP1SjrIuxZjTsQY+GkPEupELvgVWDx6XbNm8Qch0OgZU1/PRcqHJ3MXy33fcM=
X-Received: by 2002:a05:6102:5f1:: with SMTP id
 w17mr11802288vsf.45.1610735315261; 
 Fri, 15 Jan 2021 10:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20210115174315.30949-1-mreitz@redhat.com>
 <20210115174315.30949-7-mreitz@redhat.com>
In-Reply-To: <20210115174315.30949-7-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 15 Jan 2021 15:28:09 -0300
Message-ID: <CAKJDGDZF06BM9s2J2CaORL=pPcebaKfu=uaUSPVCZW7Dbu3--w@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] iotests/129: Use throttle node
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 2:43 PM Max Reitz <mreitz@redhat.com> wrote:
>
> Throttling on the BB has not affected block jobs in a while, so it is
> possible that one of the jobs in 129 finishes before the VM is stopped.
> We can fix that by running the job from a throttle node.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/129 | 37 +++++++++++++------------------------
>  1 file changed, 13 insertions(+), 24 deletions(-)

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


