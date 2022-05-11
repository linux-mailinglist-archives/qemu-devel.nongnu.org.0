Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE3952338B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 14:59:23 +0200 (CEST)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nolw2-0000r0-2v
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 08:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noluk-00008T-Jd
 for qemu-devel@nongnu.org; Wed, 11 May 2022 08:58:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nolug-0007Fh-Tx
 for qemu-devel@nongnu.org; Wed, 11 May 2022 08:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652273872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjfjX7wfoE7PLXxyMe100+s+eZe9/qCp7rwhFgAJvtk=;
 b=XR7mULNnbsYkKVWrZ8gq+SdEbIHdM1SYKTD3IYzo6gGEjmKEiL/bJ+Arf51V7Dw94+4iGz
 c4Kv1HN5DG3Z96p0S+yonO7HF7GK3LZVCCDzwqFJ6pMbdQyeivjcCZr7aFlnNygdKkcEDZ
 rIh19QfjvxwojiWlZpOAno/D3vfLBc0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-mO9u0ow3OgSOxWCcpB_RXA-1; Wed, 11 May 2022 08:57:51 -0400
X-MC-Unique: mO9u0ow3OgSOxWCcpB_RXA-1
Received: by mail-wr1-f69.google.com with SMTP id
 p10-20020adfaa0a000000b0020c4829af5fso809590wrd.16
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 05:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fjfjX7wfoE7PLXxyMe100+s+eZe9/qCp7rwhFgAJvtk=;
 b=JfYEm5J96gn6WsEcJn8SBjwD2wZLTCiSHrcZf9nM4KkJTpdiA0iLBspcldNGQgD5wY
 2PaAhvdmZdjSd8j+tbReOrpJbxmWp9PPpLvoWFU0RA3WOgBrLGk8SJAOKowB6AWB0LDW
 6UB5d6ZmjUYgExvRUuv4y9byav5AM2C1IvKU2HHTvLNuKLoglpbUsAE4AGd8slIVOzcZ
 LwuVYIJbuv5Ce0zRdMJzVMUURSrUX/XXCYXZyU2uWywB7a9vDOBHb0Zg0n0KUnNpuVY1
 3GB05OOdxFlt9pIa5X9hNkfkXEW6lFdzfYFFiRaPZSUfynZHbb0EjFcNit4Eov8mOSPh
 vx4A==
X-Gm-Message-State: AOAM530qnjy7JPH3OQpAOLdDAWw5H+NwaOR6pYYeis2XvUiHz3TSAoeA
 Ll3mH+C/m+3tJ9bLtLgAROWOGDQPXRpcZwma5Op4HPajPQ46Hqw+h9NoFyJ+8OSIZPMPbyOQydd
 HAfWfemZyEiFOpnM=
X-Received: by 2002:adf:dd0e:0:b0:20a:d00a:fcf0 with SMTP id
 a14-20020adfdd0e000000b0020ad00afcf0mr22240272wrm.239.1652273870078; 
 Wed, 11 May 2022 05:57:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFFzk9hf7L+ExjvVGmyCCdgEkTiQjHz9W6HdFTN6YAG/tVXR7gIKP9qdpplqeWmp4QbQ9VIQ==
X-Received: by 2002:adf:dd0e:0:b0:20a:d00a:fcf0 with SMTP id
 a14-20020adfdd0e000000b0020ad00afcf0mr22240255wrm.239.1652273869829; 
 Wed, 11 May 2022 05:57:49 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 k5-20020adff285000000b0020c5253d8desm1606084wro.42.2022.05.11.05.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 05:57:49 -0700 (PDT)
Message-ID: <0087bd6b-e3c9-1b51-92e0-7cacfa45826c@redhat.com>
Date: Wed, 11 May 2022 14:57:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ui: Remove deprecated parameters of -display sdl and
 switch to QAPI parser
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, libvir-list@redhat.com
References: <20220511121725.842448-1-thuth@redhat.com>
 <Ynuuo02cDee1nsZL@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Ynuuo02cDee1nsZL@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2022 14.40, Daniel P. Berrangé wrote:
> On Wed, May 11, 2022 at 02:17:25PM +0200, Thomas Huth wrote:
>> The "-display sdl" option still used a hand-crafted parser for its
>> parameters since some of them used underscores which is forbidden
>> in QAPI. Now that they've been deprecated and the deprecation period
>> is over, we can remove the problematic parameters and switch to use
>> the QAPI parser instead.
> 
> I'd say the removal of deprecated bits ought to be separate
> from the addition of new QAPI bits.

Ok, agreed, that likely makes sense.

> 
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 059302a5ef..7d5097808a 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -1309,6 +1309,19 @@
>>         '*swap-opt-cmd': 'bool'
>>     } }
>>   
>> +##
>> +# @DisplaySDL:
>> +#
>> +# SDL2 display options.
>> +#
>> +# @grab-mod:  Modifier keys that should be pressed together
>> +#             with "G" to release the mouse grab.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct'  : 'DisplaySDL',
>> +  'data'    : { '*grab-mod'   : 'str' } }
> 
> So any arbitrary string here, but...
> 
>> diff --git a/ui/sdl2.c b/ui/sdl2.c
>> index d3741f9b75..18c63e1fc9 100644
>> --- a/ui/sdl2.c
>> +++ b/ui/sdl2.c
>> @@ -40,6 +40,8 @@ static struct sdl2_console *sdl2_console;
>>   
>>   static SDL_Surface *guest_sprite_surface;
>>   static int gui_grab; /* if true, all keyboard/mouse events are grabbed */
>> +static bool alt_grab;
>> +static bool ctrl_grab;
>>   
>>   static int gui_saved_grab;
>>   static int gui_fullscreen;
>> @@ -853,6 +855,17 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
>>   
>>       gui_fullscreen = o->has_full_screen && o->full_screen;
>>   
>> +    if (o->u.sdl.has_grab_mod) {
>> +        if (g_str_equal(o->u.sdl.grab_mod, "lshift-lctrl-lalt")) {
>> +            alt_grab = true;
>> +        } else if (g_str_equal(o->u.sdl.grab_mod, "rctrl")) {
>> +            ctrl_grab = true;
>> +        } else {
>> +            error_report("Unsupported grab-mod: %s", o->u.sdl.grab_mod);
>> +            exit(1);
>> +        }
>> +    }
> 
> We're treating this more like an enum here. It does leave the door
> open for adding a generic parsing of arbitrary grab mods later
> I guess

Yes, that's the basic idea - so one day, the user might specify an arbitrary 
string here consisting of their favorite modifiers.

  Thomas



