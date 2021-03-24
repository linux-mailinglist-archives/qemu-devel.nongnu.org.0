Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9434831F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:51:27 +0100 (CET)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPATO-0004dZ-H8
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lPAPc-00033B-RQ
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lPAPW-0003Yt-6B
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616618845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=29GtX7cEmhQHVsvuZJtMUyv06WXunyr9Tt7TS5LHUYE=;
 b=d/HpqPI3Qy+tzghqyqnVsEMaLM/FM2KkBwModLQ6TWut70xBtwrCR4u9ny1R9ZJdnKp0Wk
 bPlw73wt8nTywKMCZvUwt4iOq+51Dm+IiYwvYKTi3GHYgtCqKgpoFE9iHbJZScMHoZE6n4
 6U77EmosUc9brz/gUGwJ3jAUYtkBmQs=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-byC3RXbeNP27_9C5240v7w-1; Wed, 24 Mar 2021 16:47:21 -0400
X-MC-Unique: byC3RXbeNP27_9C5240v7w-1
Received: by mail-yb1-f197.google.com with SMTP id v124so3716279ybc.15
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 13:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29GtX7cEmhQHVsvuZJtMUyv06WXunyr9Tt7TS5LHUYE=;
 b=U/dv0U4QfUyr0+57Os1ne0+G7bFZDn0534O2Z5ce5tpXuv5XMigqcPWETYTGH+d+nP
 rAoDTqWemg3SQeMwXAtWKwoR4cKhzGc+2B0QQcFDv0DSujVc4kzo83APaACaTHbfEHoR
 E7Ru/v83OAaAWZ8LBek5U91XIuVU3jOQse7dTJqaPQHWNpPnieKXww0OARsgKZobvB34
 clB1JBSVRfUbp/XOXsqUtZVyxyhQmCfNwFFrI7Knr2imITS7z0/bOv8n3xFgu4eTxL7E
 aED9hwWqcPoQ3y8SXzuTa6NV/O2fjLOPUALXO1yPYkKeLtDhjLQ/8dg4JGYK9/xwjfKt
 NDfA==
X-Gm-Message-State: AOAM532C8QY4VJYlCPvgclJDe2ahzJSCUA/PCRXJiXnplu/QJsFbpZpR
 qGlbAlxeku+8603yLE6gZomLOVzVbSYcJhXSSmSQuIEZRL049cMIcU+NoWKdBKcou6ZIHDMuXDq
 o1eJvAMu/w2CgAk4/ZGRxXGbRPgR+K3I=
X-Received: by 2002:a25:2d14:: with SMTP id t20mr7211727ybt.501.1616618841205; 
 Wed, 24 Mar 2021 13:47:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIHweia0cwcc6pHTQxp50BxjlWfprYMsP2k/eP7GpTwGW4KprzFRJ2LSMLodlx/1zG9aVdp8BS47vrBcYHEQc=
X-Received: by 2002:a25:2d14:: with SMTP id t20mr7211713ybt.501.1616618841033; 
 Wed, 24 Mar 2021 13:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-9-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-9-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 24 Mar 2021 17:46:55 -0300
Message-ID: <CAKJDGDY83KonMKehXC=peH9_iHaPnxrL+FoVrM9f=bfXfxbh3w@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] tests/acceptance/virtiofs_submounts.py: remove
 launch_vm()
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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
> The LinuxTest class' launch_and_wait() method now behaves the same way
> as this test's custom launch_vm(), so let's just use the upper layer
> (common) method.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


