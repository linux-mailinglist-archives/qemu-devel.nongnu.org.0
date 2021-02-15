Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0094931C138
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 19:13:44 +0100 (CET)
Received: from localhost ([::1]:58384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBiNT-0003x9-3O
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 13:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBiLK-0002Xi-OV
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:11:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBiLI-0006qL-Na
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613412688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+a7EJVl7VAwI2E27JS7mCrW0f8AaQ5Uk0lgf9BaqFF0=;
 b=UMChAOoAOAOok7ZFJyIN8r7Tchzzy8oIpTcSAl++ayU8E4QT50X3r+jibF61MctH0SEirO
 YvOZ96GJHxt36APsx2t6QWStL+sm6vPEV/LI6waf3kCLPaxdEgPAvgDzssfquYCSqnTzj+
 aw918qc0xAP+JAOtuGJdWPb92z/DOmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-akHk-lKtOC6oAfAf5vdpuA-1; Mon, 15 Feb 2021 13:11:26 -0500
X-MC-Unique: akHk-lKtOC6oAfAf5vdpuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 189D8801975;
 Mon, 15 Feb 2021 18:11:25 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EDB110023B2;
 Mon, 15 Feb 2021 18:11:11 +0000 (UTC)
Subject: Re: [PATCH 2/4] hw/block/fdc: Remove the check_media_rate property
To: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210203171832.483176-1-thuth@redhat.com>
 <20210203171832.483176-3-thuth@redhat.com>
 <125f27d8-8987-99f7-321e-86e7365d5a07@redhat.com>
 <fb4a2611-49f0-1292-a3c2-478666dfa65c@redhat.com>
 <96906059-731d-1e48-5b60-98ed4df9c037@redhat.com>
 <3b57740e-ad39-3e56-6262-7994376f74a9@redhat.com>
 <88f8ca2f-5121-8d40-81b1-d284737d588a@vivier.eu>
From: John Snow <jsnow@redhat.com>
Message-ID: <4f6cd372-c306-e466-f760-a031aee4234b@redhat.com>
Date: Mon, 15 Feb 2021 13:11:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <88f8ca2f-5121-8d40-81b1-d284737d588a@vivier.eu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/13/21 5:41 PM, Laurent Vivier wrote:
> Le 08/02/2021 à 08:05, Thomas Huth a écrit :
>> On 05/02/2021 21.15, John Snow wrote:
>>> On 2/5/21 1:37 AM, Thomas Huth wrote:
>>>> On 05/02/2021 01.40, John Snow wrote:
>>>>> On 2/3/21 12:18 PM, Thomas Huth wrote:
>>>>>> This was only required for the pc-1.0 and earlier machine types.
>>>>>> Now that these have been removed, we can also drop the corresponding
>>>>>> code from the FDC device.
>>>>>>
>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>> ---
>>>>>>    hw/block/fdc.c             | 17 ++---------------
>>>>>>    tests/qemu-iotests/172.out | 35 -----------------------------------
>>>>>>    2 files changed, 2 insertions(+), 50 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
>>>>>> index 292ea87805..198940e737 100644
>>>>>> --- a/hw/block/fdc.c
>>>>>> +++ b/hw/block/fdc.c
>>>>>> @@ -874,7 +874,6 @@ struct FDCtrl {
>>>>>>            FloppyDriveType type;
>>>>>>        } qdev_for_drives[MAX_FD];
>>>>>>        int reset_sensei;
>>>>>> -    uint32_t check_media_rate;
>>>>>
>>>>> I am a bit of a dunce when it comes to the compatibility properties... does this mess with the
>>>>> migration format?
>>>>>
>>>>> I guess it doesn't, since it's not in the VMSTATE declaration.
>>>>>
>>>>> Hmmmm, alright.
>>>>
>>>> I think that should be fine, yes.
>>>>
>>>>>>        FloppyDriveType fallback; /* type=auto failure fallback */
>>>>>>        /* Timers state */
>>>>>>        uint8_t timer0;
>>>>>> @@ -1021,18 +1020,10 @@ static const VMStateDescription vmstate_fdrive_media_changed = {
>>>>>>        }
>>>>>>    };
>>>>>> -static bool fdrive_media_rate_needed(void *opaque)
>>>>>> -{
>>>>>> -    FDrive *drive = opaque;
>>>>>> -
>>>>>> -    return drive->fdctrl->check_media_rate;
>>>>>> -}
>>>>>> -
>>>>>>    static const VMStateDescription vmstate_fdrive_media_rate = {
>>>>>>        .name = "fdrive/media_rate",
>>>>>>        .version_id = 1,
>>>>>>        .minimum_version_id = 1,
>>>>>> -    .needed = fdrive_media_rate_needed,
>>>>>>        .fields = (VMStateField[]) {
>>>>>>            VMSTATE_UINT8(media_rate, FDrive),
>>>>>>            VMSTATE_END_OF_LIST()
>>>>>> @@ -1689,8 +1680,7 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl, int direction)
>>>>>>        /* Check the data rate. If the programmed data rate does not match
>>>>>>         * the currently inserted medium, the operation has to fail. */
>>>>>> -    if (fdctrl->check_media_rate &&
>>>>>> -        (fdctrl->dsr & FD_DSR_DRATEMASK) != cur_drv->media_rate) {
>>>>>> +    if ((fdctrl->dsr & FD_DSR_DRATEMASK) != cur_drv->media_rate) {
>>>>>>            FLOPPY_DPRINTF("data rate mismatch (fdc=%d, media=%d)\n",
>>>>>>                           fdctrl->dsr & FD_DSR_DRATEMASK, cur_drv->media_rate);
>>>>>>            fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x00);
>>>>>> @@ -2489,8 +2479,7 @@ static void fdctrl_result_timer(void *opaque)
>>>>>>            cur_drv->sect = (cur_drv->sect % cur_drv->last_sect) + 1;
>>>>>>        }
>>>>>>        /* READ_ID can't automatically succeed! */
>>>>>> -    if (fdctrl->check_media_rate &&
>>>>>> -        (fdctrl->dsr & FD_DSR_DRATEMASK) != cur_drv->media_rate) {
>>>>>> +    if ((fdctrl->dsr & FD_DSR_DRATEMASK) != cur_drv->media_rate) {
>>>>>>            FLOPPY_DPRINTF("read id rate mismatch (fdc=%d, media=%d)\n",
>>>>>>                           fdctrl->dsr & FD_DSR_DRATEMASK, cur_drv->media_rate);
>>>>>>            fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x00);
>>>>>> @@ -2895,8 +2884,6 @@ static Property isa_fdc_properties[] = {
>>>>>>        DEFINE_PROP_UINT32("dma", FDCtrlISABus, dma, 2),
>>>>>>        DEFINE_PROP_DRIVE("driveA", FDCtrlISABus, state.qdev_for_drives[0].blk),
>>>>>>        DEFINE_PROP_DRIVE("driveB", FDCtrlISABus, state.qdev_for_drives[1].blk),
>>>>>> -    DEFINE_PROP_BIT("check_media_rate", FDCtrlISABus, state.check_media_rate,
>>>>>> -                    0, true),
>>>>>
>>>>> Could you theoretically set this via QOM commands in QMP, and claim that this is a break in
>>>>> behavior?
>>>>>
>>>>> Though, it's ENTIRELY undocumented, so ... it's probably fine, I think. Probably. (Please soothe
>>>>> my troubled mind.)
>>>>
>>>> A user actually could mess with this property even on the command line, e.g. by using:
>>>>
>>>>    qemu-system-x86_64 -global isa-fdc.check_media_rate=false
>>>>
>>>> ... but, as you said, it's completely undocumented, the property is really just there for the
>>>> internal use of machine type compatibility. We've done such clean-ups in the past already, see
>>>> e.g. c6026998eef382d7ad76 or 2a4dbaf1c0db2453ab78f, so I think this should be fine. But if you
>>>> disagree, I could replace this by a patch that adds this property to the list of deprecated
>>>> features instead, so we could at least remove it after it has been deprecated for two releases?
>>>>
>>>
>>> I don't think it's necessary, personally -- just wanted to make sure I knew the exact stakes here.
>>>
>>> Reviewed-by: John Snow <jsnow@redhat.com>
>>> Acked-by: John Snow <jsnow@redhat.com>
>>
>> Thanks! ... since the first patch has already been merged through Michael's tree, could you then
>> please take this patch here through your floppy / block branch, John? Or maybe it could also go via
>> qemu-trivial?
> 
> Applied to my trivial-patches branch.
> 
> Thanks,
> Laurent
> 

Thank you, Laurent!

--js


