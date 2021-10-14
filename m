Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CD642D558
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 10:46:02 +0200 (CEST)
Received: from localhost ([::1]:42190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mawNF-0005zG-Ae
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 04:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mawLN-0004cb-96
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:44:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mawLL-0007ji-Gn
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634201042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/UDkVnkkxFoYQMAwkp/Hh/Jm6XVxkOuKqfv/8XcaWc=;
 b=Fj3ZO/uYwChGTcelhGIKmpfGmJlrlHKO1NgDjujy7roIV9mOqJZWiEfGjSHTNw897K13aL
 mt9W0e3DOUVRpCAD+mF1ad5cLawKvtVveERe9oOYm/Rt+RciBRjUhldZl5SdPqQM6tPFyM
 f3ODV2ptkmVHI5M3PrGh5aSEepo6BBU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-JbxusNczND6Fn0niV09i_w-1; Thu, 14 Oct 2021 04:43:59 -0400
X-MC-Unique: JbxusNczND6Fn0niV09i_w-1
Received: by mail-wr1-f72.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso3948660wrb.20
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 01:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=n/UDkVnkkxFoYQMAwkp/Hh/Jm6XVxkOuKqfv/8XcaWc=;
 b=6YFPhCCDEu0V+fPx9iRtf85ZzjfjPAK22uLO95nPyyyBgIeAlRQQ2woynJbHKYGdqN
 572Zm7PAwpCzpqPplsnyA2vpDoGR3+RnXo4ap2mQ88zRSzv4u9e0RQp3U/2Rt0ilDSv9
 P3CtuUcYnEIrcWCumdgXPb5EvGGDqo5tOyCYPqV5rbbUa/W4rh1vYzRH/Q/j8w4/3Wx0
 LQSJGHX9aPvV1dUxwq53WUPIa57RPmBp2CBKj69/zUx8yCc+wp7ci+gm3DxMjSBmExwf
 edozXqyAGI9IH7BIxtIEmYEesEEBG4/ycxyHxarwHLpZtAIjjvyzUmWsdN4a9rrHnSRU
 DuKA==
X-Gm-Message-State: AOAM533iBN+fPW1tqRJ8l+mobKEwJI6hgo+OcxFBc0nelzjsrkKqTljF
 i7STTtPennbq0uI+kpSjrLkucUHe+kHFP9Oj6E+f8KyHimbJOEbYihbD66vmPa+MkOdKQcsCy6K
 p7f+tqia0NnfweD8=
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr5391749wri.92.1634201038210; 
 Thu, 14 Oct 2021 01:43:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOfvANoSsOphznFOOatyAwonzprg/QWJtgNoYtZFqMyk+i4NdZpz+NfUZgTAB1P95PWCk9fQ==
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr5391724wri.92.1634201038005; 
 Thu, 14 Oct 2021 01:43:58 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c694e.dip0.t-ipconnect.de. [91.12.105.78])
 by smtp.gmail.com with ESMTPSA id
 y8sm1511443wmi.43.2021.10.14.01.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 01:43:57 -0700 (PDT)
Message-ID: <ccf14ba6-670a-d720-758c-dd9b91415944@redhat.com>
Date: Thu, 14 Oct 2021 10:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1 0/9] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211011175346.15499-1-david@redhat.com>
 <YWcYytiOeLGNh7gv@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YWcYytiOeLGNh7gv@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 19:35, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> This series is fully reviewed by Peter and I hope we can get either more
>> review feedback or get it merged via the migration tree soonish. Thanks.
> 
> Yep, I think that's a full set now; we should take this via migration.

Thanks! (BTW, this is actually v6, I messed up :) )


-- 
Thanks,

David / dhildenb


