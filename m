Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BB13EEFF5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 18:09:04 +0200 (CEST)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1eB-0000An-EV
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 12:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mG1cN-00071v-AI
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:07:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mG1cL-0006ww-RW
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629216428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HTwF2HJlPuWkSZoavhwt0vTmGpDO687+MuFY0MZRmPA=;
 b=GaNwWUSSZSpim9fLTkilx6FGrHRXFoZcU+6ufCvgeDL/xl3UubSvrK8fbqb61vRW0J8Tdb
 ZTpEb34p8fnp+v+hUZGRpG1jkCH8LrKnbe8z/4++1ABHF27BRIxHsMT+VjCE9Ob6/BQ6Ej
 agYxWCmm6lebL63o7sAu82hPoxYvAJM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-9F_oc1kvMte4T9ep4LPbzQ-1; Tue, 17 Aug 2021 12:07:05 -0400
X-MC-Unique: 9F_oc1kvMte4T9ep4LPbzQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so5150539wmc.9
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 09:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HTwF2HJlPuWkSZoavhwt0vTmGpDO687+MuFY0MZRmPA=;
 b=KqAbBn822wQfa82xe33qcltAgh4vbpsCIIMenWcFsbS43toGir/HCgkDU4t3ugcFyN
 LMC2+3RMyRBvDWNxXZaeRQTrv1AtlmAWatm+AGSzDImcNWVaTc+U3PprXVt+Xxs5Qq2i
 JrphkPy+azM/dCXnReHrrQrSVwGQrEwzXd6wE8GCeSGTcpv8Gj8ext2WpNe2JvwqRUks
 OwkjMpn7T6Y+G7/3NfjNap2LIBfoRY6bnTKGHx8zjRUfgYBIMSQqG8MZukfK8CCIuhqT
 +mdLl6/g8ijvlolDur/f4Q3az4XwpVikwpRM5bhf8MTN4zDShmlWsj+0WZisidZdeTQa
 4ZMg==
X-Gm-Message-State: AOAM530sve4G7/g1P/VlsJlybAzAzTKZ7itNXci6a7y1m5CWkpalAbKK
 KbTqCh0N/33cGX2V+qIYZNuSezoM1AfaEfihdfvMeu14J6UlLwbnC4ZdbLOZQROy2R6MwtgB217
 Bz9Z1SGTo0E3pEOg=
X-Received: by 2002:a5d:4983:: with SMTP id r3mr5099413wrq.232.1629216423800; 
 Tue, 17 Aug 2021 09:07:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6I51HWw+oCiUv1ivnwqWmnzJZTU/F4p2Xhm6FRLqITkvHErodDRZp+wycURZtGJ6OpgK0xQ==
X-Received: by 2002:a5d:4983:: with SMTP id r3mr5099381wrq.232.1629216423611; 
 Tue, 17 Aug 2021 09:07:03 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c65c6.dip0.t-ipconnect.de. [91.12.101.198])
 by smtp.gmail.com with ESMTPSA id k26sm3094016wrc.33.2021.08.17.09.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 09:07:03 -0700 (PDT)
Subject: Re: [PATCH RESEND 2/2] memory: Add tracepoint for dirty sync
To: Peter Xu <peterx@redhat.com>
References: <20210817013553.30584-1-peterx@redhat.com>
 <20210817013706.30986-1-peterx@redhat.com>
 <43b42f6e-f2a2-6341-0c53-bcf1586fb191@redhat.com> <YRveXqqR+DELQVSe@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5f6066fb-79be-e369-5d05-8bd22db8864d@redhat.com>
Date: Tue, 17 Aug 2021 18:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRveXqqR+DELQVSe@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.08.21 18:05, Peter Xu wrote:
> On Tue, Aug 17, 2021 at 09:25:56AM +0200, David Hildenbrand wrote:
>> On 17.08.21 03:37, Peter Xu wrote:
>>> Trace at memory_region_sync_dirty_bitmap() for log_sync() or global_log_sync()
>>> on memory regions.  One trace line should suffice when it finishes, so as to
>>> estimate the time used for each log sync process.
>>
>> I wonder if a start/finish would be even nicer. At least it wouldn't really
>> result in significantly more code changes :)
> 
> Note that the "name"s I added is not only for not using start/end, it's about
> knowing which memory listener is slow.  Start/end won't achieve that if we
> don't have a name for them.  So far I just wanted to identify majorly kvm,
> vhost and kvm-smram, however it'll always be good when some log_sync is missed
> when tracing.
> 
> I'm also wondering whether kvm-smram needs a whole bitmap as I don't know what
> RAM would be touched within system manager mode (as I thought it should only
> touch a very limited range and should be defined somewhere), but that's
> off-topic.
> 
> If we want to make it start/end pair, I can do that too.  But the 1st patch
> will still be wanted.

Yeah, absolutely, not complaining about the name, it will be valuable to 
have!


-- 
Thanks,

David / dhildenb


