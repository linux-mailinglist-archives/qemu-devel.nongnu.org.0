Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB7D476A53
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 07:25:39 +0100 (CET)
Received: from localhost ([::1]:60290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxkCv-0007Yw-A9
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 01:25:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mxkAb-0006hs-4d
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 01:23:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mxkAY-0001Ao-0m
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 01:23:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639635788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hG90QpjUDPhG2jSNKwOuBGef9aFRmigOaIa2mOIyUVQ=;
 b=T/MdOYsxk+aj6x1X7dztHnZTlLKYtkjmxosbgeXHxbUKrkLJKQ9orpCnfO/ISUOsh5wUcJ
 dhe7xLNCGQf21QIlQMu+p7y3f2wyz9fvvmdU+aB5XKtMKrRulDtyxpOwuVL6N4cGO0iajG
 9CKHzL0H9gYGCk0ZDiSokKlZc0EfgTY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-1lBBPRLkP-6B69Q_KVhKjg-1; Thu, 16 Dec 2021 01:23:07 -0500
X-MC-Unique: 1lBBPRLkP-6B69Q_KVhKjg-1
Received: by mail-wr1-f72.google.com with SMTP id
 p15-20020adfaa0f000000b001a240b45c1fso249999wrd.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 22:23:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hG90QpjUDPhG2jSNKwOuBGef9aFRmigOaIa2mOIyUVQ=;
 b=qkkPVSzjk+TcLOl8UcEvMsi27l7ZYp3SA6WSjI1SjfZrU1GUnHAHRDNw2QA23+V4eq
 Z21SzhkSvZf45jfOgcuFVuhdm3ShstNLQjTKIaZwDOhU3HHICV8LhTW98I8rRJp/N5kk
 ey9NWQvqzfhn/HkHfwzpWnkqqOp7UPZZ8sO9B7IzKwvfnt6FJCINBAQyBS92DGsdA+R8
 vI7vNJBdapbTyU5WZATjby78A/CzjIVE4LbGdKfF5MyeOQCI3NGA+9iFxId5xYuEjeCN
 35sM4L9ac+XFzINzb5y99gq1NWnF2yQe3z5kA5E5kcYmnMOgDb0EvVjiAvZUjMOD9bjV
 LtBw==
X-Gm-Message-State: AOAM530tohxkm1WPVRYFouXGNuJd7ediu5Ijostejn1lumWeIQXWmP2N
 oWh3kE6/fT06QtMgPnYrBrFMnHVO3HCu5gf3ZnGjVCHcEOpfuZ3T8cV0NGxPqRDyzXMg/vH2Jex
 elK5G1CPxCJc6EJI=
X-Received: by 2002:adf:f112:: with SMTP id r18mr5825963wro.655.1639635786040; 
 Wed, 15 Dec 2021 22:23:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxH0HCKdJaEi2uF3FXbbVyaD7HT+B0bIw9dOKsjUYa2sl+yMcyltPL+9yQ9DRam1lnBIpJEdQ==
X-Received: by 2002:adf:f112:: with SMTP id r18mr5825941wro.655.1639635785794; 
 Wed, 15 Dec 2021 22:23:05 -0800 (PST)
Received: from xz-m1.local ([64.64.123.12])
 by smtp.gmail.com with ESMTPSA id g18sm8249109wmq.4.2021.12.15.22.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 22:23:05 -0800 (PST)
Date: Thu, 16 Dec 2021 14:22:57 +0800
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v10 3/3] cpus-common: implement dirty page limit on
 virtual CPU
Message-ID: <YbrbQYiEMGz864aB@xz-m1.local>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <cover.1639479557.git.huangy81@chinatelecom.cn>
 <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
 <874k7anwtc.fsf@dusky.pond.sub.org>
 <4397f17c-4431-8480-127b-4228271523c8@chinatelecom.cn>
 <Ybmiw59Qh3sHukyh@xz-m1.local> <87y24m2df7.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y24m2df7.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Hyman Huang <huangy81@chinatelecom.cn>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 02:41:32PM +0100, Markus Armbruster wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
> > On Wed, Dec 15, 2021 at 03:56:55PM +0800, Hyman Huang wrote:
> >> > > +{ 'command': 'vcpu-dirty-limit',
> >> > > +  'data': { 'enable': 'bool',
> >> > > +            '*cpu-index': 'uint64',
> >> > > +            '*dirty-rate': 'uint64'} }
> >> > 
> >> > Drop @enable, please.
> >> > 
> >> > If @dirty-rate is present, set the limit to its value.
> >> > 
> >> > If it's absent, cancel the limit.
> >> > 
> >> Ok. Indeed, this is the simplest style. :)
> >> 
> >> So the final qmp format should be like:
> >> 
> >> case 1: setup vcpu 0 dirty page limit 100MB/s
> >> vcpu-dirty-limit  cpu-index=0   dirty-rate=100MB/s
> >> 
> >> case 2: cancle vcpu 0 dirty page limit
> >> vcpu-dirty-limit  cpu-index=0
> >
> > I actually agree with what you said... for human beings no one will read it as
> > "disable vcpu throttling", instead people could consider it enables vcpu
> > throttle with a default dirty rate from a gut feeling.
> >
> > I think what Markus suggested is the simplest solution for computers, but it
> > can confuse human beings.  So it turns out to be a general question to QMP
> > scheme design: should we always assume QMP client to be a piece of software, or
> > should we still consider the feeling of human beings operating on QMP
> > interfaces using qmp-shell.
> >
> > IMHO we should still consider the latter, if we don't lose much, anyway.  But I
> > don't have a strong opinion.
> 
> If you want a more explicit interface, then I'd recommend to go right
> back to v7:
> 
>     {"execute": "set-vcpu-dirty-limit",
>      "arguments": {"cpu-index": 0, "dirtyrate": 200}}
> 
>     {"execute": "cancel-vcpu-dirty-limit",
>      "arguments": {"cpu-index": 0}}
> 
> Bonus: it already has my Acked-by.

Fair enough. :)  That looks good to me too.

Yong, please hold-off a bit on reposting (if there's a plan) - I'll read the
other parts soon..

Thanks,

-- 
Peter Xu


