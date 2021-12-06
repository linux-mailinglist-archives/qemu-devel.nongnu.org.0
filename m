Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F16469183
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 09:30:39 +0100 (CET)
Received: from localhost ([::1]:46104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu9OP-00063Z-OJ
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 03:30:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mu9N4-0004iF-Cs
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:29:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mu9N0-0005YL-Ph
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638779349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Riw5ZhWO6VDNM9rdvlaMX9HXT02X/mM3cb+DDdEwRp0=;
 b=UnpaBWpvihKDFMOSPE8ZylxPZJ86AnK2vhxeLuJG7TUq7hhRHD6IIP0SrHrApMBAjgs0km
 awdHfxXI9MsgX3QNqSYP/rs8nkBeGQYEuSVn1kO7jcXzg1mfXVIXArs+VZOr8nLT4PI6Oo
 s8x+3+Ay8oofD1hRIvnPyVgOpz1zvgg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-FOR-UTSVO1OiFTH2lh-uoQ-1; Mon, 06 Dec 2021 03:29:08 -0500
X-MC-Unique: FOR-UTSVO1OiFTH2lh-uoQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay17-20020a05600c1e1100b0033f27b76819so5725236wmb.4
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 00:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Riw5ZhWO6VDNM9rdvlaMX9HXT02X/mM3cb+DDdEwRp0=;
 b=OFYZMxRRgj5WgfjZLB4rFmnaKnVzfY09Uaru5o+6KeUjOOcdbsOyUZshso1Hi0HvIZ
 FqWT6Xl6H7GSmXbUIJGX4S3vWeWWw76v1cch71bw/Ed3eemtgNsU43x97l2Y5DvHXdwz
 q+fJHksq1hijcPLyVscGEyK1qae0IXQZh3RKibl93nUUrx8/FUeb3u4MTMvBfUVsb3bx
 cZBlNSPtF2mZ3RUBPx1QLsw6nrWu0Ksa1wu4EtKonVR+T02hdcKFBVLFP1TUzeUpAsFA
 /q4jfQxKAY0AnZ3refqctlM+36yAlwHFPRTc6an8Cpv771akzN6v3QjwvEZSvfe+eXL/
 60HA==
X-Gm-Message-State: AOAM533Gy2DmzwB4R8G21Ugzb+B4lbebGdsHXhke6jbKVlYkjlLwfQAX
 3xnVdPY+hruLG87u9bO0U6Knjf2XDNl+zNst4V60nAo4ePWFBFUGulM740XECONc3436j647XOf
 SGXkgjGsDktKskIc=
X-Received: by 2002:adf:e60e:: with SMTP id p14mr42132045wrm.470.1638779347093; 
 Mon, 06 Dec 2021 00:29:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNeELm57z04IQoguGJvcx1d4w5MPQPhZbQHY/zRqSDGQUV7zkX5dkT2XtaYKEPw7hhHZcZgQ==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr42132015wrm.470.1638779346809; 
 Mon, 06 Dec 2021 00:29:06 -0800 (PST)
Received: from xz-m1.local ([85.203.46.183])
 by smtp.gmail.com with ESMTPSA id m17sm10461463wrz.22.2021.12.06.00.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 00:29:06 -0800 (PST)
Date: Mon, 6 Dec 2021 16:28:59 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v9 3/3] cpus-common: implement dirty page limit on vCPU
Message-ID: <Ya3Jy1nWVRz12NHv@xz-m1.local>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <cover.1638495274.git.huangy81@chinatelecom.cn>
 <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
 <87tufpyiij.fsf@dusky.pond.sub.org>
 <65a49c9f-9287-b950-8fde-40fa9a4a28fe@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <65a49c9f-9287-b950-8fde-40fa9a4a28fe@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 04, 2021 at 08:00:19PM +0800, Hyman Huang wrote:
> 
> 
> 在 2021/12/3 20:34, Markus Armbruster 写道:
> > huangy81@chinatelecom.cn writes:
> > 
> > > From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> > > 
> > > Implement dirtyrate calculation periodically basing on
> > > dirty-ring and throttle vCPU until it reachs the quota
> > > dirty page rate given by user.
> > > 
> > > Introduce qmp commands "vcpu-dirty-limit", "query-vcpu-dirty-limit"
> > > to enable, disable, query dirty page limit for virtual CPU.
> > > 
> > > Meanwhile, introduce corresponding hmp commands "vcpu_dirty_limit",
> > > "info vcpu_dirty_limit" so developers can play with them easier.
> > > 
> > > Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> > 
> > [...]
> > 
> > I see you replaced the interface.  Back to square one...
> > 
> > > diff --git a/qapi/migration.json b/qapi/migration.json
> > > index 3da8fdf..dc15b3f 100644
> > > --- a/qapi/migration.json
> > > +++ b/qapi/migration.json
> > > @@ -1872,6 +1872,54 @@
> > >               'current-rate': 'int64' } }
> > >   ##
> > > +# @vcpu-dirty-limit:
> > > +#
> > > +# Set or cancel the upper limit of dirty page rate for a virtual CPU.
> > > +#
> > > +# Requires KVM with accelerator property "dirty-ring-size" set.
> > > +# A virtual CPU's dirty page rate is a measure of its memory load.
> > > +# To observe dirty page rates, use @calc-dirty-rate.
> > > +#
> > > +# @cpu-index: index of virtual CPU.
> > > +#
> > > +# @enable: true to enable, false to disable.
> > > +#
> > > +# @dirty-rate: upper limit of dirty page rate for virtual CPU.
> > > +#
> > > +# Since: 7.0
> > > +#
> > > +# Example:
> > > +#   {"execute": "vcpu-dirty-limit"}
> > > +#    "arguments": { "cpu-index": 0,
> > > +#                   "enable": true,
> > > +#                   "dirty-rate": 200 } }
> > > +#
> > > +##
> > > +{ 'command': 'vcpu-dirty-limit',
> > > +  'data': { 'cpu-index': 'int',
> > > +            'enable': 'bool',
> > > +            'dirty-rate': 'uint64'} }
> > 
> > When @enable is false, @dirty-rate makes no sense and is not used (I
> > checked the code), but users have to specify it anyway.  That's bad
> > design.
> > 
> > Better: drop @enable, make @dirty-rate optional, present means enable,
> > absent means disable.
> Uh, if we drop @enable, enabling dirty limit should be like:
> vcpu-dirty-limit cpu-index=0 dirty-rate=1000
> 
> And disabling dirty limit like:
> vcpu-dirty-limit cpu-index=0
> 
> For disabling case, there is no hint of disabling in command
> "vcpu-dirty-limit".
> 
> How about make @dirty-rate optional, when enable dirty limit, it should
> present, ignored otherwise?

Sounds good, I think we can make both "enable" and "dirty-rate" optional.

To turn it on we either use "enable=true,dirty-rate=XXX" or "dirty-rate=XXX".

To turn it off we use "enable=false".

> 
> > 
> > > +
> > > +##
> > > +# @query-vcpu-dirty-limit:
> > > +#
> > > +# Returns information about the virtual CPU dirty limit status.
> > > +#
> > > +# @cpu-index: index of the virtual CPU to query, if not specified, all
> > > +#             virtual CPUs will be queried.
> > > +#
> > > +# Since: 7.0
> > > +#
> > > +# Example:
> > > +#   {"execute": "query-vcpu-dirty-limit"}
> > > +#    "arguments": { "cpu-index": 0 } }
> > > +#
> > > +##
> > > +{ 'command': 'query-vcpu-dirty-limit',
> > > +  'data': { '*cpu-index': 'int' },
> > > +  'returns': [ 'DirtyLimitInfo' ] }
> > 
> > Why would anyone ever want to specify @cpu-index?  Output isn't that
> > large even if you have a few hundred CPUs.
> > 
> > Let's keep things simple and drop the parameter.
> Ok, this make things simple.

I found that it'll be challenging for any human being to identify "whether
he/she has turned throttle off for all vcpus"..  I think that could be useful
when we finally decided to cancel current migration.

I thought about adding a "global=on/off" flag, but instead can we just return
the vcpu info for the ones that enabled the per-vcpu throttling?  For anyone
who wants to read all vcpu dirty information he/she can use calc-dirty-rate.

Thanks,

-- 
Peter Xu


