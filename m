Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F333699430
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:21:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdFc-0007Pi-EP; Thu, 16 Feb 2023 07:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSdFU-0007Of-TX
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:20:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSdFR-0003KF-V4
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676550022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmzyxWbtdqJKAKIt5CL9s7eO+G50nvzkIbOPKJFVY9k=;
 b=ES5VMQ6E1h8kSa403Lq8gUpLPM8YZid+zwfKHSJDlSXm3G9GuDMMWBEb3vVNq5F87ddPDN
 rjiIcpBW1PX6LbyClkns3gpVriF0gLaewV2EWeGZX2saaiiElo3wKfjpmM9XHSu2/d4bUl
 IZP2VOy6K4CFlE+ES4lB8CiltYp86gg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-OCYHTzsuOVyANP7tLMG_NQ-1; Thu, 16 Feb 2023 07:20:05 -0500
X-MC-Unique: OCYHTzsuOVyANP7tLMG_NQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7F723810788;
 Thu, 16 Feb 2023 12:20:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF590492C3C;
 Thu, 16 Feb 2023 12:20:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B64D821E6A1F; Thu, 16 Feb 2023 13:20:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Mark Burton <mburton@qti.qualcomm.com>,
 Bill Mills <bill.mills@linaro.org>,  Marco Liebel
 <mliebel@qti.qualcomm.com>,  Alexandre Iooss <erdnaxe@crans.org>,  Mahmoud
 Mandour <ma.mandourr@gmail.com>,  Emilio Cota <cota@braap.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  "Wei W. Wang"
 <wei.w.wang@intel.com>
Subject: Re: Future of icount discussion for next KVM call?
References: <87bklt9alc.fsf@linaro.org>
 <CAHDbmO3QSbpKLWKt9uj+2Yo_fT-dC-E4M1Nb=iWHqMSBw35-3w@mail.gmail.com>
 <87lekxkhes.fsf@secure.mitica>
Date: Thu, 16 Feb 2023 13:20:00 +0100
In-Reply-To: <87lekxkhes.fsf@secure.mitica> (Juan Quintela's message of "Thu, 
 16 Feb 2023 11:56:27 +0100")
Message-ID: <87bkltredr.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Juan Quintela <quintela@redhat.com> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>> (replying all because qemu-devel rejected my email again)
>>
>> On Thu, 16 Feb 2023 at 10:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>>> Hi Juan,
>>>
>>> Do we have an agenda for next weeks KVM call yet? If there is space I'd
>>> like to take some time to discuss the future direction of icount.
>
> For next week we have:
> - more single binary qemu (philippe?)
> - TDX migration from intel.
>   We asked them on the previous call to change their design to transfer
>   stuff through migration channels and not create a new channel.  But I
>   haven't heard from intel. (wei?)
>   They agreed to send the slides and post the code before continue
>   discussion.
>
> And now I like the title of you topic
>
> - Future Direction of icount
>
> O:-)
>
> So, I will recommend 20 minutes each if Wei shows up, or 30/30 for the
> rest.
>
> What do the rest of the people think.

I think we either need fewer topics per call (ideally one), or strictly
enforced time limits per topic.  I don't fancy meetings where the topic
that made me attend falls off the end.

The former may necessitate more frequent calls.


