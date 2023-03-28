Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25FB6CB8DC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 09:59:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph4DU-000528-Qd; Tue, 28 Mar 2023 03:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ph4DR-00051e-Mx
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 03:58:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ph4DP-0002WZ-BR
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 03:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679990278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B/z91ZWctYVmedwq/IbE4BII+0c13Yy/yKlQiHM4DB4=;
 b=RrUAvEAGgYPjpwVwJnkpvBGJJ717MgxJzmYYmcNYKXEgDlHnEBVm6ZFZHhxS9seA2hEQE8
 jfdZFtxWbPfZuXqd5jzxB06WrwtEXqSlM7wkvX1Mv7uRdd5+aW55YWR0o0Rpabro0hdBO+
 uKqJAUQlpHufruaPao2grg3u4NAI/Zk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-3AG9Kz93NSG2f98tsEzZAw-1; Tue, 28 Mar 2023 03:57:54 -0400
X-MC-Unique: 3AG9Kz93NSG2f98tsEzZAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 196893C54261;
 Tue, 28 Mar 2023 07:57:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E16A32166B26;
 Tue, 28 Mar 2023 07:57:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C443621E6926; Tue, 28 Mar 2023 09:57:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Claudio Imbrenda
 <imbrenda@linux.ibm.com>,  qemu-devel <qemu-devel@nongnu.org>,  David
 Hildenbrand <david@redhat.com>,  "Borntraeger, Christian"
 <borntraeger@de.ibm.com>,  Janosch Frank <frankja@linux.ibm.com>,
 fiuczy@linux.ibm.com,  Halil Pasic <pasic@linux.ibm.com>,
 nsg@linux.ibm.com,  "P. Berrange, Daniel" <berrange@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v5 1/1] util/async-teardown: wire up
 query-command-line-options
References: <20230327133525.50318-1-imbrenda@linux.ibm.com>
 <20230327133525.50318-2-imbrenda@linux.ibm.com>
 <CABgObfYK_cVCS5x-JYY78KTdrhTnPU+fiK5QRnRTrd+EWMn3bw@mail.gmail.com>
 <87cz4t5tuo.fsf@pond.sub.org>
 <98a65e35-9c56-df86-66ed-f949c1fb9c96@redhat.com>
Date: Tue, 28 Mar 2023 09:57:52 +0200
In-Reply-To: <98a65e35-9c56-df86-66ed-f949c1fb9c96@redhat.com> (Thomas Huth's
 message of "Tue, 28 Mar 2023 09:20:06 +0200")
Message-ID: <87o7od2tq7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Thomas Huth <thuth@redhat.com> writes:

> On 28/03/2023 07.26, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>> 
>>> I am honestly not a fan of adding a more complex option,.just because
>>> query-command-line-options only returns the square holes whereas here we
>>> got a round one.
>>>
>>> Can we imagine another functionality that would be added to -teardown? If
>>> not, it's not a good design. If it works, I would add a completely dummy
>>> (no suboptions) group "async-teardown" and not modify the parsing at all.
>>
>> Does v2 implement your suggestion?
>> Message-Id: <20230320131648.61728-1-imbrenda@linux.ibm.com>
>>
>> I dislike it, because it makes query-command-line-options claim
>> -async-teardown has an option argument with unknown keys, which is
>> plainly wrong, and must be treated as a special case.  Worse, a new kind
>> of special case.
>
> I agree with Markus, it sounds like a bad idea to create a new special case for this.
>
> Paolo, what do you think of my "-run-with" suggestion here:
>
>
> https://lore.kernel.org/qemu-devel/3237c289-b8c2-6ea2-8bfb-7eeed637efc7@redhat.com/
>
> I still think that this is a good idea, even if it is a "grab-bag" as Markus said, it would give us a place where we could wire future similar options, too, without running into this problem here again and again.
>
>> Can we have a QMP command, so libvirt can use query-qmp-schema?
>
> Question is whether this could be toggled during runtime...? Or did you mean a command that just queries the setting of the option, e.g. "query-async-teardown" which then reports whether it is enabled or not?

Mildly ugly, as the command is pretty much useless except as a witness
for the CLI option.  We've done this before.

>> In case QMP becomes functional too late for the command to actually
>> work: make it always fail for now.  It can still serve as a witness for
>> -async-teardown.  If we rework QEMU startup so that QMP can do
>> everything the CLI can do, we'll make the QMP command work.
>
> Adding non-working functions sounds ugly...

Non-working functions that could totally work with QEMU startup reworked
are only mildly ugly, I think.

> Anyway, we're slowly running out of time for QEMU 8.0 ... if we can't find an easy solution, I think we should rather postpone this to the next cycle instead of rushing unfinished stuff now.

Yes.

I think we can still do it if we agree quickly on which kind of ugly we
hate the least.

Adding -async-teardown as a stable interface was premature.  We should
have marked it unstable when no libvirt patch was ready when we cut QEMU
7.2.

Adding new external interfaces is still not hard enough :)


