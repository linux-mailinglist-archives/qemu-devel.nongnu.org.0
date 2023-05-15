Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BCE702505
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 08:40:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyRrp-0005tD-IB; Mon, 15 May 2023 02:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pyRrn-0005t0-Uk
 for qemu-devel@nongnu.org; Mon, 15 May 2023 02:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pyRrm-0004XL-AB
 for qemu-devel@nongnu.org; Mon, 15 May 2023 02:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684132768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=msUFI9qm2KBlodzGejFVmSv3jyIdrBbWGzNG92u0N60=;
 b=M2MTCvZPre1dyJ6t6yWZ8KhnCgkuiAsGz3ksEICYtx9dEdsbgmGczRHJ4imJqB7AvkvYvz
 Pk6QqVfa8g9RW5D1iyZRMDaE9eyFca2DwFCxxR4lKXXjckhW79igvDIVCwUvm7yvaIvvS1
 ijcMthGULDmW8wPX5h7j/nm2cSzOUgs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-c5sfBvHPMU-TM2GCXaZ5SQ-1; Mon, 15 May 2023 02:39:25 -0400
X-MC-Unique: c5sfBvHPMU-TM2GCXaZ5SQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E402384952A;
 Mon, 15 May 2023 06:39:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D25B63F5F;
 Mon, 15 May 2023 06:39:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 27DB021E6806; Mon, 15 May 2023 08:39:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: css_clear_io_interrupt() error handling
References: <87fs87ny6e.fsf@pond.sub.org> <873547dwn0.fsf@redhat.com>
 <20230509193637.678780aa.pasic@linux.ibm.com>
 <874jokae8j.fsf@pond.sub.org>
 <20230511034355.0b916dcb.pasic@linux.ibm.com>
 <87r0rnjbz0.fsf@pond.sub.org>
 <20230512020519.6dab1a81.pasic@linux.ibm.com>
Date: Mon, 15 May 2023 08:39:24 +0200
In-Reply-To: <20230512020519.6dab1a81.pasic@linux.ibm.com> (Halil Pasic's
 message of "Fri, 12 May 2023 02:05:19 +0200")
Message-ID: <87ttwecd43.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Halil Pasic <pasic@linux.ibm.com> writes:

> On Thu, 11 May 2023 14:20:51 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
> [..]
>> >
>> > In my opinion the best way to deal with such situations would be to
>> > abort() in test/development and log a warning in production. Of course  
>> 
>> Understand, but...
>> 
>> > assert() wouldn't give me that, and it wouldn't be locally consistent at
>> > all.  
>> 
>> ... nothing behaves like that so far.
>> 
>
> I understand. And I agree with all statements from your previous mail. 
>
>> Let's try to come to a conclusion.  We can either keep the current
>> behavior, i.e. abort().  Or we change it to just print something.
>> 
>> If we want the latter: fprintf() to stderr, warn_report(), or trace
>> point?
>> 
>> You are the maintainer, so the decision is yours.
>> 
>> I could stick a patch into a series of error-related cleanup patches I'm
>> working on.
>
> I would gladly take that offer. Given that we didn't see any crashes and
> thus violations of assumptions up till now, and that both the kvm and the
> qemu implementations are from my perspective stable, I think not forcing
> a crash is a good option. From the options you offered, warn_report()
> looks the most compelling to me, but I would trust your expertise to pick
> the actually best one.
>
> Thank you very much.

You're welcome!

>> [*] I'm rather fond of the trick to have oopsie() fork & crash.
>
> I never thought of this, but I do actually find it very compelling
> to get a dump while keeping the workload alive. Especially if
> it was oopsie_once() so one does not get buried in dumps. But we don't
> do things like this in QEMU, or do we?

No, we don't.


