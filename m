Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BDC6F1D5B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:25:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRq4-0002Q3-VM; Fri, 28 Apr 2023 13:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psRq3-0002Pu-PC
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:24:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psRq2-00076W-Ek
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682702693;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9ID/i92cXCMn+d0b9/KymmkQ9sjayM8dT/DMH876tII=;
 b=aNlqReJG3odDLPorV4+KH2oChFGDD2wyLgOpJvM/T+ycMSldQ8A3eOy3pHQblXZh2vMYKn
 ElStXVK+kKkUzwUA5udYGoVnRhe3qQz3cwdytOF903xgwR/em1KmyWEq4LCAdZx3mMCcan
 PVwglfMbqYfSphJF8T4f7lTGEDLQAi8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-S1sfSbPLOx6rWlAvFK86GA-1; Fri, 28 Apr 2023 13:24:51 -0400
X-MC-Unique: S1sfSbPLOx6rWlAvFK86GA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f08900db79so35582415e9.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 10:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682702690; x=1685294690;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ID/i92cXCMn+d0b9/KymmkQ9sjayM8dT/DMH876tII=;
 b=GyosvQ70HKMsOA7pqiq5hFmdWIrcpB4uGeSayswdyyysOOUi0Xa+S6LOLyQuauENC1
 wP1/yEo7vQx1e6INULGWnuq/hD+klOfmXl1jf71R5xcJxkcPK4agdQhO5lxrFas/uaOb
 zyXstBqUEWrQ0HxrOX+JHYb7XDEHxrRErFbMri1sFeNqhiOgj4olhUxKo3EssW3NAy6P
 D1OdxSfFEQqzHDYyn8lBxINy1+Wi452/ciIIxBAaBhUpWvLtj7++yyF/eE5KHBHiwpdu
 pLLOp9eQnSRnIMlMxJEXCNNiQ3b6WodKv6kDhc9Sv3GUq9/6hHKka+Hw+2DfWuFow701
 n38g==
X-Gm-Message-State: AC+VfDxL5Us7OvXBpgKYBWQoxgPPpnHqBOTC6X8e2Fql05LRVePVt6v2
 3uaQNWDb4rYL6ObMpp6zhcS6/sV446vtK1KzRdH0nDnF+8M9nq17TKZ302AGxlqE/FQeZ/k6/AK
 U/JP6+cPJHIZl82Q=
X-Received: by 2002:a05:600c:2248:b0:3f2:5a60:a042 with SMTP id
 a8-20020a05600c224800b003f25a60a042mr4432273wmm.4.1682702689979; 
 Fri, 28 Apr 2023 10:24:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4b6z8bQzMtrALyxzXGGgyOs8lPfhBgEiXxeT3xSHaT8QAxsGrSJO67dc/S7+VCD0pjxaoUdw==
X-Received: by 2002:a05:600c:2248:b0:3f2:5a60:a042 with SMTP id
 a8-20020a05600c224800b003f25a60a042mr4432263wmm.4.1682702689682; 
 Fri, 28 Apr 2023 10:24:49 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c365500b003f182a10106sm25040320wmq.8.2023.04.28.10.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 10:24:49 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 12/13] ram compress: Assert that the file buffer
 matches the result
In-Reply-To: <a21bc7fdd9b2cd6ab99cdd7ae3390713085bf1a0.1681983401.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Thu, 20 Apr 2023 11:48:31 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <a21bc7fdd9b2cd6ab99cdd7ae3390713085bf1a0.1681983401.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 19:24:48 +0200
Message-ID: <87a5yrapi7.fsf@secure.mitica>
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
> Before this series, "nothing to send" was handled by the file buffer
> being empty. Now it is tracked via param->result.
>
> Assert that the file buffer state matches the result.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Even when:

> +/*
> + * Check if the writable buffer is empty
> + */
> +
> +bool qemu_file_buffer_empty(QEMUFile *file)
> +{
> +    assert(qemu_file_is_writable(file));

A function that is basically an assert

> +    assert(qemu_file_buffer_empty(f));

Is always called as an assert O:-)


