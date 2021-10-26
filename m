Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F309843B0A9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:58:22 +0200 (CEST)
Received: from localhost ([::1]:60946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfK9u-0000z6-4I
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1mfJtW-00007r-MY
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:41:26 -0400
Received: from mail.csgraf.de ([85.25.223.15]:49210 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1mfJtT-0007XH-S9
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:41:26 -0400
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 9232B6080126;
 Tue, 26 Oct 2021 12:41:15 +0200 (CEST)
Message-ID: <b92cbb28-4cfc-159b-319f-0e6431c33a35@csgraf.de>
Date: Tue, 26 Oct 2021 12:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:94.0)
 Gecko/20100101 Thunderbird/94.0
Subject: Re: [PATCH v4] isa-applesmc: provide OSK forwarding on Apple hosts
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211022161448.81579-1-yaroshchuk2000@gmail.com>
 <394b94ad-3de6-2dfb-4aaf-344dcef8ec18@csgraf.de>
 <YXa9sCG+crLWnK29@redhat.com>
 <cab92a49-f382-355b-5b93-19b6c94741b9@csgraf.de>
 <YXbDmlw8GqdBtFc2@redhat.com>
 <81e13473-7bfc-4e32-98ef-c0df717f3b0f@csgraf.de>
 <YXbI/SrmRLrvKPZR@redhat.com>
 <d1f2f7d5-5376-f7c3-73d4-c7df95f94206@csgraf.de>
 <YXe/SpwH8Kk96M/g@redhat.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <YXe/SpwH8Kk96M/g@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.215,
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
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?Q?Pedro_To=cc=82rres?= <t0rr3sp3dr0@gmail.com>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, suse@csgraf.de,
 f4bug@amsat.org, qemu-devel@nongnu.org, r.bolshakov@yadro.com,
 "Gabriel L. Somlo" <gsomlo@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 26.10.21 10:42, Daniel P. Berrangé wrote:
> On Mon, Oct 25, 2021 at 09:45:35PM +0200, Alexander Graf wrote:
>> On 25.10.21 17:10, Daniel P. Berrangé wrote:
>>> On Mon, Oct 25, 2021 at 04:53:57PM +0200, Alexander Graf wrote:
>>>> On 25.10.21 16:47, Daniel P. Berrangé wrote:
>>>>> On Mon, Oct 25, 2021 at 04:42:22PM +0200, Alexander Graf wrote:
>>>>>> On 25.10.21 16:22, Daniel P. Berrangé wrote:
>>>>>>> On Mon, Oct 25, 2021 at 12:13:32PM +0200, Alexander Graf wrote:
>>>>>>>> On 22.10.21 18:14, Vladislav Yaroshchuk wrote:
>>>>>>>>> On Apple hosts we can read AppleSMC OSK key directly from host's
>>>>>>>>> SMC and forward this value to QEMU Guest.
>>>>>>>>>
>>>>>>>>> Usage:
>>>>>>>>> `-device isa-applesmc,hostosk=on`
>>>>>>>>>
>>>>>>>>> Apple licence allows use and run up to two additional copies
>>>>>>>>> or instances of macOS operating within virtual operating system
>>>>>>>>> environments on each Apple-branded computer that is already running
>>>>>>>>> the Apple Software, for purposes of:
>>>>>>>>> - software development
>>>>>>>>> - testing during software development
>>>>>>>>> - using macOS Server
>>>>>>>>> - personal, non-commercial use
>>>>>>>>>
>>>>>>>>> Guest macOS requires AppleSMC with correct OSK. The most legal
>>>>>>>>> way to pass it to the Guest is to forward the key from host SMC
>>>>>>>>> without any value exposion.
>>>>>>>>>
>>>>>>>>> Based on https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
>>>>>>>>>
>>>>>>>>> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>>>>>>>>> @@ -331,6 +464,25 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
>>>>>>>>>           isa_register_ioport(&s->parent_obj, &s->io_err,
>>>>>>>>>                               s->iobase + APPLESMC_ERR_PORT);
>>>>>>>>> +    if (s->hostosk_flag) {
>>>>>>>>> +        /*
>>>>>>>>> +         * Property 'hostosk' has higher priority than 'osk'
>>>>>>>>> +         * and shadows it.
>>>>>>>>> +         * Free user-provided 'osk' property value
>>>>>>>>> +         */
>>>>>>>>> +        if (s->osk) {
>>>>>>>>> +            warn_report("isa-applesmc.osk is shadowed "
>>>>>>>>> +                        "by isa-applesmc.hostosk");
>>>>>>>>> +            g_free(s->osk);
>>>>>>>>> +        }
>>>>>>>>> +
>>>>>>>>> +        if (!applesmc_read_host_osk(&s->osk, &err)) {
>>>>>>>>> +            /* On host OSK retrieval error report a warning */
>>>>>>>>> +            error_report_err(err);
>>>>>>>>> +            s->osk = default_osk;
>>>>>>>>> +        }
>>>>>>>>> +    }
>>>>>>>> This part is yucky. A few things:
>>>>>>>>
>>>>>>>> 1) QEMU in general does not fail user requested operations silently. If the
>>>>>>>> user explicitly asked to read the host OSK and we couldn't, it must
>>>>>>>> propagate that error.
>>>>>>>> 2) In tandem to the above, I think the only consistent CX is to make both
>>>>>>>> options mutually exclusive. The easiest way to achieve that IMHO would be to
>>>>>>>> overload the "osk" property. If it is "host", then use the host one.
>>>>>>>> 3) Should we make "osk"="host" the default on macOS as well then? Of course,
>>>>>>>> that one should *not* fail hard when it can't read the key, because it's an
>>>>>>>> implicit request rather than an explicit one.
>>>>>>> The problem with using a magic string value for the existing "osk"
>>>>>>> parameter is that this is not introspectable by management apps.
>>>>>> What introspectability would you like to have?
>>>>> Essentially to answer the question
>>>>>
>>>>>      "Does this QEMU support OSK passthrough from the host"
>>>>>
>>>>> Mgmt apps like libvirt introspect using various query-XXX QMP commands.
>>>>> For devices, the typical approach is to ask for the list of properties
>>>>> the device supports. If we're just accepting a new magic value on an
>>>>> existing property there is no way to query for existance of that feature.
>>>>> If we add a "host-osk=bool" parameter introspectability is trivially
>>>>> satisfied.
>>>> Ok, the only flow that remains sensible in that case to me sounds like the
>>>> following:
>>> Just need an extra check upfront:
>>>
>>>    if (s->osk && s->use_hoist_osk)
>>>        error_setg(errp, ...)
>>>    else
>>>> if (s->osk) {
>>>>       /* Use osk */
>>> This should fail hard if the provided value is the wrong length - currently
>>> it falls back with a warning IIUC.
>>>
>>>> } else if (s->use_host_osk) {
>>>>       /* Use host OSK. Fail hard if we can't find it */
>>>> } else if (can_use_host_osk) {
>>>>       /* See if we can extract the key from the host. If not, fall back to old
>>>> behavior */
>>>> } else {
>>>>       /* Old fallback behavior */
>>> Was this old fallback behaviour actually useful ? IIUC it means it is using
>>>
>>>
>>>     static char default_osk[64] = "This is a dummy key. Enter the real key "
>>>                                   "using the -osk parameter";
>>>
>>> which obviously isn't a valid key that will work with any gust OS that
>>> cares. I guess it at least let QEMU startup, but any the guest OS that
>>> checks the key will be unhappy.
>>>
>>> If if don't think default_osk is actually useful, then we could simplify
>>> further to
>>>
>>>    if (s->osk && s->use_host_osk) {
>>>        error_setg(errp, ...)
>>>    } else if (s->osk) {
>>>       /* Use osk. Fail hard if invalid (ie wrong length) */
>>>    } else if (s->use_host_osk) {
>>>       /* Use host OSK. Fail hard if we can't find it */
>>>    } else {
>>>       /* try to use host OSK, fail hard if we can't find it or non-OS-X build */
>>>    }
>>
>> In the example above, use_host_osk=on and use_host_osk=off yield the exact
>> same behavior, so we don't need the switch, no?
> Hmm, I forgot about machine type back compat. From a strict pov, if we
> change the default it should only be for the 6.2.0 machine type, with
> old machines keeping the current 'default_osk' behaviour.
>
> IOW, for 6.2.0 machine use_host_osk=on as default, and for < 6.2.0,
> use_host_osk=off as default .


Yes, and then the fallback case (no osk, no use_host_osk) would keep 
installing the dummy key.

However, it means that if you create an applesmc VM today with just -M 
pc and then update it to a newer QEMU version, your existing command 
line would no longer work because you then have s->osk && 
s->use_host_osk set.

How about we make the ordering absolutely clear? If you define s->osk, 
that's the one we use. Fallback is either host (default on new instance 
types) or dummy (default for old instance types).

That way we only break existing VM definitions without modeled machine 
version that use -device applesmc without passing in an OSK. That's a 
user base I'm ok breaking.

   if (s->osk) {
      /* Use osk. Fail hard if invalid (ie wrong length) */
   } else if (s->fallback_to_host_osk) {
      /* Use host OSK. Fail hard if we can't find it */
   } else {
      /* Old dummy key behavior */
   }


In addition, new -M pc and -M q35 definitions set 
applesmc.fallback-to-host-osk=on by default.


Alex



