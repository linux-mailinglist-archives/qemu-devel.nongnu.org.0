Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EF552CD3F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 09:37:47 +0200 (CEST)
Received: from localhost ([::1]:33614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrajB-0004KM-Ld
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 03:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nrafL-0003VF-WE
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:33:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nrafK-0007cY-8t
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652945624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=df1TyDqinYcxNsO9rnJc/ZIiccsW7fO8xZLexCwNAho=;
 b=TIgUuiuGswG5lyz9FQjA2tbPXO3taWi8glR+FvBg/0T8+GcBjj5cXrxATNT0FtUb23myls
 tsgpSzmsoMo/9uR6C3HPQhLLxah9OOgFYMLSuHhuKxhmh9dFvwy084xpEHuN07OvO9m/CY
 RLIGcvJRf2/7381/BJ16QWmeLdPj4LQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-hYPSQSq_MqmO0BT6ZmM2CQ-1; Thu, 19 May 2022 03:33:42 -0400
X-MC-Unique: hYPSQSq_MqmO0BT6ZmM2CQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D8E085A5A8
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 07:33:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F26912166B25;
 Thu, 19 May 2022 07:33:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EA2DB21E690D; Thu, 19 May 2022 09:33:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Gerd Hoffmann <kraxel@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com,  Daniel =?utf-8?Q?P=2EBerrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com>
 <87pmkakhdk.fsf@pond.sub.org>
 <f1e31bd1-551e-0366-8a59-d012b23bb88e@redhat.com>
Date: Thu, 19 May 2022 09:33:40 +0200
In-Reply-To: <f1e31bd1-551e-0366-8a59-d012b23bb88e@redhat.com> (Thomas Huth's
 message of "Thu, 19 May 2022 08:39:29 +0200")
Message-ID: <87wneigenf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

Thomas Huth <thuth@redhat.com> writes:

> On 18/05/2022 17.08, Markus Armbruster wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>> 
>>> The "-display sdl" option still uses a hand-crafted parser for its
>>> parameters since we didn't want to drag an interface we considered
>>> somewhat flawed into the QAPI schema. Since the flaws are gone now,
>>> it's time to QAPIfy.
>>>
>>> This introduces the new "DisplaySDL" QAPI struct that is used to hold
>>> the parameters that are unique to the SDL display. The only specific
>>> parameter is currently "grab-mod" that is used to specify the required
>>> modifier keys to escape from the mouse grabbing mode.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   qapi/ui.json            | 27 +++++++++++++++-
>>>   include/sysemu/sysemu.h |  2 --
>>>   softmmu/globals.c       |  2 --
>>>   softmmu/vl.c            | 70 +----------------------------------------
>>>   ui/sdl2.c               | 10 ++++++
>>>   5 files changed, 37 insertions(+), 74 deletions(-)
>>>
>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>> index 11a827d10f..a244e26e0f 100644
>>> --- a/qapi/ui.json
>>> +++ b/qapi/ui.json
>>> @@ -1295,6 +1295,30 @@
>>>         '*swap-opt-cmd': 'bool'
>>>     } }
>>>   
>>> +##
>>> +# @GrabMod:
>>> +#
>>> +# Set of modifier keys that need to be hold for shortcut key actions.
>>> +#
>>> +# Since: 7.1
>>> +##
>>> +{ 'enum'  : 'GrabMod',
>>> +  'data'  : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rctrl' ] }
>> 
>> This is fine now.  If we ever generalize to "arbitrary set of modifier
>> keys", it'll become somewhat awkward.  No objection from me.
>> 
>>> +
>>> +##
>>> +# @DisplaySDL:
>>> +#
>>> +# SDL2 display options.
>>> +#
>>> +# @grab-mod:  String with modifier keys that should be pressed together with
>> 
>> s/String with modifier keys/Modifier keys/
>> 
>>> +#             the "G" key to release the mouse grab. Only "lshift-lctrl-lalt"
>>> +#             and "rctrl" are currently supported.
>> 
>> Why do we define lctrl-lalt if it's not supported?
>
> It's the default value if you don't specify the grab-mod parameter. So it's 
> supported, you get this mode if you use "grab-mod=lctrl-lalt" or no grab-mod 
> parameter at all.

That's not how I understood the comment...

Suggest

    # @grab-mod: Modifier keys that should be pressed together with the "G"
    #            key to release the mouse grab (default "lctrl-lalt")


