Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB05BF597
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 06:52:12 +0200 (CEST)
Received: from localhost ([::1]:60690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oariV-00008t-5d
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 00:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oarbv-0004AH-7y
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 00:45:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oarbr-0005M3-Dl
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 00:45:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663735517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MKrBu0T6iCLoVCqoj2lEYcQBTYcVCoQgoD/xdG1VW7k=;
 b=OsqUOMD6o9k2XqBXwpjeDL13AtgL0EU/lUy0zeJCdkbEGRXT08pEpiZr5wVsg8O7D/yt7i
 tp3ySlgRs+GGllJSy+I9ul23skaGmXm22uuZQANFO5d12ye/svkb1en18Rtw7vJNbXXrYM
 UvoF6HaB4CXXDIzIpO0V/ye9rwEtsAE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-uswSGBRcPQWY7lsYfNuvvQ-1; Wed, 21 Sep 2022 00:45:14 -0400
X-MC-Unique: uswSGBRcPQWY7lsYfNuvvQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6FEC833949;
 Wed, 21 Sep 2022 04:45:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CA44492B06;
 Wed, 21 Sep 2022 04:45:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B46B21E6900; Wed, 21 Sep 2022 06:45:10 +0200 (CEST)
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
 <YynvR49aIK2AzbJ3@redhat.com>
Date: Wed, 21 Sep 2022 06:45:10 +0200
In-Reply-To: <YynvR49aIK2AzbJ3@redhat.com> (Kevin Wolf's message of "Tue, 20
 Sep 2022 18:50:15 +0200")
Message-ID: <87r105gwtl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

> Am 08.09.2022 um 19:36 hat Claudio Fontana geschrieben:
>> On 9/8/22 19:10, Claudio Fontana wrote:
>> > On 9/8/22 18:03, Richard Henderson wrote:
>> >> On 9/8/22 15:53, Claudio Fontana wrote:
>> >>> @@ -446,8 +447,13 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>> >>>           return -EINVAL;
>> >>>       }
>> >>>   
>> >>> -    block_module_load_one("dmg-bz2");
>> >>> -    block_module_load_one("dmg-lzfse");
>> >>> +    if (!block_module_load_one("dmg-bz2", &local_err) && local_err) {
>> >>> +        error_report_err(local_err);
>> >>> +    }
>> >>> +    local_err = NULL;
>> >>> +    if (!block_module_load_one("dmg-lzfse", &local_err) && local_err) {
>> >>> +        error_report_err(local_err);
>> >>> +    }
>> >>>   
>> >>>       s->n_chunks = 0;
>> >>>       s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
>> >>
>> >> I wonder if these shouldn't fail hard if the modules don't exist?
>> >> Or at least pass back the error.
>> >>
>> >> Kevin?
>> 
>> is "dmg-bz" _required_ for dmg open to work? I suspect if the dmg
>> image is not compressed, "dmg" can function even if the extra dmg-bz
>> module is not loaded right?
>
> Indeed. The code seems to consider that the modules may not be present.
> The behaviour in these cases is questionable (it seems to silently leave
> the buffers as they are and return success), but the modules are clearly
> optional.
>
>> I'd suspect we should then do:
>> 
>> if (!block_module_load_one("dmg-bz2", &local_err)) {
>>   if (local_err) {
>>      error_report_err(local_err);
>>      return -EINVAL;
>>   }
>>   warn_report("dmg-bz2 is not present, dmg will skip bz2-compressed chunks */
>> }
>> 
>> and same for dmg-lzfse...?
>
> Actually, I think during initialisation, we should just pass NULL as
> errp and ignore any errors.
>
> When a request would access a block that can't be uncompressed because
> of the missing module, that's where we can have a warn_report_once() and
> arguably should fail the I/O request.

Seems like asking for data corruption.  To avoid it, the complete stack
needs to handle I/O errors correctly.

Can we detect presence of compressed blocks on open?


