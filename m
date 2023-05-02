Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA20F6F41EF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:44:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnTq-000561-A1; Tue, 02 May 2023 06:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ptnTm-00055t-2n
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:43:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ptnTk-0004JL-DN
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683024206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=feJmiGKFcJTxPYnnbJgYaAAonDJdUOGCBprHMWE2HuU=;
 b=bIWUbXbRuMrsvH017nO8D4xuTRWbv7nVG1A3WEJp1Bzk/lMrL9imh9IGQhTvP2YmRerh3h
 4UFJM9JOZNFmt+z0WDRVPQnhWVFs67nfxD8SKOZuVpTaJzhvNtgtOfN88UCRAPPiwx2i+/
 rz4F1FDy/u3sMwb59QCmokyL+3snTXw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-H9QK_cAtOG-iKLeuCR3XFQ-1; Tue, 02 May 2023 06:43:22 -0400
X-MC-Unique: H9QK_cAtOG-iKLeuCR3XFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 543531C06EEB;
 Tue,  2 May 2023 10:43:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 207B04020976;
 Tue,  2 May 2023 10:43:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0341621E6681; Tue,  2 May 2023 12:43:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Warner Losh <imp@bsdimp.com>,  Kyle Evans
 <kevans@freebsd.org>,  libvir-list@redhat.com,  Laurent Vivier
 <laurent@vivier.eu>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 00/10] Deprecate/rename singlestep command line
 option, monitor interfaces
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <CAFEAcA-gWH62VjOsQ1LJnLBZ7d94u1R78ESdGvF+jukRQvoY8g@mail.gmail.com>
Date: Tue, 02 May 2023 12:43:20 +0200
In-Reply-To: <CAFEAcA-gWH62VjOsQ1LJnLBZ7d94u1R78ESdGvF+jukRQvoY8g@mail.gmail.com>
 (Peter Maydell's message of "Tue, 2 May 2023 11:22:28 +0100")
Message-ID: <87jzxr814n.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

> On Mon, 17 Apr 2023 at 17:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> The command line option '-singlestep' and its HMP equivalent
>> the 'singlestep' command are very confusingly named, because
>> they have nothing to do with single-stepping the guest (either
>> via the gdb stub or by emulation of guest CPU architectural
>> debug facilities). What they actually do is put TCG into a
>> mode where it puts only one guest instruction into each
>> translation block. This is useful for some circumstances
>> such as when you want the -d debug logging to be easier to
>> interpret, or if you have a finicky guest binary that wants
>> to see interrupts delivered at something other than the end
>> of a basic block.
>
> I'm going to take this series via target-arm.next since
> I'm doing a pullreq anyway.

Yes, please!


