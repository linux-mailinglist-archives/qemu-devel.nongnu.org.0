Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB96E3D16AB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 20:52:11 +0200 (CEST)
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6HKE-0007n2-B9
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 14:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6HIr-00078Q-Ep
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 14:50:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6HIn-0000fA-6Y
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 14:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626893438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahp0aHB0DJ0eGZB6dOukONnNBq5lAg82ggl3JcZLnSE=;
 b=HqBjv1+042AJV5rCruMXnvOyYGFnFChX5vRBm1mo5anvXjJnZCgxBAIwotIFtLm/CKocHI
 BwZ6eyMWoy3go1bqN9IC1T3EXByLpAe0+rAELmGYLeQCcQdKJl1yXGbdkh2LNQG5Ar9SFh
 +qg0AIv2+u2Ic2g/nmDPaIET853BwgY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-K9hYe1xSNbOHJOUf2qwLMA-1; Wed, 21 Jul 2021 14:50:37 -0400
X-MC-Unique: K9hYe1xSNbOHJOUf2qwLMA-1
Received: by mail-qt1-f197.google.com with SMTP id
 j10-20020ac8440a0000b02902647b518455so2105037qtn.3
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 11:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ahp0aHB0DJ0eGZB6dOukONnNBq5lAg82ggl3JcZLnSE=;
 b=Uempz/2Ka6DU3GdLhjckSwHjp1jqIF1fZO407m0Cn4xEFG4zjVcO7tz83UEiQYcDCd
 ZhO3rjzay5/48YD3hMaxLoE+HogsbPfC3SUbekWRDYsteBZ+HVVH5i99nrPXqsw4rCpb
 IXGgPCn3AAIkaFLi63aS/vZq6cgibKeR7ewRrmAIbVZIV7T4ff8xYTodu1iEevWTRgRI
 zyl35j8FCclQyBAdraG5VVsfOs7SzBvWpfVqXaOJzQGHTTGpBJwYz93tL28PxF1XiC2g
 40NNTAXpLALZ8C7tu8bECPeveUfY8gxTlLw0QUTiuq6vXx5b5uZKN01jy1CeK9403IDn
 p8ww==
X-Gm-Message-State: AOAM5315DNk4RSne4G+Wv9fKdq93j8RhsHIJf/Jn/cqey2PFKH66s+RX
 lQpUW/ls+mDchbYgRT/Dz/jYFUZQ0+xcQJqK2TG6NwdcxPP/mLxpxWo6XGhFAhSCWuGbPDnheGg
 +QejRTl2o1SIFsQg=
X-Received: by 2002:a05:620a:12b7:: with SMTP id
 x23mr394540qki.384.1626893437146; 
 Wed, 21 Jul 2021 11:50:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRwilFF9aOUUSIlLlkk0VkHEg4T7KRFqhbwcRd08FjNK509tNePsbII6J2oma2bN1EWNHxzQ==
X-Received: by 2002:a05:620a:12b7:: with SMTP id
 x23mr394526qki.384.1626893436922; 
 Wed, 21 Jul 2021 11:50:36 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id q184sm11547241qkd.35.2021.07.21.11.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 11:50:36 -0700 (PDT)
Date: Wed, 21 Jul 2021 14:50:35 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v7 0/2] support dirtyrate measurement with dirty bitmap
Message-ID: <YPhse8sbHNpJ4PNE@t490s>
References: <cover.1626794163.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <cover.1626794163.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 11:19:15PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> v7:
> - do not take bql every time we need when do dirtyrate measuring.
>   try more things once we take bql so that overhead can be reduced.

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


