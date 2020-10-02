Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCD3281A15
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 19:49:08 +0200 (CEST)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOPB5-0004CG-BK
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 13:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kOP6n-0000XM-SV
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 13:44:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kOP6l-00046q-E8
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 13:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601660677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HIea7y7X+NxBpHc47NyrmUwfwINqhs69uPOP9YCfci8=;
 b=ZTLbFHhV4iOZPZXLzLwIbzsDkzPAEBeNQjyXCUCBw/vjPhqm3JveKpc6O76sgrDcys7kcn
 xPG7MtP3vecKXaCGkREPrPXop38ABgeCBFom/EbLxneAsuML9WVZkQRwxJTUQgQgRhD43c
 TOZthFY2WiakUC9FiOfRLoGs57r5Fuo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-X5em2jJwPkiNsLnZFUi5lw-1; Fri, 02 Oct 2020 13:44:35 -0400
X-MC-Unique: X5em2jJwPkiNsLnZFUi5lw-1
Received: by mail-qv1-f70.google.com with SMTP id ct11so1272031qvb.16
 for <qemu-devel@nongnu.org>; Fri, 02 Oct 2020 10:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HIea7y7X+NxBpHc47NyrmUwfwINqhs69uPOP9YCfci8=;
 b=bsADje/iYyHQz5GzPR6E7Yg+6CevHoEx5KaVzPPVUCqAYzOJmTQg252aoQD9HiEkh1
 jzYmARO5+HoSmhTnFFPla/3zRGqko+SQcngxoqTKe6V9XLWqcjb+G62fB2oz+J1r+AeF
 by5IPMQxvNlDH3ZYdD2nC0Y7HG3glpJQF1vxbpSQLS5iQ60O+SFyeAADQORXHM2e4SZ4
 d8yMepunB0dK1VZgfiXvlzEHikN5VpGlbKijEhYEU7tH42QvIhpTS+8qDg57u23aOTiy
 OAYxcGbXdIgxe8ZiXZ4DGX8/5WrUFoWO0jVEVoXGKbUNmZ+CjGFFVw+M8F+TJ0pN1rUR
 1CAg==
X-Gm-Message-State: AOAM533ZR/TQ/PjzdsGWfrLbjRPe+hVBs5NNZig0HT2OHXrtORn7qnbA
 UFOOOrFrc68v0aZhJMbnxMyRJINZimzdqw7pxeDdAG20KH3M4Wa/jNNo6FkUuQNj/tmYparcM0O
 MmMYD3m/Taq5gZYU=
X-Received: by 2002:aed:3ee7:: with SMTP id o36mr3442883qtf.244.1601660674747; 
 Fri, 02 Oct 2020 10:44:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg4VgrGKGPkMF9NeKXatid1AH3tc3wg8UQjvOXc9SwfgcGXpQbkhkhJjsAJFMLJ291weJCRA==
X-Received: by 2002:aed:3ee7:: with SMTP id o36mr3442848qtf.244.1601660674408; 
 Fri, 02 Oct 2020 10:44:34 -0700 (PDT)
Received: from xz-x1 (toroon474qw-lp130-09-184-147-14-204.dsl.bell.ca.
 [184.147.14.204])
 by smtp.gmail.com with ESMTPSA id d21sm1491077qtp.97.2020.10.02.10.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 10:44:33 -0700 (PDT)
Date: Fri, 2 Oct 2020 13:44:32 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 4/4] migration: Sync requested pages after postcopy
 recovery
Message-ID: <20201002174432.GC5473@xz-x1>
References: <20201001182641.80232-1-peterx@redhat.com>
 <20201001182641.80232-5-peterx@redhat.com>
 <20201002172646.GL3286@work-vm>
MIME-Version: 1.0
In-Reply-To: <20201002172646.GL3286@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 23:37:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Xiaohui Li <xiaohli@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 02, 2020 at 06:26:46PM +0100, Dr. David Alan Gilbert wrote:
> > +    trace_postcopy_page_req_sync((uint64_t)(uintptr_t)host_addr);
> 
> Again that's a case for host_addr and a %p I think.

Yeah, I'll fix both places and repost.  Thanks.

-- 
Peter Xu


