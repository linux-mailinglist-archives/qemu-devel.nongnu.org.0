Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F706A0ABA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:36:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBkz-00078W-Cb; Thu, 23 Feb 2023 08:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pVBkw-00077Q-Rh
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:35:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pVBkv-0006x2-2u
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=OF2fg1z+Iy1uzthL6GG/bDB4s+7GS3d8xh+7L1YZh1bEfH/fywikDlQVzum5bCpC5AIPOQ
 M5IiSvAYHCVJyo7M91fGJDeBAwlvmQLLDEcmtU5GwzoISaxxH4eqUbLoq6Bl7QBJdpPacS
 Uo1XjLyDPZxpBjv78CBoChWfs/nrzz8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-BkEeBkbLMvqT1aEeu4xFrA-1; Thu, 23 Feb 2023 08:35:26 -0500
X-MC-Unique: BkEeBkbLMvqT1aEeu4xFrA-1
Received: by mail-ed1-f69.google.com with SMTP id
 ec13-20020a0564020d4d00b004a621e993a8so14736084edb.13
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 05:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=QBbUvlLZQgiyaqqGMJQbuZQV/aJP9oyqUJkV9z3uqf00e/z4BqdbmvFfUAOC6NTOfs
 IUtiE5ALjA1PNLycPRTVsvm9XQMTV14kCngMfZmZBKwwsC9/jFLv8vLxJU8rsggRau3h
 v9brYM3B4JxUA/piN2VWDPfZdJvIJeyhRfvOtsFdsJWtOWHzzr3j7vjAz/+ZbOEAsqlV
 tFyYogNgGSDlc1J7VQhW7ZO6Ex3xw+31+otI9E/o0Tn3ojAmUGq+IOd2BwJQcNa30dun
 +2Dgx6tSjE4VpYECaWIVtz+X94GnJqBHlx4L4aOmu+Yk2OJJpWMOvaOEoHo9yiPpFO4k
 9Eeg==
X-Gm-Message-State: AO0yUKUeAcBcuuvgGrMF8AQrIvmb7Qm0Gj+T6oWIwrAa1fC5mWk/tdNp
 0vSMQISeABzA19u4+Xge7c8lDGnOjioWhn7wlmH4GL4RuYrzF6Hv2/hZOZobwh+Zhh2nquxzvN2
 mSL7fnaOu9vQ522w=
X-Received: by 2002:a17:907:7898:b0:8df:e176:483b with SMTP id
 ku24-20020a170907789800b008dfe176483bmr8202890ejc.3.1677159325388; 
 Thu, 23 Feb 2023 05:35:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/BaAfP3o5LFYww9ayS3u/am89EMDx/N7mGPSwlGDybuRU+qWmSprt4qLP78PYc5MLZ4C8bFA==
X-Received: by 2002:a17:907:7898:b0:8df:e176:483b with SMTP id
 ku24-20020a170907789800b008dfe176483bmr8202879ejc.3.1677159325043; 
 Thu, 23 Feb 2023 05:35:25 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a17090680d100b008dea022f5e6sm3443575ejx.24.2023.02.23.05.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 05:35:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: Re: [PATCH] target/i386: Fix BZHI instruction
Date: Thu, 23 Feb 2023 14:35:21 +0100
Message-Id: <20230223133521.555620-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230114233206.3118472-1-richard.henderson@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Queued, thanks.

Paolo


