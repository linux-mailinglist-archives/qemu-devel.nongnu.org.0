Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CFB506D13
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 15:06:43 +0200 (CEST)
Received: from localhost ([::1]:55074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngnZ4-0001Yw-Ds
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 09:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ngnXH-0000ga-Us
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 09:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ngnXF-0003lD-2t
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 09:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650373487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P76J9lOdMYrZESifkbZap9/2jIbo26AMRuvD73EL2iQ=;
 b=TIxIvJgWGZg1Vnf5kkxciUUV/fJCesLuKgW9QFU3CLtUOuSw/0FT0Gn1/uXz9QeEAHpvQN
 uM88QuCwv/JsxeeLKICoTEGtkY04MsFUzfCrDaPzchKhK74ghfJxT86UnhPawbKP7eDs3j
 MYdBq93PNgSh7W4aM5cQNzPa4/gibM8=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-WYeXNbOqOAWET5tdI020sQ-1; Tue, 19 Apr 2022 09:04:46 -0400
X-MC-Unique: WYeXNbOqOAWET5tdI020sQ-1
Received: by mail-io1-f72.google.com with SMTP id
 x16-20020a6bfe10000000b006409f03e39eso11740401ioh.7
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 06:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P76J9lOdMYrZESifkbZap9/2jIbo26AMRuvD73EL2iQ=;
 b=HEJVw29KeHh8s2GOjePfgXbeETW6qwtays8dBiPKvjrsSGMCxX8blGfPRc2kTGhuS6
 3Sxb4YXgSdHQ78Qq3kLmMtM21U7vVguntWkYiMLx033+FziL6Yc2zwMqP6mzOu297VnK
 RuwKFu7V8tP7yOfa5aZni/AziYhyJV3yC6frSLzXkVMOj5HxbQhainGOiX1xLO6mKZCL
 LvnMAOztoYGq2uVqAd1oHmWqlHurBeMp4mtH7A+lrP9myjTgh0/ugo1SySdtU6CWc4KD
 FuasktRZ3gQ4tFwdZOSVql9djA4QqTU8OrCW3fKLQj8fzXuDEmXqVgVNoiMBLJljAyvs
 8bxA==
X-Gm-Message-State: AOAM533YXMTkIaPiHPdK07AqAbSGFrnGPtwzrWD3QobcbkulR6xBlJAE
 kO0m3kVcfEqevhLEcF70B/y0b4frRisL9k2BOZ6jnxfilmf7GY7pM+6drmgotsD42sYaHMv9GIb
 Wj59Nrln5JR3B8Ys=
X-Received: by 2002:a05:6e02:12c4:b0:2cc:31ab:bf6f with SMTP id
 i4-20020a056e0212c400b002cc31abbf6fmr3387698ilm.105.1650373485839; 
 Tue, 19 Apr 2022 06:04:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBO/GUCD8iX/HmWt45yGwN1fWYzgadCpAyvoM0x5iXuYIYC+uO+rXtr/Fwd3QlIe6ashGKkQ==
X-Received: by 2002:a05:6e02:12c4:b0:2cc:31ab:bf6f with SMTP id
 i4-20020a056e0212c400b002cc31abbf6fmr3387688ilm.105.1650373485622; 
 Tue, 19 Apr 2022 06:04:45 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a6b4104000000b006549fdd0780sm3040846ioa.51.2022.04.19.06.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 06:04:44 -0700 (PDT)
Date: Tue, 19 Apr 2022 09:04:43 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] migration: Read state once
Message-ID: <Yl6za6Pyzt4riPcz@xz-m1.local>
References: <20220413113329.103696-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220413113329.103696-1-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: leobras@redhat.com, pkrempa@redhat.com, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 13, 2022 at 12:33:29PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The 'status' field for the migration is updated normally using
> an atomic operation from the migration thread.
> Most readers of it aren't that careful, and in most cases it doesn't
> matter.
> 
> In query_migrate->fill_source_migration_info the 'state'
> is read twice; the first time to decide which state fields to fill in,
> and then secondly to copy the state to the status field; that can end up
> with a status that's inconsistent; e.g. setting up the fields
> for 'setup' and then having an 'active' status.  In that case
> libvirt gets upset by the lack of ram info.
> The symptom is:
>    libvirt.libvirtError: internal error: migration was active, but no RAM info was set
> 
> Read the state exactly once in fill_source_migration_info.
> 
> This is a possible fix for:
> https://bugzilla.redhat.com/show_bug.cgi?id=2074205
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


