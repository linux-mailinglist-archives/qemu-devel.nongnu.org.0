Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C957657CAF5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:55:35 +0200 (CEST)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEViI-0000hI-SG
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEVfL-0005yy-Ri
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:52:31 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:55826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEVfJ-0001Ds-Fi
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:52:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD328B824D2
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 12:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27711C341D0
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 12:52:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="eztrf3Oc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658407941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PTKGlOK4AphctRDk8xGjWJoSKrgaJ3wNaCVNfpwAu80=;
 b=eztrf3Oc2XQSFenpeU6SQnHkQnickYXywJ3Yx033emTjRLbRr4zdFVS2bCSqO30FOtsGj+
 fuw+9fYFVAptJ2nlfnY5I+8TH4oMk+349XqfI+YhGNKIDdhvfWkYCGomP+c0bjfSr6D7Xz
 LBpnvBJAFWM/BPJHvn/IPk5Z5DTpBTY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 14e8502e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 21 Jul 2022 12:52:21 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id o21so1154399qkm.10
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 05:52:21 -0700 (PDT)
X-Gm-Message-State: AJIora9iJo9/i2D54Rdc//Ik+W0aS0FFau2ENJ6ewclR+kXRgrQPkTd1
 KzQshj+UkONJNdgZnon2atpTAaFmtDfcyI7Bkh0=
X-Google-Smtp-Source: AGRyM1tTzGw6Q3h3jU9iwZqfJr4uQGjWLEMm6gMzmJvAs17DZFiQjPp1nP0k8GmGwUCZfvWDGZx2P4ZamI2wHipd//g=
X-Received: by 2002:a37:9a92:0:b0:6b5:f973:26ba with SMTP id
 c140-20020a379a92000000b006b5f97326bamr11508650qke.390.1658407939717; Thu, 21
 Jul 2022 05:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220721104730.434017-1-Jason@zx2c4.com>
 <20220721104950.434544-1-Jason@zx2c4.com>
 <20220721065744-mutt-send-email-mst@kernel.org>
 <1ee57e75-94a1-cf75-7d49-0d399607fee9@redhat.com>
 <YtlDtSlRel1UUd71@zx2c4.com> <YtlGPy+C9ksQQXzO@redhat.com>
 <8329bd5c-a0aa-5d91-657a-204fb6d789b0@redhat.com>
In-Reply-To: <8329bd5c-a0aa-5d91-657a-204fb6d789b0@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 21 Jul 2022 14:52:08 +0200
X-Gmail-Original-Message-ID: <CAHmME9r8F4-ji6--PikVzSjT-rPiwqkUrK0rBtxtbYNnr8x0Lw@mail.gmail.com>
Message-ID: <CAHmME9r8F4-ji6--PikVzSjT-rPiwqkUrK0rBtxtbYNnr8x0Lw@mail.gmail.com>
Subject: Re: [PATCH v6] hw/i386: pass RNG seed via setup_data entry
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo, Daniel,

Okay, patch incoming.

Jason

