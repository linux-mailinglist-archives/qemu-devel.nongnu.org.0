Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209E86D49F1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:42:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLNU-0001NK-1f; Mon, 03 Apr 2023 10:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjLNQ-0001Mq-5D
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjLNO-0000Gi-D3
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680532901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vh7Fv4AuFSrT15wmd5hgGjh3ZQyN/3Z05ke4LznWXxo=;
 b=U9vSMD6iQ6+zI8BKWroFK2Uj6gdfMxo1fFbpwlmzjh2MsRRJXKMPTt4d7HoHXJGje8yKYr
 a8CH1t/dun4yuMx8NvQRd91fPg39Kss5OwRnMwrrhg0uZnoLPa+IzR57OgCzCIlhD1vQg2
 dqRuEOH9G2lXV9LHx98zz5tkhfpfAP8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-6ocOatpZMq2H8OoWVPeSlg-1; Mon, 03 Apr 2023 10:41:40 -0400
X-MC-Unique: 6ocOatpZMq2H8OoWVPeSlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94052884ECA;
 Mon,  3 Apr 2023 14:41:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 424BF40C845F;
 Mon,  3 Apr 2023 14:41:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3EEC721E6926; Mon,  3 Apr 2023 16:41:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Laurent Vivier
 <laurent@vivier.eu>,  Thomas Huth <thuth@redhat.com>,  Warner Losh
 <imp@bsdimp.com>,  Kyle Evans <kevans@freebsd.org>
Subject: Re: [RFC PATCH 0/5] Deprecate/rename singlestep command line option
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
 <87h6vxo4em.fsf@pond.sub.org>
 <CAFEAcA-+87o7L5oCZY18p63g=7QaEozUdz87thU5t1V3-Rfxew@mail.gmail.com>
Date: Mon, 03 Apr 2023 16:41:38 +0200
In-Reply-To: <CAFEAcA-+87o7L5oCZY18p63g=7QaEozUdz87thU5t1V3-Rfxew@mail.gmail.com>
 (Peter Maydell's message of "Mon, 3 Apr 2023 13:47:46 +0100")
Message-ID: <878rf99gf1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 7 Feb 2023 at 15:56, Markus Armbruster <armbru@redhat.com> wrote:
>> > (3) what should we do about the HMP StatusInfo object?
>> >     I'm not sure how we handle compatibility for HMP.
>>
>> Uh, you mean *QMP*, don't you?
>
> Yes.
>
>> As you wrote above, StatusInfo is returned by query-status, which is a
>> stable interface.  Changes to members therefore require the usual
>> deprecation grace period.  We'd add a new member with a sane name, and
>> deprecate the old one.
>
> Question: is it worth creating a new 'one-insn-per-tb' member at all,
> or should we instead just make the 'singlestep' member optional and
> then stop emitting it (and as a corollary stop reporting it in
> HMP 'info status')? It seems kind of weird that we surface this
> specific slightly esoteric accelerator property and only this one
> in the StatusInfo struct.

Making a mandatory member of QMP output optional is an incompatible
change.  Not necessary here.

If you think the value is not worth reporting, deprecate @singlestep in
QMP, and drop it after a grace period.  You can drop it from HMP right
away, or together with QMP.


