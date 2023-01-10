Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6366647C1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:55:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHRV-0004BZ-Be; Tue, 10 Jan 2023 11:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFHRQ-00049i-TE
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:25:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFHRP-0001Zl-GN
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673367934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=cPXojRBqzzLTGFJD7Bg1K/zwKygf3kVulA+EHuV4xUtf89RE3CLqf5VmH8bgdNt/eib1a4
 KB3GMdu058r5YL7/EXfKt+goyce7IJb2flt+l85hbDTxa+Y0z0vAbwTj5IwQb+nYg2ftih
 b33osNQwMJREXUboZwukEahJVtHSbGY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-464-nf2qeIbJM0242kW1zOHOFA-1; Tue, 10 Jan 2023 11:25:33 -0500
X-MC-Unique: nf2qeIbJM0242kW1zOHOFA-1
Received: by mail-wr1-f71.google.com with SMTP id
 t2-20020adfa2c2000000b002bbdae91832so1664285wra.21
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=3qEWZgkjuEhTGrJ41y/BwJyWlUlDkLY4X7U3J/LTsFfcPmPctCWhYsIbqjk+dvic2x
 DjK8mKq+cDBBJ9mR5+7frgCsyfdt5fMGv2ySFnWNU1OS3cMEv9iU1bvjrXlBaXODNJr1
 DdlZ8Jiib9lflqpNuKe+tYR4UUOXVSmkxxGPFs5mIv0IbaqcOYo/VJLmU89OnVr5MlOh
 +O8cp76eWILW/oY+3QyGu9e/8PD3sq20dR48X9zDhj0TSWqdggRBal1pFXlPvsyUgB0C
 DmvTSf63oOMys6zWy4RVqNDEL45gbWDKyGPmr3mED934+ONV3Wm0aF4CkKrp94d2aHpl
 8MJQ==
X-Gm-Message-State: AFqh2kr+WL26rZXa68nqti1R0GHQQ3ObQfUfV4hLW4HthzudnfmsWbfy
 gxk82p7JfU7hvbR/ll5gStHXtNX3zFEUTQYL54sC5ejJ/flzxepxf2V8n7fLqNQ5NwJA2EZnYdy
 fQz1XKXBQRIV32TA=
X-Received: by 2002:a05:600c:3b87:b0:3d2:813:138a with SMTP id
 n7-20020a05600c3b8700b003d20813138amr53442010wms.35.1673367932387; 
 Tue, 10 Jan 2023 08:25:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvjlqi+rjCj9DlJUiw4iIE2EICen3YLF/Bw0TrXan45x6b+VEK6VkYB5ZB7vl5M7LlDfUWbvg==
X-Received: by 2002:a05:600c:3b87:b0:3d2:813:138a with SMTP id
 n7-20020a05600c3b8700b003d20813138amr53442003wms.35.1673367932216; 
 Tue, 10 Jan 2023 08:25:32 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 az20-20020a05600c601400b003d96bdddd3dsm15954078wmb.15.2023.01.10.08.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:25:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] Makefile: allow 'make uninstall'
Date: Tue, 10 Jan 2023 17:25:29 +0100
Message-Id: <20230110162529.343145-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110151318.24462-1-peter.maydell@linaro.org>
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


