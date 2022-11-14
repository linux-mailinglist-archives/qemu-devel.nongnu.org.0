Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C146D628E15
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:14:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouirC-0004R1-2L; Mon, 14 Nov 2022 18:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1ouih5-0006Ku-B1
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:16:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1ouOGy-0006WC-BS
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 20:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668389306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FtWA2hDXaHMGEbeKtauuu3RoBqXX/P7Xe3H7r6al0GQ=;
 b=Kfjm18DrPHkzEgsv/qLenog1ohVtBDMogBkSW7KpuAFdyYVUfdHSwhDGvN/UguBYm+UOca
 HqsIFWmnfakZHuNPusNWnFC/1g/XUi9Jh7CWyUCnt1uMuraaYZ9geqwI52ryxCjU1rwRc2
 DHCMj8uZJ50UruqIBrL+LDJKn6X7QLo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-m2XxdwBbOCOy2TT661I07g-1; Sun, 13 Nov 2022 20:28:22 -0500
X-MC-Unique: m2XxdwBbOCOy2TT661I07g-1
Received: by mail-ed1-f72.google.com with SMTP id
 m7-20020a056402430700b0045daff6ee5dso7263165edc.10
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 17:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FtWA2hDXaHMGEbeKtauuu3RoBqXX/P7Xe3H7r6al0GQ=;
 b=FYKqGYZFgM2cs9cKbAagW4dNLeVxUn3Y5xawTEBSTgM1tlcXR9S58jATvtilE7BMaf
 O/Klg43ojKQEDKl5adihpGD7/YNoWtdRqEOQ0idpL5rHhA7iDT2OvIE1WoRWI9+8GdNU
 ivZXVJm35/FHez/ZguqZUxcw8EYSI3SYefafovTy9EmNsh6+ubjlOS4KbsjraL0f8I3j
 2K90yIfpsnrbPd/9gY7lD0kO3CfVXa3oRR+LslaM9apqE8s1fl1YbfB1LmYV7S7INFuj
 6nm/dUWYvDvPrtBEG+RtlqTM9vvBqdpOHIGii+rd3udIKfZP0nhH6kqxCcVlvV0RGpi0
 npCw==
X-Gm-Message-State: ANoB5pkRDP+2V0rY0tgFV72u4yG/awREBFOBEz2y23cPo9A3Jg0Jn2QG
 MydMOI2/GYZ/ZsQG1cdUt2abZbrA8eBG324TMpZvGUEjiaadIJyhuCitsacTHu8mXNte/Ul/UVp
 KW6zl6hcmGsctclyWQqU50A42iMiX2Qk=
X-Received: by 2002:a17:907:a602:b0:7ad:aeda:f814 with SMTP id
 vt2-20020a170907a60200b007adaedaf814mr9239558ejc.441.1668389301549; 
 Sun, 13 Nov 2022 17:28:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7zdvZxkxg/FuAw7C6jHrhXlLJhOJ9zfTTTCKJZsVtcvUBqKAZbeDLAjxBmQ59T+A3JwrCr7HwyDggtr4veYj0=
X-Received: by 2002:a17:907:a602:b0:7ad:aeda:f814 with SMTP id
 vt2-20020a170907a60200b007adaedaf814mr9239548ejc.441.1668389301312; Sun, 13
 Nov 2022 17:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20221111030541.191186-1-zhenyzha@redhat.com>
 <dc7f305b-5dc0-999f-8b58-a2c2a4b18828@redhat.com>
 <87bkpedm2z.fsf@pond.sub.org>
 <20221111101310.47bdced9@imammedo.users.ipa.redhat.com>
 <98a4d569-b81e-b3e3-f011-82ef19eeb5df@redhat.com>
 <20221111115443.30eec762@imammedo.users.ipa.redhat.com>
 <168ea85e-83c4-364e-67b0-f80e01ede087@redhat.com>
In-Reply-To: <168ea85e-83c4-364e-67b0-f80e01ede087@redhat.com>
From: Zhenyu Zhang <zhenyzha@redhat.com>
Date: Mon, 14 Nov 2022 09:27:44 +0800
Message-ID: <CAJFLiB+R6gJOxhTmejYWSmcqNisH0M4xvzJHg2bndXSydS7nnw@mail.gmail.com>
Subject: Re: [PATCH v3] qapi/qom: Memory backend property prealloc-threads doc
 fix
To: Gavin Shan <gshan@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, 
 philmd@linaro.org, shan.gavin@gmail.com, eric.auger@redhat.com, 
 lijin@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=zhenyzha@redhat.com;
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

Thanks all,
I will send v4 patch to fix the 80 characters limitation issue.

On Sat, Nov 12, 2022 at 6:05 AM Gavin Shan <gshan@redhat.com> wrote:
>
> On 11/11/22 6:54 PM, Igor Mammedov wrote:
> > On Fri, 11 Nov 2022 17:34:04 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >> On 11/11/22 5:13 PM, Igor Mammedov wrote:
> >>> On Fri, 11 Nov 2022 07:47:16 +0100
> >>> Markus Armbruster <armbru@redhat.com> wrote:
> >>>> Gavin Shan <gshan@redhat.com> writes:
> >>>>> On 11/11/22 11:05 AM, Zhenyu Zhang wrote:
> >>>>>> Commit ffac16fab3 "hostmem: introduce "prealloc-threads" property"
> >>>>>> (v5.0.0) changed the default number of threads from number of CPUs
> >>>>>> to 1.  This was deemed a regression, and fixed in commit f8d426a685
> >>>>>> "hostmem: default the amount of prealloc-threads to smp-cpus".
> >>>>>> Except the documentation remained unchanged.  Update it now.
> >>>>>> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> >>>>>> ---
> >>>>>> v3: Covers historical descriptions                  (Markus)
> >>>>>> v2: The property is changed to smp-cpus since 5.0   (Phild)
> >>>>>> ---
> >>>>>>     qapi/qom.json | 2 +-
> >>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>
> >>>>> With the following comments addressed:
> >>>>>
> >>>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
> >>>>>
> >>>>> ---
> >>>>>
> >>>>> Please consider amending the commit log to something like below.
> >>>>>
> >>>>> The default "prealloc-threads" value is set to 1 when the property is
> >>>>> added by commit ffac16fab33b ("hostmem: introduce "prealloc-threads"
> >>>>> property") in v5.0.0. The default value is conflicting with the sugar
> >>>>> property as the value provided by the sugar property is number of CPUs.
> >>>>
> >>>> What is the sugar property?  Can you explain the conflict in a bit more
> >>>> detail?
> >>>
> >>> my guess is that Gavin means mem_prealloc compat glue in qemu_process_sugar_options()
> >>>
> >>> property value should be set according to following order
> >>>        default -> compat -> explicit value
> >>> so I don't see any conflict here.
> >>>
> >>> PS:
> >>> if it we up to me, default would have stayed 1,
> >>> and prealloc-threads fixup to vCPUs number would happen in vl.c
> >>> similar to what is done in qemu_process_sugar_options(),
> >>> keeping backend clean of external dependencies.
> >>>
> >>
> >> Yes, it's the sugar property I was talking about. I'm not sure if
> >> we have a more popular name for this property: compat property or
> >> sugar property.
> >>
> >> When 'mem-prealloc=on' and 'prealloc-threads=xxx' aren't provided,
> >> the value is 1 before commit f8d426a6852c is applied. It's not
> >> inconsistent with 'mem-prealloc=on'. It's the conflict I was talking
> >> about and it's fixed by commit f8d426a6852c
> >
> > default was not supposed to be consistent with legacy mem-prealloc
> > and sugar property takes care of mem-prealloc=on case.
> >
> > so commit message in its current form looks fine to me.
> >
>
> Ok, thanks for your confirm. I think Zhenyu needs to post v4, to fix
> the 80 characters limitation issue. My reviewed-by is still valid.
>
> >>>>
> >>>>> The conflict has been fixed by commit f8d426a6852c ("hostmem: default
> >>>>> the amount of prealloc-threads to smp-cpus"). However, 'qapi/qom.json'
> >>>>> was missed to be updated accordingly in the commit.
> >>>>>
> >>>>> Update 'qapi/qom.json' to reflect the change in commit f8d426a6852c.
> >>>>>
> >>>>> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> >>>>>
> >>>>> When a specific commit is mentioned in the commit log, we usually have
> >>>>> fixed format like below.
> >>>>>
> >>>>> commit ffac16fab33b ("hostmem: introduce "prealloc-threads" property")
> >>>>> commit f8d426a6852c ("hostmem: default the amount of prealloc-threads to smp-cpus")
> >>>>
> >>>> This is certainly a common format, but the other one is also in use.
> >>>>
> >>>>>> diff --git a/qapi/qom.json b/qapi/qom.json
> >>>>>> index 30e76653ad..dfd89bc6d4 100644
> >>>>>> --- a/qapi/qom.json
> >>>>>> +++ b/qapi/qom.json
> >>>>>> @@ -576,7 +576,7 @@
> >>>>>>     #
> >>>>>>     # @prealloc: if true, preallocate memory (default: false)
> >>>>>>     #
> >>>>>> -# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
> >>>>>> +# @prealloc-threads: number of CPU threads to use for prealloc (default: number of CPUs) (since 5.0)
> >>>>>>     #
> >>>>>>     # @prealloc-context: thread context to use for creation of preallocation threads
> >>>>>>     #                    (default: none) (since 7.2)
> >>>>>>
> >>>>>
> >>>>> The line seems exceeding 80 characters. It'd better to limit each line in 75 characters.
> >>>>> So you probably need:
> >>>>>
> >>>>>       # @prealloc-threads: number of CPU threads to use for prealloc (default: number of CPUs)
> >>>>>       #                    (since 5.0)
> >>>>
> >>>> Still exceeds :)
> >>>>
> >>>> I suggested
> >>>>
> >>>>         # @prealloc-threads: number of CPU threads to use for prealloc
> >>>>         #                    (default: number of CPUs) (since 5.0)
> >>>>
> >>>
> >>
> >> Markus's suggestion works :)
> >>
>
> Thanks,
> Gavin
>


