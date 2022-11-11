Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E27262565B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 10:13:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otQ6E-0003fp-UW; Fri, 11 Nov 2022 04:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otQ6D-0003fY-0B
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:13:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otQ6A-0003x7-9w
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:13:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668157996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wY2WZbGjtsLm06DLrlDvIupJ4hfmJQEdKQrHtBAMILw=;
 b=hpG9WtzKEzS0vpam6oTysP62C+jV9mJ5LKP+AL0ZReg97/RzRgHvS8W1fg0rGrSR5lW3cF
 p9rlQl/jRdECaY1JuYuTnhIS+tnCZNTcM0jugY8A39kwKaFDXiMfmy6mibx60Ylmg4XYHP
 8iJJ4ki+9ett3gMMvShmExEn5rmBQOE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-59-4Zj7yYq4P227KoCVbuLvVA-1; Fri, 11 Nov 2022 04:13:15 -0500
X-MC-Unique: 4Zj7yYq4P227KoCVbuLvVA-1
Received: by mail-qt1-f198.google.com with SMTP id
 w27-20020a05622a191b00b003a56c0e1cd0so3260706qtc.4
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 01:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wY2WZbGjtsLm06DLrlDvIupJ4hfmJQEdKQrHtBAMILw=;
 b=tc2hJT7nza5f6Ii93wXHvFibhb0EJkxslqlT49OpnQvLB6Y01O4VWk9CBxZ9mY/zmY
 MzW/ZnC2idbphe+kVk11kCd6wVD2hK/WN/jOF94O1s28xR/qR2I4TmCfhNLOMiqRAIHo
 DldD3pw25zCujMzlnJ0QIta2VNiYpHBgSvo0bTroOR8oD3sCh1vT3nIXTIv4bTQJaNLg
 T9C1YcLHqaow4HuSlYLpit6wED2L6tkaSGH49EQbvYasYItFX8Wy2qZ7ZB742Y0rEL1Y
 SLSw8nrlGjRRxsFaprrml3E4VdtdMi3GAOkLeOw0hZ1eiX2MSl1hbxD+iElSit5i2GYj
 DBvA==
X-Gm-Message-State: ANoB5pmnMyg9QoKEWaPV70mIKExj7JyR97CztqyXe7UqfwdeK2/VOO+o
 mpTLw2qdUpEBYv4j44684egbo3OlsnZnV2EaN0f488lN7tg1dXNdy+26tVwigtBDhe4+GsqzClY
 EZ3b2XRiGtUl2fbE=
X-Received: by 2002:a05:620a:6002:b0:6ec:51ea:33f3 with SMTP id
 dw2-20020a05620a600200b006ec51ea33f3mr330361qkb.325.1668157994815; 
 Fri, 11 Nov 2022 01:13:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4vtmO2DNG3rJRZlxGmC7ZQluLJI/gMhZP0zyOIho635y3vItCeD/ODsRtFoVi7mpIMp7p/5A==
X-Received: by 2002:a05:620a:6002:b0:6ec:51ea:33f3 with SMTP id
 dw2-20020a05620a600200b006ec51ea33f3mr330350qkb.325.1668157994578; 
 Fri, 11 Nov 2022 01:13:14 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05620a299500b006e702033b15sm1187616qkp.66.2022.11.11.01.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 01:13:13 -0800 (PST)
Date: Fri, 11 Nov 2022 10:13:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, Zhenyu Zhang <zhenyzha@redhat.com>,
 qemu-devel@nongnu.org, philmd@linaro.org, shan.gavin@gmail.com,
 eric.auger@redhat.com, lijin@redhat.com
Subject: Re: [PATCH v3] qapi/qom: Memory backend property prealloc-threads
 doc fix
Message-ID: <20221111101310.47bdced9@imammedo.users.ipa.redhat.com>
In-Reply-To: <87bkpedm2z.fsf@pond.sub.org>
References: <20221111030541.191186-1-zhenyzha@redhat.com>
 <dc7f305b-5dc0-999f-8b58-a2c2a4b18828@redhat.com>
 <87bkpedm2z.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Fri, 11 Nov 2022 07:47:16 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Gavin Shan <gshan@redhat.com> writes:
> 
> > Hi Zhenyu,
> >
> > On 11/11/22 11:05 AM, Zhenyu Zhang wrote:  
> >> Commit ffac16fab3 "hostmem: introduce "prealloc-threads" property"
> >> (v5.0.0) changed the default number of threads from number of CPUs
> >> to 1.  This was deemed a regression, and fixed in commit f8d426a685
> >> "hostmem: default the amount of prealloc-threads to smp-cpus".
> >> Except the documentation remained unchanged.  Update it now.
> >> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> >> ---
> >> v3: Covers historical descriptions                  (Markus)
> >> v2: The property is changed to smp-cpus since 5.0   (Phild)
> >> ---
> >>   qapi/qom.json | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>   
> >
> > With the following comments addressed:
> >
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> >
> > ---
> >
> > Please consider amending the commit log to something like below.
> >
> > The default "prealloc-threads" value is set to 1 when the property is
> > added by commit ffac16fab33b ("hostmem: introduce "prealloc-threads"
> > property") in v5.0.0. The default value is conflicting with the sugar
> > property as the value provided by the sugar property is number of CPUs.  
> 
> What is the sugar property?  Can you explain the conflict in a bit more
> detail?

my guess is that Gavin means mem_prealloc compat glue in qemu_process_sugar_options()

property value should be set according to following order
     default -> compat -> explicit value 
so I don't see any conflict here.

PS:
if it we up to me, default would have stayed 1,
and prealloc-threads fixup to vCPUs number would happen in vl.c
similar to what is done in qemu_process_sugar_options(),
keeping backend clean of external dependencies.

> 
> > The conflict has been fixed by commit f8d426a6852c ("hostmem: default
> > the amount of prealloc-threads to smp-cpus"). However, 'qapi/qom.json'
> > was missed to be updated accordingly in the commit.
> >
> > Update 'qapi/qom.json' to reflect the change in commit f8d426a6852c.
> >
> > Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> >
> > When a specific commit is mentioned in the commit log, we usually have
> > fixed format like below.
> >
> > commit ffac16fab33b ("hostmem: introduce "prealloc-threads" property")
> > commit f8d426a6852c ("hostmem: default the amount of prealloc-threads to smp-cpus")  
> 
> This is certainly a common format, but the other one is also in use.
> 
> >> diff --git a/qapi/qom.json b/qapi/qom.json
> >> index 30e76653ad..dfd89bc6d4 100644
> >> --- a/qapi/qom.json
> >> +++ b/qapi/qom.json
> >> @@ -576,7 +576,7 @@
> >>   #
> >>   # @prealloc: if true, preallocate memory (default: false)
> >>   #
> >> -# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
> >> +# @prealloc-threads: number of CPU threads to use for prealloc (default: number of CPUs) (since 5.0)
> >>   #
> >>   # @prealloc-context: thread context to use for creation of preallocation threads
> >>   #                    (default: none) (since 7.2)
> >>   
> >
> > The line seems exceeding 80 characters. It'd better to limit each line in 75 characters.
> > So you probably need:
> >
> >     # @prealloc-threads: number of CPU threads to use for prealloc (default: number of CPUs)
> >     #                    (since 5.0)  
> 
> Still exceeds :)
> 
> I suggested
> 
>       # @prealloc-threads: number of CPU threads to use for prealloc
>       #                    (default: number of CPUs) (since 5.0)
> 


