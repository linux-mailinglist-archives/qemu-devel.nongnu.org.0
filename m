Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98E73605C2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 11:32:56 +0200 (CEST)
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWyMq-0002C5-0L
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 05:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lWyLx-0001kC-72
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:32:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lWyLt-00021K-1I
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618479115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fS0V4NXvOH0CuWHPAiY1Nz745kk/YcRrXR2H5wiv1A8=;
 b=QiZh0TtQ9akBH8F770g3eMh85Qj2AFvxm4Yovq4c56hHB9cqAK3DpWwLIfMcbZI0xcy8hY
 Gg+R6f2q5RRPKRRq6RmFAXKKrhUHw95dVdH2v6N0p4wGlxeXCftr2/33UaC/xIEd0o4uXE
 ZjFDkm1XUf9sficuKDxkQfx6U29sa6A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-vn5SV2g3O6mgyuLlElf5KA-1; Thu, 15 Apr 2021 05:31:54 -0400
X-MC-Unique: vn5SV2g3O6mgyuLlElf5KA-1
Received: by mail-ej1-f71.google.com with SMTP id
 j25-20020a1709060519b029037cb8ca241aso718440eja.19
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 02:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=fS0V4NXvOH0CuWHPAiY1Nz745kk/YcRrXR2H5wiv1A8=;
 b=OqoRbERyqBIbWzbm5O009yft/HyWUFZtzAQoQDco5c54ClWlISidp14a7w+whsd6uD
 o0BwqZ2MYRdlgqICDcarp5HBQCatlMyyjhKyRO5SI/TxH3hVikiO/P5Fi1inQk0ho0sq
 /CIR79TQgoUg7/QKk4C0OfpWU2pagf0deqhlOO9ZdiyNrHOAXB/I71yyFmt0R0mmfkcA
 KkMAUy1VpwczQz3PDd83W56YNI9FLnOOGPAWUquvppDERCSCJgTDm+ydgIC6Kta+lG2s
 3nednYS/cJlMxov/sF8bHWzEN3ZMqy9wBW5mjF5PHihcdGQqY99gXTTDAvhJHxFh51Na
 vzvw==
X-Gm-Message-State: AOAM531hdAhQrh/EbKFmu3FhYmccKe+x/F8ogjgt72Itwx7v1zZaanHi
 tIBn/rwJrWv6k7BJdOkbhSTDL1DwjN+qaLVyo7WUvlp3rEsjnsr6vjwk22mvVG4alFSxM+qoy1d
 u6NUYutT0OUD/CYM=
X-Received: by 2002:a17:906:c08f:: with SMTP id
 f15mr2493210ejz.318.1618479112951; 
 Thu, 15 Apr 2021 02:31:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFt6haKPYbu7OoOJPPUfDwKCMlTVD+MRQ3nqbDJZxWRi4h8Z9oVfDlavK/xZTRylDruYXxrw==
X-Received: by 2002:a17:906:c08f:: with SMTP id
 f15mr2493189ejz.318.1618479112694; 
 Thu, 15 Apr 2021 02:31:52 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id h15sm1489921ejs.72.2021.04.15.02.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 02:31:51 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2] i386: Make 'hv-reenlightenment' require explicit
 'tsc-frequency' setting
In-Reply-To: <20210414143903.abx5svpjalndzm3b@habkost.net>
References: <20210331113948.333461-1-vkuznets@redhat.com>
 <20210414132631.ilnasigkxcjoi2px@habkost.net>
 <87eefd55zq.fsf@vitty.brq.redhat.com>
 <20210414143903.abx5svpjalndzm3b@habkost.net>
Date: Thu, 15 Apr 2021 11:31:51 +0200
Message-ID: <87zgxzuc54.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Edmondson <dme@dme.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Wed, Apr 14, 2021 at 03:51:37PM +0200, Vitaly Kuznetsov wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>> 
>> > My apologies, this was lost under the noise in my mail inbox.
>> > (I promise I'm trying to improve)
>> >
>> > On Wed, Mar 31, 2021 at 01:39:48PM +0200, Vitaly Kuznetsov wrote:
>> >> Commit 561dbb41b1d7 "i386: Make migration fail when Hyper-V reenlightenment
>> >> was enabled but 'user_tsc_khz' is unset" forbade migrations with when guest
>> >> has opted for reenlightenment notifications but 'tsc-frequency' wasn't set
>> >> explicitly on the command line. This works but the migration fails late and
>> >> this may come as an unpleasant surprise. To make things more explicit,
>> >> require 'tsc-frequency=' on the command line when 'hv-reenlightenment' was
>> >> enabled. Make the change affect 6.0+ machine types only to preserve
>> >> previously-valid configurations.
>> >> 
>> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> >> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> >
>> > Even if the 6.0 release gets delayed, I wouldn't be comfortable
>> > including this in a -rc4.
>> >
>> > What if the user does not plan to live migrate the machine at
>> > all?  Why is this case different from the ~25
>> > migrate_add_blocker() calls in QEMU, where we block migration but
>> > still let the VM run?
>> 
>> The question is when do we want to let the user know about the
>> problem. By refusing to start with 'hv-reenlightenment' and without
>> 'tsc-frequency' we make it sure he knows early. 
>> 
>> We can, indeed, replace this with migrate_add_blocker() call but the
>> fact that the VM is not migratable may come as a (late) surprise (we
>> can certainly print a warning but these may be hidden by upper layers). 
>> 
>> Also, v1 of this patch was implementing a slightly different approach
>> failing the migration late if we can't set tsc frequency on the
>> destination host. Explicit 'tsc-frequency=' was not required.
>> 
>> Personally, I'm comfortable with any approach, please advise.
>
> I agree with what you are trying to do, I just wonder why we
> wouldn't do exactly the same for all other migrate_add_blocker()
> calls too (whatever the solution we choose here).
>
> I'd suggest the following:
>
> - For people who use "-only-migratable", using
>   migrate_add_blocker() here already solves the problem.
>
> - For people who don't use "-only-migratable", we could change
>   migrate_add_blocker() to print a warning by default (only on
>   machine types where live migration is supported).
>
> - For people who don't need live migration and don't want to see
>   those warnings, we can introduce a "-no-migration" option.

All make sense to me, let me try to draft v3 based on your proposal.

Thanks!

-- 
Vitaly


