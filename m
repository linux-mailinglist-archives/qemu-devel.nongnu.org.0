Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5131F2BB138
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:13:11 +0100 (CET)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9yA-0002yy-DC
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg9wc-0001Zy-ML
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:11:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg9wZ-0007MS-VN
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605892290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMkEre8yQjfOsDw+KhgjdYGXAnRpJe5oNnZADQH8kU8=;
 b=PnBhyB4xE5+rPG3pnRuNBCxUi1z2T2CorPBtt0EtaXsuyUJfkXyF7F9iCXV7u3E1NxrdYz
 mX7CtRa822y33qLBX75sN0niQIQZA9nc71X665WrmN+qEsd8qo8R33HnPX5CKfaKkbV7Jv
 oLdo/VppgElEE4rbrcOPjPc4dja7V9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-tCPr8RFNOw2z5CUwdWEtRw-1; Fri, 20 Nov 2020 12:11:27 -0500
X-MC-Unique: tCPr8RFNOw2z5CUwdWEtRw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A36101DDF2
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 17:11:26 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2CA418993;
 Fri, 20 Nov 2020 17:11:25 +0000 (UTC)
Date: Fri, 20 Nov 2020 18:11:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 22/29] vl: initialize displays before preconfig loop
Message-ID: <20201120181123.29ae8b33@redhat.com>
In-Reply-To: <50b90afd-6a41-61d8-44c1-273858cd4947@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-23-pbonzini@redhat.com>
 <20201120161148.0dc2bdcf@redhat.com>
 <85980ae2-9da0-d432-6825-85782f4beee5@redhat.com>
 <20201120173252.743b4208@redhat.com>
 <50b90afd-6a41-61d8-44c1-273858cd4947@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 17:46:14 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 20/11/20 17:32, Igor Mammedov wrote:
> > On Fri, 20 Nov 2020 16:53:41 +0100
> > Paolo Bonzini <pbonzini@redhat.com> wrote:
> >   
> >> On 20/11/20 16:11, Igor Mammedov wrote:  
> >>> On Tue, 27 Oct 2020 14:21:37 -0400
> >>> Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>>      
> >>>> Displays should be available before the monitor starts, so that
> >>>> it is possible to use the graphical console to interact with
> >>>> the monitor itself.
> >>>>
> >>>> This patch is quite ugly, but all this is temporary.  The double
> >>>> call to qemu_init_displays will go away as soon we can unify machine
> >>>> initialization between the preconfig and "normal" flows, and so will
> >>>> the preconfig_exit_requested variable (that is only preconfig_requested
> >>>> remains).
> >>>>
> >>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>  
> >>>
> >>> Doesn't apply to yer for-6.0 branch  
> >>
> >> I updated the branch.  
> > 
> > it probably won't help,
> > what I do review/test is drop these patches on branch
> > and reapply them from this thread.
> > Having v2 on list that applies to master would be better.  
> 
> Yes, of course.  I meant that the for-6.0 branch already _is_ the v2, 
> I'll send it out as soon as I integrate all your feedback.

Thanks for trying to make hornets nest (vl.c) in something manageable and
less scary to touch.
I'll try to review v2 faster (there is not much of it left by now)

> 
> Thanks,
> 
> Paolo
> 
> 


