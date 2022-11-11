Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB956258DB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRgT-0004PO-Nw; Fri, 11 Nov 2022 05:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otRgR-0004FQ-Sd
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:54:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otRgQ-0001G8-6m
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:54:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668164089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ahn+7H6+Ymoj/5oH5L5k4H/FuxtMbpM3hwCOJ2Q72VA=;
 b=Tv7UGYKcWAe8izt+WrBJUV5d9FiuXGaXLmNuLO0LxIiWwUqc0HCrFHQjyEH8TTyl2J9Wmx
 Mfz0p7TPDrJ6Vu5veupRJHq0IR+2jG+YH8sksDqr7rbfQelBFqz3U+cqq9ER8A7SjpsKNY
 FhqSr6PpfLA12s4ao0MX5010RMHZVu0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444-d5K8QIOZOUOKwJ2I4s9JlA-1; Fri, 11 Nov 2022 05:54:47 -0500
X-MC-Unique: d5K8QIOZOUOKwJ2I4s9JlA-1
Received: by mail-qv1-f71.google.com with SMTP id
 d8-20020a0cfe88000000b004bb65193fdcso3435662qvs.12
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 02:54:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ahn+7H6+Ymoj/5oH5L5k4H/FuxtMbpM3hwCOJ2Q72VA=;
 b=j1ha3xqf0H7PcQ6WGEDiAjYhA/l6rPXfaDlThoc6f8/pLsNKfGGDK/OhyKE/q3csRY
 TkKs49TROL0sTtNIAVs/rZ4anAArZijjhVhy4s3G4DQulHGhgg8FaP2Bhqcp6Li0uTgz
 NVmA1svks858/iF4BTKbsN69hEdf0TEsrWWx9w1nwJdISp5dY8F48T8rtAsCO+x5c7ro
 02mMeJz+uqp6g2t05mqBMYkibInxk/K4gNUuVHqTyokTWx+tlAqLMicNlgNgwXG6NkEY
 rkESOT0TddG1KECIfAeIlJu1cWS8i4+T/7Xi2jsgfZFuoy3K6Ax9hFWZRj16OJZI2MNB
 Sv9w==
X-Gm-Message-State: ANoB5pnG/33lzWrTf+2P/+rzWCyr96lURITmRvAsOJ6SKexaKKn+qzZZ
 ixZjQyie0EpsmGooj1lDNPefyBYOtEE76hdoZBm3Xm9qCOMfzpu44WgNfYmUgdAud1r3nZecYIP
 7u7oiZnCL71zwu+A=
X-Received: by 2002:a05:620a:7ef:b0:6fa:ada7:e565 with SMTP id
 k15-20020a05620a07ef00b006faada7e565mr527416qkk.208.1668164086917; 
 Fri, 11 Nov 2022 02:54:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7kHiY1ZwKOmv8+yzxpDsnvvYdAjWEMVSJOVJgK1SsJK4WKRL98/N9usW5i2f+8b5gPrDdwMA==
X-Received: by 2002:a05:620a:7ef:b0:6fa:ada7:e565 with SMTP id
 k15-20020a05620a07ef00b006faada7e565mr527404qkk.208.1668164086668; 
 Fri, 11 Nov 2022 02:54:46 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05620a400c00b006b949afa980sm1229407qko.56.2022.11.11.02.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 02:54:46 -0800 (PST)
Date: Fri, 11 Nov 2022 11:54:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Zhenyu Zhang
 <zhenyzha@redhat.com>, qemu-devel@nongnu.org, philmd@linaro.org,
 shan.gavin@gmail.com, eric.auger@redhat.com, lijin@redhat.com
Subject: Re: [PATCH v3] qapi/qom: Memory backend property prealloc-threads
 doc fix
Message-ID: <20221111115443.30eec762@imammedo.users.ipa.redhat.com>
In-Reply-To: <98a4d569-b81e-b3e3-f011-82ef19eeb5df@redhat.com>
References: <20221111030541.191186-1-zhenyzha@redhat.com>
 <dc7f305b-5dc0-999f-8b58-a2c2a4b18828@redhat.com>
 <87bkpedm2z.fsf@pond.sub.org>
 <20221111101310.47bdced9@imammedo.users.ipa.redhat.com>
 <98a4d569-b81e-b3e3-f011-82ef19eeb5df@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Fri, 11 Nov 2022 17:34:04 +0800
Gavin Shan <gshan@redhat.com> wrote:

> On 11/11/22 5:13 PM, Igor Mammedov wrote:
> > On Fri, 11 Nov 2022 07:47:16 +0100
> > Markus Armbruster <armbru@redhat.com> wrote:   
> >> Gavin Shan <gshan@redhat.com> writes:  
> >>> On 11/11/22 11:05 AM, Zhenyu Zhang wrote:  
> >>>> Commit ffac16fab3 "hostmem: introduce "prealloc-threads" property"
> >>>> (v5.0.0) changed the default number of threads from number of CPUs
> >>>> to 1.  This was deemed a regression, and fixed in commit f8d426a685
> >>>> "hostmem: default the amount of prealloc-threads to smp-cpus".
> >>>> Except the documentation remained unchanged.  Update it now.
> >>>> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> >>>> ---
> >>>> v3: Covers historical descriptions                  (Markus)
> >>>> v2: The property is changed to smp-cpus since 5.0   (Phild)
> >>>> ---
> >>>>    qapi/qom.json | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>      
> >>>
> >>> With the following comments addressed:
> >>>
> >>> Reviewed-by: Gavin Shan <gshan@redhat.com>
> >>>
> >>> ---
> >>>
> >>> Please consider amending the commit log to something like below.
> >>>
> >>> The default "prealloc-threads" value is set to 1 when the property is
> >>> added by commit ffac16fab33b ("hostmem: introduce "prealloc-threads"
> >>> property") in v5.0.0. The default value is conflicting with the sugar
> >>> property as the value provided by the sugar property is number of CPUs.  
> >>
> >> What is the sugar property?  Can you explain the conflict in a bit more
> >> detail?  
> > 
> > my guess is that Gavin means mem_prealloc compat glue in qemu_process_sugar_options()
> > 
> > property value should be set according to following order
> >       default -> compat -> explicit value
> > so I don't see any conflict here.
> > 
> > PS:
> > if it we up to me, default would have stayed 1,
> > and prealloc-threads fixup to vCPUs number would happen in vl.c
> > similar to what is done in qemu_process_sugar_options(),
> > keeping backend clean of external dependencies.
> >   
> 
> Yes, it's the sugar property I was talking about. I'm not sure if
> we have a more popular name for this property: compat property or
> sugar property.
> 
> When 'mem-prealloc=on' and 'prealloc-threads=xxx' aren't provided,
> the value is 1 before commit f8d426a6852c is applied. It's not
> inconsistent with 'mem-prealloc=on'. It's the conflict I was talking
> about and it's fixed by commit f8d426a6852c

default was not supposed to be consistent with legacy mem-prealloc
and sugar property takes care of mem-prealloc=on case.

so commit message in its current form looks fine to me.

> >>  
> >>> The conflict has been fixed by commit f8d426a6852c ("hostmem: default
> >>> the amount of prealloc-threads to smp-cpus"). However, 'qapi/qom.json'
> >>> was missed to be updated accordingly in the commit.
> >>>
> >>> Update 'qapi/qom.json' to reflect the change in commit f8d426a6852c.
> >>>
> >>> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> >>>
> >>> When a specific commit is mentioned in the commit log, we usually have
> >>> fixed format like below.
> >>>
> >>> commit ffac16fab33b ("hostmem: introduce "prealloc-threads" property")
> >>> commit f8d426a6852c ("hostmem: default the amount of prealloc-threads to smp-cpus")  
> >>
> >> This is certainly a common format, but the other one is also in use.
> >>  
> >>>> diff --git a/qapi/qom.json b/qapi/qom.json
> >>>> index 30e76653ad..dfd89bc6d4 100644
> >>>> --- a/qapi/qom.json
> >>>> +++ b/qapi/qom.json
> >>>> @@ -576,7 +576,7 @@
> >>>>    #
> >>>>    # @prealloc: if true, preallocate memory (default: false)
> >>>>    #
> >>>> -# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
> >>>> +# @prealloc-threads: number of CPU threads to use for prealloc (default: number of CPUs) (since 5.0)
> >>>>    #
> >>>>    # @prealloc-context: thread context to use for creation of preallocation threads
> >>>>    #                    (default: none) (since 7.2)
> >>>>      
> >>>
> >>> The line seems exceeding 80 characters. It'd better to limit each line in 75 characters.
> >>> So you probably need:
> >>>
> >>>      # @prealloc-threads: number of CPU threads to use for prealloc (default: number of CPUs)
> >>>      #                    (since 5.0)  
> >>
> >> Still exceeds :)
> >>
> >> I suggested
> >>
> >>        # @prealloc-threads: number of CPU threads to use for prealloc
> >>        #                    (default: number of CPUs) (since 5.0)
> >>  
> >   
> 
> Markus's suggestion works :)
> 
> Thanks,
> Gavin
> 
> 


