Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA55514BB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 11:49:14 +0200 (CEST)
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3E1y-0004n6-2U
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 05:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3Dnu-0002rU-Cw
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3Dnr-0008Nm-7V
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655717678;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=slsr4kT8Ozxx6P6YK+0k2YSx/TKUwKWUxHhgV8Kqgrw=;
 b=DSTlR6HNk+7ppyHBEw1aXrw46bEFLkNN3xbKJrkaYqqRLhWdt4evIQgt/KjGOIecj5f+cO
 rasq3Twcab168iSLNJQDeqmiprzcC+xJ58GaP7Q+LBw9Rsja+5E+41yIMj4FWHupqLqbdg
 1Z25FbT5x7ibTZGadY7cghu9iCed90s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-iLBY9Rv6Pc2cwTwF7iLm0g-1; Mon, 20 Jun 2022 05:34:36 -0400
X-MC-Unique: iLBY9Rv6Pc2cwTwF7iLm0g-1
Received: by mail-wm1-f69.google.com with SMTP id
 k15-20020a7bc40f000000b0039c4b7f7d09so4781582wmi.8
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 02:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=slsr4kT8Ozxx6P6YK+0k2YSx/TKUwKWUxHhgV8Kqgrw=;
 b=l+Pfukg+LBoTO3WZHCMz21C3vhM88bZd2pY5SlmlGduCKbx5sQaCVkWkqVX0vEYiDp
 zmRYJz89i9jmxvu8gEhJdQnGV1FKi7Z0sUsV82jMrEq0WNZRMubpLbqj+gqKcn+F5iCg
 RBKxK8RWpQPDqX83skHAlgx3tfzARRd7gwOjkTXPFMiwkGL6BkkMfiGtOE55Ohdmz5xk
 0PmH4zH9Ug5W1x7sd1SxHq9yt4ZCs35+iMzcq+kZK6cpYdr24tbkAPEN4JanB8mO8kvN
 6epxNSi6KOEu8Z4ZLNrAARaQvOKXBivRLQ0qyCKcHMlBUGJzdMQpWSFWocE1bWp8fh5p
 EPxw==
X-Gm-Message-State: AJIora++1yCFhhqNci7+wc1ItKgiRjwi3FbsmRorrXQyWYQLgNiXBwnG
 Q9SnDJx0ouAjd2K8cFdtvL9iRkcpYdC1zwFSYRqwlvqOruhzyBxJ22zIEgT51eqE6Z1azqHVKxR
 WQAQUwyyxjEEVPqU=
X-Received: by 2002:a05:6000:1e0a:b0:210:32e1:3b03 with SMTP id
 bj10-20020a0560001e0a00b0021032e13b03mr23103484wrb.642.1655717675594; 
 Mon, 20 Jun 2022 02:34:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tfecJjp7Zl+y9RHgOA9dlh8nyTS9EzZQ29mLjSlsp466N+ZzKrQpXW3tRjZkMdUDYpjv48oQ==
X-Received: by 2002:a05:6000:1e0a:b0:210:32e1:3b03 with SMTP id
 bj10-20020a0560001e0a00b0021032e13b03mr23103460wrb.642.1655717675380; 
 Mon, 20 Jun 2022 02:34:35 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 t9-20020adfe109000000b0021018642ff8sm12844099wrz.76.2022.06.20.02.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 02:34:34 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David
 Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Peter Xu <peterx@redhat.com>,  =?utf-8?B?5b6Q6Zev?=
 <xuchuangxclwt@bytedance.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v4 4/4] migration: Change zero_copy_send from migration
 parameter to migration capability
In-Reply-To: <20220620053944.257547-5-leobras@redhat.com> (Leonardo Bras's
 message of "Mon, 20 Jun 2022 02:39:45 -0300")
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-5-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 11:34:33 +0200
Message-ID: <87sfnz4r12.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras <leobras@redhat.com> wrote:
> When originally implemented, zero_copy_send was designed as a Migration
> paramenter.
>
> But taking into account how is that supposed to work, and how
> the difference between a capability and a parameter, it only makes sense
> that zero-copy-send would work better as a capability.
>
> Taking into account how recently the change got merged, it was decided
> that it's still time to make it right, and convert zero_copy_send into
> a Migration capability.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


Note to myself: I would really love not to have to write so much
boilerplate code each time that we want to add a parameter/capability.

Adding the name, the documentation, and the check to set it up should be
all that be necesary.

A parameter needs to be defined twiced in qapi, 6 times in migration.c
and another one in hmp.  Capabilities are a better, but still room to improvement.

Later, Juan.


