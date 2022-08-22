Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C659CAA0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 23:16:43 +0200 (CEST)
Received: from localhost ([::1]:37986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQEmo-0001k6-Fo
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 17:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oQEkW-0000KA-5Y
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 17:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oQEkR-0002Kc-U4
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 17:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661202852;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmNf5qs+w6xE2DuA1NZwgytVLvX/ENPUtfiroSyko3g=;
 b=h/BxXOnxu5tcLGZEcHqlbBRCSlGndKDMwZDkvtCc8332AgpNgx6QAi31uCrkeJDspE0DE4
 uF8YmPwq2KftKSgEnIKEImuxXEULMvlkdN3mwnwX1HMv5L4mkkUVM34sMICQyUd3ixup/E
 cmpB9ryDgXcWseeai6wwPdLfWeT96Fw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-UP2p1lYZMb-V2IrEoidFWw-1; Mon, 22 Aug 2022 17:14:10 -0400
X-MC-Unique: UP2p1lYZMb-V2IrEoidFWw-1
Received: by mail-wr1-f71.google.com with SMTP id
 s20-20020adfbc14000000b002252dae05f7so1907362wrg.20
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 14:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=hmNf5qs+w6xE2DuA1NZwgytVLvX/ENPUtfiroSyko3g=;
 b=cPTMiaIH1bc/LQrKfI9BE4XsFEPLyUhlS4dbJyvseW46C7BXS2w5sQ+gShXZWPyme7
 6wKAOmVhkFId3zD5d07jxSo0X+V+Wk87IXPzTblWhGLWku/tw4IJlHCrqYJRo1dKbq7B
 py9twXIMBd+z4hMcb76Br3ibGjMJhka8CqxN+0msQ5pYtn1xCDR1uB0EiDKRTQfk7va5
 zObHxMLF/9Do2ZU2HxapzMpWY+g0qSeuqPL9qWbr0VwsdLVDTooq1YEMg95KRs/VuKs1
 gi2sRnjTYXOIn1GEAG7Y9EUI6DKqkAiZeU/FakgDNwFdRzH6o8jgYaIc2tn8x8xH2Q4Q
 4oYA==
X-Gm-Message-State: ACgBeo0F14gos3Khri5Z26Nwpe3MvaYTkOPbb9djMxAoACWL2rITCvJA
 Brl7wvUwTw3xFodMpF9rIJJunn+J5nFsaTIpXyO/F2zwsvwK/4nGB80BtOWhHPRTzELEhlFreKR
 1slLukLEZAnShu+c=
X-Received: by 2002:a5d:47c1:0:b0:225:447b:2e57 with SMTP id
 o1-20020a5d47c1000000b00225447b2e57mr6893469wrc.665.1661202849673; 
 Mon, 22 Aug 2022 14:14:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6mE/8pc7S5Mitnil8ToXw37A6yikDNNPqthkskp9Pa87mwRL8TcUbAoLuwDxU4op07eXxlMQ==
X-Received: by 2002:a5d:47c1:0:b0:225:447b:2e57 with SMTP id
 o1-20020a5d47c1000000b00225447b2e57mr6893456wrc.665.1661202849436; 
 Mon, 22 Aug 2022 14:14:09 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 w6-20020a5d4b46000000b002205a5de337sm12274566wrs.102.2022.08.22.14.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 14:14:09 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH  v1 2/6] tests/qtest/migration-test: Only wait for
 serial output where migration succeeds
In-Reply-To: <20220822165608.2980552-3-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Mon, 22 Aug 2022 17:56:04 +0100")
References: <20220822165608.2980552-1-alex.bennee@linaro.org>
 <20220822165608.2980552-3-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 22 Aug 2022 23:14:08 +0200
Message-ID: <87zgfwyo9r.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> From: Thomas Huth <thuth@redhat.com>
>
> Waiting for the serial output can take a couple of seconds - and since
> we're doing a lot of migration tests, this time easily sums up to
> multiple minutes. But if a test is supposed to fail, it does not make
> much sense to wait for the source to be in the right state first, so
> we can skip the waiting here. This way we can speed up all tests where
> the migration is supposed to fail. In the gitlab-CI gprov-gcov test,
> each of the migration-tests now run two minutes faster!
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20220819053802.296584-2-thuth@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


