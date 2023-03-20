Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35E76C1210
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 13:41:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peEoO-000552-MI; Mon, 20 Mar 2023 08:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1peEo4-00053U-1s
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 08:40:08 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1peEo1-0006T2-6V
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 08:40:07 -0400
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:1383:0:640:c144:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id D2DB260753;
 Mon, 20 Mar 2023 15:39:56 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b513::1:1f] (unknown
 [2a02:6b8:b081:b513::1:1f])
 by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id rdn2i80OqKo0-bbEfplmp; Mon, 20 Mar 2023 15:39:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1679315996; bh=Uh97Baa4TqR6hx/D/YYf8JOsztFws40gaf6I5EprcyU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=FVaqIkKRXaQ5NOGF08B7RoUWcfE4We+/yQAiyNR+G9GnJzn1uo9EJOoiRUIKMBekF
 TxEO6u+ZgWdn7N43AnXtIfE2gLNVP+iggA2WfGFdBNT2mJsSqcn3pS/fy+/kJ3SAza
 i3ckieI3/NhkIUi7cMX3Tgulnd3ThnScwZloSh4w=
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <06ffc2ce-8cec-139e-9c46-a6c62acb75b6@yandex-team.ru>
Date: Mon, 20 Mar 2023 14:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Virtio-fs] [RFC 2/2] vhost-user-fs: Implement stateful migration
Content-Language: en-US, ru-RU
To: Hanna Czenczek <hreitz@redhat.com>
Cc: virtio-fs@redhat.com, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230313174833.28790-1-hreitz@redhat.com>
 <20230313174833.28790-3-hreitz@redhat.com>
 <035ba8d3-7943-ae8d-f4b2-76ac4fd74cf0@yandex-team.ru>
 <6892623a-f761-c334-b0a3-891a83e65125@redhat.com>
 <172b000e-1776-f98e-6e22-3e805de2e8d4@yandex-team.ru>
 <85b7d10f-6846-066c-026f-ce75850846f4@redhat.com>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <85b7d10f-6846-066c-026f-ce75850846f4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/03/2023 11:33, Hanna Czenczek wrote:
> On 17.03.23 19:37, Anton Kuchin wrote:
>> On 17/03/2023 19:52, Hanna Czenczek wrote:
>>> On 17.03.23 18:19, Anton Kuchin wrote:
>>>> On 13/03/2023 19:48, Hanna Czenczek wrote:
>>>>> A virtio-fs device's VM state consists of:
>>>>> - the virtio device (vring) state (VMSTATE_VIRTIO_DEVICE)
>>>>> - the back-end's (virtiofsd's) internal state
>>>>>
>>>>> We get/set the latter via the new vhost-user operations 
>>>>> FS_SET_STATE_FD,
>>>>> FS_GET_STATE, and FS_SET_STATE.
>>>>>
>
> [...]
>
>>>>>   static const VMStateDescription vuf_vmstate = {
>>>>>       .name = "vhost-user-fs",
>>>>> -    .unmigratable = 1,
>>>>> +    .version_id = 1,
>>>>> +    .fields = (VMStateField[]) {
>>>>> +        VMSTATE_VIRTIO_DEVICE,
>>>>> +        {
>>>>> +            .name = "back-end",
>>>>> +            .info = &(const VMStateInfo) {
>>>>> +                .name = "virtio-fs back-end state",
>>>>> +                .get = vuf_load_state,
>>>>> +                .put = vuf_save_state,
>>>>> +            },
>>>>> +        },
>>>>
>>>> I've been working on stateless migration patch [1] and there was 
>>>> discussed that we
>>>> need to keep some kind of blocker by default if orchestrators rely 
>>>> on unmigratable
>>>> field in virtio-fs vmstate to block the migration.
>>>> For this purpose I've implemented flag that selects "none" or 
>>>> "external" and is checked
>>>> in pre_save, so it could be extended with "internal" option.
>>>> We didn't come to conclusion if we also need to check incoming 
>>>> migration, the discussion
>>>> has stopped for a while but I'm going back to it now.
>>>>
>>>> I would appreciate if you have time to take a look at the 
>>>> discussion and consider the idea
>>>> proposed there to store internal state as a subsection of vmstate 
>>>> to make it as an option
>>>> but not mandatory.
>>>>
>>>> [1] 
>>>> https://patchew.org/QEMU/20230217170038.1273710-1-antonkuchin@yandex-team.ru/
>>>
>>> So far I’ve mostly considered these issues orthogonal.  If your 
>>> stateless migration goes in first, then state is optional and I’ll 
>>> adjust this series.
>>> If stateful migration goes in first, then your series can simply 
>>> make state optional by introducing the external option, no?
>>
>> Not really. State can be easily extended by subsections but not 
>> trimmed. Maybe this can be worked around by defining two types of 
>> vmstate and selecting the correct one at migration, but I'm not sure.
>
> I thought your patch included a switch on the vhost-user-fs device (on 
> the qemu side) to tell qemu what migration data to expect. Can we not 
> transfer a 0-length state for 'external', and assert this on the 
> destination side?

Looks like I really need to make the description of my patch and the 
documentation more clear :) My patch proposes switch on _source_ side to 
select which data to save in the stream mostly to protect old 
orchestrators that don't expect virtio-fs to be migratable (and for 
internal case it can be extended to select if qemu needs to request 
state from backend), Michael insists that we also need to check on 
destination but I disagree because I believe that we can figure this out 
from stream data without additional device flags.

>
>>>
>>> But maybe we could also consider making stateless migration a 
>>> special case of stateful migration; if we had stateful migration, 
>>> can’t we just implement stateless migration by telling virtiofsd 
>>> that it should submit a special “I have no state” pseudo-state, i.e. 
>>> by having a switch on virtiofsd instead?
>>
>> Sure. Backend can send empty state (as your patch treats 0 length as 
>> a valid response and not error) or dummy state that can be recognized 
>> as stateless. The only potential problem is that then we need support 
>> in backend for new commands even to return dummy state, and if 
>> backend can support both types then we'll need some switch in backend 
>> to reply with real or empty state.
>
> Yes, exactly.
>
>>>
>>> Off the top of my head, some downsides of that approach would be
>>> (1) it’d need a switch on the virtiofsd side, not on the qemu side 
>>> (not sure if that’s a downside, but a difference for sure),
>>
>> Why would you? It seems to me that this affects only how qemu treats 
>> the vmstate of device. If the state was requested backend sends it to 
>> qemu. If state subsection is present in stream qemu sends it to the 
>> backend for loading. Stateless one just doesn't request state from 
>> the backend. Or am I missing something?
>>
>>> and (2) we’d need at least some support for this on the virtiofsd 
>>> side, i.e. practically can’t come quicker than stateful migration 
>>> support.
>>
>> Not much, essentially this is just a reconnect. I've sent a draft of 
>> a reconnect patch for old C-virtiofsd, for rust version it takes much 
>> longer because I'm learning rust and I'm not really good at it yet.
>
> I meant these two downsides not for your proposal, but instead if we 
> implemented stateless migration only in the back-end; i.e. the 
> front-end would only implement stateful migration, and the back-end 
> would send and accept an empty state.
>
> Then, qemu would always request a “state” (even if it turns out empty 
> for stateless migration), and qemu would always treat it the same, so 
> there wouldn’t be a switch on the qemu side, but only on the virtiofsd 
> side.  Doesn’t really matter, but what does matter is that we’d need 
> to implement the migration interface in virtiofsd, even if in the end 
> no state is transferred.
>
> So exactly what you’ve said above (“The only potential problem is 
> […]”). :)
>
> Hanna
>

Oh, yes, we were talking about the same thing. So do you agree that 
storing internal state data in subsection will allow backend code to be 
more straightforward without additional switches?


