Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E083B5D25
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 13:30:04 +0200 (CEST)
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxpSl-0001d6-6a
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 07:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxpRa-0000jV-Rw
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:28:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxpRX-0007xr-FT
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624879725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K+BKs7FnBMI1R2KVCbJ9gSbjwMM1SEmeAXMMOcGDIEc=;
 b=DuGF6u4pvcMoSM0cWw3y+3K+nDpRibJOgHD1Qq28xd4ihuKpiBMITGgklf+EwHLXH5ANHI
 ep12kRk0RlPyRhrE4srwE/9PaKkvFpQeXTiHAONN3POV3BM/R+emdVu8zPeICrlUuqMhPo
 WkjvasME82voGpZXEBzZU+jOm7aOwvc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-nVOAIKO4PQ-BJejjLmI_DQ-1; Mon, 28 Jun 2021 07:28:42 -0400
X-MC-Unique: nVOAIKO4PQ-BJejjLmI_DQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 i17-20020a5d43910000b02901258b767ad5so617375wrq.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 04:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K+BKs7FnBMI1R2KVCbJ9gSbjwMM1SEmeAXMMOcGDIEc=;
 b=dy0gEaiW/uca/QOMcmxT2OuPWFoy3dbTODdU5+DCWohO3qZDXdpp42CdZj68SZIU40
 ZfVF0QqNVwuPOd7kuuo0hnQaVoqxuoeejicwu5HXH47A9OVmGduV68cVdFuQlRVFhfOd
 jKMeohYJue8Ahx30ws4Owm9jA0cDxqYCwwtT0j9HCFCA9QZCaAwarw348Rah15Cmb7hX
 eoFgARrQdCqyk1RNS928uSwrzNQmNq1Rmy6lCxwbVUKHX9i+5ynFbUqh8EslMy+pa6yD
 dcOltJB+wMrDU1SR3imu34RGvQyXn8un7IQn64TskSpJNn8L3wRJDma+WsPm29/4pTpo
 FCNg==
X-Gm-Message-State: AOAM531+J5KH9KJqOjrrd6o2Y2GVoX2Dv9s7jyC0JRTpioG9kT8OQaSz
 T/oFIxrIT8RHUpI3bhqC3GpQEar5dWFKfEj+IAOv+HWF7uUbSNQb61sXwEAhQjh+mEic5Bqts+K
 V7ua0oIZOKe74LRk=
X-Received: by 2002:a5d:6412:: with SMTP id z18mr26937590wru.163.1624879721382; 
 Mon, 28 Jun 2021 04:28:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb6/cD2eVLjdQHn5b+5zLk7qfdMRcLNr7zdBsumBRDna+SvKFituRn5lbPAeRfYHSuF2c38g==
X-Received: by 2002:a5d:6412:: with SMTP id z18mr26937564wru.163.1624879721115; 
 Mon, 28 Jun 2021 04:28:41 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id t128sm20568155wma.41.2021.06.28.04.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 04:28:39 -0700 (PDT)
Date: Mon, 28 Jun 2021 12:28:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alexander Graf <agraf@csgraf.de>, philmd@redhat.com
Subject: Re: [PATCH v3 1/1] yank: Unregister function when using TLS migration
Message-ID: <YNmyZUy4IwcgZKRy@work-vm>
References: <20210601054030.1153249-1-leobras.c@gmail.com>
 <YMdEK6evcYtpbfMv@work-vm>
 <7cdf3e49-c68b-f5e5-ae1f-8274203a0f11@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <7cdf3e49-c68b-f5e5-ae1f-8274203a0f11@csgraf.de>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, lukasstraub2@web.de,
 berrange@redhat.com, Leonardo Bras <leobras.c@gmail.com>,
 Juan Quintela <quintela@redhat.com>, qemu-stable@nongnu.org, peterx@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alexander Graf (agraf@csgraf.de) wrote:
> 
> On 14.06.21 13:57, Dr. David Alan Gilbert wrote:
> > cc'ing in qemu-stable - I think we'd probably want this on 6.0
> > (It's currently merged as 7de2e8565335c13fb3516cddbe2e40e366cce273 ).
> > Although you'll probably also want the missing dependency fix
> > Philippe is working (See: 
> > Mathieu- ( 42) [RFC PATCH] migration: Add missing dependency on GNUTLS )
> 
> 
> Current master does not compile for me anymore (on macOS) due to this
> change. Can we please either disable yank support and revert this patch,
> pick the GNUTLS dependency patch you refer to quickly and work on a real
> fix afterwards or get the proposed fix in the "missing dependency on
> GNUTLS" discussion done quickly?
> 
> Having a broken tree is going to make bisection super painful later.

There was Phil's dependency fix;
https://lore.kernel.org/qemu-devel/YMcTpO2SlVSc%2FHCR@redhat.com/t/

but there still seemed to be some argument if this was the right way to
do it.

Dave

> 
> Alex
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


