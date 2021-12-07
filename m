Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942B146B3F3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:32:57 +0100 (CET)
Received: from localhost ([::1]:34610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muUy8-0004fe-3z
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:32:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muUw8-0003nN-UJ
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:30:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muUw6-0001GD-8n
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638862249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B1SjCoLnKMM3k9JJaQDJq5N+2CDURBj2hAD5cMFvVQQ=;
 b=gjWRf5kw9ZLBQsqcPjTxN3B4SnbRCMAhlsw2UHSDq6ZptcPlaWCBebJO8shd/ugZqpMgVU
 j9P+P2CnE4MqtH8qY/jJguIPqOb4Os6BOOhl5yn/4UVBmHxtnNr5qxY9dQ7/UocC1OL+OX
 kOIbP/JRH53ewZoVwZP2SHyyiAhSRD0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-6rp26Q2iOjaQ_oJhBjKAaQ-1; Tue, 07 Dec 2021 02:30:47 -0500
X-MC-Unique: 6rp26Q2iOjaQ_oJhBjKAaQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso990285wms.1
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 23:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B1SjCoLnKMM3k9JJaQDJq5N+2CDURBj2hAD5cMFvVQQ=;
 b=Z05jM4WBUO0/AAwdkSfyIJHkMJezdbhoKCJ3PJtt7oAakXxVCXl4FOgsz+gsitmfm2
 V7TIwZRBAprWvR+nzsp1Du/7lMvnsIlfbrTXh8m/HS0GwUYILvwXOHWFQTVp5cUVrsxs
 mjtX7w6gMoQ5zo6MobpIR4ArgaLuvz6dC8Q1O7M54M5bxNcbRghv6tXkIIm3pvfIVfeK
 WESqYdQ0GSDNdhZAjM20ON+hN9BDNZTUXNYFGwJORsEjqz/M06q7QxgcT8d7qe4qNaVc
 AT3CJ4mXwnkavAgFQ6PvS2VVKXgeIqk6cKdZRuByJnjsZzbsNtYbHEpOYlP2jLfLOwlt
 Nbdg==
X-Gm-Message-State: AOAM533O2s1MyZNo5sFNgdvhoLjrGp9gOI9FYgOHbtKxN5Ll1vmCb+TS
 F2HkbrKS0lHkoyYXXVJJyowoo03SKqR36uRWZZa7I10FFRQ/8aJ+1z2OLr8mX4Y4du/dFokkvpZ
 +krEyb3M+A3XPjKI=
X-Received: by 2002:adf:ef52:: with SMTP id c18mr49633730wrp.162.1638862246559; 
 Mon, 06 Dec 2021 23:30:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGFLKoZJC0ub4VY+ETdoBNSLNUc6i+0fBKtrFC9jJ/Hvjzr7Gj2EJuNTN2Kln0Xc9sbpyr4g==
X-Received: by 2002:adf:ef52:: with SMTP id c18mr49633713wrp.162.1638862246385; 
 Mon, 06 Dec 2021 23:30:46 -0800 (PST)
Received: from xz-m1.local ([85.203.46.174])
 by smtp.gmail.com with ESMTPSA id z6sm1865062wmp.9.2021.12.06.23.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 23:30:45 -0800 (PST)
Date: Tue, 7 Dec 2021 15:30:41 +0800
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 23/23] migration: Use multifd before we check for the
 zero page
Message-ID: <Ya8NoTyiXOCQ/MLL@xz-m1.local>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-24-quintela@redhat.com>
 <Yaj+V6LstcnNERaZ@work-vm> <87fsragb58.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87fsragb58.fsf@secure.mitica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 02, 2021 at 06:38:27PM +0100, Juan Quintela wrote:
> This needs to be improved to be compatible with old versions.

Any plan to let new binary work with old binary?

Maybe boost the version field for multifd packet (along with a
multifd_version=2 parameter and only set on new machine types)?

PS: We should really have some handshake mechanism between src/dst, I dreamt it
for a long time..  So that we only need to specify the capability/parameters on
src someday and we'll never see incompatible migration failing randomly because
the handshake should guarantee no stupid mistake..  Sad.

> 
> But .... if we don't care about RDMA, why do we care about
> control_save_page()?

Could anyone help to explain why we don't care?  I still see bugfixes coming..

Thanks,

-- 
Peter Xu


