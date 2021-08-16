Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929FF3EDD4E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 20:46:12 +0200 (CEST)
Received: from localhost ([::1]:38574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFhch-0008P6-Db
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 14:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mFhb2-0007in-A2
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:44:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mFhay-0007ae-G9
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629139462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XPA6z3vyl7JbUvLu9jE6N+ENipuPdAEJE+qpI9/O9dg=;
 b=BOEUZeK0IP4FQnwud4RWlKkkb1KO+cIu856CKQFjpsPS+DoPR9GVvBUB3Mgvom4uO0kR7c
 0O8MVIHAw7mCouKqH8670SlBGAHuhZJQirWa4VlOhBYowDWm3giK1xCX7rGA6TzKiqOW5a
 HbVZXSvJ34KpyndOkzISGrorIosgBSQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-r_tEBSwHOWCHe0n0tOe9Mw-1; Mon, 16 Aug 2021 14:44:21 -0400
X-MC-Unique: r_tEBSwHOWCHe0n0tOe9Mw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so237506wmr.9
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 11:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XPA6z3vyl7JbUvLu9jE6N+ENipuPdAEJE+qpI9/O9dg=;
 b=e9YMppo9nknnsUiPYyLI5rBBhE2G1WxIih/vtUt94WyYkMCmSasJ+AlSjoH0MUNSbi
 ihp8NrMQjeVvqDJS9ZwBHs/FJkQXeVySVe3BgVMs7a15NcdNnKvFuDGE+JOC6yd0mL/+
 AB2u3fQxOXOaVc9WhieTqEfzzcmJO7y/jaCVf5SNGqYX3Ax7gCS+1qAW3AxhE4ho4Dkh
 grkNy7lX7WRDna7v7cr72vH8rWryc1Ik5ggOZicbVllK/Onli/1j+oZhI3PBcfF7nRLC
 zGI1V50ap3AOdiv2jp45+8XdtsMMpoT0kMxq7nKWRsY91oppAE6GwSuikFIRbju1ti0K
 5OBA==
X-Gm-Message-State: AOAM530wQnWgVga4+Sz8Jc/CDi3oehmBiHzk3qpLCbGCgyFHB5YVCCTd
 Cphy4eL0CFbVM7obdq52XvKyMduwsIoWbZlCzf9FtNosLANHf/s4QreXb0Ue9qVMddJGaQdiIFI
 zlE1Xm7EdIgJtdf8=
X-Received: by 2002:a5d:6186:: with SMTP id j6mr20600292wru.115.1629139459923; 
 Mon, 16 Aug 2021 11:44:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymfT/wJKmS1m6HzQlrLJQfUSdnfwJwfUgMsaAlfDdT5M4rQYUhy1v5WR8kbt8ZTEl5wDFDcw==
X-Received: by 2002:a5d:6186:: with SMTP id j6mr20600269wru.115.1629139459658; 
 Mon, 16 Aug 2021 11:44:19 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id o17sm309101wmp.13.2021.08.16.11.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 11:44:18 -0700 (PDT)
Date: Mon, 16 Aug 2021 19:44:16 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Subject: Re: [PATCH v4 01/14] doc: update AMD SEV API spec web link
Message-ID: <YRqyAJrq5Nb5Bt7J@work-vm>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <3c88c509d6b96f8beaf5335b8c266714405cc09e.1628076205.git.ashish.kalra@amd.com>
MIME-Version: 1.0
In-Reply-To: <3c88c509d6b96f8beaf5335b8c266714405cc09e.1628076205.git.ashish.kalra@amd.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Thomas.Lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 jejb@linux.ibm.com, tobin@ibm.com, qemu-devel@nongnu.org,
 dovmurik@linux.vnet.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Ashish Kalra (Ashish.Kalra@amd.com) wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>

Lets get this little change out the way; please resend just this patch to
qemu-trivial@nongnu.org  and we can have one less patch on this series.

Dave

> ---
>  docs/amd-memory-encryption.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
> index ffca382b5f..12ca25180e 100644
> --- a/docs/amd-memory-encryption.txt
> +++ b/docs/amd-memory-encryption.txt
> @@ -88,8 +88,8 @@ expects.
>  LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
>  context.
>  
> -See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
> -complete flow chart.
> +See Secure Encrypted Virtualization Key Management API spec section
> +'Launching a guest' usage flow  (Appendix A) for the complete flow chart.
>  
>  To launch a SEV guest
>  
> -- 
> 2.17.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


