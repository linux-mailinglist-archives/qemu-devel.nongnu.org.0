Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FB96B9D9F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:55:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc8rR-0006fk-0H; Tue, 14 Mar 2023 13:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pc8r6-0006X4-Gt
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pc8r4-0005CA-Gv
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678816470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DSf4qLbKhrSYZHRx2lC6gIZ7secedLZ5SibKTLzk0bA=;
 b=LH1OHchrlu1f9WWdfRVYihAcsrVQb+/qyKc07x2U2hZXXbm7qANLD9BiAW87ZcGd7JNkYd
 RN6idCUvmOivF5UjMkL8WLP6eDBAADfXhdoOAvN6/MtaKinmwvMTxS1cyYefFPKDW57A5K
 CeUXD2MejrAqD9rlMgI+PkXOdPSeL0U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-uT_owh4sMYSPD27IULMqPQ-1; Tue, 14 Mar 2023 13:54:29 -0400
X-MC-Unique: uT_owh4sMYSPD27IULMqPQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 u18-20020a0cec92000000b0056ea549d728so9563258qvo.10
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 10:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678816468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSf4qLbKhrSYZHRx2lC6gIZ7secedLZ5SibKTLzk0bA=;
 b=PcfB0nqGlufKqipxn00HpuuH8G5B7/HQnQ2GM/Frm5Q5oRrZo6Z7Pod6pnOzEZ0hlU
 zE26bzoDhlB3RmOFypXhsW+0yYlzcENMonINACioTfhX/yzk1pPBdyqpEfbbfkoWh7fy
 Y8ZOHPFQ4ErLuAoVXtsYdHWVCAlT5+p7QVcWd2BP1/MB/YKnxWMnvlv8njqA6dILsQqa
 gmjiU9SQaSpJMa+Yg2AzaRBgG7knmwrT3f+xzHYZmohODj9c9o68A8fBOXGupE8mOpJI
 vFgg00HGDfMmJ4bnbtS9Xo8asv+k/7DcnZ589p8xoo6Q7ru2yoSPKVNb7FwxbMdscdwa
 mY+A==
X-Gm-Message-State: AO0yUKVbYziDNnmPz994mYnjrf6/YuY7xbmk036wev1vtqFoRLofVtXP
 XE2XtSrizcsW5wpAoq7qe6QawOfQ2jXVWmr17ru/covH4vZCx3WI8UmNirWI2PCVkP41M0/sPvG
 eL2GcM98bgGF+aqY=
X-Received: by 2002:a05:622a:1aa1:b0:3bf:a061:6cae with SMTP id
 s33-20020a05622a1aa100b003bfa0616caemr23329437qtc.5.1678816468446; 
 Tue, 14 Mar 2023 10:54:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set8DKyXqZtNXkrwZ0FCmVHBS4WqugmiOSzr48m3odIBbwx16AclB9eITm+Ai/go9vLTY45MZbQ==
X-Received: by 2002:a05:622a:1aa1:b0:3bf:a061:6cae with SMTP id
 s33-20020a05622a1aa100b003bfa0616caemr23329417qtc.5.1678816468188; 
 Tue, 14 Mar 2023 10:54:28 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 x7-20020ac87307000000b003b63b8df24asm2204236qto.36.2023.03.14.10.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 10:54:27 -0700 (PDT)
Date: Tue, 14 Mar 2023 13:54:26 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, lizhijian@cn.fujitsu.com,
 jdenemar@redhat.com
Subject: Re: [PATCH] migration/rdma: Fix return-path case
Message-ID: <ZBC00qARI3Lu7YVw@x1n>
References: <20230314171558.75941-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230314171558.75941-1-dgilbert@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Tue, Mar 14, 2023 at 05:15:58PM +0000, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The RDMA code has return-path handling code, but it's only enabled
> if postcopy is enabled; if the 'return-path' migration capability
> is enabled, the return path is NOT setup but the core migration
> code still tries to use it and breaks.
> 
> Enable the RDMA return path if either postcopy or the return-path
> capability is enabled.
> 
> bz: https://bugzilla.redhat.com/show_bug.cgi?id=2063615
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

> @@ -3373,7 +3373,8 @@ static int qemu_rdma_accept(RDMAContext *rdma)
>       * initialize the RDMAContext for return path for postcopy after first
>       * connection request reached.
>       */
> -    if (migrate_postcopy() && !rdma->is_return_path) {
> +    if ((migrate_postcopy() || migrate_use_return_path())
> +        && !rdma->is_return_path) {
>          rdma_return_path = qemu_rdma_data_init(rdma->host_port, NULL);
>          if (rdma_return_path == NULL) {
>              rdma_ack_cm_event(cm_event);

It's not extremely clear to me yet on when we should use migrate_postcopy()
and when to use migrate_postcopy_ram().  I think it's because I don't know
enough on the dirty-bitmaps capability.  Do we have some good documentation
somewhere?

Not much I get from the qapi doc..

# @dirty-bitmaps: If enabled, QEMU will migrate named dirty bitmaps.
#                 (since 2.12)

Thanks,

-- 
Peter Xu


