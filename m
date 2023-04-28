Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08296F1C67
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:14:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psQjK-00005g-GX; Fri, 28 Apr 2023 12:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psQjG-0008WV-39
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psQj9-0007S7-Rq
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682698422;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vOIcf1FPhigOjU4TaRX6cN3D41yirybZzjalr9g9cK8=;
 b=Mah/BSg+4P2/M0szFZIQFK/bkf4IVi5586KCXf6tUdOyqPah0cRy/mM+ORvIqdghZgyCHW
 Y9E1/wcj2G8pv6ewXWjP4gmVpd1pWBqHfyKFYHPhbG+iM7SMO5X7aVVf7z25/QTdghw6rv
 ZX5/3liR5gpXsiy1WVXdtJombCIqTis=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-qccMY1prPxy3WenHiXiLug-1; Fri, 28 Apr 2023 12:13:40 -0400
X-MC-Unique: qccMY1prPxy3WenHiXiLug-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f32b3835e9so1900625e9.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682698419; x=1685290419;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vOIcf1FPhigOjU4TaRX6cN3D41yirybZzjalr9g9cK8=;
 b=dL4owB6LoM7kFPAVxddaYLB3JZIZn8HRaqBBeZv8ebqDMN9U6OAxh4R3MIHcSQ0Z9N
 oS5cuqu4+4s7IIn9k/Trjbx7eQesdsShMAf/eHm5Vdp2P62j1fcUQMspk6pZlsiXTX87
 YSCux5kbCgY31Q6VzcdFvp+R7z/UwKfqgvl9Imj3w9SJrHgNYEN/XADD2NTubssBQqIM
 SckkLIwiWyqFtSkm2sO+QiWSO7lePJO3rjuy7Z3ozH5FCg5lFkuK+VgdTvi2FC5BuRar
 NLRj3gzDobHmqnsLmdptknb6BErBJxTezdKH+2CoON70acKe//fJu9kw846H+DDXxOzA
 b5pg==
X-Gm-Message-State: AC+VfDwK3a4UuFQUtPI7sYcKAZoeNthT2PvPmNnfxTI2tY26tlAR/upZ
 Z8hoYO1qeeEFgY6Z8OpX++kxdu1211D2Y4v91RfzBx+QQnBMkboOHRhX9wAcdFJtPVkDYImubxB
 4t5+mzbUB3P3lMqE=
X-Received: by 2002:adf:f9c3:0:b0:2cf:e710:a4b9 with SMTP id
 w3-20020adff9c3000000b002cfe710a4b9mr4854001wrr.32.1682698419275; 
 Fri, 28 Apr 2023 09:13:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4BDV5FJAWy3dWnWuCOxt9PVBMAxMuLs0unGOj3t7drv5vh2DriLBlcFPfsQCJZh8Lq9qlhuw==
X-Received: by 2002:adf:f9c3:0:b0:2cf:e710:a4b9 with SMTP id
 w3-20020adff9c3000000b002cfe710a4b9mr4853985wrr.32.1682698419011; 
 Fri, 28 Apr 2023 09:13:39 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 c6-20020a7bc006000000b003f31cb7a203sm4156791wmb.14.2023.04.28.09.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:13:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 08/13] ram.c: Introduce whitespace (squash with next
 patch)
In-Reply-To: <ba5ece76ede6ef45d982b08d223f2a6c22345d27.1681983401.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Thu, 20 Apr 2023 11:48:17 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <ba5ece76ede6ef45d982b08d223f2a6c22345d27.1681983401.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 18:13:37 +0200
Message-ID: <87a5ysassu.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
> Introduce whitespace to make it easier to reroll the series.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

obviously skipped.


