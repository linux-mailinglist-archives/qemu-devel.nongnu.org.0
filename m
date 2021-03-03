Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E8732B8D8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 16:09:28 +0100 (CET)
Received: from localhost ([::1]:39794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHT7v-0000x9-RS
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 10:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lHT6t-00082n-Gy
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:08:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lHT6r-0000sB-CP
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:08:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614784100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ew+eiBT6LPJJ2wWF2i+udRKIqPIGLIYexSf9DsPtLjI=;
 b=EYqeSoYM1/jGmJpOvZruVCKi0pJGxeDxBhfjhtI5q4+PVsWy46e78aGJsWSXDxqHn8Coyp
 whowIhr0hJm1yv9tKbORNhCS7dBqIsISEaQk/5mCyM2NYRN2oQ8AqQcNyIWU7oMfnTeatc
 sQY9SUHztcdGUVbTcLcQn3oRUypM8gA=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-r0O3o8xrMPWxfCIabNvQfw-1; Wed, 03 Mar 2021 10:08:18 -0500
X-MC-Unique: r0O3o8xrMPWxfCIabNvQfw-1
Received: by mail-vk1-f199.google.com with SMTP id q15so3311391vkd.1
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 07:08:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ew+eiBT6LPJJ2wWF2i+udRKIqPIGLIYexSf9DsPtLjI=;
 b=qT5wgQDlLak70gDHHQ3vQnbRXUu2EDWw3ryWhJdKXYPcCc6MqZ1FyKc2JEgXNW5j1y
 A/E43OMBLjpb070pTitdzvrbyIkMIOBr3CXF+lGTmYlMg8VIpVHtpQOu4x0mv5Q67rBp
 +VIDQGpdGvn8rAMBP1wt0IpOx/6e0wqiF/G7HR3O9MB3izdQ030iN9VSQxn3SfKTRnRS
 X38tgL3QK+9cj73y9ibTkBJ2+8/Tpvwybq3kDxL2MalLNXAYvoQXa8ve9Q9Z4lNUJQDJ
 wYBI/sEYLfil2CQr8MT2shPBSDTGC4c1x81foxzdRkqZrWwfuxdpz8lb0Xi+5Sv/ID+0
 cvVQ==
X-Gm-Message-State: AOAM532R5Mp3WwtaX5DsROx/5ZnQJcLA/wUkmaK+ah9iYQfXeruwvIgd
 TvIWBo0+BGCHQ07Jq5T+rWUYxEho5L3foL1C6hOPwsVQayccgwTqRyDFhz3pFNG1fggkXtc2u4N
 z1PRywzO+L316jHtCgoE1M9jEl1KMwfc=
X-Received: by 2002:a67:fe99:: with SMTP id b25mr2222488vsr.45.1614784097962; 
 Wed, 03 Mar 2021 07:08:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTP9IngoKuWanrVCMpE+QfjbdM5ngPpX4U9qLyK021r4DXssWVWgGhcr5cMbPkxglZNkX40vEGeZAYbzb8G9Y=
X-Received: by 2002:a67:fe99:: with SMTP id b25mr2222464vsr.45.1614784097835; 
 Wed, 03 Mar 2021 07:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20210225232122.1254879-1-crosa@redhat.com>
 <20210225232122.1254879-3-crosa@redhat.com>
In-Reply-To: <20210225232122.1254879-3-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 3 Mar 2021 12:07:52 -0300
Message-ID: <CAKJDGDbE6AxEJCxA-N2eB6RtDjOkOp19wixZwwSuVe3D7=c2gQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Acceptance Tests: restore filtering of tests by
 target arch
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 25, 2021 at 8:21 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Previously, tests were being filtered by the matching target
> architectures to be built.  The benefit, compared to the current
> situation, is a more concise test job that won't show tests canceled
> because a matching QEMU binary was not found (those tests won't even
> be attempted).
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


