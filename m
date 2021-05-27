Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1F63937CA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 23:11:40 +0200 (CEST)
Received: from localhost ([::1]:36384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmNI3-0007yD-G5
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 17:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmNGl-00078U-Jk
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:10:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmNGj-0003Al-8D
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622149816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5cFXy+/X41Y/B+UynZ/4ono/TuoRUnDZ6TEExC0rCH8=;
 b=N2JYy4bl52KaalZ6F3XLIiLPcIAt+M9cCR2NPA2IqdqUKmR028bftO0n83fpKhNY6USJJW
 hXsFaTNecpD8Qy5h03y1oWdQQgESHpx/WBNAy0WRdJqKBzxJZqiq4P4wPxe0fbJzdwvuhg
 EHyRL9q90xJtbG5qWw5kXd/KsxFmIt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-bbruRtIwMIG5h2DzDlKZ3g-1; Thu, 27 May 2021 17:10:10 -0400
X-MC-Unique: bbruRtIwMIG5h2DzDlKZ3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE16E107ACE6;
 Thu, 27 May 2021 21:10:09 +0000 (UTC)
Received: from localhost (ovpn-117-209.rdu2.redhat.com [10.10.117.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 709435C3E4;
 Thu, 27 May 2021 21:10:09 +0000 (UTC)
Date: Thu, 27 May 2021 17:10:08 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Ziqiao Kong <ziqiaokong@gmail.com>
Subject: Re: [PATCH v4 1/2] target/i386: Trivial code motion
Message-ID: <20210527211008.axpaxs4pasy57rfv@habkost.net>
References: <20210507080055.258563-1-ziqiaokong@gmail.com>
 <20210517201616.szvgx5xygbgwwhz6@habkost.net>
 <CAM0BWNAOAZucbfj3KnWS5_QQeOQUQoWkU9ZSG1xPFVH9BK2=wA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM0BWNAOAZucbfj3KnWS5_QQeOQUQoWkU9ZSG1xPFVH9BK2=wA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 18, 2021 at 10:53:51AM +0800, Ziqiao Kong wrote:
> On Tue, May 18, 2021 at 4:16 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > On Fri, May 07, 2021 at 04:00:56PM +0800, Ziqiao Kong wrote:
> > > Move the float translation case to a new block by a new pair of braces.
> >
> > If you are just adding braces around the code, do you really need
> > to reindent all the code?  I don't see any mention of `switch`
> > statements on style.rst, but I see 235 existing cases where the
> > brackets are aligned below the `c` in `case`.
> 
> The indention style is from the translate.c itself like here:
> 
> https://github.com/qemu/qemu/blob/master/target/i386/tcg/translate.c#L5634
> 
> There are also many similar cases in translate.c.

Oh, right.  Makes sense to me (and sorry for not noticing this
before).

> 
> >
> > In either case, I'm looking for a description of "why", not
> > "what", but I couldn't find it.  Why are the braces necessary or
> > useful here?
> 
> I have to declare some variables in this case scope, like last_addr, last_seg,
> update_fdp and update_fip according to the previous review. Without the braces
> here, they have to be declared at the beginning of the function like
> the v2 patch.
> Shall I state that in the commit message?

Yes, please.  Ideally every commit message should state the
reason for the change.

-- 
Eduardo


