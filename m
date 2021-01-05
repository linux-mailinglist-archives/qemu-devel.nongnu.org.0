Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA02EB02F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:37:00 +0100 (CET)
Received: from localhost ([::1]:48316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpKN-0001jy-UM
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kwpFP-00053q-Mf
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kwpFO-0002rA-0d
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609864307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DttBJOJxDk0oPdPq8M5vF1+2NsPHLzg9Rl/IFgDLeqc=;
 b=arkDz4oaBbCjyArLubDFTsweFbq7ARAS8YgqKoexRzM7gPKeMO+Pgx7oDMWsx7HddGyKdu
 TkA5o4gjoD4rk0QtJ8dbRcEC5A3vvaouVxwou7iWVmT7zooJd4v0DkUa6Dubx53jd3d145
 rSeKuq1VU9t3Vdki4qW+cFkTfq0UGmY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-ADnMAX2VObmplK_jg17q6Q-1; Tue, 05 Jan 2021 11:31:46 -0500
X-MC-Unique: ADnMAX2VObmplK_jg17q6Q-1
Received: by mail-ej1-f69.google.com with SMTP id q11so97538ejd.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 08:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DttBJOJxDk0oPdPq8M5vF1+2NsPHLzg9Rl/IFgDLeqc=;
 b=QvJPQ+Um4LQeifArGWU69SmOYgxKGbDUxjcr4wXAU6wScuYUSwFFodMzN1T/yNHEKg
 lED5H2srl4+c4MJih9Q5OtojU/4WwNjC41wLLE3qR1uu5T7LC1GCq4hcqzkzCYD2F6rI
 S34Cwn5IJUS6EiLe+LdNkPd6yfon9aVW9dyaOmMp9grrJWNDUXMeFgZYPZqefQjSbpto
 Mt4MfLjVHd4RlsBl+1d532r68jVuGhhDnk68udr/vwd3+Zl9pjahtFY4YkmRb5rTA0V/
 1hN5zKsbVBslMHa2ZND9ZV/d8Du1wcFAj+SJ113oj751dUejYtuhXNlB/zd0+DiwYkJl
 5gog==
X-Gm-Message-State: AOAM5334CfGyJnYiz8sJGQrp8H5MP6GC6zljL6AhtvQ1yGCPcP1Wih14
 V2Om1EtktKp1wkWugUpBF6kYuXZJC/nnxfDhup5GjPbF4KhcsoST78yo/7asxQ1fOojCJ1+GMG2
 PaUyqWWljn5FJ7uB9GvwUSu4lJY7FS31L79hKSGbM9ek8vyzioAYnCl4bv7MAdfLxT0c=
X-Received: by 2002:a17:906:7c49:: with SMTP id
 g9mr71816344ejp.185.1609864305144; 
 Tue, 05 Jan 2021 08:31:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+l0fcNI44aMBbczACmezk7U6/Z5JMlFUVFlp9iAeqUOruoHsyT1jEcOQGotCm7Z9PWoABXA==
X-Received: by 2002:a17:906:7c49:: with SMTP id
 g9mr71816322ejp.185.1609864304942; 
 Tue, 05 Jan 2021 08:31:44 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id f20sm1116edx.92.2021.01.05.08.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 08:31:44 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
In-Reply-To: <20210105170312.32cf0e12@redhat.com>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com> <87r1n0j20n.fsf@vitty.brq.redhat.com>
 <20210105000435.1cf4c6f6@redhat.com> <87lfd7iowi.fsf@vitty.brq.redhat.com>
 <20210105170312.32cf0e12@redhat.com>
Date: Tue, 05 Jan 2021 17:31:43 +0100
Message-ID: <87a6tnibv4.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Tue, 05 Jan 2021 12:50:05 +0100
>
> I think there is a misunderstanding, idea was:
>
> cpu_initfn() {
>     //current set
>     cpu->default_hyperv_cpu_features = ACD
> }
>
> compat_props_5.1 {
>    cpu.default_hyperv_cpu_features = AB
> }
>
> compat_props_5.2 {
>    cpu.default_hyperv_cpu_features = ABC
> }
>

...

> I was talking about CPU features/properties only, it doesn't apply to other devices.
> It makes sense for machine to have a knob to create onboard hyperv specific
> devices if there is any (do we have any?).
>
> If there aren't any currently, I wouldn't bother with machine knob
> and just use -cpu foo,hv_default=on or -device cpu,hv_default=on
> like any other cpu feature.
>

We don't currently have any devices which are not 'CPU features' (in
QEMU terminology), however, we already have Vmbus and I can easily
imagine us implementing e.g. hartbeat/kvp/vss/... devices on top. We
*may* want to enable these 'automatically' and that's what make
'-machine' option preferable. It is, however, not a *must* right now and
we can indeed wait until these devices appear and be happy with
'hv_default' -cpu option for now. We will, however, need to teach upper
layers about the change when/if it happens.

-- 
Vitaly


