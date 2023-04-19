Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9706E81F4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 21:35:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppDZD-0002XU-O8; Wed, 19 Apr 2023 15:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppDZC-0002Vv-JT
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:34:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppDZA-0001ua-SV
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681932846;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=rlh7Zh+RRDPxzZ0DBskEB6VStLUyZLjCLbLrq8hPHu0=;
 b=DmGF2B+dopHzrtcuftQ1VhIKKGPyqNRj6K/maNgzLiiIfxViqj5MlYH7WcyPMnzkBKiZr/
 2XxYgYGbhmBlTtyRv9Z0PKIIYHeUiqpmKzPOJ2zaCZLhzKewKdocAQYOOa7hT6MdfkTxKJ
 XGcIgURx2CQdHHVuR3c0Hvcq9ssO+OY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-365ixHvhMfOs-lWYZ9QGzA-1; Wed, 19 Apr 2023 15:34:05 -0400
X-MC-Unique: 365ixHvhMfOs-lWYZ9QGzA-1
Received: by mail-wm1-f72.google.com with SMTP id
 hg16-20020a05600c539000b003f09d1918aaso87756wmb.4
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 12:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681932844; x=1684524844;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rlh7Zh+RRDPxzZ0DBskEB6VStLUyZLjCLbLrq8hPHu0=;
 b=iI8JsnyaNhXnSP+cy6CvucejkTR56xi/3bP6LMZI1MHtfD1wdGC+yYmBbhyFEPZJqQ
 FtFhaFPM/+jon2NXufpP+S0clGKc5Rvd9r1zNXWotZAz/L5ZOwCMRL0k4787tfG4r/br
 e5dRac1zNH0PUmWQ5y3j3Dcik+w+Czik70HjVuE2bAmJkVjU+BTKrkqmlJX9EdQIk2E7
 92Xg6y0/KRpsCtBO6SENH0pOjOGgC5if7bqNvufwkZcZIbI+K3dzPxU3rxVUhyzY1TXJ
 IeMdfsEx6YS4AOIp9gv1kn3yv+JuTT4lMsRcWLsOBBph3meKf0OQADRshnNp0FvBmj4K
 78oA==
X-Gm-Message-State: AAQBX9doLsVWemCyte1ek4TQUWXcd/YygMmoQ5DHw2+gNfJVCFDz/iGu
 b3UnTNXPtyLqiFMDQtN5fixZWjmFGmV7EayVpZCwuq/4dtNeYJwAfQoqOfZs5sYL0niHcOPTwSr
 xQ4X4a9/kQiTJ+jE=
X-Received: by 2002:a05:600c:3201:b0:3f1:7b29:ab38 with SMTP id
 r1-20020a05600c320100b003f17b29ab38mr2767949wmp.11.1681932844338; 
 Wed, 19 Apr 2023 12:34:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350YaLCU+nLdlu0plJhV5j5LapJ2fbYwcKIc3bucIBRQwasQyQfRqzVWkq5VUFRf1WXmg0mYqnA==
X-Received: by 2002:a05:600c:3201:b0:3f1:7b29:ab38 with SMTP id
 r1-20020a05600c320100b003f17b29ab38mr2767936wmp.11.1681932844078; 
 Wed, 19 Apr 2023 12:34:04 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 m36-20020a05600c3b2400b003edc4788fa0sm3176064wms.2.2023.04.19.12.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 12:34:03 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Leonardo Bras Soares
 Passos <lsoaresp@redhat.com>,  David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 1/4] util/mmap-alloc: qemu_fd_getfs()
In-Reply-To: <20230419161739.1129988-2-peterx@redhat.com> (Peter Xu's message
 of "Wed, 19 Apr 2023 12:17:36 -0400")
References: <20230419161739.1129988-1-peterx@redhat.com>
 <20230419161739.1129988-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 19 Apr 2023 21:34:02 +0200
Message-ID: <87edof1xat.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Peter Xu <peterx@redhat.com> wrote:
> This new helper fetches file system type for a fd.  Only Linux is
> implemented so far.  Currently only tmpfs and hugetlbfs is defined, but it

s/is/are/

> can grow per need.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

...

> +#include <linux/magic.h>

...

> +    case TMPFS_MAGIC:

...

> +    case HUGETLBFS_MAGIC:

Everybody loves magic, right? O:-)


