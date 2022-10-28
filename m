Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0B6112ED
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:35:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPVP-0004wQ-44; Fri, 28 Oct 2022 09:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ooPVJ-0004w8-Bl
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ooPVH-0006wP-2T
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666964069;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lZAwHxtNpRom5XBWt6r+1z0C9mEw3HUB17lgB1YkLwM=;
 b=PsNhX3ztUWihYp5FPjAg7mT9+UlIbZXx9NjoFqa1rt5OvPNtdZpo3hiExD9FBzxPDUavIJ
 ZYWytSLB6woILAEh/tpXDoF8KKpCfteWH0zLmMt5VoIb3HfsCihSOEEQ1oTsQU/PUM13vR
 8FKMJu72vztIkgYlNQaVa/fdOU0xgY4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-XpuF_nt-MxeNFR2fJRZy5Q-1; Fri, 28 Oct 2022 09:34:26 -0400
X-MC-Unique: XpuF_nt-MxeNFR2fJRZy5Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 t19-20020a1c7713000000b003cf5e738dd1so490782wmi.7
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lZAwHxtNpRom5XBWt6r+1z0C9mEw3HUB17lgB1YkLwM=;
 b=HSvERTS9eVqMhzUonO6w63zd27HxHzDpzWLW5XLdn45GPD/ZTcvOrT7xr/sPqhEjOr
 91r/0GFi0zFJScA3PdDfQKC9wp6tStuEU/nBfAwVm/Wszs6+lGTPTGd44RqYRSj5hR0D
 9KHxOfFJ41NtiGByqMHsgSzwMJHeH2duciEg6DrQmOJyvCDHAyIayuPwOzJf+ONShLdq
 LBsLUtSTMyzhbfkXZEKN0+ct0qEU5aSaSABGzulfZmTljpQQic8HKllk3k0WU0nRsgPT
 mBY2yQFfJ9HU3e1sczWM68bah7InUsqKmv94j99oKX7YYwYYZxEwYeA9djTRr0VbZo8U
 wgpw==
X-Gm-Message-State: ACrzQf0gcoQFqKWLvh4Qy9BUmmc0tKqPigE+6bXt6lErtNWR0AcHq4R4
 LOk+oJEXiZbk/TJKXgmK9a9rOpuWLWt3PI45lSffipWTodrAU8MsBGhMKU2x6ZNV84tHKZsXuVB
 zyD9b7wKSlTFEhVQ=
X-Received: by 2002:a05:600c:1e8c:b0:3cf:55e7:c54f with SMTP id
 be12-20020a05600c1e8c00b003cf55e7c54fmr4659885wmb.61.1666964065350; 
 Fri, 28 Oct 2022 06:34:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Iz3p+pbrwjGw3P60c+glOBRlLkVBT4zPhjbKBlkbe31EHMruTUuJ0Zm8s0GYu/zoeVb2qFg==
X-Received: by 2002:a05:600c:1e8c:b0:3cf:55e7:c54f with SMTP id
 be12-20020a05600c1e8c00b003cf55e7c54fmr4659870wmb.61.1666964065191; 
 Fri, 28 Oct 2022 06:34:25 -0700 (PDT)
Received: from localhost (255.4.26.77.dynamic.reverse-mundo-r.com.
 [77.26.4.255]) by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003a682354f63sm8710553wmp.11.2022.10.28.06.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 06:34:23 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Bin Meng <bin.meng@windriver.com>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v6 07/11] tests/qtest: migration-test: Make sure QEMU
 process "to" exited after migration is canceled
In-Reply-To: <20221028045736.679903-8-bin.meng@windriver.com> (Bin Meng's
 message of "Fri, 28 Oct 2022 12:57:32 +0800")
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-8-bin.meng@windriver.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 28 Oct 2022 15:34:23 +0200
Message-ID: <87ilk4vzq8.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Bin Meng <bin.meng@windriver.com> wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> Make sure QEMU process "to" exited before launching another target
> for migration in the test_multifd_tcp_cancel case.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v6:
> - change to use qtest_wait_qemu() API
>
> Changes in v3:
> - Add a usleep(1) in the busy wait loop
>
> Changes in v2:
> - Change to a busy wait after migration is canceled
>
>  tests/qtest/migration-test.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Juan Quintela <quintela@redhat.com>


