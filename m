Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EF049E63A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 16:38:37 +0100 (CET)
Received: from localhost ([::1]:58408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD6r6-00034i-43
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 10:38:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nD6TG-0006Dq-1M
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:14:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nD6TB-0002bX-6E
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AlJubWbNJptpsc8is/nPPVvB/xmwP73Np+7rcVH9GYY=;
 b=jVsZVNaT6dCgznusDHLfBDTn9GrlFtxbmGMN1oBSbxP9my2Is5FBm4q5dTOJOeiSVCScf1
 TblDaHBN9+WZNHXAl4z+zDH5lvkLlEcOnMvKuT1vstDxBsBgfALgIb5mOX+1M+ZiHyu0Jw
 VLw54nJOYvNepN552yh4zSlXpSiOXXc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645--Tpjq7CXNOmJwHZIR7zLRA-1; Thu, 27 Jan 2022 10:13:08 -0500
X-MC-Unique: -Tpjq7CXNOmJwHZIR7zLRA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so4341489wme.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AlJubWbNJptpsc8is/nPPVvB/xmwP73Np+7rcVH9GYY=;
 b=nqr4QySn4BpiMKseOSppheUwL1aIUe9VpQJTd5kG4KpK8zdZ/F8z77BAmFFIKKOD1L
 zulgPirpz2hyCOfzK+vDv+BXpmTXVJlKSqJjK58ybz1Bq2vhy1360JGmEAjfiU7sbbsU
 FoBHsEwGLS8fckar7jQCnhKrjNMsj2gCBYJcE6nhcx7z27zT7hSJ9yAKEZmSA6jQCalB
 HaFEm1b6sY3oCpD0ugTp8iS9YhBh5oGv9k8I2XTK+WbvTnBensUPvZ96ED+pBtyO6+xN
 tGaz/GFdLWTxKbNq0sIJGalThcA2QrDrJbzmVsUAisj7LUILCrsukFCWQm0jBNJ++ALw
 jT4Q==
X-Gm-Message-State: AOAM530gdjnchKt3RKP/0drKMttf4sDX31JmJ++mhSVCiA+ndkqKLMkK
 4OICO97DRKFjIwqeCO5WC//UwnqAnSIoafdxQwZJ2HIgUs/35D42ZzENFuYUw7iGizoZCkZ1vEt
 A8EUPiR8rgnRwLK8=
X-Received: by 2002:a05:6000:1a89:: with SMTP id
 f9mr3611577wry.251.1643296387263; 
 Thu, 27 Jan 2022 07:13:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyoE0u0fRzSj6fjDmq9K5kzpAQUie28C87vtnDvFId6Li7vrluTdicN1f9LcQwleTQo20YCA==
X-Received: by 2002:a05:6000:1a89:: with SMTP id
 f9mr3611561wry.251.1643296387076; 
 Thu, 27 Jan 2022 07:13:07 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id w8sm2380017wrq.3.2022.01.27.07.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:13:06 -0800 (PST)
Date: Thu, 27 Jan 2022 15:13:04 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 21/23] multifd: Zero pages transmission
Message-ID: <YfK2gGO6fjouiGGV@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-22-quintela@redhat.com>
 <YecbN5MbUvL3oVKm@work-vm> <87h79srw1f.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87h79srw1f.fsf@secure.mitica>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > * Juan Quintela (quintela@redhat.com) wrote:
> >> This implements the zero page dection and handling.
> >> 
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> 
> >> ---
> >> 
> >> Add comment for offset (dave)
> >>              }
> >>          }
> >>  
> >> +        for (int i = 0; i < p->zero_num; i++) {
> >> +            memset(p->host + p->zero[i], 0, qemu_target_page_size());
> >> +        }
> >> +
> >
> > On the existing code, it tries to avoid doing the memset if the target
> > page size matches; that avoids allocating the zero pages on the
> > destination host; should we try and do the same here?
> >
> > Dave
> 
> Hi Dave
> 
> That only happens on postcopy.
> With precopy we have to do the memset, because we can have:
> 
> write non zero to page 50
> migrate page 50
> write zeros to page 50
> Another migration pass
> If we don't write here, we have garbage on the page.
> 
> Or I am missing something?

You're missing the call to buffer_is_zero:

void ram_handle_compressed(void *host, uint8_t ch, uint64_t size)
{
    if (ch != 0 || !buffer_is_zero(host, size)) {
        memset(host, ch, size);
    }
}

so it checks the buffer to see if it was non-zero before doing the
memset.

Dave

> Later, Juan.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


