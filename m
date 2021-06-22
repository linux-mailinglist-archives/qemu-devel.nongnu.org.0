Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712F13B0938
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:35:00 +0200 (CEST)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lviQV-0003ly-Au
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lviOP-0001zR-Bh
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:32:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lviON-0003Wr-ER
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624375966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+tYDb9YdP3h6rzzjStzjIgR7fFI5U4JYO7ktA2y3ZA=;
 b=CJxC2/kb2LyAyKa3OcLKuar5ddMdKNN5YAzAYfM70NoKDdOHDyntyqLtGI2IZ5B8KFH+8t
 CneGocmVYj93BaKsBAx3mkD85oJdCSf2LOqGdg0/i3JXbHM/W64Z42Z/D5VT0ZX/HgoGIp
 3o1bkx1kiT4qK/9NlbIy5BCQ0qO3yTA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-rPnjYmqvP0KuJB8sUyA_lw-1; Tue, 22 Jun 2021 11:32:45 -0400
X-MC-Unique: rPnjYmqvP0KuJB8sUyA_lw-1
Received: by mail-wm1-f69.google.com with SMTP id
 s80-20020a1ca9530000b02901cff732fde5so1305366wme.6
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=E+tYDb9YdP3h6rzzjStzjIgR7fFI5U4JYO7ktA2y3ZA=;
 b=CrPnevZJg4FJDh7AuvohroU/GAxdfUvicNvK1zHDSZhUnxM+2pmoVm5benw8UQibIy
 m3Ij25XIrO8Oa5HKSTBkIqBn/GjlRof5EKWJ/pioLrVWzs7KJcT2g0u4f01hBiL9oHqh
 FEwH9Hu6aP42cGjLiUpWHdpMRhap9L8IR8Npy0NKxYnEw6NIIKKz3KvyY5E0gd8oe0lQ
 wQApmCSObd94AH2pkMnDBEQis1Us5/m9yE3zTIZh+k999ivKOFqSar+V1JT+ZatN4YzZ
 XlsHs6oRQYB/iEpZL9tJDopnTsu1I44THgAzoCAuHAW3BecEIY3JBIfiCTvhQnyFAJAH
 BXLQ==
X-Gm-Message-State: AOAM5322yvVfg5FnynZW3TRmWmf7jdblTfjXWGJ+Kth59/7ojBGYzC/8
 3U21tFO193NXxVKzrN2CxMzORlY4CaAE6w3y1UBpFe4jxj5gcccRu05EW0SEnBOr6ZP9Mexyq48
 w3jWKbYRu13I8Pxi5+Q+eTT8APNpy7m4XjX0Ix4H39SR8EQaw7hjrauEWdjEiDyLv
X-Received: by 2002:adf:e787:: with SMTP id n7mr5490193wrm.169.1624375964297; 
 Tue, 22 Jun 2021 08:32:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygjkyahika5D6H8ZflDZw/vkACU4RCJenBNCqZsXUW58g6/6v/RzTODmkTRq8ji+4KoFpjyA==
X-Received: by 2002:adf:e787:: with SMTP id n7mr5490149wrm.169.1624375963923; 
 Tue, 22 Jun 2021 08:32:43 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 u15sm2655744wmq.48.2021.06.22.08.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 08:32:43 -0700 (PDT)
Subject: Re: [PATCH 4/4] iotests/308: Test allow-other
To: Kevin Wolf <kwolf@redhat.com>
References: <20210614144407.134243-1-mreitz@redhat.com>
 <20210614144407.134243-5-mreitz@redhat.com> <YNH86rBVVG2mJo/E@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <42e9ae24-864d-fa53-3a04-2ac0df47b583@redhat.com>
Date: Tue, 22 Jun 2021 17:32:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YNH86rBVVG2mJo/E@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.06.21 17:08, Kevin Wolf wrote:
> Am 14.06.2021 um 16:44 hat Max Reitz geschrieben:
>> We cannot reasonably test the main point of allow-other, which is to
>> allow users other than the current one to access the FUSE export,
>> because that would require access to sudo, which this test most likely
>> will not have.  (Also, we would need to figure out some user/group that
>> is on the machine and that is not the current user/group, which may
>> become a bit hairy.)
>>
>> But we can test some byproducts: First, whether changing permissions
>> works (our FUSE code only allows so for allow-other=true), and second,
>> whether the kernel applies permission checks with allow-other=true
>> (because that implies default_permissions).
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
> This seems to have the problem that you mentioned:
>
> --- /home/kwolf/source/qemu/tests/qemu-iotests/308.out
> +++ 308.out.bad
> @@ -205,7 +205,9 @@
>            'writable': true,
>            'allow-other': true
>             } }
> -{"return": {}}
> +fusermount3: option allow_other only allowed if 'user_allow_other' is set in /etc/fuse.conf
> +{"error": {"class": "GenericError", "desc": "Failed to mount FUSE session to export"}}
> +Timeout waiting for return on handle 2
>   (Invoking chmod)
>   Permissions post-chmod: 666
>   (Removing all permissions)
>
> Maybe it should be a separate test case that is skipped with
> user_allow_other is disabled.

Right.

>>   tests/qemu-iotests/308     | 91 ++++++++++++++++++++++++++++++++++++++
>>   tests/qemu-iotests/308.out | 47 ++++++++++++++++++++
>>   2 files changed, 138 insertions(+)
>>
>> diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
>> index f122065d0f..1b2f908947 100755
>> --- a/tests/qemu-iotests/308
>> +++ b/tests/qemu-iotests/308
>> @@ -334,6 +334,97 @@ echo '=== Compare copy with original ==='
>>   
>>   $QEMU_IMG compare -f raw -F $IMGFMT "$COPIED_IMG" "$TEST_IMG"
>>   
>> +echo
>> +echo '=== Test permissions ==='
>> +
>> +# Test that you can only change permissions on the export with allow-other=true.
>> +# We cannot really test the primary reason behind allow-other (i.e. to allow
>> +# users other than the current one access to the export), because for that we
>> +# would need sudo, which realistically nobody will allow this test to use.
>> +# What we can do is test that allow-other=true also enables default_permissions,
>> +# i.e. whether we can still read from the file if we remove the read permission.
> We already have other test cases that use sudo if available. Though I
> guess it means that these tests aren't run very often.

Yes, I know, but honestly I don’t really want to deal with user 
management either.  I had a paragraph about that in a preliminary 
version but decided to cut it, because, I thought it wouldn’t really matter.

That problem is that I’d need to run qemu-io as some different user, and 
the question is, who is a different user?  I suppose I could rely on 
“root” and “nobody” being valid users on any system, but I don’t think I 
can be sure that the user running the tests isn’t either of those.  So I 
would have to check whether the current user is “root”, and then run it 
as “nobody”, or otherwise run it as “root”, but that just seems like I’m 
getting in too deep for something that isn’t really useful anyway, 
because on developers’ machines, it will most likely be skipped anyway.

Max


