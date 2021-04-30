Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A2370377
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 00:29:02 +0200 (CEST)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcbd7-0004r0-6M
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 18:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lcbc6-0004QN-Ue
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lcbc3-0007vf-T3
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619821673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sAZmsHV+0FR5h6OQ/ELT+vydk2Eye99tPqv3pjLTN8g=;
 b=FfEC6iepJSllRYGIo54lN9CS6iPacvhXy3jy1gz3JUxucNnLkJYzIgB5VTAtjxDAUEyOzP
 S4PwFCWySBNNDwfLkbkLNVR+Lcozafh8ylXAr9mUfv4q/Gf6bmYkNhBa8OeLbKv05CkhDL
 06tREpjZRbmIPUCfrLSdzVO5Z97zI8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-rLOZZS9XOK-FJXQ5FauFWw-1; Fri, 30 Apr 2021 18:27:51 -0400
X-MC-Unique: rLOZZS9XOK-FJXQ5FauFWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BFB88189C3;
 Fri, 30 Apr 2021 22:27:50 +0000 (UTC)
Received: from localhost (ovpn-115-66.phx2.redhat.com [10.3.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CC922C167;
 Fri, 30 Apr 2021 22:27:50 +0000 (UTC)
Date: Fri, 30 Apr 2021 18:27:49 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Subject: Re: [PATCH v2] target/i386: add "-cpu, lbr-fmt=*" support to enable
 guest LBR
Message-ID: <20210430222749.xane2ewbu6jka6fz@habkost.net>
References: <20210427080948.439432-1-like.xu@linux.intel.com>
 <20210428211908.ysogzmzh2ulpajgq@habkost.net>
 <2dddf3ba-27d8-7297-1b70-16ca8e09088d@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <2dddf3ba-27d8-7297-1b70-16ca8e09088d@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, wei.w.wang@intel.com,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 30, 2021 at 11:20:08AM +0800, Like Xu wrote:
[...]
> > > +    if (cpu->lbr_fmt) {
> > > +        if (!cpu->enable_pmu) {
> > > +            error_setg(errp, "LBR is unsupported since guest PMU is disabled.");
> > > +            return;
> > > +        }
> > > +        env->features[FEAT_PERF_CAPABILITIES] |= cpu->lbr_fmt;
> > 
> > This doesn't seem right, as we should still do what the user
> > asked for if "lbr-fmt=0" is used.
> > 
> > You need to differentiate "lbr-fmt=0" from "lbr-fmt not set"
> > somehow.  I suggest initializing lbr_fmt to 0xFF by default,
> > so you can override env->features[FEAT_PERF_CAPABILITIES]
> > when lbr_fmt != 0xFF (even if lbr_fmt=0).
> 
> 
> > 
> > Something like this:
> > 
> >    #define LBR_FMT_UNSET 0xff
> >    ...
> >    DEFINE_PROP_UINT8("lbr-fmt", X86CPU, lbr_fmt, LBR_FMT_UNSET)
> >    ...
> > 
> >    void x86_cpu_realizefn(...)
> >    {
> >        ...
> >        if (cpu->lbr_fmt != LBR_FMT_UNSET) {
> >            if ((cpu->lbr_fmt & LBR_FMT_FMT) != cpu->lbr_fmt) {
> >                error_setg(errp, "invalid lbr-fmt" ...);
> >                return;
> >            }
> >            env->features[FEAT_PERF_CAPABILITIES] &= ~PERF_CAP_LBR_FMT;
> >            env->features[FEAT_PERF_CAPABILITIES] |= cpu->lbr_fmt;
> >        }
> >        /* If lbr_fmt == LBR_FMT_UNSET, the default value of env->features[]
> >         * will be used as is (and it may depend on the "migratable" flag)
> >         */
> 
> How about the user use "-cpu host,lbr-fmt=0xff" ?
> 
> The proposed code does nothing about warning or error,
> but implicitly uses the the default value of env->features[]
> 
> Users may have an illusion that the "lbr-fmt=0xff" is a "valid" lbr-fmt
> and it may enable guest LBR (depend on the "migratable" flag).

You are correct, lbr-fmt=0xff will be synonymous to "use default
lbr-fmt", but this won't be obvious.

You can avoid this by validating the user-provided value in a
property setter.  Or you could just document that 0xff has a
special meaning, to avoid a custom setter.  I believe custom
setters are more likely to cause us problems in the future than
users fiddling with obviously an invalid lbr-fmt value.

-- 
Eduardo


