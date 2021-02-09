Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3877831471E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 04:41:15 +0100 (CET)
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Jtp-0000kU-RJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 22:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9JsV-0000HR-T0
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 22:39:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9JsS-0000Ex-F5
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 22:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612841985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NR/DK+697iUmLTOvImR8XJJHnABoPxTEmPcebkSyyI=;
 b=WSryHBPoPVfVzn9/7AnslKVCWdVO48OyaWETj5ssczJElbe8RoW4z5LWRV9t6S+0TD1TdE
 B7PgBuyVHN56lxRnepKA9F3Tq1qz9JLT1kT977RHmb2sY9daY/St4KHuzn4GYR0ZSpZuNU
 vNRruR+v08ho/MsJnF10hFXu0QZsM7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-w11LaUtUM2qom5iKtMX1vg-1; Mon, 08 Feb 2021 22:39:43 -0500
X-MC-Unique: w11LaUtUM2qom5iKtMX1vg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBB42108C303;
 Tue,  9 Feb 2021 03:39:42 +0000 (UTC)
Received: from [10.72.13.32] (ovpn-13-32.pek2.redhat.com [10.72.13.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B89610013D7;
 Tue,  9 Feb 2021 03:39:38 +0000 (UTC)
Subject: Re: [PATCH 3/3] virtio-net: graceful fallback to vhost=off for tap
 netdev
To: Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210204202915.15925-4-yuri.benditovich@daynix.com>
 <20210205083742-mutt-send-email-mst@kernel.org>
 <afc2b49b-4751-9a16-0859-8543b7ee8796@redhat.com>
 <CAOEp5OchL-Yx4GQKr6jZR68-Cq8h=zFZc_LYvT8U7G5wYN_f1A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c23fa765-9f74-92de-0d6e-41e7ecd596d5@redhat.com>
Date: Tue, 9 Feb 2021 11:39:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOEp5OchL-Yx4GQKr6jZR68-Cq8h=zFZc_LYvT8U7G5wYN_f1A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/9 上午3:46, Yuri Benditovich wrote:
> On Mon, Feb 8, 2021 at 5:15 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2021/2/5 下午9:38, Michael S. Tsirkin wrote:
>>> On Thu, Feb 04, 2021 at 10:29:15PM +0200, Yuri Benditovich wrote:
>>>> Currently virtio-net silently clears features if they are
>>>> not supported by respective vhost. This may create migration
>>>> problems in future if vhost features on the source and destination
>>>> are different. Implement graceful fallback to no-vhost mode
>>>> when some acked features contradict with vhost. The decision is
>>>> taken on set_features call and the vhost will be disabled
>>>> till next reset (or migration).
>>>> Such fallback is currently enabled only for TAP netdev.
>>>>
>>>> Signed-off-by: Yuri Benditovich<yuri.benditovich@daynix.com>
>>> Sounds good, but I don't think we should do this if
>>> vhostforce=on is set.
>>
>> If we do this, does it mean we won't maintain migration compatibility
>> when vhostforce is on?
> AFAIU, the 'vhostforce=on' should mean the vhost can't be disabled (if
> I'm not mistaken this is typically used for vhost-user).
> So we can view this case as similar to vhost-vdpa and vhost-user.


Right, but since it was used by libivrt. Then it turns out to be a 
compatibility breaker.

Thanks


>
>> Thanks
>>
>>
>>> Also, let's document this behaviour with the vhost option so people
>>> are not suprized.
>>>


