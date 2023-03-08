Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C23C6AFBD4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiLB-0000yx-Is; Tue, 07 Mar 2023 20:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiL9-0000xo-Um
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiL8-0001YX-6z
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rChHAev6adIa0o9WmxAEYbKw6MUNz8l/c+RQN4k0e3Y=;
 b=gZ5ZHyfo7dXCci4jWUhS8jozduTidna6S1hVp8WQplFAQ06TlzMzKLKw2fMGkLpxmQFrTp
 prmtrSVIR3YB4crB5txZGLkyB2OjvNgllnrtV4+XBsB5DB3FLJ581tyceoExL1kY5tttwu
 reVZmwJ1SKz7kqEXXjAf5Yd/vO9WzSk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-W1hz64XUO2WdVHLGg_mYqw-1; Tue, 07 Mar 2023 20:11:32 -0500
X-MC-Unique: W1hz64XUO2WdVHLGg_mYqw-1
Received: by mail-ed1-f69.google.com with SMTP id
 ee15-20020a056402290f00b004f059728d91so4492288edb.23
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rChHAev6adIa0o9WmxAEYbKw6MUNz8l/c+RQN4k0e3Y=;
 b=jJ7cyhenDjq85Uiie3d61L//nP4QbS8YKyohSbVnHyk1DIgqaCRkZJYMOGf1uupmDZ
 nqjUmBs9vqiT8XTz4qDq1KJNmQJ4yV6y0e/2oyBIgGQ8OvU6qO24Zi3+PnMmuGii0kBt
 gUs3QxzmTv18EywueKOfmC+hljZ/mMGF0twU/3yl2Lh6RK1tpzO1KstfnBChhY+MGQ89
 aWp4NPeTPoeWwgNu51ozm2TvDK0d+ex820QYaz77mQzXBalqtFlhnIE/XkZ0wRzStCyo
 SFrq/z2lqflJLU0JlT4+mMWE2xggp0IGhwTxiw7GcTjpWkZ/bDYDeUG9WMoG5HO4IqtT
 wogQ==
X-Gm-Message-State: AO0yUKW7xQ6mbMA38j3hMee3UDiqkmU/H2GfMWAQ6jfQP7+Y1K9LRjPB
 5esOID+j+IvZUH1sf7D425YS+jIvUgYSD51TqbvEZqouDlABct1tPvWSQ+6lS5yRB8WskZlACt6
 ujzQLFtQyd6r6Sb65ZcQ9JoN/e2k38smEozmSTJdzUORUnc6ulBCjS5G2hzeUJefcKM9z
X-Received: by 2002:a17:906:7948:b0:8b2:37b5:cc4 with SMTP id
 l8-20020a170906794800b008b237b50cc4mr24407444ejo.7.1678237890805; 
 Tue, 07 Mar 2023 17:11:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/+xhnQ33SWH86S5czY3dMKejwDs1TCS57fwnu63mzAB1oabhPHy1lPjKVzr/pHkMIM4yJSxA==
X-Received: by 2002:a17:906:7948:b0:8b2:37b5:cc4 with SMTP id
 l8-20020a170906794800b008b237b50cc4mr24407418ejo.7.1678237890430; 
 Tue, 07 Mar 2023 17:11:30 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 d6-20020a1709064c4600b008eb5b085075sm6681877ejw.122.2023.03.07.17.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:29 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>, Gonglei <arei.gonglei@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 12/73] MAINTAINERS: add myself as the maintainer for cryptodev
Message-ID: <2133e07c4ca1d0befa382e557d2f6b38c77ed689.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: zhenwei pi <pizhenwei@bytedance.com>

I developed the akcipher service, QoS setting, QMP/HMP commands and
statistics accounting for crypto device. Making myself as the
maintainer for QEMU's cryptodev.

Cc: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20230301105847.253084-13-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cbb05de8eb..72ac2ac4b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2876,6 +2876,7 @@ T: git https://gitlab.com/ehabkost/qemu.git machine-next
 
 Cryptodev Backends
 M: Gonglei <arei.gonglei@huawei.com>
+M: zhenwei pi <pizhenwei@bytedance.com>
 S: Maintained
 F: include/sysemu/cryptodev*.h
 F: backends/cryptodev*.c
-- 
MST


