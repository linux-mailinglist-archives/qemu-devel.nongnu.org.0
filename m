Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B549E7A8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:36:07 +0100 (CET)
Received: from localhost ([::1]:46250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7kk-0007Og-Ep
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:36:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6fv-00048t-N8
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:27:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6fr-0005AA-23
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643297218;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Jpy3CzIgb5AZCwQ8eOaTSsgpYEyQBJGAjr0/Zk7Qjkg=;
 b=T9571JyWJbs5ZQEJ5iq7pNT5oFienHjYhblPyNd4sO3BTR6kk3w1rO65IzQjY7LcNCmyR9
 Aad81I6bfznTgTXQAwGQgFD5iz30DtOHfaW/Bb5ffiK0AW1/hAf2g+m0MT/mAZCGa+z+x+
 eeJFFYrNY16z8pgf8cMV+IG6FngCUSA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-nONVHDQHO8WrJI_FLzWZCQ-1; Thu, 27 Jan 2022 10:26:56 -0500
X-MC-Unique: nONVHDQHO8WrJI_FLzWZCQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l20-20020a05600c1d1400b0035153bf34c3so1600777wms.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Jpy3CzIgb5AZCwQ8eOaTSsgpYEyQBJGAjr0/Zk7Qjkg=;
 b=gvrh4rJNol/WLi3qhIeDja+WKOXmAt6eorgiJOhIwlzuBsgQN9YoUtDDJxL5DBIRK7
 Lty/a6H44rwtz34RoQ8Z1B5sJLxd+YAg9yVIt16QbYPU3/1jbsSRGEG5xAdCVmLXoFuM
 6mWnmcXYHRqFNwLzjmETQGN+m5zhy05a4wxIeY/dSZt3SQfuk7S53qys+jeBM2W+8VUg
 dGkQHICyOxjA5FOyRiW2GHDjIqou/M85BctghqY9J5vyTBYzKWEjehhDuVoj6fZ8H/OW
 dvOqlrdFNwH5Ai8GWSsmM6NA103WNHV9F2DCYZGGUC5sfB7fyHytOYBdEP/akkgqdbRo
 d1yQ==
X-Gm-Message-State: AOAM533qOaqb5FxrqL4K7umGKHy01O4ITuTCaKMmmWmvMulZH8V9wIv8
 G20YbrrYtu5rZ0YC+TsZPV99nDs6EGEj79WzucePmsD+l/BE5aD9ZTgnB7KI5oz+SlAK0A7CNNZ
 kqAIxJyhXEyN4Cf0=
X-Received: by 2002:a05:600c:21d9:: with SMTP id
 x25mr3692128wmj.193.1643297215621; 
 Thu, 27 Jan 2022 07:26:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgz+xinzn492HOJp7RjeCNq3e7r/C8yqHC5ZezWyxRX0pT6pPr8PBnEXeyLgyEqqZHzZtogg==
X-Received: by 2002:a05:600c:21d9:: with SMTP id
 x25mr3692102wmj.193.1643297215356; 
 Thu, 27 Jan 2022 07:26:55 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id j12sm2356552wru.38.2022.01.27.07.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:26:54 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 21/23] multifd: Zero pages transmission
In-Reply-To: <YfK2gGO6fjouiGGV@work-vm> (David Alan Gilbert's message of "Thu, 
 27 Jan 2022 15:13:04 +0000")
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-22-quintela@redhat.com>
 <YecbN5MbUvL3oVKm@work-vm> <87h79srw1f.fsf@secure.mitica>
 <YfK2gGO6fjouiGGV@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 27 Jan 2022 16:26:54 +0100
Message-ID: <87o83xjj29.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>> > * Juan Quintela (quintela@redhat.com) wrote:
>> >> This implements the zero page dection and handling.
>> >> 
>> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> >> 
>> >> ---
>> >> 
>> >> Add comment for offset (dave)
>> >>              }
>> >>          }
>> >>  
>> >> +        for (int i = 0; i < p->zero_num; i++) {
>> >> +            memset(p->host + p->zero[i], 0, qemu_target_page_size());
>> >> +        }
>> >> +
>> >
>> > On the existing code, it tries to avoid doing the memset if the target
>> > page size matches; that avoids allocating the zero pages on the
>> > destination host; should we try and do the same here?
>> >
>> > Dave
>> 
>> Hi Dave
>> 
>> That only happens on postcopy.
>> With precopy we have to do the memset, because we can have:
>> 
>> write non zero to page 50
>> migrate page 50
>> write zeros to page 50
>> Another migration pass
>> If we don't write here, we have garbage on the page.
>> 
>> Or I am missing something?
>
> You're missing the call to buffer_is_zero:
>
> void ram_handle_compressed(void *host, uint8_t ch, uint64_t size)
> {
>     if (ch != 0 || !buffer_is_zero(host, size)) {
>         memset(host, ch, size);
>     }
> }

Aha, I didn't understood you the 1st time.

Thanks, will add that.

Later, Juan.


