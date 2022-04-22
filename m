Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D82350BF6B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:27:16 +0200 (CEST)
Received: from localhost ([::1]:60676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxzv-0003zH-AL
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhxfe-00065m-IH
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhxfa-0001L1-6G
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650650772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l1gqvyvCIUxH3qsuEtHgwnRxgIIyEJUG07bMBNQxYBE=;
 b=IaLxTX6JpXYbDIbiwQVAo3qTF92gGMOiAUZjRorovwCeBO7Q9Odc7mt22KHAfqLKI4GaG6
 vlUH5KJbnJltXDMbypgE+ZvSDjIu+kg4tZ+egQ8dYF3iwC+BXf/8xOQWNKLpFj2xkG0PCl
 0PhkrADAwNpkfdUot3KdzJkFWckhU5w=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-0tYsc2yMMXOIY29WVKgaMA-1; Fri, 22 Apr 2022 14:06:10 -0400
X-MC-Unique: 0tYsc2yMMXOIY29WVKgaMA-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-2f4dc56af69so42173157b3.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 11:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=l1gqvyvCIUxH3qsuEtHgwnRxgIIyEJUG07bMBNQxYBE=;
 b=oWkmOQhfo/nkvr8uWYrhImLIwxlWs7hTqtcsnppQizYwJivS4JxTIPa2c3pTNLSN+W
 tvqsylDbtod7vj3OgxL3EXo0w0glA0LStl/bnWmE+FMlFMBj+cwxmu2C7ixXSXbV5plp
 Jm2AohQwV7fAigkiBcdIzi9E4n0YTlDqGvMz3ADTu6DxkZ3TE+INzW1a3CsR+NJpULFV
 cKsllPJVs9QPTqSAJbf7d5iR7smqnHcJYeH2mgx/WK6tiB55HGiBmVxNCKrc/gjd2CPX
 83EayeRKGba6CGo3lpJZkmFW96zRFqweidBZEfOGRKystqKahl3E3NgzGu3FgHmurf2w
 Slsw==
X-Gm-Message-State: AOAM5331k6je0eoMQfqrA2pGf2emcx6AVdV5BzL0ZujC2wgD1rHgMXBJ
 rWln7SmpmSwwHiPgX+t4KSiK3SBEZxj7MG1jSr1oEW5hc44moa3JlEZRN2XgatFbu3PIG5SDMc6
 fcyKESQUhyrSezX/4ng2mmzMLYb7aT+s=
X-Received: by 2002:a5b:30b:0:b0:63d:fcd9:3e4b with SMTP id
 j11-20020a5b030b000000b0063dfcd93e4bmr6112089ybp.18.1650650770368; 
 Fri, 22 Apr 2022 11:06:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPq6i4yeRszWa+ywwg62JRQE89MvUj3gEY21t3xit1wNx7ptktcUB1dmhdyTJxP+Fh1vMIcYAnOqsCyH7/5Os=
X-Received: by 2002:a5b:30b:0:b0:63d:fcd9:3e4b with SMTP id
 j11-20020a5b030b000000b0063dfcd93e4bmr6112065ybp.18.1650650770184; Fri, 22
 Apr 2022 11:06:10 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 11:06:09 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220422132807.1704411-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220422132807.1704411-1-armbru@redhat.com>
Date: Fri, 22 Apr 2022 11:06:09 -0700
Message-ID: <CABJz62M9QWAfHHrZYWNDzmzGgz_Zzq9VOme=82h7GLqgHvOUGw@mail.gmail.com>
Subject: Re: [PATCH] qapi: Fix malformed "Since:" section tags
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
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
Cc: eduardo@habkost.net, berrange@redhat.com, michael.roth@amd.com,
 qemu-devel@nongnu.org, f4bug@amsat.org, wangyanan55@huawei.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 03:28:07PM +0200, Markus Armbruster wrote:
> "Since X.Y" is not recognized as a tagged section, and therefore not
> formatted as such in generated documentation.  Fix by adding the
> required colon.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/crypto.json     | 3 +--
>  qapi/machine.json    | 2 +-
>  qapi/misc.json       | 2 +-
>  qga/qapi-schema.json | 2 +-
>  4 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Andrea Bolognani <abologna@redhat.com>

-- 
Andrea Bolognani / Red Hat / Virtualization


