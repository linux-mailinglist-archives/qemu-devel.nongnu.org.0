Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B0F6EB46A
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:07:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppyu5-000240-6Y; Fri, 21 Apr 2023 18:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppyu1-00023g-Ol
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:06:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppyu0-0000jn-6W
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682114807;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2TrZVTZC5AnqW2uQ7r2rzZy/pfRAMeZAn4rU6XYOgg=;
 b=P2EGR+1ZHezMJOORvLE8W85naK6SYNptsP4tmPKgcAD98g9Fohy7WYp1bF2RuPf+PTcdz3
 urEsklml0FS1uJpRmJknEwNKfBx+vY1FR3CVgOHOgzaoT6JaEASD/xXBMwX57AWE/5n8A4
 HAGwBnB3yhHyCn1Xrx/xLNhi/aHDOHs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-NybA3V3rPNq7ppWXOVQJqQ-1; Fri, 21 Apr 2023 18:06:45 -0400
X-MC-Unique: NybA3V3rPNq7ppWXOVQJqQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2ffee43dac5so841847f8f.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114804; x=1684706804;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H2TrZVTZC5AnqW2uQ7r2rzZy/pfRAMeZAn4rU6XYOgg=;
 b=WUJzxwmaaqAOF0KR9WKWyBgukcts797x3jqTqKlFfnpuzctLS6D+5Jn/PpyM6e+XEn
 eGsyJBp+nDwWakEMmFbONU+9j5v/77q+7iXWGE/auNG6BLwcli5ksaMYcvfhU2dZzAQo
 7LKaRErsVPnB7cXw2E+S12KaYpeTGYz3S7FreP1X4L4zvsi8vzpfAq1JFKtNSRsoMoCp
 LwFJt4uo+dVPF5aDE6pWNLTDH4KqCPwzPbNEJJm/HvsldyEXYUsZoOtbDo7UYG90M8mr
 +kfF/PqIXkAfOvclzPxW7ObgjE6rdipMC2MEplq2sLQp2oKz26vsXYobgq9L2K+5gsEp
 eldw==
X-Gm-Message-State: AAQBX9e544ti6hLRH8IHeOMnVZd+gsD58lAxK1zj/qAwApUF5EKXluZp
 vbB7hCF0pc0BBKhB7D/k8FsgoHlmcDjGb6JCFWc2fRMHroYpoxHU3Mu/2JLqqBc5hL32ddCxkhZ
 s+1RmaJ0nLEt5Pm0=
X-Received: by 2002:a5d:4988:0:b0:2f0:2dd5:ee7 with SMTP id
 r8-20020a5d4988000000b002f02dd50ee7mr4890462wrq.36.1682114804238; 
 Fri, 21 Apr 2023 15:06:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350ba/TQmSYjOodNOvivEDtOsjdlRtS2Z7qNhf1i9fBUtObeaCkiZhNIAzsGYdqhP4rKM8OGRjg==
X-Received: by 2002:a5d:4988:0:b0:2f0:2dd5:ee7 with SMTP id
 r8-20020a5d4988000000b002f02dd50ee7mr4890446wrq.36.1682114803945; 
 Fri, 21 Apr 2023 15:06:43 -0700 (PDT)
Received: from redhat.com ([31.4.212.142]) by smtp.gmail.com with ESMTPSA id
 k5-20020adff5c5000000b002f103ca90cdsm5243055wrp.101.2023.04.21.15.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 15:06:43 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Li Zhijian <lizhijian@fujitsu.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Zhang Chen <chen.zhang@intel.com>,  Laurent Vivier
 <lvivier@redhat.com>
Subject: Re: [PATCH v2 4/6] tests/qtest: make more migration pre-copy
 scenarios run non-live
In-Reply-To: <20230421171411.566300-5-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Fri, 21 Apr 2023 18:14:09
 +0100")
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-5-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Sat, 22 Apr 2023 00:06:39 +0200
Message-ID: <87h6t8gaa8.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> There are 27 pre-copy live migration scenarios being tested. In all of
> these we force non-convergance and run for one iteration, then let it
> converge and wait for completion during the second (or following)
> iterations. At 3 mbps bandwidth limit the first iteration takes a very
> long time (~30 seconds).
>
> While it is important to test the migration passes and convergance
> logic, it is overkill to do this for all 27 pre-copy scenarios. The
> TLS migration scenarios in particular are merely exercising different
> code paths during connection establishment.
>
> To optimize time taken, switch most of the test scenarios to run
> non-live (ie guest CPUs paused) with no bandwidth limits. This gives
> a massive speed up for most of the test scenarios.
>
> For test coverage the following scenarios are unchanged
>
>  * Precopy with UNIX sockets
>  * Precopy with UNIX sockets and dirty ring tracking
>  * Precopy with XBZRLE
>  * Precopy with multifd
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

It is "infinitely" better that what we have.

But I wonder if we can do better.  We could just add a migration
parameter that says _don't_ complete, continue running.  We have
(almost) all of the functionality that we need for colo, just not an
easy way to set it up.

Just food for thought.

Later, Juan.


