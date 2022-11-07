Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52FA620295
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:49:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAvT-0006wo-2F; Mon, 07 Nov 2022 17:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAvP-0006qf-8U
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAvN-0001ix-M9
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cmk3N2TkEM2NEWtSgSN/BkMeJ3tFoPM9dpA0sZODk+E=;
 b=ZQFJtX+nj/FSR7wSUiowRgIB/W+pgVxiEDfU//OP1h2SgCpV8N2V9rYr045RWcJmSRUEP2
 lQnmHHRxv71QjQHdecDdeiNvqeXkaC3bDaKBM79H8SQRP7dCzPOpmf0UrMwTnpR8dfOkYL
 g+4YBlPuvThkjta7yyXcwrINn4/pbus=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-g8-Sin7ZO2mP3pY4T1bo9w-1; Mon, 07 Nov 2022 17:48:59 -0500
X-MC-Unique: g8-Sin7ZO2mP3pY4T1bo9w-1
Received: by mail-qt1-f199.google.com with SMTP id
 ay12-20020a05622a228c00b003a52bd33749so9021326qtb.8
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cmk3N2TkEM2NEWtSgSN/BkMeJ3tFoPM9dpA0sZODk+E=;
 b=NMNprZT7RUTBPzCXqeYALD24LlrvsMMbVvi6slxd7XV0b2ur1zNd/Zku4ZnoyrSp1k
 nbvhA6Hpg7uipfB2Pyfk0sK0/1fJgT3OmUCWmBWfAjX1ZloioXjAX3IcshwGJjwxa9At
 xnmtNVx5vPztZQrdLFJuBeUvXm4VMYTRD1bLyB7Tufg1ByhA+H7eGA5SQK+5Cslo2auM
 TnWyVdHiY/1/EW/xWaePyi1p6j7SBcRyiobp6tJIOpNVF2zNKkReAZb7NE0iCBHzwdbT
 1+mV7fJec+dbHBjuYVe97HuKtSoCkQbsRIHmTBI8YBHxUh8lHSzj06B+BmJxD4svHno7
 tJRg==
X-Gm-Message-State: ACrzQf1Yrkdyd/67xGy8Ki+ECwJLJo7YskFRdJdXS+jKusA/MNFBXdYw
 PYcv6EKx+qYMeuTC/3FsrHFY159TwmF7qjzVymdLtV/RRsUR5vJbQ3SBokb/zakd6zg9mM5kQNe
 rJZMj7TlqTb3zf3b2WNZfWuxo6UUyvVxkL/PEK8KrfAGc+MwVrITOW6TreupA
X-Received: by 2002:a05:6214:4109:b0:4bb:e8dd:9fa5 with SMTP id
 kc9-20020a056214410900b004bbe8dd9fa5mr41577272qvb.118.1667861339199; 
 Mon, 07 Nov 2022 14:48:59 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5Nl6vlsoPcStHV85IB8ShmguqCD5Tot/EK0N+lXmETy7FGYCJHFhHShyl4AgvQiGJ/jpxEnA==
X-Received: by 2002:a05:6214:4109:b0:4bb:e8dd:9fa5 with SMTP id
 kc9-20020a056214410900b004bbe8dd9fa5mr41577245qvb.118.1667861338896; 
 Mon, 07 Nov 2022 14:48:58 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 bk26-20020a05620a1a1a00b006f1187ca494sm7809732qkb.28.2022.11.07.14.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:48:58 -0800 (PST)
Date: Mon, 7 Nov 2022 17:48:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v4 16/83] MAINTAINERS: add myself as the maintainer for acpi
 biosbits avocado tests
Message-ID: <20221107224600.934080-17-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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

From: Ani Sinha <ani@anisinha.ca>

I wrote the biosbits avocado tests for testing QEMU's ACPI/SMBIOS implementation
and all the related changes including fixes in biosbits software itself. Making
myself as the maintainer for QEMU's biosbits related files and test scripts.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221021095108.104843-8-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4adf8c65db..07df572adf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1862,6 +1862,13 @@ S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
+ACPI/AVOCADO/BIOSBITS
+M: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: tests/avocado/acpi-bits/*
+F: tests/avocado/acpi-bits.py
+F: docs/devel/acpi-bits.rst
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
MST


