Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE4A543841
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:01:49 +0200 (CEST)
Received: from localhost ([::1]:48598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyy7w-00049Z-Jh
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyy4Y-0003NX-2s
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:58:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyy4W-0008OF-GQ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654703895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SihQ1xlYFgCcg9jLtuHelwC7iwUpKFsfbr8sd/0N9wk=;
 b=anWIdo2mCgEg19aYx94EgDvp3ghHsGBFPn0PrxPkI8GaafcUKBljGo8Reeko0ILDBoIY2E
 bDkgHd7e3nC3qJJ/V/qCrK2v7yDpEdSE1G1YsKNzT9RNc9KjAqh2OgfoLuBG/QpO4mW5Mz
 k1BeArDgLLC30Hj7i4MJZJV/Gy7P11Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-zoHkZyB4NbmKei4z6MLFaA-1; Wed, 08 Jun 2022 11:58:14 -0400
X-MC-Unique: zoHkZyB4NbmKei4z6MLFaA-1
Received: by mail-ed1-f72.google.com with SMTP id
 x15-20020a05640226cf00b004318eab9feaso3899200edd.12
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 08:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SihQ1xlYFgCcg9jLtuHelwC7iwUpKFsfbr8sd/0N9wk=;
 b=zpIXUvymRZUeyRZ6trTnQrATr21Ax3XFuxtyZ9ZL1om2uRV8jNey9K+l/cOGiph0EY
 J3Lw3OKEqaj4jq0k2RwWFcQCmL7q2X3iFs1Y/gAWuXOH+yCSXT5X2iH+G6VoT/Bjs2Wp
 f1oEoWYGKnodgNCs9V8/MQvnRl/Clm4cAdVD6b9BGsuDG+jmhyVOvGHLXb2CWR+35Qvv
 /dw37LQv31I9/RyQJdDSApUmi8UM1RmqA6eAil1vBkgo4of7QXtSF6GFMmvuACVydXpq
 F3be60GW6MJtyiiMsDaCkDdsB27SSbr5ATPgkA50TLk0rweQI/PA129PNST7A6dyl48E
 fxUA==
X-Gm-Message-State: AOAM532MdLndR4/tw2X9E1AwZDVXXPpYD6vvUgtsScOdAGsX8ZC+YmyY
 I9g4uXBK0yhN/WqnYUYCFMlsxbEndwsucnzS1OinUpW1pZjcrurawvUPTAn8T/ImcnoIYLow3xv
 uR9zxRsyvF2NblNw=
X-Received: by 2002:a05:6402:3312:b0:42d:bf2e:1869 with SMTP id
 e18-20020a056402331200b0042dbf2e1869mr40587290eda.348.1654703893302; 
 Wed, 08 Jun 2022 08:58:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjeu1YbKF6e+sLTTsoGy+htS946TupB2ZbF9kCNP9I2GmDrZCaqgACj/c8GMbbfvNQAvmdXg==
X-Received: by 2002:a05:6402:3312:b0:42d:bf2e:1869 with SMTP id
 e18-20020a056402331200b0042dbf2e1869mr40587272eda.348.1654703893077; 
 Wed, 08 Jun 2022 08:58:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 a25-20020a50c319000000b0042dd2f2bec7sm12471820edb.56.2022.06.08.08.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 08:58:12 -0700 (PDT)
Message-ID: <686d6426-f035-4218-25a2-c212af38ce58@redhat.com>
Date: Wed, 8 Jun 2022 17:58:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 02/10] kvm: Support for querying fd-based stats
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-3-pbonzini@redhat.com> <Yp+ObQxOi/EXc6PZ@work-vm>
 <758db6b4-5786-adf4-d293-d8dc7793a21b@redhat.com> <YqC3pocwSjcp2y/3@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YqC3pocwSjcp2y/3@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/22 16:52, Dr. David Alan Gilbert wrote:
>> If you mean why not some other source, each source has a different file
>> descriptor:
>>
>> +    int stats_fd = kvm_vcpu_ioctl(cpu, KVM_GET_STATS_FD, NULL);
>>
>> but the descriptors are consistent every time KVM_GET_STATS_FD is called, so
>> basically "ident" can be used as a cache key.
>
> Ah OK, this is what I was after; it's a little weird that the caller
> does the ioctl to get the stats-fd, but it does the lookup internally
> with current_cpu for the ident.

Oh yeah that's weird.

Let me squash in this:

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 023bf4ea79..71896ad173 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3871,17 +3871,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
      size_t size_desc;
      ssize_t ret;
  
-    switch (target) {
-    case STATS_TARGET_VM:
-        ident = StatsTarget_str(STATS_TARGET_VM);
-        break;
-    case STATS_TARGET_VCPU:
-        ident = current_cpu->parent_obj.canonical_path;
-        break;
-    default:
-        abort();
-    }
-
+    ident = StatsTarget_str(target);
      QTAILQ_FOREACH(descriptors, &stats_descriptors, next) {
          if (g_str_equal(descriptors->ident, ident)) {
              return descriptors;
@@ -3917,7 +3907,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
      }
      descriptors->kvm_stats_header = kvm_stats_header;
      descriptors->kvm_stats_desc = kvm_stats_desc;
-    descriptors->ident = g_strdup(ident);
+    descriptors->ident = ident;
      QTAILQ_INSERT_TAIL(&stats_descriptors, descriptors, next);
      return descriptors;
  }

(once I test it).

Paolo


