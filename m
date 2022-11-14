Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812AF628EE1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:06:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinX-0007rx-MZ; Mon, 14 Nov 2022 18:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ouifG-0003B9-E4
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ouZqO-0005jN-Vq
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 08:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668433787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=DrJW2BoLKb+bLj6n4vCkDmxYrb5fOnn6kbDJqa7sinQJIHqOTGxjrfJv1J/4pHqaEaYYWU
 gGPoWqaATtLVSQBylXo7a+q8BjpzKejFn1mLxD4wn6Dpy46k7MOgWJVOI3y2Q15ViId6y5
 FxHNTZn+Ma2rnwIWdB1c8KsFeXBe9YQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-4s8ggSI8O-GvmLXz-EjVlQ-1; Mon, 14 Nov 2022 08:49:44 -0500
X-MC-Unique: 4s8ggSI8O-GvmLXz-EjVlQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 qb20-20020a1709077e9400b007ae67a9aa7dso5459114ejc.16
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 05:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=oLotNSwbwAf3F95hscuepqZqCXGwXZzDgTY4H4Qz0J43ZT7I4gc+X3cSSXZ3AT2D97
 zLxdUW42OQAHG74g0NpV3zu+4PjsIt32bqvONyyeGPEk2+9LVZy4lgyZYUnxzBS9UdIB
 TIVi0ejjAkrDnnZpo7zNbp+w/b59ocTYLgfVBSQSbbxnF1gFAadJY3VVPVJ5S5/+FDV8
 cI2LsTU/DL+T770mE8ZDi0aI4WVh1QT1skZZhH4WH1Vy5Sg/Kr45OY0y2+/hZQJAGFjc
 UirdfLzDATJfGO+01XIUv6ybU3wQVxwLjy+mju08P1REq5VnBSZDHMq1ONtK4dYlOCM+
 fa9w==
X-Gm-Message-State: ANoB5pnEp/O24HclXTgiX2brfocXrzBlhfo27FmnAQEUtPabFaoHRQCM
 l6SUN3x5ZSydSY942RQN6f7sJDdC0HCNy/0gwC3QCcjhI0E0K0y1e0sL1usXOEHD1K17JKDHYZe
 FH9Ari59dDq1v7iw=
X-Received: by 2002:a05:6402:28b0:b0:458:c66a:3664 with SMTP id
 eg48-20020a05640228b000b00458c66a3664mr10935110edb.79.1668433782630; 
 Mon, 14 Nov 2022 05:49:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7cctgHw2+obqmBfamc6pL6b0yKfSaFF4CsCyH/KPQcbwNWxWANgj9SHIcwC22XkgEpM2jttQ==
X-Received: by 2002:a05:6402:28b0:b0:458:c66a:3664 with SMTP id
 eg48-20020a05640228b000b00458c66a3664mr10935088edb.79.1668433782402; 
 Mon, 14 Nov 2022 05:49:42 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 fg15-20020a1709069c4f00b0078d4ee47c82sm4161198ejc.129.2022.11.14.05.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 05:49:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] capstone: use <capstone/capstone.h> instead of
 <capstone.h>
Date: Mon, 14 Nov 2022 14:49:39 +0100
Message-Id: <20221114134939.18365-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
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


