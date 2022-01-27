Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6049E82F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:56:44 +0100 (CET)
Received: from localhost ([::1]:49272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD84h-00056O-0b
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:56:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nD71O-00027R-9v
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:49:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nD71H-00008U-Nh
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643298547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JgrJyl6k3RPvJavVvaOWivTJQR/KC3MowdoqlYh4/iM=;
 b=FpK2U/YV1/pMEFJadGup8DZxUK1aBdhbZl9770Nt/DeTnIYp65HdqBtJlB/A+ut3UVi2tQ
 KuI2dvu2g2YpZmwb5T5fsJlmivPTJGkLKEVYZkSdbUQ2eq+7rBMkQQUZUX/eBBQnAFtPuG
 fUXn2snuoiKumGZuMF5kd0QcXsfCj5Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-CYMTDpCQPSWJWSBuBkdc5Q-1; Thu, 27 Jan 2022 10:49:03 -0500
X-MC-Unique: CYMTDpCQPSWJWSBuBkdc5Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 s1-20020a1ca901000000b0034ece94dd8cso4375862wme.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:49:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JgrJyl6k3RPvJavVvaOWivTJQR/KC3MowdoqlYh4/iM=;
 b=iZlS27sy85IMCkcdLGSJLwK7OqSRMQ4E9RbSwOzQ2k6a5J7HOzGL7wkd34X+YQcNYX
 K1ynjAX6mw/yqIxRC/VZICXWfQGDZhdyOmc/5D0yhTtJkKAtPAiWgEjTQGxZiPlCBf6P
 29rVgBDEDGHtHsw8PD5CcpcsclPokFBVR6XsQ7etYR35jg62TIDS0exJwTHqPXEGRiRl
 29wMF5/dP7RqvNbXC3KTshCelvJBqd4qlGaHX1xIhau4TeGB0JmAiWT025O+DTM65idb
 9zAW+6dztNHQZ0GEIh+5W2J00aBVCPsyq1a8sS3fZke6XN199jUj/LYbEpnwKL09wUi8
 6Log==
X-Gm-Message-State: AOAM530C2NMCWlabPCyTRJCBbeh5LqQGzKror5vFJZT+ZXOJ0JSbftcD
 K6Wz88lQUqWGl9Owd0+Jz7xp+zNIpVk9ajJN7PL2LEA31g8Umazy65qbkzaYO6heLnlno2di9DW
 /IBZiZsFQgUKxmp4=
X-Received: by 2002:adf:f44a:: with SMTP id f10mr3449697wrp.653.1643298542639; 
 Thu, 27 Jan 2022 07:49:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnyEP9uL9ZqU680XUHfX7FlqhAXTT5s9c+9Xu2ew9eRp02fjl1boZVL8uNdLwvEaU7ZUCSBA==
X-Received: by 2002:adf:f44a:: with SMTP id f10mr3449679wrp.653.1643298542425; 
 Thu, 27 Jan 2022 07:49:02 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id k25sm4495909wms.23.2022.01.27.07.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:49:02 -0800 (PST)
Date: Thu, 27 Jan 2022 15:49:00 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 3/3] migration: Perform vmsd structure check during
 tests
Message-ID: <YfK+7LCJssDhie9O@work-vm>
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-4-dgilbert@redhat.com>
 <87ilu6nrqe.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87ilu6nrqe.fsf@secure.mitica>
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
Cc: peter.maydell@linaro.org, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, lsoaresp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > Perform a check on vmsd structures during test runs in the hope
> > of catching any missing terminators and other simple screwups.
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> queued.

Careful; I think that'll break with slirp until libslirp gets updated
first.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


