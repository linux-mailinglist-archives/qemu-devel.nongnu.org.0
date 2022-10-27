Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F260FA1D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:08:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3Wg-0002RO-CG; Thu, 27 Oct 2022 10:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oo3We-0002Fa-7E
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:06:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oo3Wc-0005qA-F7
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666879584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=jGTMdcPRY/D2JKp3hSpN41iXRvK2/lXTRWxZYJgEOy+zrKAW5IVKrXmFt5wW/KJ9U/kXUA
 J0BzCTpu5vz7odJFHlgkakD4aleIkmZR72cPwdi6TAZ/tUn0EnpTj9iQLtGCZ2LaxLn5+Y
 LfY2xOM8R4DeWo8bBdV8Ryozj1gmJeo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-JAA4meyUNriXboB5VgNdTA-1; Thu, 27 Oct 2022 10:06:21 -0400
X-MC-Unique: JAA4meyUNriXboB5VgNdTA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r18-20020a05600c35d200b003cb2ba79692so783237wmq.5
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 07:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=YHO8QEWOzlFNQbWTJ/NNk415gJnxzAWjv0urLi0eGwm4qfBkH1dJf0ImNWf+pAitnn
 75y1ayu/yJIlfqactb1qj1a8VGkAiLi0jr1uy8puOY4Z0qnwLpASg90lryw4BwsOTJVx
 xY802I1V7PoQwu/bAhoruZcRLt9HmAoAAMQDwHpu1X1QKQq/lki8zpfGcYUyIqBSdXg8
 RaW4yRF6G/m5dEANE6MH3DwY2pySL1s7BjT+qWrTt53AxgEeJ2onPIv+ZfU4Awdiv8iI
 yQf1RzWEmApdsvODz5EJzz3Mh/iAPO4lhW151VVJCbFkRWjm/XIQHeRSGCfRjJuIzm2u
 Vwlg==
X-Gm-Message-State: ACrzQf308rN0rTGUtB9mccwir9GMBg5NdkfGZY/O44lymEwPR/ATRcHf
 BGtPeVatRiC5M3bU4RB5mmq1pujBZqLFdU7ZFe12qri8P2zkIgs1dXceeHiMZjVA7B/ZuiOOXx5
 BcnaZQnY5kbQ9FvI=
X-Received: by 2002:adf:f482:0:b0:236:7a2f:69f with SMTP id
 l2-20020adff482000000b002367a2f069fmr11565937wro.115.1666879579837; 
 Thu, 27 Oct 2022 07:06:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM78ROGR/ODHD9Sl5IhMz5hpRNpEAWQAXslhrc/CCq+NC5jD3zd3wDnqze+kfDnVY/ISy/M98Q==
X-Received: by 2002:adf:f482:0:b0:236:7a2f:69f with SMTP id
 l2-20020adff482000000b002367a2f069fmr11565913wro.115.1666879579562; 
 Thu, 27 Oct 2022 07:06:19 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 dn10-20020a05600c654a00b003a3170a7af9sm1644522wmb.4.2022.10.27.07.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 07:06:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 richard.henderson@linaro.org
Subject: Re: [PATCH] util/log: Close per-thread log file on thread termination
Date: Thu, 27 Oct 2022 16:06:13 +0200
Message-Id: <20221027140613.433481-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221021105734.555797-1-groug@kaod.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued, thanks.

Paolo


