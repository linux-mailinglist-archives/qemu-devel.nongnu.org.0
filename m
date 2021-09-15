Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BEA40C1E2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 10:38:04 +0200 (CEST)
Received: from localhost ([::1]:39944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQQQb-0005P5-HD
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 04:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQQPL-0004i3-Jk
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 04:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQQPJ-0006X7-VA
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 04:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631695000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DirLEsaBzmRk+2crnbCoV/MQ93VfohiBWGVCYlP/hTk=;
 b=evsv4vo32xLlmDOr/mcpJtWcl1XlTi5J36UY9sXhwMb7VCRpI7Vm7Ayrp2lC/8qnE7KAc8
 4XntBvlMbVZTsFz6qAvlddBRHuO+W3dEdx1hjBxSIkGOWDuoG6NO52kmW/cxNv6PAXI/dV
 ktUrJUWFS6vYLReUs6vhyMMho60pouM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-EAiwdC0pMbab6qHbHbWGEQ-1; Wed, 15 Sep 2021 04:36:39 -0400
X-MC-Unique: EAiwdC0pMbab6qHbHbWGEQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 a144-20020a1c7f96000000b002fee1aceb6dso1133101wmd.0
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 01:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DirLEsaBzmRk+2crnbCoV/MQ93VfohiBWGVCYlP/hTk=;
 b=sMQO5bRBZQES565swoR/gcvl8QYmBfVya2qfWNY8yOFJLQVqQS5KYemLTN8HuGB4Zd
 FRtKkb+b/kOLXt8z49ezlN/15uidD+vuuGyBV53k8Esd8n4PlTX1s/UGOGDTHGkv+7g9
 03dh5GpqOLVabE+DHLOd/bGn0ltJk7LaQvrpXF46Jr7wW+96jkWyV5tHS8xUYadB0//h
 QVqwGlWHYhj3ScOgyvWNTkc6i9ed3EWHb+aw495Wzp6yiRmOwanoT2w5a4ADQYvarvkP
 EpEMlqAZQQryimrQGGsJLdSKozJ84yCUEMwUJ6X1ZDfBghHa2cOt0uMbcPR5744hxbt+
 TPkQ==
X-Gm-Message-State: AOAM530Pwo/3wKuctITGNHUFYciN0E2v2MU+P8JdDigm+IaE0Q6Jes8J
 E7Ijo3OQVv+RF7JLp1i1DtjP0on6gA3QgAqrBl0Q0/1UAAXd/8fHemjcS2OKko1VFuFKsZJtDrX
 9iOpVa8s9nllHmAI=
X-Received: by 2002:adf:9f4b:: with SMTP id f11mr3632969wrg.337.1631694998568; 
 Wed, 15 Sep 2021 01:36:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDCCwSbkzr+C7+1Qb12NYYzCVEdzDGtKOAzXYZ8LKdqCb6J6LQGsNfWUJAbAMG+si7vo49VA==
X-Received: by 2002:adf:9f4b:: with SMTP id f11mr3632949wrg.337.1631694998347; 
 Wed, 15 Sep 2021 01:36:38 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id l10sm13895613wrg.50.2021.09.15.01.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 01:36:37 -0700 (PDT)
Date: Wed, 15 Sep 2021 09:36:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] virtio-balloon: Fix page-poison subsection name
Message-ID: <YUGwkyYXzx1xYXbm@work-vm>
References: <20210914131716.102851-1-dgilbert@redhat.com>
 <535891c6-237b-6d37-7492-ef8c1e19e6ca@redhat.com>
 <YUCj3i2BK1HzuztT@work-vm>
MIME-Version: 1.0
In-Reply-To: <YUCj3i2BK1HzuztT@work-vm>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: stefanha@redhat.com, qemu-devel@nongnu.org,
 Alexander Duyck <alexander.duyck@gmail.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note this also correspounds to:

https://gitlab.com/qemu-project/qemu/-/issues/485


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


