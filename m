Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D170642C5EA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 18:11:11 +0200 (CEST)
Received: from localhost ([::1]:49316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1magqU-0001d4-DW
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 12:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1magos-0000Gc-Os
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:09:30 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:2304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1magop-0001l7-RY
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:09:30 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 371FC45DAE;
 Wed, 13 Oct 2021 18:09:23 +0200 (CEST)
Subject: Re: [PATCH v4 2/2] monitor: refactor set/expire_password and allow
 VNC display id
To: Markus Armbruster <armbru@redhat.com>
References: <20210928090326.1056010-1-s.reiter@proxmox.com>
 <20210928090326.1056010-3-s.reiter@proxmox.com>
 <87zgrebnod.fsf@dusky.pond.sub.org>
From: Stefan Reiter <s.reiter@proxmox.com>
Message-ID: <69473cd0-b01b-a189-e4e8-fcb02738b7b1@proxmox.com>
Date: Wed, 13 Oct 2021 18:09:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87zgrebnod.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=s.reiter@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 11:24 AM, Markus Armbruster wrote:
> Stefan Reiter <s.reiter@proxmox.com> writes:
> 
>> It is possible to specify more than one VNC server on the command line,
>> either with an explicit ID or the auto-generated ones à la "default",
>> "vnc2", "vnc3", ...
>>
>> It is not possible to change the password on one of these extra VNC
>> displays though. Fix this by adding a "display" parameter to the
>> "set_password" and "expire_password" QMP and HMP commands.
>>
>> For HMP, the display is specified using the "-d" value flag.
>>
>> For QMP, the schema is updated to explicitly express the supported
>> variants of the commands with protocol-discriminated unions.
>>
>> Suggested-by: Eric Blake <eblake@redhat.com>
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> 
> [...]
> 
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index d7567ac866..4244c62c30 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -9,22 +9,23 @@
>>   { 'include': 'common.json' }
>>   { 'include': 'sockets.json' }
>>   
>> +##
>> +# @DisplayProtocol:
>> +#
>> +# Display protocols which support changing password options.
>> +#
>> +# Since: 6.2
>> +#
>> +##
>> +{ 'enum': 'DisplayProtocol',
>> +  'data': [ { 'name': 'vnc', 'if': 'CONFIG_VNC' },
>> +            { 'name': 'spice', 'if': 'CONFIG_SPICE' } ] }
>> +
> 
> 
> 
>>   ##
>>   # @set_password:
>>   #
>>   # Sets the password of a remote display session.
>>   #
>> -# @protocol: - 'vnc' to modify the VNC server password
>> -#            - 'spice' to modify the Spice server password
>> -#
>> -# @password: the new password
>> -#
>> -# @connected: how to handle existing clients when changing the
>> -#             password.  If nothing is specified, defaults to 'keep'
>> -#             'fail' to fail the command if clients are connected
>> -#             'disconnect' to disconnect existing clients
>> -#             'keep' to maintain existing clients
>> -#
>>   # Returns: - Nothing on success
>>   #          - If Spice is not enabled, DeviceNotFound
>>   #
>> @@ -37,33 +38,106 @@
>>   # <- { "return": {} }
>>   #
>>   ##
>> -{ 'command': 'set_password',
>> -  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str'} }
>> +{ 'command': 'set_password', 'boxed': true, 'data': 'SetPasswordOptions' }
>> +
>> +##
>> +# @SetPasswordOptions:
>> +#
>> +# Data required to set a new password on a display server protocol.
>> +#
>> +# @protocol: - 'vnc' to modify the VNC server password
>> +#            - 'spice' to modify the Spice server password
>> +#
>> +# @password: the new password
>> +#
>> +# Since: 6.2
>> +#
>> +##
>> +{ 'union': 'SetPasswordOptions',
>> +  'base': { 'protocol': 'DisplayProtocol',
>> +            'password': 'str' },
>> +  'discriminator': 'protocol',
>> +  'data': { 'vnc': 'SetPasswordOptionsVnc',
>> +            'spice': 'SetPasswordOptionsSpice' } }
>> +
>> +##
>> +# @SetPasswordAction:
>> +#
>> +# An action to take on changing a password on a connection with active clients.
>> +#
>> +# @fail: fail the command if clients are connected
>> +#
>> +# @disconnect: disconnect existing clients
>> +#
>> +# @keep: maintain existing clients
>> +#
>> +# Since: 6.2
>> +#
>> +##
>> +{ 'enum': 'SetPasswordAction',
>> +  'data': [ 'fail', 'disconnect', 'keep' ] }
>> +
>> +##
>> +# @SetPasswordActionVnc:
>> +#
>> +# See @SetPasswordAction. VNC only supports the keep action. 'connection'
>> +# should just be omitted for VNC, this is kept for backwards compatibility.
>> +#
>> +# @keep: maintain existing clients
>> +#
>> +# Since: 6.2
>> +#
>> +##
>> +{ 'enum': 'SetPasswordActionVnc',
>> +  'data': [ 'keep' ] }
>> +
>> +##
>> +# @SetPasswordOptionsSpice:
>> +#
>> +# Options for set_password specific to the VNC procotol.
>> +#
>> +# @connected: How to handle existing clients when changing the
>> +#             password. If nothing is specified, defaults to 'keep'.
>> +#
>> +# Since: 6.2
>> +#
>> +##
>> +{ 'struct': 'SetPasswordOptionsSpice',
>> +  'data': { '*connected': 'SetPasswordAction' } }
>> +
>> +##
>> +# @SetPasswordOptionsVnc:
>> +#
>> +# Options for set_password specific to the VNC procotol.
>> +#
>> +# @display: The id of the display where the password should be changed.
>> +#           Defaults to the first.
>> +#
>> +# @connected: How to handle existing clients when changing the
>> +#             password.
>> +#
>> +# Features:
>> +# @deprecated: For VNC, @connected will always be 'keep', parameter should be
>> +#              omitted.
>> +#
>> +# Since: 6.2
>> +#
>> +##
>> +{ 'struct': 'SetPasswordOptionsVnc',
>> +  'data': { '*display': 'str',
>> +            '*connected': { 'type': 'SetPasswordActionVnc',
>> +                            'features': ['deprecated'] } } }
> 
> Let me describe what you're doing in my own words, to make sure I got
> both the what and the why:
> 
> 1. Change @protocol and @connected from str to enum.
> 
> 2. Turn the argument struct into a union tagged by @protocol, to enable
>     3. and 4.
> 
> 3. Add argument @display in branch 'vnc'.
> 
> 4. Use a separate enum for @connected in each union branch, to enable 4.
> 
> 5. Trim this enum in branch 'vnc' to the values that are actually
>     supported.  Note that just one value remains, i.e. @connected is now
>     an optional argument that can take only the default value.
> 
> 6. Since such an argument is pointless, deprecate @connected in branch
>     'vnc'.
> 
> Correct?

Yes.

> 
> Ignorant question: is it possible to have more than one 'spice' display?

Not in terms of passwords anyway. So only one SPICE password can be set at
any time, i.e. the 'display' parameter in this function does not apply.

> 
> Item 5. is not a compatibility break: before your patch,
> qmp_set_password() rejects the values you drop.

Yes.

> 
> Item 5. adds another enum to the schema in return for more accurate
> introspection and slightly simpler qmp_set_password().  I'm not sure
> that's worthwhile.  I think we could use the same enum for both union
> branches.

I tried to avoid mixing manual parsing and declarative QAPI stuff as much
as I could, so I moved as much as possible to QAPI. I personally like the
extra documentation of having the separate enum.

> 
> I'd split this patch into three parts: item 1., 2.+3., 4.-6., because
> each part can stand on its own.

The reason why I didn't do that initially is more to do with the C side.
I think splitting it up as you describe would make for some awkward diffs
on the qmp_set_password/hmp_set_password side.

I can try of course. Though I also want to have it said that I'm not a fan
of how the HMP functions have to expand so much to accommodate the QAPI
structure in general.

> 
>>   
>>   ##
>>   # @expire_password:
>>   #
>>   # Expire the password of a remote display server.
>>   #
>> -# @protocol: the name of the remote display protocol 'vnc' or 'spice'
>> -#
>> -# @time: when to expire the password.
>> -#
>> -#        - 'now' to expire the password immediately
>> -#        - 'never' to cancel password expiration
>> -#        - '+INT' where INT is the number of seconds from now (integer)
>> -#        - 'INT' where INT is the absolute time in seconds
>> -#
>>   # Returns: - Nothing on success
>>   #          - If @protocol is 'spice' and Spice is not active, DeviceNotFound
>>   #
>>   # Since: 0.14
>>   #
>> -# Notes: Time is relative to the server and currently there is no way to
>> -#        coordinate server time with client time.  It is not recommended to
>> -#        use the absolute time version of the @time parameter unless you're
>> -#        sure you are on the same machine as the QEMU instance.
>> -#
>>   # Example:
>>   #
>>   # -> { "execute": "expire_password", "arguments": { "protocol": "vnc",
>> @@ -71,7 +145,50 @@
>>   # <- { "return": {} }
>>   #
>>   ##
>> -{ 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
>> +{ 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
>> +
>> +##
>> +# @ExpirePasswordOptions:
>> +#
>> +# Data required to set password expiration on a display server protocol.
>> +#
>> +# @protocol: - 'vnc' to modify the VNC server expiration
>> +#            - 'spice' to modify the Spice server expiration
>> +
>> +# @time: when to expire the password.
>> +#
>> +#        - 'now' to expire the password immediately
>> +#        - 'never' to cancel password expiration
>> +#        - '+INT' where INT is the number of seconds from now (integer)
>> +#        - 'INT' where INT is the absolute time in seconds
>> +#
>> +# Notes: Time is relative to the server and currently there is no way to
>> +#        coordinate server time with client time.  It is not recommended to
>> +#        use the absolute time version of the @time parameter unless you're
>> +#        sure you are on the same machine as the QEMU instance.
>> +#
>> +# Since: 6.2
>> +#
>> +##
>> +{ 'union': 'ExpirePasswordOptions',
>> +  'base': { 'protocol': 'DisplayProtocol',
>> +            'time': 'str' },
>> +  'discriminator': 'protocol',
>> +  'data': { 'vnc': 'ExpirePasswordOptionsVnc' } }
>> +
>> +##
>> +# @ExpirePasswordOptionsVnc:
>> +#
>> +# Options for expire_password specific to the VNC procotol.
>> +#
>> +# @display: The id of the display where the expiration should be changed.
>> +#           Defaults to the first.
>> +#
>> +# Since: 6.2
>> +#
>> +##
>> +{ 'struct': 'ExpirePasswordOptionsVnc',
>> +  'data': { '*display': 'str' } }
>>   
>>   ##
>>   # @screendump:
> 
> Same as above, less item 4.-6.
> 
> 


