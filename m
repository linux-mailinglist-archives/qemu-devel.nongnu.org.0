Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B23937C7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 23:09:45 +0200 (CEST)
Received: from localhost ([::1]:34054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmNGC-0006FS-Pa
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 17:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmNFS-0005aZ-Mp
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmNFR-0002Oj-50
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622149736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EbOq6ogGQQrRyIgbbiWrAOCoA3AE8cBjWh7Z/Ij52Ss=;
 b=DhMeDZRGmKYvn6GtPhrlDVAHxr3t4VpXPchgxie2AVt1c6fp//TQcaNgDMw/qJdF34hVd5
 YWPsUs9uxvEWshKc+W747NZvawm4SetdHI45+eomXNVDZ1POi8BKGYDrxa49SAQYKPWl0f
 B4I9cuEWNbpEUmy+TOKWQQkiwJD04uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61--nxkzoJVO_qMo5vWWsEfeQ-1; Thu, 27 May 2021 17:08:53 -0400
X-MC-Unique: -nxkzoJVO_qMo5vWWsEfeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A9C41020C33;
 Thu, 27 May 2021 21:08:52 +0000 (UTC)
Received: from localhost (ovpn-117-209.rdu2.redhat.com [10.10.117.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34B215C22B;
 Thu, 27 May 2021 21:08:52 +0000 (UTC)
Date: Thu, 27 May 2021 17:08:51 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Ziqiao Kong <ziqiaokong@gmail.com>
Subject: Re: [PATCH v4 2/2] target/i386: Correct implementation for FCS, FIP, 
 FDS and FDP
Message-ID: <20210527210851.y6r7z3kapzg7dgdg@habkost.net>
References: <20210507080055.258563-1-ziqiaokong@gmail.com>
 <20210507080055.258563-2-ziqiaokong@gmail.com>
 <20210517202934.qghui32kfrv6zgns@habkost.net>
 <CAM0BWNBHwKst1USrGv6kcnPA9omLFjAW_+bJybYDrDhhynxqQg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM0BWNBHwKst1USrGv6kcnPA9omLFjAW_+bJybYDrDhhynxqQg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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

On Tue, May 18, 2021 at 11:06:56AM +0800, Ziqiao Kong wrote:
[...]
> > > +    /*
> > > +     * If CR0.PE = 1, each instruction saves FCS and FDS into memory. If
> > > +     * CPUID.(EAX=07H,ECX=0H):EBX[bit 13] = 1, the processor deprecates
> > > +     * FCS and FDS; it saves each as 0000H.
> > > +     */
> > > +    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_FCS_FDS)
> > > +        && (env->cr[0] & CR0_PE_MASK)) {
> > > +        fpcs = env->fpcs;
> > > +        fpds = env->fpds;
> >
> >
> > If you want to start supporting this feature flag, I suggest
> > moving this to a separate patch.  The description of this patch
> > seems to imply it is just a bug fix, not the implementation of a
> > new feature flag.
> >
> > When adding support for a new feature flag in TCG code, you need
> > to extend TCG_*_FEATURES in target/i386/cpu.c, otherwise the
> > feature flag will never be enabled by the CPU configuration code.
> 
> Yes, currently this feature flag is never enabled for all CPU types.
> How about removing this
> feature flag in this patch and leaving a TODO in the comment? Thus I
> can issue another patch
> to complete the feature later.

Sounds better to me.  Otherwise you'll be just adding dead code
(because the flag will is impossible to be enabled if it's not
present in TCG_*_FEATURES).

-- 
Eduardo


