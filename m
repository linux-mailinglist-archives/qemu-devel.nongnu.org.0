Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC85B680BA3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:10:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMS21-00017D-N1; Mon, 30 Jan 2023 06:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMS1z-00015V-V5
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:09:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMS1y-0005PV-HR
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675076936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0FypJyPRbyz9UCuYXBqojDmRcqKdFGU5CmVzaxtZgME=;
 b=L+GmazqlC5Tya9rUlBgUm1fHYR7kMcMj0fRsEEHlwSVZOYNp4L7+ArXeg9WyKoSMnzzp6O
 v71K9tRNoPfjSHtiAdYBCiv4JaGejBgBP1GMYaD/Eezn5XvG6QmkNk8UJ2OSFWNmNuNA6w
 LBwzvZgIiEAytF1XFyUFiWBtoij2+Qo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67-7XcdYeafPxCTH-gZUSjmHw-1; Mon, 30 Jan 2023 06:08:55 -0500
X-MC-Unique: 7XcdYeafPxCTH-gZUSjmHw-1
Received: by mail-wm1-f70.google.com with SMTP id
 fl5-20020a05600c0b8500b003db12112fdeso7016437wmb.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 03:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0FypJyPRbyz9UCuYXBqojDmRcqKdFGU5CmVzaxtZgME=;
 b=A2N6t+XZjERMu3rN2VaKrHeAF1shsQkeIaOLn0ykp50b0sm9kwFdsQ+/aaqf2KWGp6
 a4zurTlDOE94MluVQ9FSShXF+FMgTm0oXHIVxl+GCgrbOfK5uUGFml9Epv5cpEZNBwTK
 5cI2LfR00sTaVZA2k1go/bAKfvZbdJWWJipFMRVXP+Tk2h7tPnr9+SAX9PvaJdxw5eJ2
 bt7C9vOw7FZHm+cuwylUNxdfSiE/dBeha8VpFgeuhdcJqbBSglEdSg0148LZKuFk5j2w
 ZsBageFP0KHYXoN5iXLYAN57mLLdzb68TARNlDt7oRFVrpZO6Rgt+4abLe23J+i/5ty9
 UKvA==
X-Gm-Message-State: AFqh2krEYWZpFSTlRd3UurTgL4D0juS/U6kQt1vK2zti/rMXEYVvBu3O
 IPaSvDq+7UTcrs7A1Ic/rMjZ4+7SqCZPWeYTZmYtJ2ob6nqQx+NM8amsOH3wHIwL2GgvQIEG/4b
 LpwoJkDTtUqiEoK0=
X-Received: by 2002:a05:600c:3b18:b0:3db:eab:3c5c with SMTP id
 m24-20020a05600c3b1800b003db0eab3c5cmr46577166wms.32.1675076934412; 
 Mon, 30 Jan 2023 03:08:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvupMtrFRL0aIUod3xqSCL/zYAYggn7lbrHMlD3lIVy0Rlo4anX5lhuNNz54PW41Fsisdlbtw==
X-Received: by 2002:a05:600c:3b18:b0:3db:eab:3c5c with SMTP id
 m24-20020a05600c3b1800b003db0eab3c5cmr46577150wms.32.1675076934151; 
 Mon, 30 Jan 2023 03:08:54 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 ip6-20020a05600ca68600b003d04e4ed873sm15641754wmb.22.2023.01.30.03.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 03:08:53 -0800 (PST)
Date: Mon, 30 Jan 2023 06:08:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, stephen@networkplumber.org,
 chenbo.xia@intel.com, thomas@monjalon.net, dmarchan@redhat.com
Subject: Re: [PATCH 0/3] Vhost-user: replace _SLAVE_ with _BACKEND_
Message-ID: <20230130060706-mutt-send-email-mst@kernel.org>
References: <20230130104548.13262-1-maxime.coquelin@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130104548.13262-1-maxime.coquelin@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 30, 2023 at 11:45:45AM +0100, Maxime Coquelin wrote:
> This series continues the work done to get rid of harmful
> language in the Vhost-user specification.

I prefer a positive "switch to a more inclusive terminology".
To consider if you keep doing this work.

> While the spec texts were changed to replace slave with
> backend, the protocol features and messages names hadn't
> been changed. 
> 
> This series renames remaining occurences in the spec and
> make use of the new names in both libvhost-user and the
> Vhost-user frontend code.
> 
> Maxime Coquelin (3):
>   docs: vhost-user: replace _SLAVE_ with _BACKEND_
>   libvhost-user: Adopt new backend naming
>   vhost-user: Adopt new backend naming
> 
>  docs/interop/vhost-user.rst               | 40 +++++++++++------------
>  hw/virtio/vhost-user.c                    | 30 ++++++++---------
>  hw/virtio/virtio-qmp.c                    | 12 +++----
>  subprojects/libvhost-user/libvhost-user.c | 20 ++++++------
>  subprojects/libvhost-user/libvhost-user.h | 20 ++++++------
>  5 files changed, 61 insertions(+), 61 deletions(-)
> 
> -- 
> 2.39.1


