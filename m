Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7254A71B3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 14:39:42 +0100 (CET)
Received: from localhost ([::1]:41664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFFrH-0003oj-NM
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 08:39:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nFFOm-0000vm-14
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 08:10:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nFFOQ-0001tD-TM
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 08:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643807366;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nFdb2AX2dR+vsoBwFAct0/JT7jpQv60lrztJ9yO1abE=;
 b=Xsfb8Eg8LYBxWu3x/Boi0H5dYx2Wch0NeGa6C5yfFTKLByLnuAt2x1ShLzSsf2ksZfIGV/
 3xZnKz5j9pem2aN56me5Yab/zspC9PWUCPpHULw718mlgYL7AAs4t7xQ0skh1b/oaEkLTq
 fMfVTl4RISOmuMsPbwzETewTO7Tk+h0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-aw0l41JrMdCIdCq_N2wjig-1; Wed, 02 Feb 2022 08:09:21 -0500
X-MC-Unique: aw0l41JrMdCIdCq_N2wjig-1
Received: by mail-wm1-f72.google.com with SMTP id
 189-20020a1c02c6000000b0035399bb7e85so1877139wmc.4
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 05:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=nFdb2AX2dR+vsoBwFAct0/JT7jpQv60lrztJ9yO1abE=;
 b=IsdC4Z0J0LXEKbV56jkg2CdzLdpCWmhUGto4U1dTPs1IP6I4+iJRzl0BINt23vHCCU
 HyiSZbXaMJHd1u3sQK8ZUjdCuQv/ffgbLxNPG8bLYxRKIGpukoLpNtUzpWpCTITnHbnv
 XJc9WwKSWqG9dHOewl14PllsvDcs3MkGSpJLklZZbC1cLgz5xLZy8uZRYSxd5QEOT4uS
 N0aXEKCD4945c44sIZv7agiOU4zz6NIuo+tcUFS/GibWXIsJyag9kGmhoJAMrpH5P09B
 ffyMGUfZp6pCD3W/Z/fR2XktFhmKe6J6+gQ/5YIjTupIYN7WizLi2h/0tsheSpJ3CZ4+
 0DWw==
X-Gm-Message-State: AOAM5334JHcktzPicByamXO/FGM6y7cmYr8o8t/ssbpF+r0hOtHstAFL
 J1n3FjkMVWbDs9/mL7C4jULus6lUnrJsTA41/2caaWanLK600+zWoKwJIIsK4D8ZarC/26UYZ8V
 pUfuVPp9rZXuah3Y=
X-Received: by 2002:a5d:4532:: with SMTP id j18mr15009319wra.602.1643807360394; 
 Wed, 02 Feb 2022 05:09:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaOmhwe6OGH7eMlHW/i0W0bOXGMbEW/SYj5ZHhLNJg8+poJBGn/9NeML6rNtMG89hOyKpL+Q==
X-Received: by 2002:a5d:4532:: with SMTP id j18mr15009302wra.602.1643807360179; 
 Wed, 02 Feb 2022 05:09:20 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id c11sm20528032wri.43.2022.02.02.05.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:09:19 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 3/3] migration: Perform vmsd structure check during
 tests
In-Reply-To: <Yfprvld4Y/GoJbhh@work-vm> (David Alan Gilbert's message of "Wed, 
 2 Feb 2022 11:32:14 +0000")
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-4-dgilbert@redhat.com>
 <87ilu6nrqe.fsf@secure.mitica> <YfK+7LCJssDhie9O@work-vm>
 <87mtjc8el9.fsf@secure.mitica> <Yfprvld4Y/GoJbhh@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 02 Feb 2022 14:09:18 +0100
Message-ID: <87czk5h0u9.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, lsoaresp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>> > * Juan Quintela (quintela@redhat.com) wrote:
>> >> "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
>> >> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> >> >
>> >> > Perform a check on vmsd structures during test runs in the hope
>> >> > of catching any missing terminators and other simple screwups.
>> >> >
>> >> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> >> 
>> >> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> >> 
>> >> queued.
>> >
>> > Careful; I think that'll break with slirp until libslirp gets updated
>> > first.
>> 
>> As expected, it broke it.
>> 
>> I resend the PULL request wihtout that two patches.
>> 
>> Once that we are here, how it is that make check didn't catch this?
>
> Because in my local world I did the changes to libslirp; I wanted to
> make sure qemu people were happy with the changes before proposing them
> to libslirp.
>
> Which I've just done:
>
> https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/112

I mean make check.

It worked for me on my PULL request.  I would have assumed that it
checks slirp.

Later, Juan.


