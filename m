Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D3D6F9D72
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 03:40:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvppt-0000II-5A; Sun, 07 May 2023 21:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pvppr-0000Hr-Gl
 for qemu-devel@nongnu.org; Sun, 07 May 2023 21:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pvppp-0004xe-Sl
 for qemu-devel@nongnu.org; Sun, 07 May 2023 21:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683509920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5+f1wfTDAp0C7Ucin1iibfhJ1kJuMmvZ9/BITdV3PNg=;
 b=RVQbGHYJGe6yjxOswAj3qJAhYoZ+Gq04uG2etVadOg1pn/Zh/HaLdnlApTK1zM3dDMqYJ8
 pGBgoTLeWNvD4Xzod8fhCfRjry01cmVysMipK4+1jjnoUnjPODhxVox3B2OwgAMvvcoD98
 f6CZ7FofD93KjK52ZtLunlk5ikSG4hc=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-u5PhXWnoPpCk-9xK4YLnNg-1; Sun, 07 May 2023 21:38:38 -0400
X-MC-Unique: u5PhXWnoPpCk-9xK4YLnNg-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1ab3c41d5ceso5280625ad.1
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 18:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683509917; x=1686101917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+f1wfTDAp0C7Ucin1iibfhJ1kJuMmvZ9/BITdV3PNg=;
 b=S/C/y2ca1YQ4AwzEst69OJMDbiECZA2RfYdI5mDA0sEI7LKC5vRCNt8LUx5hM0fomn
 9cKgS4JOUjS3SuM/BI2WT6AZKGnajB6AXkXgB8O4WskviiZgIlEp1c4cPBN3iZeaU5gJ
 83RFAfGPngN6al/Cy9jKgXFk/JsGb+fCD582z/dMaGUusLmuxKsU+CQbLvMUodoDf4G8
 35QFUO+U3usEQbQn7pngrc5bDS64OGWKlxpN2Qum4lm6p6rKDD1/N0eXiTdf/0ftKTmL
 WuYrX8wOeuGnYBBgQGp9IJNUI88ntFg58jOoxSYgIWe3RjV1nlvShWIwSw5T8vnqsXi6
 e+Fw==
X-Gm-Message-State: AC+VfDwxTmgx5ZpWPBZw1ra6iyotndQ0CM0wew6OjExJjUAPmG8EKlE3
 fajIBnRVUCaxIluhScmCQqLtVteB154tg0pGYFPwOMq912kZOEF/rR2930YkPKkwdVwnoVZa3Md
 FMqIouI/45joXO/o=
X-Received: by 2002:a17:902:d4c4:b0:1ac:40f7:8b5a with SMTP id
 o4-20020a170902d4c400b001ac40f78b5amr10636435plg.3.1683509917726; 
 Sun, 07 May 2023 18:38:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73wBVk0KNqJ81KqPf71XTPDBfE1EBJR3uqq9aZYPvnENiRkKBhf6OKLonXqqUsjQ1R8FqMpw==
X-Received: by 2002:a17:902:d4c4:b0:1ac:40f7:8b5a with SMTP id
 o4-20020a170902d4c400b001ac40f78b5amr10636426plg.3.1683509917484; 
 Sun, 07 May 2023 18:38:37 -0700 (PDT)
Received: from x1n ([64.114.255.114]) by smtp.gmail.com with ESMTPSA id
 x13-20020a170902ec8d00b00194d14d8e54sm5827678plg.96.2023.05.07.18.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 18:38:36 -0700 (PDT)
Date: Sun, 7 May 2023 18:38:35 -0700
From: Peter Xu <peterx@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH 0/5] multifd: Add colo support
Message-ID: <ZFhSICLxzgQpk4pW@x1n>
References: <cover.1683506133.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1683506133.git.lukasstraub2@web.de>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Copy Hailiang Zhang

On Mon, May 08, 2023 at 02:51:43AM +0200, Lukas Straub wrote:
> Hello Everyone,
> These patches add support for colo to multifd.
> 
> Lukas Straub (5):
>   ram: Add public helper to set colo bitmap
>   ram: Let colo_flush_ram_cache take the bitmap_mutex
>   multifd: Introduce multifd-internal.h
>   multifd: Introduce a overridable revc_pages method
>   multifd: Add colo support
> 
>  migration/meson.build        |  1 +
>  migration/multifd-colo.c     | 67 ++++++++++++++++++++++++++++++++
>  migration/multifd-internal.h | 39 +++++++++++++++++++
>  migration/multifd.c          | 74 +++++++++++++++++++++++-------------
>  migration/multifd.h          |  2 +
>  migration/ram.c              | 19 +++++++--
>  migration/ram.h              |  1 +
>  7 files changed, 173 insertions(+), 30 deletions(-)
>  create mode 100644 migration/multifd-colo.c
>  create mode 100644 migration/multifd-internal.h
> 
> -- 
> 2.39.2



-- 
Peter Xu


