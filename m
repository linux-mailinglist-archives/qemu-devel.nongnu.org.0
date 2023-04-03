Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826F36D4600
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:42:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKQN-0000h8-PY; Mon, 03 Apr 2023 09:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pjKQL-0000gT-Dl
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pjKQJ-0003JX-GI
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680529237;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xQ8DAkQAf9/IkFJXvoqvGB85HJQSeD4/CaDOt2stbBc=;
 b=S43UOyiUMBs23+Bs9PYB0gXju6sLjLV42jRH4KJC8DqVGlKMzyBw//kklaWVoJ2m3Q1BF7
 Zfie4ipkeSO7flKR8vgsYhmNeyqmrVB5MheDRwTc1QGocO+/uSsRdO5v9hNN2/4YEMIZrr
 uzFZL22G9Z3tHXLjQVVVwEl9FITsprw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-QYvRKNl4Nc-R9YPzAH36DA-1; Mon, 03 Apr 2023 09:40:36 -0400
X-MC-Unique: QYvRKNl4Nc-R9YPzAH36DA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k25-20020a05600c1c9900b003ef79f2c207so9041616wms.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529235;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQ8DAkQAf9/IkFJXvoqvGB85HJQSeD4/CaDOt2stbBc=;
 b=6mKVc61OH8TiYjfX/uzCsTHGmmyplRHZeCSL6X7sHme+3PbjzHR5FKzLBMqUqASRiU
 ZYHolEoNi0q/aNJyBG1RdbKpyH0WumNpRqApJ1JK82WcnK4ceUHGrh55mn9DRQCurSVH
 AdLbDb+gcjT7nW297nQDJtKfIRr4FpYoVZuxXqjeh9w0WlWGXegDMXKj+PhcmYYU/HlM
 a8hx5Q1hSdsN36VPoyLo8Suc1CnLQdlEeSBOWZEVyV77JhyQrrwGVd5U7ON/EJYj7SYV
 YOCmy/+zUmtMBZUDgQHu4rgVxs/shdcuLR9avEz9hVkNCHovN3xsI3GGwPD8pcugMwf4
 4gFQ==
X-Gm-Message-State: AAQBX9cgQqKttRH2jJrXCahXpl3D6csNWXlCGjWwWw/CAfmbzIFu8YlJ
 12LNBdqqDQtuO6xxaOrxyZ7aUV+XygpAC6JZPOPkqB48p4YLp0Wh4krK4JFKqGLTP/poYsSLHvN
 ql3QpNGItfDQ47pM=
X-Received: by 2002:a5d:408c:0:b0:2ce:9819:1c1e with SMTP id
 o12-20020a5d408c000000b002ce98191c1emr26236981wrp.30.1680529235312; 
 Mon, 03 Apr 2023 06:40:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350b/5yAGDHIpk0gnr/jSNeP9P7h7Lp5iadyiwN8wZbtEXiSYGrBV/gLj+lWc6CYFnSHdtWiqVQ==
X-Received: by 2002:a5d:408c:0:b0:2ce:9819:1c1e with SMTP id
 o12-20020a5d408c000000b002ce98191c1emr26236964wrp.30.1680529235013; 
 Mon, 03 Apr 2023 06:40:35 -0700 (PDT)
Received: from redhat.com ([47.58.164.113]) by smtp.gmail.com with ESMTPSA id
 e19-20020a5d5953000000b002e6a1bf2162sm7799719wri.16.2023.04.03.06.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:40:34 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  stefanha@redhat.com,  dave@treblig.org,
 peter.maydell@linaro.org,  alex.bennee@linaro.org
Subject: Re: [PATCH] MAINTAINERS: Remove and change David Gilbert maintainer
 entries
In-Reply-To: <20230330095524.37691-1-dgilbert@redhat.com> (David Alan
 Gilbert's message of "Thu, 30 Mar 2023 10:55:24 +0100")
References: <20230330095524.37691-1-dgilbert@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 03 Apr 2023 15:40:32 +0200
Message-ID: <87mt3prsmn.fsf@secure.mitica>
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

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> I'm leaving Red Hat next week, so clean up the maintainer entries.
>
> 'virtiofs' is just the device code now, so is pretty small, and
> Stefan is still a maintainer there.
>
> 'migration' still has Juan.
>
> For 'HMP' I'll swing that over to my personal email.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

So long and thanks for all the fish, sir.

> ---
>  MAINTAINERS | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef45b5e71e..f0f7fb3746 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2119,7 +2119,6 @@ T: git https://github.com/borntraeger/qemu.git s390-next
>  L: qemu-s390x@nongnu.org
>  
>  virtiofs
> -M: Dr. David Alan Gilbert <dgilbert@redhat.com>
>  M: Stefan Hajnoczi <stefanha@redhat.com>
>  S: Supported
>  F: hw/virtio/vhost-user-fs*
> @@ -2863,7 +2862,7 @@ F: tests/unit/test-rcu-*.c
>  F: util/rcu.c
>  
>  Human Monitor (HMP)
> -M: Dr. David Alan Gilbert <dgilbert@redhat.com>
> +M: Dr. David Alan Gilbert <dave@treblig.org>
>  S: Maintained
>  F: monitor/monitor-internal.h
>  F: monitor/misc.c
> @@ -3136,7 +3135,6 @@ F: scripts/checkpatch.pl
>  
>  Migration
>  M: Juan Quintela <quintela@redhat.com>
> -M: Dr. David Alan Gilbert <dgilbert@redhat.com>
>  S: Maintained
>  F: hw/core/vmstate-if.c
>  F: include/hw/vmstate-if.h


