Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4ED667E31
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 19:37:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG2RL-0006Mv-H4; Thu, 12 Jan 2023 13:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG2RB-0006MP-Bn
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 13:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG2R9-0002Zr-Gs
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 13:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673548586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K2FNIMcvjy95AH1GZC97PgPiimTwS5vjcChfEOFCdKQ=;
 b=eNDZTVFB/2kyCRu/FKU9pVMUKWOy2eU4Zsyj+SX7SFfWPRl7T2r93+NnY/yHrDFJ97/zIh
 YVqkPSm93hrn6JNU0oNj9rUeaUoqZ/gBDiTyGp1RoJCofjJS5VJBABjFzCd08hzoypeuG7
 +MsqKy9OLkAMs9inrHErDMzRrKjWHVM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-288-za-CtfBVMCKBWPDsLcbJSA-1; Thu, 12 Jan 2023 13:36:25 -0500
X-MC-Unique: za-CtfBVMCKBWPDsLcbJSA-1
Received: by mail-wr1-f70.google.com with SMTP id
 j11-20020adfa54b000000b002bd9b1e1656so2140480wrb.15
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 10:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2FNIMcvjy95AH1GZC97PgPiimTwS5vjcChfEOFCdKQ=;
 b=gE1e5wFbzicaa3PW6y2KQM41t2hKpp3I6N9id+9TVGd8wc4JP9aM4yrYDVBLIePyj8
 GF362hUN7ZZ+C2qZSpKEbRIMOgrWq6pQPrz6cbeuWZ3PjdArS0e9vTz1hfJyTJROw7at
 QDYpUWeae1hM+mcpaOGfa8lyZHWM7LrkxPBpJR/uvo+DPvMlOa9UHFwvE4fMPsTq4BFm
 OzBzs24b7cvmAw6Tt677FXRFxj3jYoXXf4WY0tZZfj2M/U6zmh9ReYbMojiv3EGXOgsG
 QISzgC1vpeZh91FEKKRdxwk/Xh2ib+JBcYC0LD65Ty8pXrz4lyXf1pJMiL3ZJwDN/BcT
 /ZvQ==
X-Gm-Message-State: AFqh2kpt5zJ13CTLTgP/NtGPa6VczZt7V/ZPBEuSRT98waG77+W40J5Q
 OxeyFzxI9SGeeTAujvWTwIbl6V5oB9Ri8YeOCChLNh9ZUgGPu5UfI8q2B0ELik6gtNeGlLxqAFj
 aGU9tgEymYp9JSII=
X-Received: by 2002:a05:600c:c07:b0:3d9:73fe:96f8 with SMTP id
 fm7-20020a05600c0c0700b003d973fe96f8mr49698403wmb.32.1673548584056; 
 Thu, 12 Jan 2023 10:36:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtGC6FoFXkKAW+9d7Ss53ENUEgwUGESomYrRVwMJkhvcHUsdAG391lH7EDfd87vkm/EVxdevQ==
X-Received: by 2002:a05:600c:c07:b0:3d9:73fe:96f8 with SMTP id
 fm7-20020a05600c0c0700b003d973fe96f8mr49698398wmb.32.1673548583878; 
 Thu, 12 Jan 2023 10:36:23 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 bh13-20020a05600c3d0d00b003d358beab9dsm22347119wmb.47.2023.01.12.10.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 10:36:23 -0800 (PST)
Date: Thu, 12 Jan 2023 18:36:21 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 1/8] migration/savevm: Move more savevm handling into
 vmstate_save()
Message-ID: <Y8BTJVQhkpenEeKH@work-vm>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-2-david@redhat.com>
 <Y8A8J78zL3hW9z34@work-vm>
 <6ee9e268-efe9-87bc-d198-08784ce73f72@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ee9e268-efe9-87bc-d198-08784ce73f72@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* David Hildenbrand (david@redhat.com) wrote:
> On 12.01.23 17:58, Dr. David Alan Gilbert wrote:
> > * David Hildenbrand (david@redhat.com) wrote:
> > > Let's move more code into vmstate_save(), reducing code duplication and
> > > preparing for reuse of vmstate_save() in qemu_savevm_state_setup(). We
> > > have to move vmstate_save() to make the compiler happy.
> > > 
> > > We'll now also trace from qemu_save_device_state().
> > 
> > Mostly OK, but..
> > 
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > ---
> > >   migration/savevm.c | 79 ++++++++++++++++++++++------------------------
> > 
> > Doesn't this also need to upate trace-events?
> 
> The existing trace events from
> qemu_savevm_state_complete_precopy_non_iterable() are simply moved to
> vmstate_save(), so qemu_save_device_state() will implicitly use them.
> 
> So no update should be needed (no new events), or am I missing something?

Aren't you losing the trace_savevm_state_setup() trace?

Dave

> Thanks!
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


