Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CE749E575
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 16:08:44 +0100 (CET)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD6OB-0007f3-Ey
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 10:08:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nD6Jb-0004Jx-UA
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:04:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nD6JY-0001BI-JR
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643295834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q8VKhsEJ/bXCy5ebMY5hyL/dbw9XPS2Zq9MUQWrn07s=;
 b=Vk8QuehC2BJoy4kDY8eczrRZ3u12acYay1XJpJ8F3KqWGE2FS5ET+W0jHHqbAWoS7+20Vr
 i9DCB3syeeXt/XXG7q6vF6F5k7WTHQ7n6T7eQGugLJEj9GMgZPo3Z9r32BLJv3wdwJQcsV
 VDUROQiYJuqYRM1a8ujm1e0ThKZwcDQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-gGpBBDkJOdGCjty840j-IQ-1; Thu, 27 Jan 2022 10:03:53 -0500
X-MC-Unique: gGpBBDkJOdGCjty840j-IQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so1186804wrc.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q8VKhsEJ/bXCy5ebMY5hyL/dbw9XPS2Zq9MUQWrn07s=;
 b=wHhBa3Zd/4xEUc6bCJ4zaB88kxPDHp+EghdBT9lf27rpKDC2QQHA1iNP3xLsUN5pAw
 QF+fjd5Vslv1U9ZBhYfZQW5w1FLBHqqFydOqYfABPeczhT2l0zzedWoau+PmlnYA+m8O
 al07vGQ+piri3Ri4zyARINKQ3pwz1klQJREO0Caj7pcBxII+FhsbRsP76nf3edlBvaLJ
 eAtPCQAsWAJBNvlRJ1VBHDt4YfZ1eaMCVxJkzUG/xQK1LXSIt7YRpTek8pN+/QS39kJi
 bYSl8rrOqP/Fd0o0OFK2Zx7eXJDnjeDMihaEqg/mcoEnxyNnff8Wi9SOeAytvUz/SqAb
 +BVw==
X-Gm-Message-State: AOAM530kL6e/dIe4QWg066hJAjepRpboNNDMlnhRIj7Cpi9hlrpEnuBm
 DJiKCPJtWaxS2Lmzfwap51GsZ1PTR4J6vq64wIAFHCIw7CodAPL9WI47BCof5NmT3VMmFJ3Uw4u
 DSg0aK5PEI45RkVE=
X-Received: by 2002:a7b:c3c3:: with SMTP id t3mr3769739wmj.94.1643295832469;
 Thu, 27 Jan 2022 07:03:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVYF9njyB7m1x2DvRfFrvof9FwzIDvbGWf3yaDMcuDkT/LRMCnj5Fmp2P6fql4tO2F9a4PrQ==
X-Received: by 2002:a7b:c3c3:: with SMTP id t3mr3769722wmj.94.1643295832257;
 Thu, 27 Jan 2022 07:03:52 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m5sm2453366wms.4.2022.01.27.07.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:03:51 -0800 (PST)
Date: Thu, 27 Jan 2022 15:03:49 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 08/23] multifd: Move iov from pages to params
Message-ID: <YfK0VUtFpxISRXV0@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-9-quintela@redhat.com>
 <Yeb/aaVGA+gphb/q@work-vm> <87lez4rwkq.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87lez4rwkq.fsf@secure.mitica>
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
> >> This will allow us to reduce the number of system calls on the next patch.
> >> 
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> ---
> >>  migration/multifd.h |  8 ++++++--
> >>  migration/multifd.c | 34 ++++++++++++++++++++++++----------
> >>  2 files changed, 30 insertions(+), 12 deletions(-)
> >> 
> >> diff --git a/migration/multifd.h b/migration/multifd.h
> >> index e57adc783b..c3f18af364 100644
> >> --- a/migration/multifd.h
> >> +++ b/migration/multifd.h
> >> @@ -62,8 +62,6 @@ typedef struct {
> >>      uint64_t packet_num;
> >>      /* offset of each page */
> >>      ram_addr_t *offset;
> >> -    /* pointer to each page */
> >> -    struct iovec *iov;
> >>      RAMBlock *block;
> >>  } MultiFDPages_t;
> >>  
> >> @@ -110,6 +108,10 @@ typedef struct {
> >>      uint64_t num_pages;
> >>      /* syncs main thread and channels */
> >>      QemuSemaphore sem_sync;
> >> +    /* buffers to send */
> >> +    struct iovec *iov;
> >> +    /* number of iovs used */
> >> +    uint32_t iovs_num;
> >>      /* used for compression methods */
> >>      void *data;
> >>  }  MultiFDSendParams;
> >> @@ -149,6 +151,8 @@ typedef struct {
> >>      uint64_t num_pages;
> >>      /* syncs main thread and channels */
> >>      QemuSemaphore sem_sync;
> >> +    /* buffers to recv */
> >> +    struct iovec *iov;
> >
> > Why is there the asymmetry between send and recv, where the send
> > has the iovs_num and the recv doesn't?
> 
> When we are sending data, we have the normal page and the iov, so it is
> normal_pages + 1.  On reception side, we have to read first the header,
> because that is where normal_pages is stored.
> 
> I can drop iovs_num on the send side and add a comment, but I think that
> the new variable is more descriptive.
> 
> Or I can add iovs_num to the recv_side and just do a iovs_num =
> normal_pages, but it seems a bit pointless, no?

OK, it would be great to add a comment; because it jumps out as a little
odd.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> 
> Later, Juan.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


