Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4954B99FC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 08:44:36 +0100 (CET)
Received: from localhost ([::1]:51238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbSt-00016i-Fo
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 02:44:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nKbRG-0000Ow-1A
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:42:54 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:4635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nKbRD-0003YS-Ml
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:42:53 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id EF012404E1;
 Thu, 17 Feb 2022 08:42:39 +0100 (CET)
Message-ID: <988fcea0-b231-6a23-5c2b-e384ddaf7ef4@proxmox.com>
Date: Thu, 17 Feb 2022 08:42:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 3/3] qapi/monitor: allow VNC display id in
 set/expire_password
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, dgilbert@redhat.com
References: <20220204101220.343526-1-f.ebner@proxmox.com>
 <20220204101220.343526-4-f.ebner@proxmox.com> <875ypogmkt.fsf@pond.sub.org>
From: Fabian Ebner <f.ebner@proxmox.com>
In-Reply-To: <875ypogmkt.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@gmail.com, kraxel@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, eblake@redhat.com, t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.02.22 um 15:07 schrieb Markus Armbruster:
> Fabian Ebner <f.ebner@proxmox.com> writes:
> 
>> From: Stefan Reiter <s.reiter@proxmox.com>
>>
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
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
> 
> Did I suggest this feature?  I don't remember...  Most likely, I merely
> suggested using a union.  Mind if I drop this tag?
> 

Yes, Stefan might've put the tag because of the suggested approach. I'll
drop it.

>> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
>> [FE: update "Since: " from 6.2 to 7.0
>>      set {has_}connected for VNC in hmp_set_password]
>> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
>> ---
>>
>> v7 -> v8:
>> * add missing # in the description for @ExpirePasswordOptions
>> * other changes are already mentioned above
>>
>>  hmp-commands.hx    |  24 +++++-----
>>  monitor/hmp-cmds.c |  39 ++++++++++++----
>>  monitor/qmp-cmds.c |  34 ++++++--------
>>  qapi/ui.json       | 110 ++++++++++++++++++++++++++++++++++++---------
>>  4 files changed, 145 insertions(+), 62 deletions(-)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 70a9136ac2..cc2f4bdeba 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -1514,33 +1514,35 @@ ERST
>>  
>>      {
>>          .name       = "set_password",
>> -        .args_type  = "protocol:s,password:s,connected:s?",
>> -        .params     = "protocol password action-if-connected",
>> +        .args_type  = "protocol:s,password:s,display:-dV,connected:s?",
>> +        .params     = "protocol password [-d display] [action-if-connected]",
>>          .help       = "set spice/vnc password",
>>          .cmd        = hmp_set_password,
>>      },
>>  
>>  SRST
>> -``set_password [ vnc | spice ] password [ action-if-connected ]``
>> -  Change spice/vnc password.  *action-if-connected* specifies what
>> -  should happen in case a connection is established: *fail* makes the
>> -  password change fail.  *disconnect* changes the password and
>> +``set_password [ vnc | spice ] password [ -d display ] [ action-if-connected ]``
> 
> This is the first flag with an argument in HMP.  The alternative is
> another optional argument.
> 
> PRO optional argument: no need for PATCH 1.
> 
> PRO flag with argument: can specify the display without
> action-if-connected.
> 
> Dave, this is your call to make.
> 

I'll go ahead with v9 once the decision is made.

----8<----

>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index e112409211..089f05c702 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -38,20 +38,61 @@
>>    'data': [ 'keep', 'fail', 'disconnect' ] }
>>  
>>  ##
>> -# @set_password:
>> +# @SetPasswordOptions:
>>  #
>> -# Sets the password of a remote display session.
>> +# General options for set_password.
> 
> Actually, all the options there are.  Let's drop "General".
> 

Ok.

>>  #
>>  # @protocol: - 'vnc' to modify the VNC server password
>>  #            - 'spice' to modify the Spice server password
>>  #
>>  # @password: the new password
>>  #
>> -# @connected: how to handle existing clients when changing the
>> -#             password.  If nothing is specified, defaults to 'keep'
>> -#             'fail' to fail the command if clients are connected
>> -#             'disconnect' to disconnect existing clients
>> -#             'keep' to maintain existing clients
>> +# Since: 7.0
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
>> +# @SetPasswordOptionsSpice:
>> +#
>> +# Options for set_password specific to the SPICE procotol.
>> +#
>> +# @connected: How to handle existing clients when changing the
>> +#             password. If nothing is specified, defaults to 'keep'.
>> +#
>> +# Since: 7.0
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
> 
> Neglects to document the default, unlike SetPasswordOptionsSpice above.
> 

Will add it in v9.

>> +#
>> +# Since: 7.0
>> +#
>> +##
>> +{ 'struct': 'SetPasswordOptionsVnc',
>> +  'data': { '*display': 'str',
>> +            '*connected': 'SetPasswordAction' }}
> 
> @connected could be made a common member.  Untested incremental patch
> appended for your consideration.
> 

Yes, sounds good.


