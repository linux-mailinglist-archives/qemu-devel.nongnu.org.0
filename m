Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D025D4C449B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 13:28:39 +0100 (CET)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNZiA-0006t2-DN
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 07:28:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nNZeT-0005A6-8l
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:24:50 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:15302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nNZeR-0006u4-14
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:24:48 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 877B046115;
 Fri, 25 Feb 2022 13:24:35 +0100 (CET)
Message-ID: <39e1b9b4-d82b-4efc-2a5d-9ce904ecbffe@proxmox.com>
Date: Fri, 25 Feb 2022 13:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v9 3/3] qapi/monitor: allow VNC display id in
 set/expire_password
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <20220225084949.35746-1-f.ebner@proxmox.com>
 <20220225084949.35746-4-f.ebner@proxmox.com> <874k4nkwmb.fsf@pond.sub.org>
From: Fabian Ebner <f.ebner@proxmox.com>
In-Reply-To: <874k4nkwmb.fsf@pond.sub.org>
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
 dgilbert@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.02.22 um 12:34 schrieb Markus Armbruster:
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
>> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
>> [FE: update "Since: " from 6.2 to 7.0
>>      make @connected a common member of @SetPasswordOptions]
>> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
> 
> [...]
> 
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index e112409211..4a13f883a3 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -38,20 +38,47 @@
>>    'data': [ 'keep', 'fail', 'disconnect' ] }
>>  
>>  ##
>> -# @set_password:
>> +# @SetPasswordOptions:
>>  #
>> -# Sets the password of a remote display session.
>> +# Options for set_password.
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
>> +# @connected: How to handle existing clients when changing the
>> +#             password. If nothing is specified, defaults to 'keep'.
>> +#             For VNC, only 'keep' is currently implemented.
>> +#
>> +# Since: 7.0
>> +#
>> +##
>> +{ 'union': 'SetPasswordOptions',
>> +  'base': { 'protocol': 'DisplayProtocol',
>> +            'password': 'str',
>> +            '*connected': 'SetPasswordAction' },
>> +  'discriminator': 'protocol',
>> +  'data': { 'vnc': 'SetPasswordOptionsVnc' } }
>> +
>> +##
>> +# @SetPasswordOptionsVnc:
>> +#
>> +# Options for set_password specific to the VNC procotol.
>> +#
>> +# @display: The id of the display where the password should be changed.
>> +#           Defaults to the first.
> 
> Is this default equivalent to any value?  "The first" suggests it's not.
> 

The value will be NULL and QTAILQ_FIRST(&vnc_displays) is picked, which
means the display defaults to the first display. But yeah, the value
doesn't actually default to the id of the first display, it just behaves
as if it did.


