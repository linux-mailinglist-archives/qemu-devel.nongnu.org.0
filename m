Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B90564CCE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 06:51:28 +0200 (CEST)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8E3S-0004zA-Kf
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 00:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8E2A-0004DJ-TO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 00:50:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8E27-00062H-8s
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 00:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656910201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Bmz7j5iCs4H+pDqyp6TwelxYSOjZWky8LPm2OqzeUs=;
 b=afVCHeBFADaA+N+bot//Mtc9gVFrX4JmeblMcMjIyTAkf4SzC8/rIUv/AMcsiLb1N9Gpzb
 m4Uh9ZUyEBmRlqT48WG7gC0Y+JWdKVfIjcNpVbmQYi4SmCX9pxE1LfzR99AaSTRf3SG1fz
 IdgTTW3RyvSC3VOIAUkMnQMD7iRw5Qc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-l8iu33nUMVqKMBzw0ZqnYA-1; Mon, 04 Jul 2022 00:49:57 -0400
X-MC-Unique: l8iu33nUMVqKMBzw0ZqnYA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BF8F3806736;
 Mon,  4 Jul 2022 04:49:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6D5140334D;
 Mon,  4 Jul 2022 04:49:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 825F721E690D; Mon,  4 Jul 2022 06:49:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>,  qemu-devel@nongnu.org,  Hanna Reitz
 <hreitz@redhat.com>,  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PULL 14/15] qdev: Base object creation on QDict rather than
 QemuOpts
References: <20211015144640.198044-1-kwolf@redhat.com>
 <20211015144640.198044-15-kwolf@redhat.com>
 <CAFEAcA9jnySMWRD56FF9D7rXhwARiyvqJx+4Ys+smYa2ghdLBg@mail.gmail.com>
Date: Mon, 04 Jul 2022 06:49:54 +0200
In-Reply-To: <CAFEAcA9jnySMWRD56FF9D7rXhwARiyvqJx+4Ys+smYa2ghdLBg@mail.gmail.com>
 (Peter Maydell's message of "Fri, 1 Jul 2022 14:37:16 +0100")
Message-ID: <87wnctzdl9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 15 Oct 2021 at 16:01, Kevin Wolf <kwolf@redhat.com> wrote:
>> QDicts are both what QMP natively uses and what the keyval parser
>> produces. Going through QemuOpts isn't useful for either one, so switch
>> the main device creation function to QDicts. By sharing more code with
>> the -object/object-add code path, we can even reduce the code size a
>> bit.
>>
>> This commit doesn't remove the detour through QemuOpts from any code
>> path yet, but it allows the following commits to do so.
>>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> Message-Id: <20211008133442.141332-15-kwolf@redhat.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Tested-by: Peter Krempa <pkrempa@redhat.com>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>
> Hi; we discovered via a report on IRC this this commit broke
> handling of "array properties", of which one example is:
> qemu-system-x86_64 -netdev user,id=a -device rocker,len-ports=1,ports[0]=a
>
> This used to work, and now fails with
>  qemu-system-x86_64: -device rocker,len-ports=1,ports[0]=a: Property
> 'rocker.ports[0]' not found
>
> I think this happens because array properties have the
> requirement that the len-foo property is set first before
> any of the foo[n] properties can be set. In the old code
> I guess we used to set properties from the command line
> in the order they were specified, whereas in the new code
> we end up in object_set_properties_from_qdict() which
> tries to set them in whatever order the qdict hash table
> provides them, which turns out to be the wrong one :-(
>
> Any suggestions for how to address this ?

My initial (knee-jerk) reaction to breaking array properties: Faster,
Pussycat! Kill! Kill!

Back to serious: replace the implementation of QDict so it iterates in
order?


