Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6B64DA94
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 12:41:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5mbX-0004Fy-Fs; Thu, 15 Dec 2022 06:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p5mbU-0004FW-Oi
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 06:40:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p5mbT-0002Jx-52
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 06:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671104441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPsdNjnzTBgr3y/tmyfQiNdWXd9MaFgmbI/Ly7Lh4BQ=;
 b=LH0yvdnrBrApwX5vs39wbsE/LWQNgq84chfw7pLMH+VkiCOQzaJiQaoSzuUL5/tFque3pi
 q/P/+OIDCRzRiRSyowmMiizZhKFSxDkPJ5H9lVK7LobDuU6hXthx8WLa2G1ReMcKksEb17
 lpakv2Y/1PHUqaHkTZ0BLauywH4WhE4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-130-HRPERCR6OVyQ5C9pQowhwQ-1; Thu, 15 Dec 2022 06:40:40 -0500
X-MC-Unique: HRPERCR6OVyQ5C9pQowhwQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 x10-20020a05600c420a00b003cfa33f2e7cso7778641wmh.2
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 03:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NPsdNjnzTBgr3y/tmyfQiNdWXd9MaFgmbI/Ly7Lh4BQ=;
 b=yH2mthJFKLX5E4sFZdhOitBOU6cVCr5h3YWcolH1gl3uvw9eW5JDQmXOHw71kWdel2
 jo6oCJ8uzSHTfYzCROi1/qTVNPGr0126UdS/5qK8EYGRnTFMJWi9yq8/rfVOsXqxUV49
 b95WXhvx79v7j88xQX9/mehFuratcA0lDDd5ycDVared3k1+mDl0v9+DX4OSCzXi5wUZ
 gYQCrTVeNGOSjWszuj6PBwKH0yc/dTvVPh4fr/tEILb3kbKO78bzgcmcRCfYaNoHavdJ
 pSGWv1f9j3yLKoNJPzrKfEtTis0AI2BbPgOd+i7vMCuqV+e7p6hZZ3T8GTibvWTm11dW
 IqIA==
X-Gm-Message-State: ANoB5pmx1iv/pyUPFHUIWrHZ9b/KXGYarNt8v0DBVIufTBsPedeUmf0G
 XQmEm8PlRVFzt72OnAvMb93Dbpi2OYBZ5f+dDzJQVrTiKPniMNx8yT/cdamKWcBiRFzDL9KkmpB
 ZaYU6MMXxgv5CwtE=
X-Received: by 2002:a05:600c:3b0c:b0:3d2:37a4:222a with SMTP id
 m12-20020a05600c3b0c00b003d237a4222amr6356475wms.38.1671104439036; 
 Thu, 15 Dec 2022 03:40:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7cP3b4X6tiRS4gocmRRwg+QoSG2RAzZZASGn5OubUz/oYZVkJDe4D6q2pkeFM0wlGV7pe6yQ==
X-Received: by 2002:a05:600c:3b0c:b0:3d2:37a4:222a with SMTP id
 m12-20020a05600c3b0c00b003d237a4222amr6356463wms.38.1671104438777; 
 Thu, 15 Dec 2022 03:40:38 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c3b0600b003a6125562e1sm6994900wms.46.2022.12.15.03.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 03:40:38 -0800 (PST)
Date: Thu, 15 Dec 2022 11:40:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: migration qtest failure: "query-migrate shows failed migration:
 Unable to write to socket: Broken pipe"
Message-ID: <Y5sHtDP4vyEjhIan@work-vm>
References: <CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Maydell (peter.maydell@linaro.org) wrote:
> Hi; I see this migration qtest failure on my x86 macos box:
> 
> 
> ▶  32/591 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed:
> assertion fail
> ed: (!g_str_equal(status, "failed")) ERROR
>  32/591 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
>            ERROR          152.27s   killed by signal 6 SIGABRT
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> query-migrate shows failed migration: Unable to write to socket: Broken pipe
> **
> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed:
> assertion failed: (!g_str_equal(status, "failed"))
> Assertion failed: (pid == s->qemu_pid), function qtest_wait_qemu, file
> ../../tests/qtest/libqtest.c, line 207.
> 
> (test program exited with status code -6)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 
> and similarly:
> 
> ▶  34/591 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed:
> assertion failed: (!g_str_equal(status, "failed")) ERROR
>  34/591 qemu:qtest+qtest-i386 / qtest-i386/migration-test
>            ERROR          169.44s   killed by signal 6 SIGABRT
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> query-migrate shows failed migration: Unable to write to socket: Broken pipe
> **
> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed:
> assertion failed: (!g_str_equal(status, "failed"))
> Assertion failed: (pid == s->qemu_pid), function qtest_wait_qemu, file
> ../../tests/qtest/libqtest.c, line 207.
> 
> (test program exited with status code -6)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 
> It seems to be fairly consistent. Any ideas what it might be?
> Maybe the QEMU process has already exited before the test binary
> gets round to querying the status ?

Yes, it sounds like it, can you get a backtrace to figure out which test
it was in/where it was upto when it died?

Dave

> thanks
> -- PMM
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


