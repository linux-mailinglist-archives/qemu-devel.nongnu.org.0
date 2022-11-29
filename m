Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E7463CC0D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 00:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0AUm-0006Eq-8d; Tue, 29 Nov 2022 18:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0AUk-0006Eh-Qf
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 18:58:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0AUh-0003np-FO
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 18:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669766310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmXCpEAQJTqOgxR0jLQTlaFTXSmpaJL5jYx3LVCHtWw=;
 b=Sp8MFNC/OagAlzCutbe29ds1Flh437vQY4JsHgyBNLez93sv9RZlXLVcZs1iCe0zf7pvTy
 AvsMPf9yy7fpVz7Tz8QD0DDyy7U40YrXXJO5+i4DKgJ2ufIlBq4Zu3TpRg8j3/+URHDE2s
 j7oB+iLWhPWt05S7cvSFI+/LQPYqads=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-Qhrfsk-uPHeDS4_975NUBg-1; Tue, 29 Nov 2022 18:58:28 -0500
X-MC-Unique: Qhrfsk-uPHeDS4_975NUBg-1
Received: by mail-qv1-f70.google.com with SMTP id
 u15-20020a0cec8f000000b004c704e015f7so11805151qvo.1
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 15:58:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pmXCpEAQJTqOgxR0jLQTlaFTXSmpaJL5jYx3LVCHtWw=;
 b=qCkLKRJ1SPJc2q45cv4ZaDln1uTFsms1+tn2brugJtY751iJrJk0Zqq7EWDT47tVmI
 kZaGDL2cbC0CqdXz1PziEXd3/47lN5YqcpfGztPPnUf76w8/Gk13jZEox28zF/jQ3CfX
 ymiD9s0NuffdXzUU3d05jOGbbEz9PplOjodMKhHuLkLXhUkoIdPoVlK0NRseGcywlIhS
 Nirou02U0ypJPWGUklOvfhx23vc7iX3boDcB4ai+ixWhEPaBgSwgAxZmsfmTkaQOQ6+6
 ZVVXbIHXW71zeFuP7Wpac6xNr/MchQwcELGrsRgPlBKwXC3fItGmVx1QGJym9+Gbc23c
 cG+A==
X-Gm-Message-State: ANoB5pkUHZbKbknp/XyAsV8XBEuuDLfqQ0bl3kEmaM5ZSXqEOTj6tvYe
 dWhrazeHpsnD6dAOXq4FDfsNqZ2dQ97VBruYi4VYt5fHSNWGH/esA+ofMXhLMPKMkc5gb+OxpII
 izF+pEw4VaCjhMq4=
X-Received: by 2002:a05:6214:5c81:b0:4c6:d189:8d62 with SMTP id
 lj1-20020a0562145c8100b004c6d1898d62mr29569059qvb.16.1669766308255; 
 Tue, 29 Nov 2022 15:58:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4YLSC8rJPHfl587cAiYAjdHdTttzrQw97EPHE3fwn0dJKK8ypKJ17FYPcXP6F33Fnfs/O2bQ==
X-Received: by 2002:a05:6214:5c81:b0:4c6:d189:8d62 with SMTP id
 lj1-20020a0562145c8100b004c6d1898d62mr29569046qvb.16.1669766308028; 
 Tue, 29 Nov 2022 15:58:28 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 f30-20020a05622a1a1e00b0039ccbf75f92sm9574636qtb.11.2022.11.29.15.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 15:58:27 -0800 (PST)
Date: Tue, 29 Nov 2022 18:58:26 -0500
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 05/11] qapi/migration: Introduce vcpu-dirty-limit
 parameters
Message-ID: <Y4acotnvjWHjcs/s@x1n>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <3fe7b2324c350b65f2a6fe6e4c585e9de5402e0c.1669047366.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fe7b2324c350b65f2a6fe6e4c585e9de5402e0c.1669047366.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Mon, Nov 21, 2022 at 11:26:37AM -0500, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce "vcpu-dirty-limit" migration parameter used
> to limit dirty page rate during live migration.
> 
> "vcpu-dirty-limit" and "x-vcpu-dirty-limit-period" are
> two dirty-limit-related migration parameters, which can
> be set before and during live migration by qmp
> migrate-set-parameters.
> 
> This two parameters are used to help implement the dirty
> page rate limit algo of migration.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


