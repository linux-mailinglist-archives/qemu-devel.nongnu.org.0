Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E186EE27B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:09:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIPR-0004uh-Hj; Tue, 25 Apr 2023 09:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prIPN-0004uT-Va
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:08:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prIPM-0005MN-0c
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7o6420pqOpbR0e1kPVuQahpzuSrRnYJ8j2ZoE5Wd6vI=;
 b=OXKCLJzrwSTPdtSL89ejZeW881MMBzEdtA9onoWonSxrgLLZMNj0AgjgeHm4ghC8dgJPIQ
 Nm+qdlCrXHh1jhORa2zepULPHJ1pM7LiqwpgVNi4TCfZMn/ugUTpkejoVy5vUkG46xS89N
 KNYb4b1376iPWIjjy/CVKJPRd9r3N9Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-1FSx1N8DPE6s7R24VRRlDA-1; Tue, 25 Apr 2023 09:08:30 -0400
X-MC-Unique: 1FSx1N8DPE6s7R24VRRlDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CD7B185A78B;
 Tue, 25 Apr 2023 13:08:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7316F2166B3A;
 Tue, 25 Apr 2023 13:08:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 64BD821F1672; Tue, 25 Apr 2023 15:08:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Warner Losh <imp@bsdimp.com>,  Kyle Evans
 <kevans@freebsd.org>,  libvir-list@redhat.com,  Laurent Vivier
 <laurent@vivier.eu>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-11-peter.maydell@linaro.org>
 <87jzy18oqv.fsf@pond.sub.org>
 <CAFEAcA-T7jYeCp9Sqx8nMNeDL2Dr-U0=5FSCyv7QW58Eimto-w@mail.gmail.com>
Date: Tue, 25 Apr 2023 15:08:28 +0200
In-Reply-To: <CAFEAcA-T7jYeCp9Sqx8nMNeDL2Dr-U0=5FSCyv7QW58Eimto-w@mail.gmail.com>
 (Peter Maydell's message of "Tue, 25 Apr 2023 13:13:33 +0100")
Message-ID: <875y9kun1v.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> On Tue, 25 Apr 2023 at 13:10, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > -# Notes: @singlestep is enabled through the GDB stub
>> > +# Notes: @singlestep is enabled on the command line with
>> > +#        '-accel tcg,one-insn-per-tb=on', or with the HMP
>> > +#        'one-insn-per-tb' command.
>>
>> You're deleting "enabled through the GDB stub".  Is this one of the
>> misstatements you alluded to in the commit message
>
> Yes -- this field has never been anything to do with
> GDB-enabled singlestep (or for that matter with
> emulation of any guest-CPU architecture singlestep
> functionality). I assume that whoever originally wrote
> that text was confused by the terrible name of the
> command line option/global variable.

Thanks!

Reviewed-by: Markus Armbruster <armbru@redhat.com>


