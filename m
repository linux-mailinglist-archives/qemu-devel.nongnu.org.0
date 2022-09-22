Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185315E68D1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:52:53 +0200 (CEST)
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPRU-0001oY-26
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obNpy-0004sm-CC
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:10:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obNpw-0005MB-Ja
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663859399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EAP0yEqiv9UF1RL+ISHPLUK8pQAVw+NJe/AsR9iJGEE=;
 b=LYfBSf0w2CsR9NaI+k2TSVGpS41B6G2dCQk2NiTrKT0P6BJXrTtrtyTusYPgATeX1hipbn
 ULowJfB/Qy3cKPhSy/U5IIe/krsxtCsumA+5be9A7dGEcn8MKa03QvAWPLFBDZ6YBSjRNo
 cxzhsrDk8DBtiOq+OIw/gLSMqjDQgHc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-CFjzxPnDOpiFFA5m4sMoCw-1; Thu, 22 Sep 2022 11:09:56 -0400
X-MC-Unique: CFjzxPnDOpiFFA5m4sMoCw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3232E185A7AC;
 Thu, 22 Sep 2022 15:09:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE437492B04;
 Thu, 22 Sep 2022 15:09:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BBB5121E6900; Thu, 22 Sep 2022 17:09:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>,  Richard Henderson
 <richard.henderson@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org,  dinechin@redhat.com,  Gerd Hoffmann
 <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
References: <20220908145308.30282-1-cfontana@suse.de>
 <20220908145308.30282-3-cfontana@suse.de>
 <062faaa8-064c-f68a-e316-aaacb80efa5a@linaro.org>
 <3c6cb3ee-2470-654f-c2c4-3449861f9781@suse.de>
 <8682ad9f-aea8-0419-5ff6-c14493e4e980@suse.de>
 <YynvR49aIK2AzbJ3@redhat.com> <87r105gwtl.fsf@pond.sub.org>
 <Yyr47JwudwU7JYQq@redhat.com> <874jx1dj5l.fsf@pond.sub.org>
 <YyxyJ1W1D5zdZOj9@redhat.com>
Date: Thu, 22 Sep 2022 17:09:52 +0200
In-Reply-To: <YyxyJ1W1D5zdZOj9@redhat.com> (Kevin Wolf's message of "Thu, 22
 Sep 2022 16:33:11 +0200")
Message-ID: <874jwzjvi7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 21.09.2022 um 14:08 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Am 21.09.2022 um 06:45 hat Markus Armbruster geschrieben:
>> >> Can we detect presence of compressed blocks on open?
>> >
>> > We seem to read in the full metadata of the image in dmg_open(). So I
>> > think it would be possible to detect it there.
>> >
>> > dmg_read_mish_block() is what fills in s->types. However, it never fills
>> > in types that it doesn't know (and it pretends it doesn't know the types
>> > of compressed blocks whose module is not loaded). So instead of checking
>> > it in dmg_open() after dmg_read_mish_block() has completed, you would
>> > have to catch the situation already in dmg_read_mish_block() while
>> > parsing the image file, which should be entirely doable if you want.
>> 
>> In most cases, "open fails because some blocks are known to be
>> unreadable" is much better UX than "everything goes swimmingly until you
>> try to read one of the known-unreadable blocks".
>> 
>> Even when your software manages not to eat your data, surprise bad
>> blocks are still likely to result in a bad day.
>
> That's fair. On the other hand, not allowing the user to read the part
> of data that is perfectly readable would be bad, too.
>
> Maybe the right solution would be to have a driver option like
> "unknown-block-types=io-error|fail-open" (probably with better names),
> and then having "fail-open" as the new default would be reasonable
> enough.

Makes sense.


