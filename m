Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B87C34830A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:42:04 +0100 (CET)
Received: from localhost ([::1]:45482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAKJ-0006bh-Is
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lPAIY-0005dS-Ei
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:40:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lPAIV-0000LA-VA
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616618410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eEf1kzx5coCo4HWtPvc8lSCrAiVYTj813mrAt2eSUJc=;
 b=gcIvNGwkh+9RF3nnrOi0IZPx+enUbjlL0Cc633qv7j56sJIKgQbC2RLH4oL8El7xrRRH7n
 nx1bfqwizK9iwp1gL/1GCMgV7T6SMUKSAb7Ldk6SQBRX4Mo98lK8bnPUf1lBrtHGpIsU78
 kPCy2qTLKVQCm4YN4evVyjJRPAeGXqQ=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-We9ucMoVNOibCBraneA_oQ-1; Wed, 24 Mar 2021 16:40:06 -0400
X-MC-Unique: We9ucMoVNOibCBraneA_oQ-1
Received: by mail-yb1-f200.google.com with SMTP id g9so3701407ybc.19
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 13:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eEf1kzx5coCo4HWtPvc8lSCrAiVYTj813mrAt2eSUJc=;
 b=TcaTnkzgVfVCqHwkkrRzbZ791ss5vupAJjv9I9iEICwL1CJXIcbA0EWBesaCbROzQe
 zehen9nIfGuhaHqJZc9+84fJVltPWzw4TU11Mae2cwtvVQFtJ4AWaUwHBqUMtBJDK4+l
 tWm9RX6rJ+R+PSupKjDEEVmLhYme9H4gZbyUiE/PYIXaIeRVqrK15jCRIoia/EAT+maQ
 9YJitvLqtplHpPjgrx2mtaZlRcZYDRJivEdLDw2lpT3lgGU1Bw1thGy5uzq/0qo1n3rm
 Q5jfWIk9CBIN24JHRo7yklUhHadBLMi9rVUdpu4jbzQuO+kJt3yTdEm0cmQykoFVI881
 2D0A==
X-Gm-Message-State: AOAM531DDqfHTUj3Hv+ShEmFnc1infRkRuw1hRlBbRLpv7YI0ct0zVqE
 RJXbQandJt5jtkwM7KWNi5QqGSmJ4dsQjxnHcTUHoIDA+wsmUJShgQxOh3/VUKAzr7OZnX70XkU
 moY+Nr8N1EKF5BaCaE3NSsA8LdOqm07g=
X-Received: by 2002:a25:7d07:: with SMTP id y7mr7302255ybc.425.1616618405998; 
 Wed, 24 Mar 2021 13:40:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkf4Q7fo85P/lea0lVT3aOMlOALD7rMrUmAIsVGfdZTQCOvzhz3c/UkqOMnWVebLSfqNAssjVfjC6Jt1DfyKw=
X-Received: by 2002:a25:7d07:: with SMTP id y7mr7302236ybc.425.1616618405843; 
 Wed, 24 Mar 2021 13:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-6-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-6-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 24 Mar 2021 17:39:40 -0300
Message-ID: <CAKJDGDb4B9qr6aUeNvDOLLxQhsu2CzqLwJ12JNMckeD+O0fmXg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] Acceptance Tests: add port redirection for ssh
 by default
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 7:16 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> For users of the LinuxTest class, let's set up the VM with the port
> redirection for SSH, instead of requiring each test to set the same
> arguments.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 4 +++-
>  tests/acceptance/virtiofs_submounts.py    | 4 ----
>  2 files changed, 3 insertions(+), 5 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


