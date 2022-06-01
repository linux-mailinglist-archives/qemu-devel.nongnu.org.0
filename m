Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417153A1EB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 12:07:15 +0200 (CEST)
Received: from localhost ([::1]:52766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwLFy-0004yB-Ct
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 06:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nwLAo-0000X9-M9
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:01:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nwLAm-0004jf-PS
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654077712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIG8bMhXqTqs0NjJNq80PgU/0+dWMLSGWLfEwYzevpU=;
 b=bBJKXyKkJZgpJYPkw9hDYba6pisPKHJ0OrXYWVNwlWu3ikRX4XHbD5d5jTEHS/mT/avU+t
 D6yK3IDh7r4jo74721R7r7UgOVA03grEMMvn05tGR1w7ShG4qDCbhEEoFiDcDNvzVRmuQl
 c1ApRqL4wrGPmSXPJSk/0nCq1aC/YDU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-ugAQaoHgOc2CtBgi0462bQ-1; Wed, 01 Jun 2022 06:01:50 -0400
X-MC-Unique: ugAQaoHgOc2CtBgi0462bQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 eh10-20020a0564020f8a00b0042dd9bf7c57so901993edb.17
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 03:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bIG8bMhXqTqs0NjJNq80PgU/0+dWMLSGWLfEwYzevpU=;
 b=MgRaB5oAlb5Kg3r/jITHDXx9BcVqHLNR2NU640VSd6kI4Y8AoDrBjnhKWC0TAU+Imr
 Lvo7xk7OQaJq+LgG8YWoq3o2KzPPTpXUlO8G8ArkX2e47Yj9YY+wG5hGe+7Qk3CjAS2R
 aiYORW58Nyb2we1UDl9zHoe35OiMV8wv+FhqRJCgVi5Fi4KgbcfI8KjCRVTtgF9vfQ8N
 jDLb/LLtFVEM0gN7uFOOAjK9WA2wqiOhsIVE6trqx4BW5nY7KG2+kCKDZ0XQZvTj1rco
 Lx7RTXAC0AryZ3DakaL+CvDXHZQtTT1nzl/0NM8nQuH0tJfQcJIFz9ryi3ugOi28WgHl
 n9hw==
X-Gm-Message-State: AOAM531mrBijdjMyhChLervMcsDYmvZC+6sdEB2o61i/nFRfPNr6YtKG
 TVmndx1ctcADOuXjlBhyEkMdo6tp26v8fijI2QbD5HrxPOiU1wVwMHDNhRaDfXh6NAOzAA+wWM4
 hMM8YL79dm5RKyLA=
X-Received: by 2002:a17:907:8a01:b0:6ff:3eab:9dfa with SMTP id
 sc1-20020a1709078a0100b006ff3eab9dfamr20888260ejc.467.1654077709570; 
 Wed, 01 Jun 2022 03:01:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS1ZKN7BHBKxf9WO/D0TfEtGsddouJ6RGycZNdwq4aQZOy0MKgvLz3icOWsnKvb1a4e3rQ+w==
X-Received: by 2002:a17:907:8a01:b0:6ff:3eab:9dfa with SMTP id
 sc1-20020a1709078a0100b006ff3eab9dfamr20888142ejc.467.1654077708092; 
 Wed, 01 Jun 2022 03:01:48 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 o9-20020a170906600900b006fec8e5b8a9sm519501ejj.152.2022.06.01.03.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 03:01:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/Makefile.include: Fix 'make check-help' output
Date: Wed,  1 Jun 2022 12:01:10 +0200
Message-Id: <20220601100109.974137-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <165366545439.6869.11633009118019728798.stgit@work>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +	@echo " $(MAKE) check-report.junit.xml Generates an aggregated TAP test report"

XML now rather than TAP; tweaked and queued, thanks.

Paolo



