Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25461565AA9
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 18:11:04 +0200 (CEST)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Of8-00010M-Q5
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 12:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o8Obt-0007EB-D6
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:07:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o8Obq-00019K-2G
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656950855;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sT+5ax1ALAO2s1rceBDrmlzlNCTmkNg91W9AiBWFYsw=;
 b=J6TLx/IU8cUXmPWyP6mFS0MSp917r4QgH6snv9mX1p5r5qZvIZb34MB3+SIjoPmY++w7DH
 Wm8m17/kmR3ZSws2/eNRD2QjKrAfKJKtSIu1RzrVYQGW9Aj7S1tzmecChNAyMjkCEp4LWa
 jv9rnQ95CZRRReE3LHxsorZfX12F/qk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-GvHZ3KkGMdOdTIIhQYFTRA-1; Mon, 04 Jul 2022 12:07:34 -0400
X-MC-Unique: GvHZ3KkGMdOdTIIhQYFTRA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k26-20020adfb35a000000b0021d6c3b9363so624860wrd.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 09:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=sT+5ax1ALAO2s1rceBDrmlzlNCTmkNg91W9AiBWFYsw=;
 b=7Z87shOoaGa6ZkL8xViF4qzQGXJXmgUocGasVwnnyo8wVqmcuuk0hEmlOOg9m+IcaD
 AdPD9V2WX5K6pvT4Zud+Fb8TX+WYvtS9X1UiqswMiWPtLJ9DSYJwh4MBoYUC/XbL0siV
 VoBcQCGM4We1lJQo2QuwBKNjDvWUoL9GKJcssKlWHwbhFv5oRM+U2HaYrX9YV8U7XuIF
 /zFbA96GV7Z/bhIfYRXcMhyutjDk816q/TGxOrKUyVH0ffMxDVK2S78CgXCYY0LGCTFL
 f0ePZY0gOPSQ+ScQcKU722WH9VWodSRGVAAnB9jiuS/kc7JpcDD6q1Cb2KyxsGUL/2G0
 3hpA==
X-Gm-Message-State: AJIora92Qw6Sg/oftZ5gwp3q9kLjBieu2ThLoLjux0hXgs9i0gyuuQHH
 oB66J3pU/u1CDiHMppMcZZI4gnFeKhuFbCLJs8bgca3qt7o/CYLafnyxoza/0gkSTzU1gEku0/g
 YAA4EBQ4NwUwF1Lo=
X-Received: by 2002:a05:6000:1445:b0:21b:a919:7d3 with SMTP id
 v5-20020a056000144500b0021ba91907d3mr27073125wrx.545.1656950853805; 
 Mon, 04 Jul 2022 09:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ss5w9KnFF71dGgpcT+EtW6tawbN704I98Ekl5kV/7tf9CAEcV2oPQzeWMbw21BmRbYzl0FNA==
X-Received: by 2002:a05:6000:1445:b0:21b:a919:7d3 with SMTP id
 v5-20020a056000144500b0021ba91907d3mr27073099wrx.545.1656950853584; 
 Mon, 04 Jul 2022 09:07:33 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm19880610wmi.29.2022.07.04.09.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 09:07:32 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 1/5] multifd: Create property multifd-sync-each-iteration
In-Reply-To: <Yr20gdrEYimAq1Tn@work-vm> (David Alan Gilbert's message of "Thu, 
 30 Jun 2022 15:34:41 +0100")
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-2-quintela@redhat.com> <Yr20gdrEYimAq1Tn@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 04 Jul 2022 18:07:31 +0200
Message-ID: <87h73w275o.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> We used to synchronize all channels at the end of each RAM section
>> sent.  That is not needed, so preparing to only synchronize once every
>> full round in latests patches.
>> 
>> Notice that we initialize the property as true.  We will change the
>> default when we introduce the new mechanism.
>
> I don't understand why this is a property - does it break the actual
> stream format?

Yeap.

You can see on following patches.  The problem is that we synchronize
each time that we sent/receive a

RAM_SAVE_FLAG_EOS

And that is way too much.  As Leo showed, it can be as much as 20 times
a second.

Later, Juan.


