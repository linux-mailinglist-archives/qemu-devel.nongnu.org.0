Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC6C63A11F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 07:20:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozXUx-000321-K2; Mon, 28 Nov 2022 01:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ozXUu-00030x-MO
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 01:20:08 -0500
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ozXUo-0007Pf-S1
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 01:20:04 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id d2so1802207qvp.12
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 22:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=atbCSBcDTqH/R95/pm4H1LzMlHp76NM4uDOXNt5pdeI=;
 b=aZpzsJMYASs4Enegwpuor4caMhLbQM9lOFIWtHbJvXv4WEC9jC9uhdwT48K4JlXJyp
 X4e0q4jqugosodJK8GH7GZJZaZ3uEO/AQshcRvQiuC2dDKuCj3ligUwq0ebE3dMJ9p4F
 VQtfs1ZlitomcfUJ8Nqd3j1+HaF7OqdTqtvJIwCmvdU6slSN7H7UHPjK1ItL19KzCTmQ
 xHmYMlV08j6/PrnJ/3CykEGveJNEEDiFORUKsLrTz13G5/3HXYJZ0rNSo9GCzCzvHTPv
 BhfQnpE83/8QgF4miw4ovZpRy05kOorb2O9/Q9q2tyT/90Qby3do6vx5adm2kV7To4fq
 bvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=atbCSBcDTqH/R95/pm4H1LzMlHp76NM4uDOXNt5pdeI=;
 b=QRudS6pNZEdzlh5yR+1GT1d18LQ2DTIPa317xLVcuAr8ruiGoGsnDds9iOedwerAlR
 t+eCzK28BWujvg2K9G8xBPqO2H2vv3T41SkjQgjF7wAIPoIWPDNnG3QvKdwGSfZ64PgY
 Y84JAkznD/3tlbfm/r442a97ZRK1T5TCvYS9BlBYsJo0nJczOmxBPPWwmVVLfnpPr46L
 P3hjS9TQtGDzSGjTWIK2BQXqB3mQZkOeUdnckrZdRkakP9IPrgo5VkO5JIFpimSdwksM
 iUV3/vtDCXtdS+fFAivURMYcEvidH8eHYjpoNBw7SA9fZgiM0QYUbDps1h/k+i3xolwV
 faOw==
X-Gm-Message-State: ANoB5pna9N2ss2uStQIvusFC4gSWgomwAyQxi9zvfjbdI2mwWiqkU8A/
 ybcV/kT+Bl8g9fvIMsFm75AuwJtFbt1LjRUu0u4=
X-Google-Smtp-Source: AA0mqf5fLX1Nid7QQMlz/vUmnToQdr519mfKFT+Y8RpzAipEXDEQAw6vXVnwjWlulaycWPDDf/+Fr4ThGb9KxWDMFII=
X-Received: by 2002:a05:6214:3281:b0:4c6:ed60:791 with SMTP id
 mu1-20020a056214328100b004c6ed600791mr9391825qvb.85.1669616401400; Sun, 27
 Nov 2022 22:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20221125083054.117504-1-thuth@redhat.com>
In-Reply-To: <20221125083054.117504-1-thuth@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 28 Nov 2022 14:19:50 +0800
Message-ID: <CAEUhbmV9A=b15wi-7+LktmSD4S_AdcWaiCApqFr6+XmfrGgLEA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Fix unlink error and memory
 leaks
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 25, 2022 at 4:33 PM Thomas Huth <thuth@redhat.com> wrote:
>
> When running the migration test compiled with Clang from Fedora 37
> and sanitizers enabled, there is an error complaining about unlink():
>
>  ../tests/qtest/migration-test.c:1072:12: runtime error: null pointer
>   passed as argument 1, which is declared to never be null
>  /usr/include/unistd.h:858:48: note: nonnull attribute specified here
>  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
>   ../tests/qtest/migration-test.c:1072:12 in
>  (test program exited with status code 1)
>  TAP parsing error: Too few tests run (expected 33, got 20)
>
> The data->clientcert and data->clientkey pointers can indeed be unset
> in some tests, so we have to check them before calling unlink() with
> those.
>
> While we're at it, I also noticed that the code is only freeing
> some but not all of the allocated strings in this function, and
> indeed, valgrind is also complaining about memory leaks here.
> So let's call g_free() on all allocated strings to avoid leaking
> memory here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/migration-test.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>

Tested-by: Bin Meng <bmeng@tinylab.org>

