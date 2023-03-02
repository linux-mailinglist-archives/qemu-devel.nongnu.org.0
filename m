Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28DA6A8197
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:54:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhVz-0007sJ-OA; Thu, 02 Mar 2023 06:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXhVx-0007rq-Lt
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:54:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXhVv-0007be-Q7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677758062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwhG0RKblQO7mX+uovycOUR8OWvmLunOwL4OowtK2ys=;
 b=YP6OB8+vFwGOWEuSlST7avZCNvu7QUYNV0Kd1Ea3hEc6f6CTwwJD4yabBI8rwPu94IP8K7
 zKN4ApEkcpzEwKpnuiqHa7NW6exoyBK9AK3T7LFaZ6BdqJ8jvzjP7RzKN3D9t2y8rJx4CH
 Q/T2DQ4TV1tPCQYSNKF867DL50v1sfs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-L1-0IftaPnyk1B-OpjgaJQ-1; Thu, 02 Mar 2023 06:54:21 -0500
X-MC-Unique: L1-0IftaPnyk1B-OpjgaJQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 c30-20020adfa31e000000b002c59b266371so3137531wrb.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bwhG0RKblQO7mX+uovycOUR8OWvmLunOwL4OowtK2ys=;
 b=vTbBOwE+9SOTCEAlyDEHTrONc7BouS4Hx6bjyIMM3Czi8ZxAnYjmHcVmJ3QljeBWcy
 x0jdpVwKl1vg60Tot0/C+EOGvY1vp6JKwaXpIfOk1O8v32FWm5cpp2DPm8nimk9x7I7c
 a5859iMSD+mjjkfQLXHMzAMCcqHUC79GrYor711nsD2psgn/0lazyK0Dxp5aeOFgqbKb
 CUKhj96Lhca6s9p8UIkuap4hxV4LKFUF5cWkF+s0JQRWwlZ7n9o+eQU6o7jzyPxytvmi
 Y7rej2sB90xTsMejLD+n00kzC98FFvQbwEoV/ri7pN+TBmmhH/fgPam4gkxGfi5NmfHu
 4C6w==
X-Gm-Message-State: AO0yUKWtfmJHn5xWhd+9OrGbLPnreytrkLYHu8qaBoLbc478K6+Bl84Q
 QNuvQIaya7EYjTlRpoeHBsecGnow0cHFXnu3QXqz0HvX7SkhJjkJHGWoEZdQEU37DvWoPVwcRle
 vp9HiXLG0ieZGytw=
X-Received: by 2002:a05:600c:92a:b0:3eb:5739:7591 with SMTP id
 m42-20020a05600c092a00b003eb57397591mr4880911wmp.23.1677758060228; 
 Thu, 02 Mar 2023 03:54:20 -0800 (PST)
X-Google-Smtp-Source: AK7set8MymO/9onjdnBe5tM/2gzpj2K3wcjCQ5v18hbGMZSAVBLD89SgqTfHhp9rVcBuri39vU9VFg==
X-Received: by 2002:a05:600c:92a:b0:3eb:5739:7591 with SMTP id
 m42-20020a05600c092a00b003eb57397591mr4880887wmp.23.1677758059868; 
 Thu, 02 Mar 2023 03:54:19 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:4f00:87ba:e9e9:3821:677b?
 (p200300cbc70e4f0087bae9e93821677b.dip0.t-ipconnect.de.
 [2003:cb:c70e:4f00:87ba:e9e9:3821:677b])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c2f8800b003e91b9a92c9sm2779264wmn.24.2023.03.02.03.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 03:54:19 -0800 (PST)
Message-ID: <cd366355-0589-eba1-bfa0-bd2b9ee117a8@redhat.com>
Date: Thu, 2 Mar 2023 12:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [External] [PATCH] hostmem: Add clear option to file backend
Content-Language: en-US
To: Feiran Zheng <fam.zheng@bytedance.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Fam Zheng <fam@euphon.net>,
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20230302110925.4680-1-fam.zheng@bytedance.com>
 <377c3521-ffe1-074b-48ac-71fd445b3bb4@redhat.com>
 <15DA845E-C50C-46BB-A241-164E5851E388@bytedance.com>
 <9c14c247-0184-35e8-6399-b542e4e20129@redhat.com>
 <D936CC04-15BB-4F77-A2F6-919225EA06C1@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <D936CC04-15BB-4F77-A2F6-919225EA06C1@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 02.03.23 12:48, Feiran Zheng wrote:
> 
> 
>> On 2 Mar 2023, at 11:39, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 02.03.23 12:37, Feiran Zheng wrote:
>>>> On 2 Mar 2023, at 11:31, David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 02.03.23 12:09, Fam Zheng wrote:
>>>>> This adds a memset to clear the backing memory. This is useful in the
>>>>> case of PMEM DAX to drop dirty data, if the backing memory is handed
>>>>> over from a previous application or firmware which didn't clean up
>>>>> before exiting.
>>>>
>>>> Why can't the VM manager do that instead? If you have a file that's certainly easily possible.
>>> Hi David,
>>> Technically yes, but I have a simple VM manager here which wants to avoid replicating the same mmap code, such as handling the flags depending on share=on|off,hugepages=on|off. All in all this approach requires the least additional code to achieve it.
>>
>> so ... we're supposed to maintain that code in QEMU instead to make your life easier ? :)
>>
>> Sorry, for this particular use case I don't see the big benefit of moving that code into QEMU.
>>
> 
> I am posting because this does not only makes my life easier, supposedly it also make other developers life easier, because the file here can be a char file and there is no easy way to clear it (/dev/dax1.0) from command line if you want to invoke a QEMU command directly.
> 
> Maybe I’m missing a convenient command to clear a DAX char file?

Can't you simply use dd and read from /dev/zero?

-- 
Thanks,

David / dhildenb


