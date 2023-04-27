Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50056F04C0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:10:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przVH-0006Bf-9E; Thu, 27 Apr 2023 07:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1przVF-0006B8-2N
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:09:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1przVD-0007lS-AC
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682593770;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cuiwC8ouLdhiiN+XeKfUgpPB4GrPsDim0NSGSNEFvi8=;
 b=SQvNPrNi9jKZ+pBTFinwq2Hr90esnIHnAiADFquf/9lTXsjwiVKWipXhImDlOeZA6u0o5T
 jtaKJ7JjR86qDNqllAC95cfsv7G2AnUWvvEtMaSr3ucF0UKgQlqopnSyHWxXcL91u52U/W
 4JvQ/dKEl3L7ITGE04HicfFhVsb0PvY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-5zUVV9vnMF-z5JuHjBnVdg-1; Thu, 27 Apr 2023 07:09:28 -0400
X-MC-Unique: 5zUVV9vnMF-z5JuHjBnVdg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f1754de18cso50085865e9.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 04:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682593767; x=1685185767;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cuiwC8ouLdhiiN+XeKfUgpPB4GrPsDim0NSGSNEFvi8=;
 b=X3sDSzIlORED9Mw4tGU/wt1wMyIkjAyCTY0BW4RiNw68t8mb4q71p3rNbJCB2OufHw
 h17ELNWn4BgXRKLU0hdmwhxMsrWXmv8J2KJe0WNplp1iGOMJ7ABSqcDL21PZhqfN7hKM
 L4TJv2d/N4Cfyh2rp/iivvIsb7Um16bL24xybxhwM8lZHOdO1ti3o6zSSzpZ4r0QOfW4
 XeZuDW/XWfPHIjvlZQNpYoLbQMLPiFzZ2PhaNJXbZ/kxUgF6YLHb+xHE3MKZKtxd8let
 XiznCo7rKmEZptrAgDeqX2cWsEV15xWqJSl21K8wFkGwLkSpw5wLFnSJdTlQFxoqvxEe
 DKUA==
X-Gm-Message-State: AC+VfDyquijS2WEbI6aOYhuCnxSoxNIXffNoPKpL0RmdeVPWYM5vP0eI
 EXy4MF8gx5I7W/noy229D03t/vVHr1ZhH000QnjhcZTIwxTc1MvEdqdoymSiIrYvOnz6xjPsxix
 GM9mmVeynALXyX2s=
X-Received: by 2002:a7b:cb85:0:b0:3f1:7136:dd45 with SMTP id
 m5-20020a7bcb85000000b003f17136dd45mr1104943wmi.30.1682593767753; 
 Thu, 27 Apr 2023 04:09:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ66P3/qFm7DY8mCfBfjRnGNfbV/ER2sXdDXGTMq3pQYKGrK49UGvIXtWU9oT4k2TVUmLlRZgQ==
X-Received: by 2002:a7b:cb85:0:b0:3f1:7136:dd45 with SMTP id
 m5-20020a7bcb85000000b003f17136dd45mr1104910wmi.30.1682593767395; 
 Thu, 27 Apr 2023 04:09:27 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b003f1738d0d13sm32657584wmq.1.2023.04.27.04.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 04:09:26 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  eblake@redhat.com,
 kwolf@redhat.com,  hreitz@redhat.com,  pbonzini@redhat.com,
 marcandre.lureau@redhat.com,  arei.gonglei@huawei.com,
 pizhenwei@bytedance.com,  jsnow@redhat.com,  vsementsov@yandex-team.ru,
 eduardo@habkost.net,  marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 stefanha@redhat.com,  kraxel@redhat.com,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  marcandre.lureau@gmail.com,  david@redhat.com
Subject: Re: [PATCH 17/16] docs/devel/qapi-code-gen: Describe some doc
 markup pitfalls
In-Reply-To: <20230427095346.1238913-1-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 27 Apr 2023 11:53:45 +0200")
References: <20230425064223.820979-1-armbru@redhat.com>
 <20230427095346.1238913-1-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 27 Apr 2023 13:09:25 +0200
Message-ID: <878redd1ju.fsf@secure.mitica>
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

Markus Armbruster <armbru@redhat.com> wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

> ---
>  docs/devel/qapi-code-gen.rst | 53 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index d81aac7a19..14983b074c 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -1059,6 +1059,59 @@ For example::
>     'returns': ['BlockStats'] }
>  
>  
> +Markup pitfalls
> +~~~~~~~~~~~~~~~
> +
> +A blank line is required between list items and paragraphs.  Without
> +it, the list may not be recognized, resulting in garbled output.  Good
> +example::
> +
> + # An event's state is modified if:
> + #
> + # - its name matches the @name pattern, and
> + # - if @vcpu is given, the event has the "vcpu" property.
> +
> +Without the blank line this would be a single paragraph.
> +
> +Indentation matters.  Bad example::
> +
> + # @none: None (no memory side cache in this proximity domain,
> + #              or cache associativity unknown)
> +
> +The description is parsed as a definition list with term "None (no
> +memory side cache in this proximity domain," and definition "or cache
> +associativity unknown)".
> +
> +Section tags are case-sensitive and end with a colon.  Good example::
> +
> + # Since: 7.1
> +
> +Bad examples (all ordinary paragraphs)::
> +
> + # since: 7.1
> +
> + # Since 7.1
> +
> + # Since : 7.1
> +
> +Likewise, member descriptions require a colon.  Good example::
> +
> + # @interface-id: Interface ID
> +
> +Bad examples (all ordinary paragraphs)::
> +
> + # @interface-id   Interface ID
> +
> + # @interface-id : Interface ID
> +
> +Undocumented members are not flagged, yet.  Instead, the generated
> +documentation describes them as "Not documented".  Think twice before
> +adding more undocumented members.
> +
> +When you change documentation comments, please check the generated
> +documentation comes out as intended!

What is the easiest way to see the code generated for some subsystem,
say migration.json and find the problems and undocumented stuff?

I am expecting something in the lines of:
- you run this command
- and look at this file

Thanks, Juan.


