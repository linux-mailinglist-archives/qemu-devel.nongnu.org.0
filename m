Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34239417BE0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:39:59 +0200 (CEST)
Received: from localhost ([::1]:44472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTr38-00018Q-2G
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mTr1q-0008Sw-09
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:38:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mTr1k-0005Ad-BM
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632512310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F46TQmWZ9p9VuMcMApMFzjJqVqkjOVJjcBpbYW9gwDY=;
 b=NhCVuUGYnd2IF4LNrR+QVUMi1zy+1V63FDJXbh7lGfuuCGFIXpk140cW5qftB3X9NSTFiK
 O1deK2RXPrRNtuJJ4ZG4WgxRuAAHNpF2w94fFtmaCwkFsKUxJ493TXbE/CUGZZFrrngaBB
 8/tRDdH1BHFEaSKEiIQ6GBz/OhtXDJU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-2BS73HlNOf-HIIIQt1lErw-1; Fri, 24 Sep 2021 15:38:27 -0400
X-MC-Unique: 2BS73HlNOf-HIIIQt1lErw-1
Received: by mail-pl1-f199.google.com with SMTP id
 m5-20020a170902bb8500b0013a2b785187so3829306pls.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 12:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F46TQmWZ9p9VuMcMApMFzjJqVqkjOVJjcBpbYW9gwDY=;
 b=rRC2SRJsEyFa1RF3RHEIUFMQDFbMUbGQvCc1UZqDgP541BjxTXfjbxetFBI/zT5RcH
 4tejtB8KbAuz9CPcZ4e4WFqBnyvRj7O/7Rrb6fPiHWMDvDUX02NBXVXiWa3Er3LAFSFJ
 u2HLzOg43TVpX6AUMqaWcmNJD0zHXKO7cYDVvNHmz/US4CJyYMW6GkxXGWIRIc44FWB9
 46MHycDwnWyvwsDpqiTcbVeZymG5+pB3hOl4qFm9NgB0pyZvqarE9cTzffPplRbWNwpM
 RuGAXV+MhPD9/cI+mONWryZ3gpc9fkMqpQYhi3N4FzsNHkoRnbQSNHw2F8oZIZ/8mvo8
 KdTQ==
X-Gm-Message-State: AOAM530M20siCoTGvSHHSDF3Rjyt6058YwS5cvDG1jVoeI96EceCAg9B
 BIoaeiDxZLV+FjTgm269jajif7M9/d8vjoIoiPCdqBHEkVUQW2nsnVjNp2NJxYml1Amo4BhGA9x
 nXgy3aEuT9t512JEvuI1NRtDV5hPRVWs=
X-Received: by 2002:aa7:9807:0:b0:44b:28b0:747e with SMTP id
 e7-20020aa79807000000b0044b28b0747emr11461299pfl.42.1632512306753; 
 Fri, 24 Sep 2021 12:38:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRHpQxzKo20QHvOSUpg2DqV1m0d7+daEJfsLiDf7b+AcwZboN6drtSulKdB9HUdEce4Je+DasvvyTdJ1eJhHk=
X-Received: by 2002:aa7:9807:0:b0:44b:28b0:747e with SMTP id
 e7-20020aa79807000000b0044b28b0747emr11461267pfl.42.1632512306419; Fri, 24
 Sep 2021 12:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-6-crosa@redhat.com>
In-Reply-To: <20210924185506.2542588-6-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 24 Sep 2021 16:38:00 -0300
Message-ID: <CAKJDGDbBVVZwGcj8OVX5xNNh+BfxtiLQKcfFohUXaM6TtSDbpQ@mail.gmail.com>
Subject: Re: [PATCH 05/16] Acceptance Tests: add standard clean up at test
 tearDown()
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Cleber,

On Fri, Sep 24, 2021 at 3:57 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> The avocado.Test class, used as the basis of the avocado_qemu.Test
> class, performs a clean of temporary directories up as part of its own
> tearDown() implementation.
>
> But the avocado_qemu.Test class is currently missing the same clean
> up, as it implemented its own tearDown() method without resorting to
> the upper class behavior.
>
> This brings avocado_qemu.Test behavior in sync with the standard
> avocado.Test behavior and prevents temporary directories from
> cluttering the test results directory (unless instructed to do so with
> Avocado's "--keep-tmp" option).
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 1 +
>  1 file changed, 1 insertion(+)
>

There was a comment from Wainer in the original patch and as you were
on vacation I submitted a respin last Monday:

https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05117.html

I also did some refactoring/fixes to the avocado_qemu here:

https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05212.html


