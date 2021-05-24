Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD9A38F31C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:39:03 +0200 (CEST)
Received: from localhost ([::1]:48512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFTg-0007fp-Jv
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llFSQ-0006AY-36
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llFSO-00051I-Ca
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621881458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E0zax4mVhcjFEiyoDanuHWG2NCu2zF5Ifu+2jTMCRnk=;
 b=KhxxsNEj8fDCJfx7Dd3J5/uroErFLWeGCsMdnHfZwTaBkGi8NhrfCZ3Well3VjRUQ8jU70
 VgNmY/mg3SOMxAMaXog8BqsMgq6Enzo/1HXJLn5cIwuz58jOmG5+RTDYqoEL1gjywb+aa/
 hEnn6fcbpW0rivmEZBvIMTqnISLmQNc=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-yW4feO_1PT6gBLwE23euhQ-1; Mon, 24 May 2021 14:37:37 -0400
X-MC-Unique: yW4feO_1PT6gBLwE23euhQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 o4-20020ab037640000b0290218107a4549so5819709uat.14
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E0zax4mVhcjFEiyoDanuHWG2NCu2zF5Ifu+2jTMCRnk=;
 b=shqd/N4u/5OWTxh8BEAQSYT7dSuitk4PfhNQZnGOArdSo667rBXrO/fZIooDt9coEH
 QSBXwK3bs354/OzbUZKIpuYHhqkTobpG5VLKqL2sW/cASpaH0QBgeWfgpRYuVfKecXs2
 OIDZ3f9LXLjYiCiFLkQYxRZeZDjRn3aZMXEdQVkGam/bsmvzfowV1a/mGvK4HqjoFdC4
 S2k9HIlGCyBlHgrfVm9dAIr0UzaSKrcR/nVM76YNV606Ns406a8IaTN/VHrQc6k7NleQ
 L/Hjp09k7JkAb2dJzEWD0ERSWaver73z80BKOuLoLjsX8XB3XT7P6kel1TIbpkSiVON6
 SACw==
X-Gm-Message-State: AOAM533cl6aSG4JhAHkA3+UtyR4skVfC1VrxGUmSi6eO4A+aIU/47//6
 5CwBNG0Wia3wSMXDdmoJdUZ/O8h6eoICT3DFqMEVSLc716gljjk0GM60lxm+vZvIgu40OAeIspE
 W67KAqdgVLqhgOvaULcsHIL5SekXTHCs=
X-Received: by 2002:a1f:308a:: with SMTP id w132mr22721410vkw.7.1621881455784; 
 Mon, 24 May 2021 11:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQWbmknAyBay8b0OUjzgpmJJ1skT02HX9b+FKGq0fgahYMZ40c2O3+K+PRK1cV9J5EfP7m0fv67rMsrmtDm0s=
X-Received: by 2002:a1f:308a:: with SMTP id w132mr22721399vkw.7.1621881455651; 
 Mon, 24 May 2021 11:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210503224326.206208-1-wainersm@redhat.com>
 <20210503224326.206208-8-wainersm@redhat.com>
In-Reply-To: <20210503224326.206208-8-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 24 May 2021 15:37:09 -0300
Message-ID: <CAKJDGDaY1gwN5-rt6W8RHgN1c0XxWcyLg=Cx78S1aooQMwRnrA@mail.gmail.com>
Subject: Re: [PATCH 7/7] tests/acceptance: Move _console_interaction to
 ConsoleMixIn
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Philippe Mathieu Daude <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 3, 2021 at 7:44 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> This moved the last remaining _console_interaction() to ConsoleMixIn.
>
> None tests call it directly, so only the other methods in ConsoleMixIn
> needed to be adapted.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 57 +++++++++++------------
>  1 file changed, 28 insertions(+), 29 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


