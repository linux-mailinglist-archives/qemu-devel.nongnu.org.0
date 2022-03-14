Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2504D86E2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:21:51 +0100 (CET)
Received: from localhost ([::1]:50730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTla2-0006HS-LI
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:21:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nTkqh-00042X-La
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:34:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nTkqg-00011I-1i
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647264897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pQ5u68A6AMEL+/N7irMetNO1/3+aeFRmAnVYxl87MPM=;
 b=Ac/CVXtZtbn4G/pKxkgS7RZ/A6sf//qZ3yU/r439XJnxcPv8DuwsJXn5ma+zcy/vPPWVDS
 oVhjy7lIGau8y7fFtt3xGnjyYxY9rSnaF2OwDZW5+IASHbI5AG7tuEQKL+yOofAL6/eu0d
 O+RQY4D9sAF/xfNoJmlYjWnYuG+1wdo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-3cWmpZSUOiSVWpq6NL8oew-1; Mon, 14 Mar 2022 09:34:56 -0400
X-MC-Unique: 3cWmpZSUOiSVWpq6NL8oew-1
Received: by mail-wr1-f70.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so4368399wrp.10
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 06:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=pQ5u68A6AMEL+/N7irMetNO1/3+aeFRmAnVYxl87MPM=;
 b=G37Vtvxog+i925/2ZD5sUzXBbPcTbIDkGBBAPPT1XbKRVZRavHx17Tzdr6NDHPy1no
 Gi1QQkoyR6AlXLHJ6YTSPd+2z/l5bcbLQAsTUOIWbgrdQH/5pnzNQDqO0DzCeJFtFX0K
 ZA65KDapDuQC8JrWvmPny/oWsmwlzlJbA6kKr0k7sUYl/OzGz1xFcyaBPi+3EQ51/xiL
 kbrkmEXiTFdh6ub9gVcE9JuH7JSs4dqyDslX6bNLhsGjsK06CzcZcUl8gJZgVi3YZjVe
 pXJ+u85xNXrSPunuDNVXSZRh3hkIEYUOCHAvtAvGahsTZN7JFyZrTmW1PTW6Qm7vNMxZ
 pnLg==
X-Gm-Message-State: AOAM53350IXRAhgzink/tSwdjMHfWLlGw4wIdWc09kJnovYWNTjADyvW
 Y7ew5WL1oY45SHU/x3LAiw5EphtEHyliHc9al7Y378nUC4khS2URqjc+tbb/N0S8OcsTE/t2KCP
 svhM9bOVRsUEPPcA=
X-Received: by 2002:a05:6000:11d0:b0:1f1:f6ea:f9a with SMTP id
 i16-20020a05600011d000b001f1f6ea0f9amr16860420wrx.40.1647264894724; 
 Mon, 14 Mar 2022 06:34:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcHwnotpLj02WtXFIWf/b9VIJkWVVid0zvwIUJF/qB1AqwAOwl34RYG4ejPZCaWJ93M2gQLg==
X-Received: by 2002:a05:6000:11d0:b0:1f1:f6ea:f9a with SMTP id
 i16-20020a05600011d000b001f1f6ea0f9amr16860394wrx.40.1647264894399; 
 Mon, 14 Mar 2022 06:34:54 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:3506:3400:69b5:c807:1d52:ff67?
 ([2a0c:5a80:3506:3400:69b5:c807:1d52:ff67])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d4bcd000000b001f0620ecb3csm13167391wrt.40.2022.03.14.06.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 06:34:54 -0700 (PDT)
Message-ID: <5fd3f882fc5594da3e45c4d7e154c4b6fbe0edf1.camel@redhat.com>
Subject: Re: [PATCH v2 2/4] Introduce event-loop-base abstract class
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 14 Mar 2022 14:34:52 +0100
In-Reply-To: <Yi9EDyZpOa4+6MG4@stefanha-x1.localdomain>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
 <20220303145822.518887-3-nsaenzju@redhat.com>
 <YinSD8xxujd5lOSy@stefanha-x1.localdomain>
 <50ce51c3a8f84d53b64fba396b19e5a1d11b1e19.camel@redhat.com>
 <Yi9EDyZpOa4+6MG4@stefanha-x1.localdomain>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2022-03-14 at 13:33 +0000, Stefan Hajnoczi wrote:
> On Fri, Mar 11, 2022 at 11:17:22AM +0100, Nicolas Saenz Julienne wrote:
> > On Thu, 2022-03-10 at 10:25 +0000, Stefan Hajnoczi wrote:
> > > On Thu, Mar 03, 2022 at 03:58:20PM +0100, Nicolas Saenz Julienne wrote:
> > > > @@ -2935,13 +2947,6 @@ qemu_syms = custom_target('qemu.syms', output: 'qemu.syms',
> > > >                               capture: true,
> > > >                               command: [undefsym, nm, '@INPUT@'])
> > > >  
> > > > -qom_ss = qom_ss.apply(config_host, strict: false)
> > > > -libqom = static_library('qom', qom_ss.sources() + genh,
> > > > -                        dependencies: [qom_ss.dependencies()],
> > > > -                        name_suffix: 'fa')
> > > > -
> > > > -qom = declare_dependency(link_whole: libqom)
> > > > -
> > > 
> > > Why was it necessary to move qom_ss and subdir('hw') up? Can
> > > event_loop_base be defined down here instead?
> > 
> > The way I setup it up, qemuutil now depdens on event_loop_base which in turn
> > depends on qom. IIUC I can't declare dependencies without declaring first the
> > libraries and source sets. All has to happen sequencially. With this in mind,
> > almost all libraries depend on libqemuutil so moving it down isn't possible.
> 
> I see now. The qemuutil dependency on event_loop_base is introduced in
> the next patch so the reason wasn't clear at this point in the patch
> series.

I'll mention it in the commit message.

-- 
Nicolás Sáenz


