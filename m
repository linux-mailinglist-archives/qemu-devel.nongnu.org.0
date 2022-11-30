Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E237963D992
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 16:37:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0P8A-0004Xg-NC; Wed, 30 Nov 2022 10:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0P7m-0004PJ-CQ
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 10:36:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0P7k-0006CB-7X
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 10:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669822546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=GlXiazofOWg559z8+Q/lIGVgn4cMyB3QLcOc4SkoymOLmZnCtyt7uNeB8Y2SgBz6O3yy1G
 AGFL+k3AC3FrIQo67Yb31A3Gz2SxwTqff57gyuUta9Uej+gxNajzNYhYkMbHRyOOVPBERi
 RQqIUKpmRpMpNDJFIvyr3BMfkW+1JdQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-3Bbp46uqOL-1925aWghMGQ-1; Wed, 30 Nov 2022 10:35:44 -0500
X-MC-Unique: 3Bbp46uqOL-1925aWghMGQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 qb2-20020a1709077e8200b007bf01e43797so5924508ejc.13
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 07:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=mGxQbzDTIPDNbBkEnvv2bTATmRTfggfw/Dhq77c+TfOOGDqOEHpmAshHzU3ch2RPva
 JBlBfwbyYgKWUom4WEwwq6eW9R6BkcS9Zt0svNQI9+bGqWKjH3M2dCkz8ysDLVRejUvG
 Iw3HuRAAf4n5xJzGC8s5/vCSdluwN3ZEDXd/Fw7i/X/4MpKYr/387tgyT2DWbfDzPgdR
 ktI34iwiwLRNQgGa7T36s0VKNCI08RjgOp8X2d/3rBcKEIhysxGyY3/tFyW3ioKI/xmE
 HjOj050lKgmakWW6NCeSnAwRzs7Ccn/350p78Xi8U00AVGOgZABfzLV/9lNUSzt5AYh2
 nIrw==
X-Gm-Message-State: ANoB5pn2WG/4WaSGcHZSpkjfz7cXtpCEyCI2V+XRf11NUEWDN0i/AAuA
 wEYwGkwiFfICkNz6zzc38ciKIzyjdQlTvoMWjgPu9zYAAbWJQTaVBL2g0Pf5iGxfyd/PHe471Sy
 vd/dU0Artw91DorU=
X-Received: by 2002:a17:906:d20a:b0:7a9:8d8e:c3df with SMTP id
 w10-20020a170906d20a00b007a98d8ec3dfmr36735387ejz.519.1669822543634; 
 Wed, 30 Nov 2022 07:35:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4CCNoz1wBBTyDYc2FPTllawNM1aCJ1iDxZQkMYxIFw/ARhKoqR63rn/IEBt5l+yLU9gkKTNg==
X-Received: by 2002:a17:906:d20a:b0:7a9:8d8e:c3df with SMTP id
 w10-20020a170906d20a00b007a98d8ec3dfmr36735368ejz.519.1669822543379; 
 Wed, 30 Nov 2022 07:35:43 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 a17-20020aa7d751000000b00456c6b4b777sm733169eds.69.2022.11.30.07.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 07:35:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH-for-8.0 0/2] hw: Reduce "qemu/accel.h" inclusion
Date: Wed, 30 Nov 2022 16:35:39 +0100
Message-Id: <20221130153539.46310-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130135641.85328-1-philmd@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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


