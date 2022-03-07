Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5034CF286
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:22:01 +0100 (CET)
Received: from localhost ([::1]:57184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7gu-0005YL-AO
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:22:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7bi-0000SF-1G
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:16:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7bf-0002nu-33
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646637393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abNG5uqwKgOIvA/n7NQb4UU7Vt1oVxXnsSnMoilpr1Q=;
 b=T30wVmeaPMpzr7KO9xDph9wBwofDg5Ori3ufyE6oYuUh5FhKEtqSAITGSA1q8eJN44yoDK
 /bCqXwJ4o9Z7qDYACw8B7eKJZrEG2eGXLf2zvbQ7AXqFuH8w+RhlulYOkcMTcetXNh2fAC
 GIth1RWgM6yeg+bZm7c9bhNlUbhERUw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-q6zeSFLMNBenQ36Oijzs5w-1; Mon, 07 Mar 2022 02:16:32 -0500
X-MC-Unique: q6zeSFLMNBenQ36Oijzs5w-1
Received: by mail-pl1-f197.google.com with SMTP id
 j1-20020a170903028100b0014b1f9e0068so7016951plr.8
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 23:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=abNG5uqwKgOIvA/n7NQb4UU7Vt1oVxXnsSnMoilpr1Q=;
 b=0uimxCViLoYQ8QzDgkdP6ONI4q8QZ7eunsiIxWWUHnjnzfeXFlxfU6VbTi/8uDmONN
 b4+ffx1Iv+pNKt2Md/NkTbu8+9oQnwADDEajjz1euOwieg77ot9X/EbB493PWwYFtlb3
 FhuIJxjWkUYURjdTRL2NFGvVJi3YSnsBfFEgFFgDWTRgnEmvDr5YLX8pU84ZdnrKA8RS
 6/4f3G4Xh6Hev8/LpW0NnEQMz71J6R7AdJrVTHgpj7Wvnz1JxX/R7NZr+av14mZ3KeTw
 AFGiijwhKw3CTmGwTdtAf4lzgWlxwgTVv7hDE8kpOWUtQY04A7bIuzr9NpoKJEv9CM+L
 J2wQ==
X-Gm-Message-State: AOAM532vZJmcsaHwXTvkxycfNL2FSJr9O6YIJo+QbW4CSO10M2lpZsap
 w/lFtv/F+JWIuXiQVT1F/P9nnvObV2kBepQB2Dc6jT6IbYFXaBD/ZB1eI9kTdvXGK2mAFw9NF9t
 gqv/3ZEKSNvlHm+g=
X-Received: by 2002:a05:6a00:301c:b0:4f6:f04e:ca34 with SMTP id
 ay28-20020a056a00301c00b004f6f04eca34mr6221004pfb.19.1646637391555; 
 Sun, 06 Mar 2022 23:16:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwr+OBePlskppSQcmKK+02OEUW3Q3xhZjeNSoJoDIDQdGJbtWlScbJH45NegTEOI0ovpaIMkg==
X-Received: by 2002:a05:6a00:301c:b0:4f6:f04e:ca34 with SMTP id
 ay28-20020a056a00301c00b004f6f04eca34mr6220992pfb.19.1646637391306; 
 Sun, 06 Mar 2022 23:16:31 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 nk11-20020a17090b194b00b001beed2f1046sm15165748pjb.28.2022.03.06.23.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 23:16:31 -0800 (PST)
Date: Mon, 7 Mar 2022 15:16:25 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 08/18] tests: merge code for UNIX and TCP migration
 pre-copy tests
Message-ID: <YiWxSUAcN03DDcR5@xz-m1.local>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-9-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220302174932.2692378-9-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 02, 2022 at 05:49:22PM +0000, Daniel P. Berrangé wrote:
> The test cases differ only in the URI they provide to the migration
> commands, and the ability to set the dirty_ring mode. This code is
> trivially merged into a common helper.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


