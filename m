Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5254AD558
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:11:20 +0100 (CET)
Received: from localhost ([::1]:51792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNSw-0002Lw-QD
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:11:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHNPH-00006Y-UJ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:07:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHNPE-0002aH-BK
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:07:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644314846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VWIeudwvgeboDkbZskokem3hzzm/jFo+1yulhSVfiew=;
 b=Nh5tI/GNxYly9EudTmdXpGtNNxS3xeQqhVvQxAKL0kCkxjmeJiozLy1pDpAI50XzppYyia
 o2tfuvM9FoNtuZKQdHje9mFQA0Q98ZkxcH91CG30nwbRG4++cAkE2q0SZonagdOWjLJVQq
 U08PPEz4wci+H/2HhZYEs+7NOOaqC1Y=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-FQFpMAt7MJuGpIIVuAbmnw-1; Tue, 08 Feb 2022 05:07:26 -0500
X-MC-Unique: FQFpMAt7MJuGpIIVuAbmnw-1
Received: by mail-pj1-f70.google.com with SMTP id
 j23-20020a17090a7e9700b001b8626c9170so1249934pjl.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:07:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VWIeudwvgeboDkbZskokem3hzzm/jFo+1yulhSVfiew=;
 b=WcfeAiY2BUe7VfpPsdYsy1lm+1bKsunJ8XPvELIvMNiwlO2uabnbNtCrUyoELqvDWa
 zJXKLOd5ncAolbBFdRZ0wxn1qoNhzH1oxiulNLiJftXjz1G3zoddw+AZsUAyl7egToTr
 UVdS0Err6hkbyNTOlmP+1bpsoW27liDzn44rEYrLg2vJ2WoK/37BrHWkvKQJUmhBrNjy
 kubYnPWMahyPkbVQ9lubKqWnWQ5U/+u96MtglFTMTnT4exUuvt61f3IzJRnWAJCK8Nkj
 fgEWQYasGQYAtj0aZxZBnGlYJC4QkA4PgF9Is733/Eo+yCRLjZZvoaYbh1QoY7+S1RTC
 C1gQ==
X-Gm-Message-State: AOAM533LfZpJFRcCkcFOVIhOqFv8zcgrWg0lrT8Zm+RU9qYqpKTRoB+o
 skSM8f7awBNhLIH4LLuNAj4IoexSCeSadWjd66WrPkdnstv+/yLOq5khRj6CC/yl+vAhOhKGYoq
 ejPEh07bp+DYJoB8=
X-Received: by 2002:a62:86c1:: with SMTP id x184mr3841660pfd.26.1644314844663; 
 Tue, 08 Feb 2022 02:07:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxqr/7Vwk/5Oy1pHASxyKvTiXTRFUobGEb+FjdfyqhG39SfdzhRLnJDS3y2YwBLqN/EnYNrQ==
X-Received: by 2002:a62:86c1:: with SMTP id x184mr3841627pfd.26.1644314844302; 
 Tue, 08 Feb 2022 02:07:24 -0800 (PST)
Received: from xz-m1.local ([94.177.118.119])
 by smtp.gmail.com with ESMTPSA id c5sm14874999pfc.12.2022.02.08.02.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 02:07:24 -0800 (PST)
Date: Tue, 8 Feb 2022 18:07:19 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 07/15] migration: Introduce postcopy channels on dest
 node
Message-ID: <YgJA14TsR2lr8BNW@xz-m1.local>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-8-peterx@redhat.com>
 <Yfvv9zYcgJWg+Yy9@work-vm> <YgHjL0VqLCAHxdav@xz-m1.local>
 <YgI7VRjW3zNoztNi@work-vm>
MIME-Version: 1.0
In-Reply-To: <YgI7VRjW3zNoztNi@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08, 2022 at 09:43:49AM +0000, Dr. David Alan Gilbert wrote:
> > It'll be cleaned up later here:
> > 
> >   loadvm_postcopy_handle_listen
> >     postcopy_ram_incoming_setup
> >       postcopy_temp_pages_setup
> >     postcopy_ram_incoming_cleanup  <---------- if fail above, go here
> >       postcopy_temp_pages_cleanup
> 
> Ah OK, it might still be worth a comment.

Will do.

-- 
Peter Xu


