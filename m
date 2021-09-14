Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7127D40B365
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:45:06 +0200 (CEST)
Received: from localhost ([::1]:36280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQAcL-0003bD-Dy
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ9tA-0003Bt-Ge
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:58:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ9t8-0007HZ-Dt
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:58:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631631501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+4nUpN3yMgLssBmX1eaXF/+JyqPQAdUuiwwp2xdGBY=;
 b=WvcwEZPUGgo/BRLKW91inbGUPvfZMzSj4j3iN20JpOLP+2wEusSZk5fS4wL3dAUAmpgX+p
 TvSIXZG7UzcxVoScOxxD1WD0N/edQ8+5RXy9qXGgGjfAueaftTIHCYFn7wFOH7x1oK8CDd
 siwd8onAmQX22okidSaf8mKOPMBKzDE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-TUFkO6Y4NAaVPD-81xjLdg-1; Tue, 14 Sep 2021 10:58:16 -0400
X-MC-Unique: TUFkO6Y4NAaVPD-81xjLdg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j1-20020adff541000000b001593715d384so4067867wrp.1
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N+4nUpN3yMgLssBmX1eaXF/+JyqPQAdUuiwwp2xdGBY=;
 b=Yt7j2qVD1ZtC49NJrAvWxEDrrt9Un8uVGBKdeIgb/ts8LyhOTqF7rRou06WqfeAPRi
 0ujNNEBvOmm8SW3w0HDdHlwQyG0UPFhYrImTp/Tw0SlYpqY5ggfEB4x2f/3GJTDG9rvS
 6nRSDiI2z97DvDwhzmK72k90T+pWXDns9YDHWCIuWQWEfvk5AqphCeciDbRbxE12KoPb
 Ih4AJrxy4O8woOWdoAxR9jnfRmX36vd36PAKiBvnsfNIlDJpni3Of8izeZA7dG5BSN4t
 Knlij/TtP/k3uBkCSscG75gaJsK0V22SULJRaZRSOaPCvwLUMXWxeVt+026qNRNwdIkG
 ClJA==
X-Gm-Message-State: AOAM530H1GZH8yj6tUiqBHYHA8PFDCC3fbzLeA0MLMZC95FBf6CAUGi3
 FwvaSpHm6fOKe6yF4qEMRSMasbq5RFZXoxvTMp/TJiWKQvmJjCQtiFTE5oHaxlcsYi5gcQ/PKZP
 O9bSz2AWXvXG/R9Y=
X-Received: by 2002:a1c:4e14:: with SMTP id g20mr2744402wmh.64.1631631495409; 
 Tue, 14 Sep 2021 07:58:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYCD/4HYns+dR8Co9rPSXs8V9+1fK0rfse/bca44WQewyB4cI2TP8XilB+kIa1mv0+xK2waw==
X-Received: by 2002:a1c:4e14:: with SMTP id g20mr2744378wmh.64.1631631495151; 
 Tue, 14 Sep 2021 07:58:15 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id b188sm469839wmd.39.2021.09.14.07.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 07:58:14 -0700 (PDT)
Subject: Re: [PATCH] virtio-balloon: Fix page-poison subsection name
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210914131716.102851-1-dgilbert@redhat.com>
 <535891c6-237b-6d37-7492-ef8c1e19e6ca@redhat.com> <YUCj3i2BK1HzuztT@work-vm>
 <YUCqoJzt8VjkcNin@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0974971c-2443-8a7d-b5c6-22d2db107b05@redhat.com>
Date: Tue, 14 Sep 2021 16:58:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUCqoJzt8VjkcNin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>, stefanha@redhat.com,
 qemu-devel@nongnu.org, Alexander Duyck <alexander.duyck@gmail.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 3:58 PM, Daniel P. Berrangé wrote:
> On Tue, Sep 14, 2021 at 02:30:06PM +0100, Dr. David Alan Gilbert wrote:
>> * David Hildenbrand (david@redhat.com) wrote:
>>> On 14.09.21 15:17, Dr. David Alan Gilbert (git) wrote:
>>>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>>>
>>>> The subsection name for page-poison was typo'd as:
>>>>
>>>>    vitio-balloon-device/page-poison
>>>>
>>>> Note the missing 'r' in virtio.
>>>>
>>>> When we have a machine type that enables page poison, and the guest
>>>> enables it (which needs a new kernel), things fail rather unpredictably.
>>>>
>>>> The fallout from this is that most of the other subsections fail to
>>>> load, including things like the feature bits in the device, one
>>>> possible fallout is that the physical addresses of the queues
>>>> then get aligned differently and we fail with an error about
>>>> last_avail_idx being wrong.
>>>> It's not obvious to me why this doesn't produce a more obvious failure,
>>>> but virtio's vmstate loading is a bit open-coded.
>>>>
>>>> Fixes: 7483cbbaf82 ("virtio-balloon: Implement support for page poison reporting feature")
>>>> bz: https://bugzilla.redhat.com/show_bug.cgi?id=1984401
>>>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>> ---
>>>>   hw/virtio/virtio-balloon.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
>>>> index 5a69dce35d..c6962fcbfe 100644
>>>> --- a/hw/virtio/virtio-balloon.c
>>>> +++ b/hw/virtio/virtio-balloon.c
>>>> @@ -852,7 +852,7 @@ static const VMStateDescription vmstate_virtio_balloon_free_page_hint = {
>>>>   };
>>>>   static const VMStateDescription vmstate_virtio_balloon_page_poison = {
>>>> -    .name = "vitio-balloon-device/page-poison",
>>>> +    .name = "virtio-balloon-device/page-poison",
>>>>       .version_id = 1,
>>>>       .minimum_version_id = 1,
>>>>       .needed = virtio_balloon_page_poison_support,
>>>>
>>>
>>> Oh, that's very subtle. I wasn't even aware that the prefix really has to
>>> match the actual device ... I thought the whole idea of the prefix here was
>>> just to make the string unique ...
>>
>> Subsection naming is *very* critical; the logic is something like:
>>   'we're loading the X device'
>> a subsection arrives for 'N/P'
>> if 'X==N' then it looks in X for subsection P.
>> If 'X!=N' then it assumes we've finished loading X
>> and P is really for an outer device that X is part of.
>> This is horrible.
> 
> Is there value in making this more explicit via a code convention
> for .name field initializers. eg instead of
> 
>    .name = "virtio-balloon-device/page-poison",
> 
> Prefer
> 
>    .name = TYPE_VIRTIO_BALLOON "/page-poison"
> 
> ?

IIUC so far only user-creatable devices are required to have
a stable name in the TYPE definition (because CLI must stay
stable). Which is why this type is not recommended for
migration section names.


