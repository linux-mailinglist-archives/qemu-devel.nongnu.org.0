Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE70B6F1750
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:14:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psMzQ-0007ai-Tc; Fri, 28 Apr 2023 08:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psMzN-0007aG-MP
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:14:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psMzL-0004MV-GF
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682684050;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1hgMlfREkgcYSaTFANcWmH1Kl3Yie23qDMs9f7FvoAU=;
 b=GsCR1ohE91iELiKlqIBFAkmw2brAg29lwl9zQYjRW5n/IRrWaUbDasrizZnV3YVCKaCNl6
 asY2nKo/ukAJsbcFUS73J7YCpYOo7es0TJIQ4G9Z3RMzdrAopKMsiwlmlko6dx7rTBQ/TA
 Z0lrH9daeTH+uOjk3mWQWJT2lXUiBsg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-W4dZ4wT1NFOH2QkeMvj1zw-1; Fri, 28 Apr 2023 08:14:09 -0400
X-MC-Unique: W4dZ4wT1NFOH2QkeMvj1zw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f1793d6363so35257605e9.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 05:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682684048; x=1685276048;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1hgMlfREkgcYSaTFANcWmH1Kl3Yie23qDMs9f7FvoAU=;
 b=NonmRkRTJnpLrvpnxJF4TFCTnk4sjlrTgx1d9dc6eTLngGFKa/+cxpxRSUjhdvA3Wh
 z5zCI1P/PTYAzDiOdfwFnF2YS99EGaLBoAr7Jt0+sh2qSsteCgRxKbYd0iN+bbAZds6Z
 oJ0tnz3GyGMEmL2s8d+Opq0zPg/IlS1YxQSuSf0rwbExOevDZnBpXDFC+Sayp95ELMt/
 OIGSQe2X3t0Rx5IUs6/UBumFt362oq6ep19FnTkOus9JuFuQ9nGN+YjSLtfI/190/Znt
 4c1MiIzLlBrEymIRjlaRe3nFu8Jt0aeGenrZBQ7DXJUYVWtyOWUp+Jez2yrrNUKcQEWS
 7+dA==
X-Gm-Message-State: AC+VfDw9lLFtPxg/Vic4/r/grmUdxI76IUH4c01WMhjJpHSeMveLRKyS
 VjH9ffp+dOBRGfdVcer2TYevyVbLLfIBVeFtKwuvVMnAJX+VjWFgtuMvQ+/dxjdtIEo6fSeQVL9
 29oluSoKDRWstcVsh3RHRY/LTC2kO
X-Received: by 2002:a05:600c:2051:b0:3ed:3d89:1b4b with SMTP id
 p17-20020a05600c205100b003ed3d891b4bmr4520193wmg.8.1682684047819; 
 Fri, 28 Apr 2023 05:14:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Z0pFvOysiohE28ZOE5SmOSGSO+sfRQo0CxbQdyK4z/jI4kNobzU8h4benUz5cfeRUraVGhg==
X-Received: by 2002:a05:600c:2051:b0:3ed:3d89:1b4b with SMTP id
 p17-20020a05600c205100b003ed3d891b4bmr4520175wmg.8.1682684047540; 
 Fri, 28 Apr 2023 05:14:07 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 n12-20020a7bc5cc000000b003f17329f7f2sm24131790wmk.38.2023.04.28.05.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 05:14:06 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 07/13] ram.c: Remove last ram.c dependency from the
 core compress code
In-Reply-To: <5951bf117606dde2183abead9ce34944734042dd.1681983401.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Thu, 20 Apr 2023 11:48:13 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <5951bf117606dde2183abead9ce34944734042dd.1681983401.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 14:14:06 +0200
Message-ID: <87edo4b3w1.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Lukas Straub <lukasstraub2@web.de> wrote:
> Make compression interfaces take send_queued_data() as an argument.
> Remove save_page_use_compression() from flush_compressed_data().
>
> This removes the last ram.c dependency from the core compress code.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>


