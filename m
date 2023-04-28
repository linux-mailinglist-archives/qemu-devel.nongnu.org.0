Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1886F171F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:04:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psMom-0002Ah-Pt; Fri, 28 Apr 2023 08:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psMoe-00029G-Aw
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:03:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psMoc-0001ju-MP
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682683385;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xj1YGGgujVZ2dovPDVRFhcEMqW0xAjkGqJsBnipDZ/4=;
 b=XCoA+rOJwUWbW9JK+CKbOOmhayWq1kBEglRidyaKkMWUodw9iwNKe4pTayO1u9otGvmqNL
 hnrFlUgv06RVHYcRdDsEbJ877nwtCuOQUFzsXjedRkbFmBmouXUPYY6JGMrWRm2R0/BUf0
 DcL0f8zucWjqGX+C5ZWgx5nFc6gUFNk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-fonFcF3SOzKD0E2XN_Km4Q-1; Fri, 28 Apr 2023 08:03:03 -0400
X-MC-Unique: fonFcF3SOzKD0E2XN_Km4Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f175a24fd1so57176355e9.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 05:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682683382; x=1685275382;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xj1YGGgujVZ2dovPDVRFhcEMqW0xAjkGqJsBnipDZ/4=;
 b=i4FRSIVh/89t0Nmlncqib6d84Ha/7u/P5NaA0cCLSVes/TW9ok14+OP8t1oVDswxQq
 gd4IRD/ARhdO+urHeJow3Of7o0RgH9jkO2jaZ7vYXjQt5W1Dob65nP66JfU6XLoLa8Z2
 /r46M7i0TqragwheyD7cIjodX1837v+uJ7m2z45bSogk3ezNCo0TfUSvXELr5sJAx1/y
 qD1GHo+YI341LOkiRdkpQZal7hBnGdlBGXBu8tDYV/brwLVGYNelKurRQ4dfbAq78lV8
 9agWKfoxnuEcatZQwn0qkpwg6jOduLB5kGYo0+lG6kD3JMaMagj7C8pgIQQMtDHJ9Gu6
 +rTw==
X-Gm-Message-State: AC+VfDzMQpeZFxme+tMa4lToXHFVmtLjuj/iTgx170En7L4vUscIf110
 hAxFb0qpOJupGk/hMjB20d0aAbs86trXYFQ5mzeZuwLZHLZCzTXv+PL07M6rH8OM5cZGVuyJ4zF
 aj66eoytjk82ZjLU=
X-Received: by 2002:a05:600c:2309:b0:3ea:f73e:9d8a with SMTP id
 9-20020a05600c230900b003eaf73e9d8amr3856904wmo.30.1682683382037; 
 Fri, 28 Apr 2023 05:03:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61ynMAPa6bX8vp2oHhRKolEURW6GmVXLBVV9MPLu9ZT+oNZOnlOC3ZhQaCJbyDeTHsibtn5Q==
X-Received: by 2002:a05:600c:2309:b0:3ea:f73e:9d8a with SMTP id
 9-20020a05600c230900b003eaf73e9d8amr3856886wmo.30.1682683381704; 
 Fri, 28 Apr 2023 05:03:01 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003f173a2b2f6sm27940894wmo.12.2023.04.28.05.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 05:03:00 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 05/13] ram.c: Do not call save_page_header() from
 compress threads
In-Reply-To: <11f3eccee34665a352dd2917c5a662dab8ad528f.1681983401.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Thu, 20 Apr 2023 11:48:06 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <11f3eccee34665a352dd2917c5a662dab8ad528f.1681983401.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 14:02:56 +0200
Message-ID: <87o7n8b4en.fsf@secure.mitica>
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
> save_page_header() accesses several global variables, so calling it
> from multiple threads is pretty ugly.
>
> Instead, call save_page_header() before writing out the compressed
> data from the compress buffer to the migration stream.
>
> This also makes the core compress code more independend from ram.c.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>


