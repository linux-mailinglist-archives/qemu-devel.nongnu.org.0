Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903383A4672
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 18:24:36 +0200 (CEST)
Received: from localhost ([::1]:47830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrjxT-0004QZ-Kx
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 12:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1lrjwO-0003js-TL
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:23:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1lrjwM-0001yz-7l
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623428605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qXQX4Tyr4ivL4y+JrKBzk2JHl6qqFEIouOborvgJYIs=;
 b=V4MXPPwYYoP6eT23R7iEW8zv2fpb7Ank04ND5VK9Fawnxf5zX/hhghMf6IxA18ScK31ewO
 zIaaWMxyCs/Vk6uhF+ZC6dOVvGbxiB58CzGPooWjejOMngH+7NELq7bjeyou5PyVAlOFSt
 ki/VikBsZFh/BiRUHmcZtGBcJrQVKMA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-QmwHcneeMsGA1r5MMqM-Kw-1; Fri, 11 Jun 2021 12:23:24 -0400
X-MC-Unique: QmwHcneeMsGA1r5MMqM-Kw-1
Received: by mail-pj1-f72.google.com with SMTP id
 w12-20020a17090a528cb029015d7f990752so6341282pjh.0
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 09:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qXQX4Tyr4ivL4y+JrKBzk2JHl6qqFEIouOborvgJYIs=;
 b=FtBY7iB4x3VIvCAyI822LY8nRwprBrFF6dpJRAQZY5ar3cHZYKD628vZiy2U+hyyFp
 QYBGv9i+DZoTCbm/mSH/zoXzHDlCYB6GNa62+DrfqYabtOpl8bsbjOdEhBioEXbO+PmY
 9N6xXPHYnRB7fzLJXX7yfUnewSAmkXo3LlLmxbfs4qJHJuEtueeIHoZt+L0ZEPuszcRX
 Mabb3y9okgbGfAz3KZq0govAwUmG2U/wI9Olpq54KDVTRcS4uRDqUIaBmis5ge36/9Fu
 it5dQ5nuNUOdYc96SCEvpH24ZUYLkuVOobiSMVzVrneCkBTtyj8o7PbJeMestuy1gqN7
 7EhQ==
X-Gm-Message-State: AOAM532sCDA0404oQAeycRkPe8wKOLSccp5RxxDVcqSMqLUlXZsLxBQY
 iJUl5TxmRoF5AdplO4iiiDbB8wv2kKvq4Nd9GxvTwmQhTY1t/TmR6bTs4N+vX/WXWFlZAb8lPcF
 W3X/mZfAqrYGAQ/U/sAiYAETRBrA//t8=
X-Received: by 2002:a62:1942:0:b029:2e9:debd:d8b1 with SMTP id
 63-20020a6219420000b02902e9debdd8b1mr9109271pfz.9.1623428603317; 
 Fri, 11 Jun 2021 09:23:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbieIyynz762Izx7igJ6nPnoRMaFAjx7PWV7jT7nrwiCk7VCHr4efUyLw1R4j6zaz9rUkjmlVi2VCETNnZdmM=
X-Received: by 2002:a62:1942:0:b029:2e9:debd:d8b1 with SMTP id
 63-20020a6219420000b02902e9debdd8b1mr9109252pfz.9.1623428603047; Fri, 11 Jun
 2021 09:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210611162033.437690-1-mcascell@redhat.com>
In-Reply-To: <20210611162033.437690-1-mcascell@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Fri, 11 Jun 2021 18:23:12 +0200
Message-ID: <CAA8xKjVmnTcqwkZ547k=eQpS0Gyfo_QdfUEPv+pOYqiLCdk7aQ@mail.gmail.com>
Subject: Re: [PATCH] Test comment for git-publish
To: Mauro Matteo Cascella <mcascell@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 6:20 PM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> ---
>  hw/rdma/vmw/pvrdma_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> index 84ae8024fc..e229c19564 100644
> --- a/hw/rdma/vmw/pvrdma_main.c
> +++ b/hw/rdma/vmw/pvrdma_main.c
> @@ -427,7 +427,7 @@ static void pvrdma_regs_write(void *opaque, hwaddr addr, uint64_t val,
>      case PVRDMA_REG_REQUEST:
>          if (val == 0) {
>              trace_pvrdma_regs_write(addr, val, "REQUEST", "");
> -            pvrdma_exec_cmd(dev);
> +            pvrdma_exec_cmd(dev); // this is a test comment
>          }
>          break;
>      default:
> --
> 2.31.1
>

Sorry, please disregard this "patch" =)

-- 
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


