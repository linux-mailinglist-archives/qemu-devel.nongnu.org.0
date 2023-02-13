Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0836949DC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:02:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRaKw-00017L-JH; Mon, 13 Feb 2023 10:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pRaKo-00016r-7O
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:01:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pRaKm-0000lR-9E
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676300494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KH0+rfcrpdMFszWCQVUfZyYIQ8xRjCPW7Fa6G7tIyfc=;
 b=GZnZKNikUp9HBkByKJUVFBDh/tgA5LrFS8fNNT5L1jMcGQmV4KPRKW7cMagKWZvllIMEoL
 +nAyQ0B+RgANUu2U0uv7nv9ywlE2DKQdvkqZkzY9+tt2Oxt8KBGJgQtUawLOgFEiS2ManF
 KVBTFzcdFM/Fcuom3MbIQfm8N9YscCw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-AJrhgtv2MOWlXnCAJDDy4g-1; Mon, 13 Feb 2023 10:01:26 -0500
X-MC-Unique: AJrhgtv2MOWlXnCAJDDy4g-1
Received: by mail-wm1-f70.google.com with SMTP id
 b19-20020a05600c4e1300b003e10d3e1c23so8923215wmq.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 07:01:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KH0+rfcrpdMFszWCQVUfZyYIQ8xRjCPW7Fa6G7tIyfc=;
 b=ESB71Mb5l614oxUSYzDmH8ECrv7AioIbxYMVYi62yE1F9swR8SByE3DMul3DAW/MFg
 YdLkJMAE31kSVHSVg/tqQRfXcJWo5h0qs02cDvjpLnPeNmKKzgCL1EsBDY6k/4VvGgL0
 703dytRO0x2XWL+0emIn5p09/8pmZST+RAMJV90cXF8KBRtrI95OF0+5U1oYlWmN8Zuc
 XXdUcFI6z9xibd1ByRDfYrOTDz+ubZvbV2IWAoZ0VZ6IBEykrsVb5UdKDeGy+0S3jE5L
 7oZXwXIWrdvTN/sqObGr1Q3hsdjKS9bF8eX5b79AvYVCHWmYNjWVU6uu6/z7Ycmibiwt
 OCdA==
X-Gm-Message-State: AO0yUKW1D8BTWd1b2ZVazrBPisinT9wBB8ODdgMAIS6cqhM1jiJxNRGp
 ysv4IKUcBusz+3NMxPMQdima7p7MXzfvVp6AvXdyJg1fmthpDUUDdRNUcfGUw57mfPylcNLL4ft
 Aeu3xo5AclvT4bOY=
X-Received: by 2002:a05:600c:43d3:b0:3db:1919:41b5 with SMTP id
 f19-20020a05600c43d300b003db191941b5mr18949828wmn.21.1676300485044; 
 Mon, 13 Feb 2023 07:01:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8jXdIZ3TG5oJWtA97GjEl458+zmAMqIKb6w7Pe6eda9Pi43U3euhr2MkZvzcme4zTnnxeeaQ==
X-Received: by 2002:a05:600c:43d3:b0:3db:1919:41b5 with SMTP id
 f19-20020a05600c43d300b003db191941b5mr18949793wmn.21.1676300484688; 
 Mon, 13 Feb 2023 07:01:24 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 be7-20020a05600c1e8700b003dff2b493c8sm18744710wmb.36.2023.02.13.07.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 07:01:24 -0800 (PST)
Date: Mon, 13 Feb 2023 15:01:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Subject: Re: [RFC PATCH 0/5] Deprecate/rename singlestep command line option
Message-ID: <Y+pQwn3u45zVhxYo@work-vm>
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
 <87h6vxo4em.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6vxo4em.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Markus Armbruster (armbru@redhat.com) wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > The command line option '-singlestep' and its HMP equivalent
> > the 'singlestep' command are very confusingly named, because
> > they have nothing to do with single-stepping the guest (either
> > via the gdb stub or by emulation of guest CPU architectural
> > debug facilities). What they actually do is put TCG into a
> > mode where it puts only one guest instruction into each
> > translation block. This is useful for some circumstances
> > such as when you want the -d debug logging to be easier to
> > interpret, or if you have a finicky guest binary that wants
> > to see interrupts delivered at something other than the end
> > of a basic block.
> >
> > The confusing name is made worse by the fact that our
> > documentation for these is so minimal as to be useless
> > for telling users what they really do.
> >
> > This series:
> >  * renames the 'singlestep' global variable to 'one_insn_per_tb'
> >  * Adds new '-one-insn-per-tb' command line options and a
> >    HMP 'one-insn-per-tb' command
> >  * Documents the '-singlestep' options and 'singlestep'
> >    HMP command as deprecated synonyms for the new ones
> >
> > It does not do anything about the other place where we surface
> > 'singlestep', which is in the QMP StatusInfo object returned by the
> > 'query-status' command.  This is incorrectly documented as "true if
> > VCPUs are in single-step mode" and "singlestep is enabled through
> > the GDB stub", because what it's actually returning is the
> > one-insn-per-tb state.
> >
> > Things I didn't bother with because this is only an RFC but
> > will do if it turns into a non-RFC patchset:
> >  * test the bsd-user changes :-)
> >  * add text to deprecated.rst
> >
> > So, questions:
> >
> > (1) is this worth bothering with at all? We could just
> >     name our global variable etc better, and document what
> >     -singlestep actually does, and not bother with the new
> >     names for the options/commands.
> 
> The feature is kind of esoteric.  Rather weak excuse for not fixing bad
> UI, in my opinion.  Weaker still since you already did a good part of
> the actual work.
> 
> > (2) if we do do it, do we retain the old name indefinitely,
> >     or actively put it on the deprecate-and-drop list?
> 
> By "the old name", you mean the CLI option name, right?
> 
> I'd prefer deprecate and drop.
> 
> > (3) what should we do about the HMP StatusInfo object?
> >     I'm not sure how we handle compatibility for HMP.
> 
> Uh, you mean *QMP*, don't you?
> 
> As you wrote above, StatusInfo is returned by query-status, which is a
> stable interface.  Changes to members therefore require the usual
> deprecation grace period.  We'd add a new member with a sane name, and
> deprecate the old one.
> 
> The matching HMP command is "info status".  It shows member @singlestep
> as " (single step mode)".  Changing that is fine; HMP is not a stable
> interface.

Right, and similarly you don't need to keep the old 'singlestep' command
around; you can just rename.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


