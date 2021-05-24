Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE7C38F315
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:37:00 +0200 (CEST)
Received: from localhost ([::1]:45000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFRi-0005HI-W3
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llFNf-000138-77
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:32:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llFNZ-0002Ca-Ve
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621881161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ouq12HPpC77lggC0AZl7YB0vMlpuhUXZWDYV65773J4=;
 b=awzoLB2RP+iu7EIqPiKzrcdve8yHodWqM8cf1Uz8cpWy2HUJAwwdyZCSIbJgu1G54i1g8p
 wZH/nbtoZj5LGcsOGf6TH/LFpl3wFmsXWnRADtjXilUYIcDPA4n4vv6Dn/OcA/lpSCNwAt
 PNSxqM0tQv1FlV1+m4fC5Sb5LRU8wmA=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-Rl27H6uXNO-pyFt_Ny_U7Q-1; Mon, 24 May 2021 14:32:39 -0400
X-MC-Unique: Rl27H6uXNO-pyFt_Ny_U7Q-1
Received: by mail-ua1-f70.google.com with SMTP id
 b34-20020ab014250000b02901eb696c5fbaso12118000uae.22
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ouq12HPpC77lggC0AZl7YB0vMlpuhUXZWDYV65773J4=;
 b=NWDlHAjPF+0JN8B8YHVjY+gP9yhsUS/BZY+DchaC3tJseBmisWdzLm7AmY0Uu38Woe
 AmXceOHNLA2RGoq4kkdesFD7zk23EBloEkHFc4l2iaKrHX6K4NmLDNlB0RC9ovsALVbl
 Fb9XTy748M5G/JSBbRm5nsdSb7/cd2xb0tKSM1xFHWn5YmrKx/9JhQU8b2TObT2WoMkn
 UV1bIADp6LqL73vpG2H3pXQyr2oBz3hjjaeyHCuoPrCBupwQLmCUKqLVni+m/vPBfuzK
 vB3Xd9SQFuceqqHNw/05GFEaWed5BD+HEIV9JziFC4K3fHeEA5caa5phTyHYtXOI6rHA
 JpZA==
X-Gm-Message-State: AOAM532X8puRQzRbohP35xiE2np1RMeCLPmfUJYI6qKQ+pnXst1lsItU
 5ii7cbSqC2ioTVq0kjBCP1TjedmhcMxgKeHYt49DSToAO0BhJl3DO78j52IAY7fXiK9pQmE56Ck
 d49VSpoTPlIRtg5zJaV7WMB/DPz0AuIQ=
X-Received: by 2002:a67:c31c:: with SMTP id r28mr21830949vsj.50.1621881159120; 
 Mon, 24 May 2021 11:32:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJEvesq8bRZzVzm8zXPTzLATiyzcreNUnNjP0VU458T8r6/J/L9GbTZOBYmeSd5+7M8rbxcWvUpZTNat22vQg=
X-Received: by 2002:a67:c31c:: with SMTP id r28mr21830940vsj.50.1621881158955; 
 Mon, 24 May 2021 11:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210503224326.206208-1-wainersm@redhat.com>
 <20210503224326.206208-6-wainersm@redhat.com>
In-Reply-To: <20210503224326.206208-6-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 24 May 2021 15:32:12 -0300
Message-ID: <CAKJDGDbyoJOdhb9ii1zqq_UfDvLOiAR+_CAPwy4-SKDJAEWwEw@mail.gmail.com>
Subject: Re: [PATCH 5/7] tests/acceptance: replay_kernel: Remove unused
 wait_for_console_pattern
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
> The ReplayKernelBase class uses the wait_for_console_pattern from its
> parent LinuxKernelTest class, thus it doesn't need to import that method
> from avocado_qemu.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/replay_kernel.py | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


