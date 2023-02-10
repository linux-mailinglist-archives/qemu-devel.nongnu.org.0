Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FF5691F50
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:48:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQSpC-0008J2-Gh; Fri, 10 Feb 2023 07:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQSp9-0008IB-MS
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:48:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQSp8-0005fe-9c
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676033297;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=BcXYJH3i+y1TT/U2nZy+Ny3ldVGLyUDD1mxU7KuZFDk=;
 b=FsUAvOq2fbkvNTH3oUm76v9Raxo74PCPJnD7bgELx6S59e3jmFJGlQWKparXrh2vQPhBT+
 3JbVoqOa9R6fpZmSTjuHtAii0SVTZ6hrhhUpHt1K442fePyWjFYjoRhc/rffLub+pt2alL
 mxLz0liEGb347EboHQw6wv+xTfA+rnQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-186-CL85OYcEMUmdV3nkdxxzDQ-1; Fri, 10 Feb 2023 07:48:15 -0500
X-MC-Unique: CL85OYcEMUmdV3nkdxxzDQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r14-20020a05600c35ce00b003e10bfcd160so2514242wmq.6
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 04:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BcXYJH3i+y1TT/U2nZy+Ny3ldVGLyUDD1mxU7KuZFDk=;
 b=Yj0lUyf3+6ZBv0tXN1TE8zcuZFG0g2z3VGm+fgenNbVXMUD+Dl00se1XULbcuIP4mc
 I8MfNSc0KaVXFGAVbUHnedJbR7rCtOHaQtxZD+B4Dc1pAczZEetsl2Hj13o9eCz2g+ET
 CyXfLSU/Eoyaea0U9DxYRtfQn/t7Mu9YdbyVLW8hSWXSKmvlh/b9y7jKUa4h1UY1k2CB
 ZGaxlBmpxm9XkZYWtf/2+lf+VP89ie9cSFLKzbzl2oUYCzLLQ/2QLlfXXsEe1k6iS0eM
 MYO3VQINlJ+SYQ6lntdYC6nW37EoMwS95JUZCe2UQVOGCkaa++yZpnnJ+JYfpdy0ln49
 FVMw==
X-Gm-Message-State: AO0yUKUbo1MH+zjNZwnjXAaewbZQgqZmfx70Ko7g3x7cu6Dxu/MR46TY
 5E9ITtWUGuyULQ2RasZQXJef8cgQB8tvs66ohcOG9d5Y7tIoPmyvsYG2mClXHLOrnO3DxeQUh5f
 4BjDOB82UPw1+rIcWbc65t7k=
X-Received: by 2002:adf:e3c4:0:b0:2c5:4ad6:b929 with SMTP id
 k4-20020adfe3c4000000b002c54ad6b929mr1545660wrm.18.1676033294439; 
 Fri, 10 Feb 2023 04:48:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+R4u9i2CS7LTqhtt7k3xpBy3+Wl12eGfLFXNKehPFQ8YEi6t0KsAYDMFuw/3Xeqz0WdAyItQ==
X-Received: by 2002:adf:e3c4:0:b0:2c5:4ad6:b929 with SMTP id
 k4-20020adfe3c4000000b002c54ad6b929mr1545649wrm.18.1676033294252; 
 Fri, 10 Feb 2023 04:48:14 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfdfcc000000b002c3ebbc9248sm3517649wrn.66.2023.02.10.04.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 04:48:13 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v1 2/4] migration/multifd: Remove unnecessary assignment
 on multifd_load_cleanup()
In-Reply-To: <20230210063630.532185-2-leobras@redhat.com> (Leonardo Bras's
 message of "Fri, 10 Feb 2023 03:36:29 -0300")
References: <20230210063630.532185-1-leobras@redhat.com>
 <20230210063630.532185-2-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 10 Feb 2023 13:48:12 +0100
Message-ID: <87o7q1hek3.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Leonardo Bras <leobras@redhat.com> wrote:
> Before assigning "p->quit = true" for every multifd channel,
> multifd_load_cleanup() will call multifd_recv_terminate_threads() which
> already does the same assignment, while protected by a mutex.
>
> So there is no point doing the same assignment again.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

good catch


