Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3A3CFC66
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:37:50 +0200 (CEST)
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qsX-00073L-Nz
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m5qqw-0005e2-1q
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:36:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m5qqq-0001q1-3E
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626791763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0JY4pqmYwSGz2a63Y+FuRrNmgn56TUDj4MufGSjBDGM=;
 b=VRgnQH53tbYLwWrOdpUg2qRdOfXeKPs64nRTpnnVSKxf6zlIDWjuxHQCZDVbILrmCyQpC5
 S0rm0tJCeCV6k9bFGmXQC0D6UMObCsl6mnLftefpgesgMlXXQqo3U9YBh2WdZ19MlFa/9X
 YdUo/xjDwZMO9R4h238NfjXpk9mk+Io=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-SUc8gt-LO42P-BxwWAaiqA-1; Tue, 20 Jul 2021 10:36:02 -0400
X-MC-Unique: SUc8gt-LO42P-BxwWAaiqA-1
Received: by mail-wr1-f70.google.com with SMTP id
 i10-20020a5d55ca0000b029013b976502b6so10427754wrw.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 07:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0JY4pqmYwSGz2a63Y+FuRrNmgn56TUDj4MufGSjBDGM=;
 b=W5jpjtbYp0itdm6CY8hvFyA/Lu7vVsk7BO2czpe9D7hnMxRBpvhVoncjC+O8u77FKO
 gThCO9TCAr3qsh+74qk32Zz3WxVpyjR/RuhlCaZnOkjjBDjMUDSXP+uZDN6pop7gVTzb
 BPlypxbo8IUoiTKnWWHKXmMmNZ5Sakp8CcgQMAa1XxlvwFRCoUVhGk88x1mzfdVk5/4N
 Kp0uIxA8WekHzy4DKPraUzHHdfYOiU6xdouf8ke9op4CV0aRCjLm106GJ+WqRY+Vi7jn
 Rb1jzHHz2SbNq03SEWTOoSdHVTs83CHmOTl7nCPFxzoebt648uw9Hrn0afzWiRaEh/x/
 h+3g==
X-Gm-Message-State: AOAM533XF7HlsEH87Ul6m0MNJIwfE+LGt9caHdETD+IJKNU4pziejsWv
 du+OBA1QHvQJR8A3tfxX2YvxZg90Y3uwcKIZ3PY9FHFVidj+viAgN0qPSs1o/rstKJxejPKqwlz
 XUKDNh3v3ZdpcFsY=
X-Received: by 2002:a7b:c844:: with SMTP id c4mr38136276wml.107.1626791761044; 
 Tue, 20 Jul 2021 07:36:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybk7l5uHZH9eU3nbhBPnrdlvVCqQwcKz5WoYZhTwQRmhyTliLtC3Ly7tMJY7pgbwhQnqsWog==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr38136249wml.107.1626791760783; 
 Tue, 20 Jul 2021 07:36:00 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id l24sm2520437wmi.30.2021.07.20.07.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 07:36:00 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] util/oslib-posix: Support concurrent
 os_mem_prealloc() invocation
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210714112306.67793-1-david@redhat.com>
 <20210714112306.67793-4-david@redhat.com> <YPbcQmgAY+GdsIfb@redhat.com>
 <a8b2e7c8-9c95-ea23-c1f0-f74387647809@redhat.com>
 <YPbeX8XASYP4eZTk@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <6da6fe82-d3b6-1996-32e2-71848c4f9157@redhat.com>
Date: Tue, 20 Jul 2021 16:35:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPbeX8XASYP4eZTk@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>>
>>> Of course with the madvise impl we're bypassing the SIGBUS
>>> dance entirely. This is good for people with new kernels,
>>> but is this SIGBUS stuff safe for older kernels ?
>>
>> It remains broken with old kernels I guess. There isn't too much that we can
>> do: disabling prealloc=on once the VM is running breaks existing use cases.
> 
> Ok, while refactoring this, could you add a scary warning next to the
> sigaction calls mentioning that this code is not likely to play well
> with qemu's other handling of sigbus, as a reminder to future reviewers.

Sure thing!

> 
>> Fortunately, running into that race seems to be rare, at least I never hear
>> reports.
> 
> The failure mode is likely to be silent or easily mis-interpreted
> 
> Is there any value in emitting a one-time per process warning message
> on stderr if we take the old codepath post-startup ?

Will look into emitting a warning when running this code while the VM is 
already running. (hope it won't be too ugly to have vm state checks in 
util/oslib-posix).

-- 
Thanks,

David / dhildenb


