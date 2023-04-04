Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F156D6591
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:39:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhoB-00010V-TR; Tue, 04 Apr 2023 10:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjhoA-0000zy-45
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjho8-0006iM-Li
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680619127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JXeBvuq8iwtDqI8lEux+3cVms010qw8ZyvGL6ZOsGMY=;
 b=Bcl+J16+rKjY8gbF6h9dnZqKcMoYEMdHqZ9h+8StIWupnERDsfKwCrRqhCJ7UNrHGt/IfE
 xRqMsDrGc8TX8G1xYLCVA1JI4nP8qHB4TnB8XJlG8DQ07E6M7sD1A0/SS7h8Vq/NrZPlWC
 nBWtIh0xsbmzFKrSp7To/SEgbovrpKo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-y2i6FR1HN9meICOKy3WZtA-1; Tue, 04 Apr 2023 10:38:45 -0400
X-MC-Unique: y2i6FR1HN9meICOKy3WZtA-1
Received: by mail-qv1-f72.google.com with SMTP id
 pe26-20020a056214495a00b005df3eac4c0bso11597204qvb.1
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680619125; x=1683211125;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXeBvuq8iwtDqI8lEux+3cVms010qw8ZyvGL6ZOsGMY=;
 b=JWC41vDpYOHovXExM0vLj/TmKAHW0pyBrgQatzwzePaGr74GIS43XfELatwJUGNNiX
 E89mldUFpJ/R953r8pqcCYgfSfZaFsofZp+LlRFS6xhaccP760c03jzeQHo+YqAzUtRB
 MN+ESH29ePuy2qzbI6RxN6wOb6ccTBSCTgA5gslefPL40KPxzKT4QVPSV1rK8y9asCgT
 KQ6vICTcVAdd+0U2MY3lmATxq/vrRxOkyhOH1QxkaBXWOFMzjnMqDHDyRLoDYqV8LmMB
 xmT48JVQL9B4iXG1cS0O+fQXzLUoCoNqeqDlka6dCBN2KxUPMPT8nWOpmW2aGuavVR2T
 PrKA==
X-Gm-Message-State: AAQBX9f/L+Z7ftxjsW5KG797sVokw+qR/z3KkspgQgMDdPoYpFySt2aN
 Cm002of4dXAlFHU8Uz2zTe+xXHhevolcIHlmf2bVOyiMl5uz7PlUqpNy8j79z7Vlp7k0iYGYRk/
 fjQKXht5jpir9XCs=
X-Received: by 2002:ac8:5949:0:b0:3dc:483f:9c82 with SMTP id
 9-20020ac85949000000b003dc483f9c82mr547235qtz.0.1680619124825; 
 Tue, 04 Apr 2023 07:38:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z20+FTjYWtSLNvBw9xN4pEYJnatIaCR9djNXzdVVAbNX9MiZBgYVYvTxRfBsfwTmnoEHpvQg==
X-Received: by 2002:ac8:5949:0:b0:3dc:483f:9c82 with SMTP id
 9-20020ac85949000000b003dc483f9c82mr547212qtz.0.1680619124602; 
 Tue, 04 Apr 2023 07:38:44 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 dt8-20020a05620a478800b00748461ac012sm3612119qkb.63.2023.04.04.07.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:38:44 -0700 (PDT)
Date: Tue, 4 Apr 2023 10:38:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-8.0 v2 1/2] qtest/migration-test.c: Add tests with
 compress enabled
Message-ID: <ZCw2bUQy1qR6qNcM@x1n>
References: <2f4abb67cf5f3e1591b2666676462a93bdd20bbc.1680618040.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2f4abb67cf5f3e1591b2666676462a93bdd20bbc.1680618040.git.lukasstraub2@web.de>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Tue, Apr 04, 2023 at 02:35:27PM +0000, Lukas Straub wrote:
> There has never been tests for migration with compress enabled.
> 
> Add suitable tests, testing with compress-wait-thread = false
> too.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


