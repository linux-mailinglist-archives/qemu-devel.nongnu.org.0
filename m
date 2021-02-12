Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C172E31A615
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:33:36 +0100 (CET)
Received: from localhost ([::1]:57280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAf8B-0006co-NY
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lAf5c-0005QP-C2
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:30:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lAf5Z-0001ki-Ob
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613161852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dFpphZ/ObnOdeNoQGRMiudn/UV/eWanGtURSQTj1Hvk=;
 b=b7NzdLd4e3e5lOC2pXMT4UTBwnZ7gmqiI4rAGooYEee/qr0n0e5U84Mx/9NvWTE+dM9cYy
 zKB80+f41xCOXURA4ha/ydRYtsipa7XzL0zGklnAKxDfNlDtDTF6dGd+0vjsoglurmABFo
 IVk33DoKK7k4trJGn3VKGtTnLsCJvOA=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-dn56F2RYNl2p2_BXsyT1_g-1; Fri, 12 Feb 2021 15:30:50 -0500
X-MC-Unique: dn56F2RYNl2p2_BXsyT1_g-1
Received: by mail-vs1-f70.google.com with SMTP id v22so366795vsm.7
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 12:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dFpphZ/ObnOdeNoQGRMiudn/UV/eWanGtURSQTj1Hvk=;
 b=PyAvnqGsPuNsW5oOT3A+wdWHq5moqPRQYwFvf1YGcFVjW837T3Ud73oJhTcicHujV5
 ux4XCkeSDi7mLE3ZtxPejR+UnSPnAu9m87sHG/mi8mimz4BabNBBBKjU2ZzIxKufe9tB
 W93SVPlwjmq2etMK9vE2HeC4pWGySqlywr4X3agfv8mCh0L74t3NhUFq6+SKb1G9JT/n
 0AbMXGzc2/u9/PHQm7Ye5sK6U0mVqFHiRcQZ7kOjDk5Vb3cXZFiFE+qcrx4HAJvyAiEi
 uq3cbTJUGenuxpWU52zrBUzfMZQaFBH1c1JU8nBL8SThtQsZcR61gJ+DZ/zK5ZU17MIm
 Iixw==
X-Gm-Message-State: AOAM530C7Jn1n26I7RQcxZfhLSB/Qi3RqhQchHqRR1mTL7iy48XMLyvm
 Jk4FkAVsyomhxFN8xajprDK+8trjVxepvB2naWr+ngvwYR7ByQZ+5UTB1zThHZCmGCEfMlW1XxW
 Fb8/dMTvWeY3PO7Clfie5GstQzt5P17k=
X-Received: by 2002:ab0:23c3:: with SMTP id c3mr3418464uan.133.1613161850487; 
 Fri, 12 Feb 2021 12:30:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlpEX/2YCcrHHiGiXkN/fviQvTdBBbIVg5gCVrD7vG95C3q7DG0opXzKG2VvDMb+6xsAmaiOca6cVED3K89Gs=
X-Received: by 2002:ab0:23c3:: with SMTP id c3mr3418438uan.133.1613161850346; 
 Fri, 12 Feb 2021 12:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-21-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-21-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 12 Feb 2021 17:30:24 -0300
Message-ID: <CAKJDGDbZOVPQynajKZ8W9POAhLSvwm8W0Cmy-AR9==AAh3YxWA@mail.gmail.com>
Subject: Re: [PATCH 20/22] Acceptance Tests: add basic documentation on
 LinuxTest base class
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 3, 2021 at 2:25 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  docs/devel/testing.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


