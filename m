Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C7C6E0FEF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 16:26:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmxsf-0005eK-Nz; Thu, 13 Apr 2023 10:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pmxsc-0005Ys-Oh
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 10:24:54 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pmxsZ-0002rE-1I
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 10:24:54 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:47ac:0:640:70fa:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 2F5C560C52;
 Thu, 13 Apr 2023 17:24:42 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6510::1:20] (unknown
 [2a02:6b8:b081:6510::1:20])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id aOYOD70OiW20-Afes9AmC; Thu, 13 Apr 2023 17:24:41 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681395881; bh=NMqAiToKvo7nZzDyeapLMXWi1ilUs5lo5A6EhxlIADA=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ltT/1lg11l6K/+vM5R/C7c8uRlpHjpvW5tT6gyYsv1vCJP9AuELcRtIiL86U3NDfe
 mvpnYJ2JKTvgIgmpFWaG5OzmFnuLjhuc8KeFaI+ORV3wJX0x+dwMtuJYsQEaEFwsZA
 zC+ghHS0PhaG0/UUhTvkhIzrs8VUv2+c7NgN70mQ=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <da5c06fe-3422-709a-9782-66e338cc7c85@yandex-team.ru>
Date: Thu, 13 Apr 2023 17:24:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] vhost: Re-enable vrings after setting features
Content-Language: en-US, ru-RU
To: Stefan Hajnoczi <stefanha@gmail.com>, Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Roman Kagan <rvkagan@yandex-team.ru>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-2-hreitz@redhat.com> <20230412205138.GA2813183@fedora>
 <0ca69a92-49ab-223e-b737-9d8655883f38@redhat.com>
 <CAJSP0QWOu5vW_fWc+UKfemrfhgGvJjNJmifVGCyRaP895AXocg@mail.gmail.com>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <CAJSP0QWOu5vW_fWc+UKfemrfhgGvJjNJmifVGCyRaP895AXocg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
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

On 13/04/2023 14:03, Stefan Hajnoczi wrote:
> On Thu, 13 Apr 2023 at 04:20, Hanna Czenczek <hreitz@redhat.com> wrote:
>> On 12.04.23 22:51, Stefan Hajnoczi wrote:
>>> On Tue, Apr 11, 2023 at 05:05:12PM +0200, Hanna Czenczek wrote:
>>>> If the back-end supports the VHOST_USER_F_PROTOCOL_FEATURES feature,
>>>> setting the vhost features will set this feature, too.  Doing so
>>>> disables all vrings, which may not be intended.
>>>>
>>>> For example, enabling or disabling logging during migration requires
>>>> setting those features (to set or unset VHOST_F_LOG_ALL), which will
>>>> automatically disable all vrings.  In either case, the VM is running
>>>> (disabling logging is done after a failed or cancelled migration, and
>>>> only once the VM is running again, see comment in
>>>> memory_global_dirty_log_stop()), so the vrings should really be enabled.
>>>> As a result, the back-end seems to hang.
>>>>
>>>> To fix this, we must remember whether the vrings are supposed to be
>>>> enabled, and, if so, re-enable them after a SET_FEATURES call that set
>>>> VHOST_USER_F_PROTOCOL_FEATURES.
>>>>
>>>> It seems less than ideal that there is a short period in which the VM is
>>>> running but the vrings will be stopped (between SET_FEATURES and
>>>> SET_VRING_ENABLE).  To fix this, we would need to change the protocol,
>>>> e.g. by introducing a new flag or vhost-user protocol feature to disable
>>>> disabling vrings whenever VHOST_USER_F_PROTOCOL_FEATURES is set, or add
>>>> new functions for setting/clearing singular feature bits (so that
>>>> F_LOG_ALL can be set/cleared without touching F_PROTOCOL_FEATURES).
>>>>
>>>> Even with such a potential addition to the protocol, we still need this
>>>> fix here, because we cannot expect that back-ends will implement this
>>>> addition.
>>>>
>>>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>>>> ---
>>>>    include/hw/virtio/vhost.h | 10 ++++++++++
>>>>    hw/virtio/vhost.c         | 13 +++++++++++++
>>>>    2 files changed, 23 insertions(+)
>>>>
>>>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>>>> index a52f273347..2fe02ed5d4 100644
>>>> --- a/include/hw/virtio/vhost.h
>>>> +++ b/include/hw/virtio/vhost.h
>>>> @@ -90,6 +90,16 @@ struct vhost_dev {
>>>>        int vq_index_end;
>>>>        /* if non-zero, minimum required value for max_queues */
>>>>        int num_queues;
>>>> +
>>>> +    /*
>>>> +     * Whether the virtqueues are supposed to be enabled (via
>>>> +     * SET_VRING_ENABLE).  Setting the features (e.g. for
>>>> +     * enabling/disabling logging) will disable all virtqueues if
>>>> +     * VHOST_USER_F_PROTOCOL_FEATURES is set, so then we need to
>>>> +     * re-enable them if this field is set.
>>>> +     */
>>>> +    bool enable_vqs;
>>>> +
>>>>        /**
>>>>         * vhost feature handling requires matching the feature set
>>>>         * offered by a backend which may be a subset of the total
>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>>> index a266396576..cbff589efa 100644
>>>> --- a/hw/virtio/vhost.c
>>>> +++ b/hw/virtio/vhost.c
>>>> @@ -50,6 +50,8 @@ static unsigned int used_memslots;
>>>>    static QLIST_HEAD(, vhost_dev) vhost_devices =
>>>>        QLIST_HEAD_INITIALIZER(vhost_devices);
>>>>
>>>> +static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable);
>>>> +
>>>>    bool vhost_has_free_slot(void)
>>>>    {
>>>>        unsigned int slots_limit = ~0U;
>>>> @@ -899,6 +901,15 @@ static int vhost_dev_set_features(struct vhost_dev *dev,
>>>>            }
>>>>        }
>>>>
>>>> +    if (dev->enable_vqs) {
>>>> +        /*
>>>> +         * Setting VHOST_USER_F_PROTOCOL_FEATURES would have disabled all
>>>> +         * virtqueues, even if that was not intended; re-enable them if
>>>> +         * necessary.
>>>> +         */
>>>> +        vhost_dev_set_vring_enable(dev, true);
>>>> +    }
>>>> +
>>>>    out:
>>>>        return r;
>>>>    }
>>>> @@ -1896,6 +1907,8 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
>>>>
>>>>    static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable)
>>>>    {
>>>> +    hdev->enable_vqs = enable;
>>>> +
>>>>        if (!hdev->vhost_ops->vhost_set_vring_enable) {
>>>>            return 0;
>>>>        }
>>> The vhost-user spec doesn't say that VHOST_F_LOG_ALL needs to be toggled
>>> at runtime and I don't think VHOST_USER_SET_PROTOCOL_FEATURES is
>>> intended to be used like that. This issue shows why doing so is a bad
>>> idea.
>>>
>>> VHOST_F_LOG_ALL does not need to be toggled to control logging. Logging
>>> is controlled at runtime by the presence of the dirty log
>>> (VHOST_USER_SET_LOG_BASE) and the per-vring logging flag
>>> (VHOST_VRING_F_LOG).
>> Technically, the spec doesn’t say that SET_LOG_BASE is required.  It says:
>>
>> “To start/stop logging of data/used ring writes, the front-end may send
>> messages VHOST_USER_SET_FEATURES with VHOST_F_LOG_ALL and
>> VHOST_USER_SET_VRING_ADDR with VHOST_VRING_F_LOG in ring’s flags set to
>> 1/0, respectively.”
>>
>> (So the spec also very much does imply that toggling F_LOG_ALL at
>> runtime is a valid way to enable/disable logging.  If we were to no
>> longer do that, we should clarify it there.)
> I missed that VHOST_VRING_F_LOG only controls logging used ring writes
> while writes to descriptors are always logged when VHOST_F_LOG_ALL is
> set. I agree that the spec does require VHOST_F_LOG_ALL to be toggled
> at runtime.
>
> What I suggested won't work.

But is there a valid use-case for logging some dirty memory but not all?
I can't understand if this is a feature or a just flaw in specification.

>
>> I mean, naturally, logging without a shared memory area to log in to
>> isn’t much fun, so we could clarify that SET_LOG_BASE is also a
>> requirement, but it looks to me as if we can’t use SET_LOG_BASE to
>> disable logging, because it’s supposed to always pass a valid FD (at
>> least libvhost-user expects this:
>> https://gitlab.com/qemu-project/qemu/-/blob/master/subprojects/libvhost-user/libvhost-user.c#L1044).
> As an aside: I don't understand how logging without an fd is supposed
> to work in QEMU's code or in the vhost-user spec. QEMU does not
> support that case even though it's written as if shmfd were optional.
>
>> So after a cancelled migration, the dirty bitmap SHM will stay around
>> indefinitely (which is already not great, but if we were to use the
>> presence of that bitmap as an indicator as to whether we should log or
>> not, it would be worse).
> Yes, continuing to log forever is worse.
>
>> So the VRING_F_LOG flag remains.
>>
>>> I suggest permanently enabling VHOST_F_LOG_ALL upon connection when the
>>> the backend supports it. No spec changes are required.
>>>
>>> libvhost-user looks like it will work. I didn't look at DPDK/SPDK, but
>>> checking that it works there is important too.
>> I can’t find VRING_F_LOG in libvhost-user, so what protocol do you mean
>> exactly that would work in libvhost-user?  Because SET_LOG_BASE won’t
>> work, as you can’t use it to disable logging.
> That's true. There is no way to disable logging.
>
>> (For DPDK, I’m not sure.  It looks like it sometimes takes VRING_F_LOG
>> into account, but I think only when it comes to logging accesses to the
>> vring specifically, i.e. not DMA to other areas of guest memory?  I
>> think only places that use vq->log_guest_addr implicitly check it,
>> others don’t.  So for example,
>> vhost_log_write_iova()/vhost_log_cache_write_iova() don’t seem to check
>> VRING_F_LOG, which seem to be the functions generally used for writes to
>> memory outside of the vrings.  So here, even if VRING_F_LOG is disabled
>> for all vrings, as long as a log SHM is set, all writes to memory
>> outside of the immediate vrings seem to cause logging (as long as
>> F_LOG_ALL is set).)
>>
>> Hanna
>>
>>> I have CCed people who may be interested in this issue. This is the
>>> first time I've looked at vhost-user logging, so this idea may not work.
>>>
>>> Stefan
>>

