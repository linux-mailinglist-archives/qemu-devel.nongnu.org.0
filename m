Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88BB494C87
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:10:49 +0100 (CET)
Received: from localhost ([::1]:44882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAVL4-0005os-D3
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:10:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAV7V-0007e8-8S
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:56:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAV7N-0000Hm-0A
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642676194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=69+nqQ5IbcPCIRyszLEEAZKihYrJUafw162lSzMpPMk=;
 b=KgfGyIeWRuENu+RMuzT3JlkoDCUKkTm4WNn+Y96WEdEquWMOXZTcX054JHTiUxg7TWfEpj
 N/07dq10a1SveHwEcvrJSC9/ziQ7o/XveImJviBzNwbvYyXkNR6iml7VaSW8uiyRLloDal
 E5ddl6p3vJGwBovQLNl9erXftdl3OkM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-gOaaw4TsOdWiSqCHxrUZ2g-1; Thu, 20 Jan 2022 05:56:32 -0500
X-MC-Unique: gOaaw4TsOdWiSqCHxrUZ2g-1
Received: by mail-pj1-f71.google.com with SMTP id
 l1-20020a17090aec0100b001b508cd63f6so2409604pjy.9
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 02:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=69+nqQ5IbcPCIRyszLEEAZKihYrJUafw162lSzMpPMk=;
 b=LkbkU3jpyLv3PwgYujv5AoNK3FDuzWNyjoumQuEyZjsx7YMU8qnhwYYYt42DufGT0z
 7zeHCZcI922hGeNVDEr6hwqbFZwVeEraSOeLOO+QeZFdwOCP9GN+pKVYWAjAue+s1dAT
 KwJaCCirb0pIUeA5ZAKbr1r6hqx3i0zlNmIgrqMBslYp5mChOLA+h0jtSpXHULI0N8gd
 /muOwfX8s6yn9cIJ+9z48gYN4TAOT4Fv2FGahFuA0B854hQ0B8g0ClJudErGGzdEs0T5
 nQPeIn1S5ZNTFlyr75tjFV21VvuCM06c3HLNWE0NW/JreIh0/VjEWKxz58iXffhqByqr
 m/og==
X-Gm-Message-State: AOAM530CmD5KOtcSHFNfZjyE2eEEgRWQXOOQT8oJOAnp0gK5IgrXvYpZ
 91QcnKOyZGZSDPTUkG68L7Di12s+TUpwWzcO5dHcTCWLY9ZmA+Aw+onPgc0b49yKaOBR8t7C8ir
 SjwWOZN62PheqH08=
X-Received: by 2002:a62:8084:0:b0:4c6:c15d:3516 with SMTP id
 j126-20020a628084000000b004c6c15d3516mr721169pfd.44.1642676191705; 
 Thu, 20 Jan 2022 02:56:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxslGBlhHqxfy0mRLRhiyQLAcUJHl0tT8nAMte/QpxnGITySpaCSyoZRVjepBU/Jn6cbRFmnw==
X-Received: by 2002:a62:8084:0:b0:4c6:c15d:3516 with SMTP id
 j126-20020a628084000000b004c6c15d3516mr721139pfd.44.1642676191435; 
 Thu, 20 Jan 2022 02:56:31 -0800 (PST)
Received: from xz-m1.local ([94.177.118.145])
 by smtp.gmail.com with ESMTPSA id o11sm2034570pjw.35.2022.01.20.02.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 02:56:30 -0800 (PST)
Date: Thu, 20 Jan 2022 18:56:24 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
Message-ID: <Yek/2BoqmYBM0PWt@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <YeUbhC7MG32K9pxu@xz-m1.local>
 <d34dbb85-f8a9-cb21-a312-a4f4f3cafd07@chinatelecom.cn>
 <Yekqn90HOtFMWupM@xz-m1.local>
 <c6086788-da45-d023-edaa-5fca9a602c5a@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <c6086788-da45-d023-edaa-5fca9a602c5a@chinatelecom.cn>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 06:39:01PM +0800, Hyman Huang wrote:
> > It only runs once per second so it shouldn't bring a lot of differences, but
> > I'm also wondering whether we should also turn that temporarily off too when
> > dirtylimit is enabled - we can simply let it keep sleeping if dirtylimit is in
> > service.
> Does this work ok when dirtylimit and migration happens concurrently?
> Migration may fetch the aged dirty bitmap info from slot if we turn reaper
> thread off. As you metioned above, reaper thread only runs once per second.
> Is it more suitable for not touching the reaper thread logic?

Yes I think it'll still work, as migration will do explicit sync/collect after
each iteration.  See kvm_log_sync_global().

In short, you shouldn't touch the rest of the kvm_dirty_ring_reap() callers,
they'll always flush all the rings.

But it'll be nicer if you will try it out. :)

-- 
Peter Xu


