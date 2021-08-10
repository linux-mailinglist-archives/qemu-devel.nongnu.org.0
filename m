Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B5E3E55A8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:40:06 +0200 (CEST)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNIr-0001eh-8r
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDNHU-0007lC-6Q
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:38:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDNHS-0000iA-G4
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:38:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628584717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCwe09+T/nbcl7nGNXFGlGTq8XyDhVrvst3EJqT4lSw=;
 b=dJ8/ZooaFx1bLvkB7riu3iQe4Kpyl97bcLN58EAbCTZ+x6rtGIIGNWpEONDH+2z4scoNt/
 U6AEmCP377fIjUuJjJVKEYzr6OINGzO9HXva0YdtVQpe8TcJGt4rJSG4sPUb6V3QibR2q/
 hEhw5fnTfZAXpGKH61J77CW9xHMe65M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-xwgUS7_PMDGJSbtj274NqA-1; Tue, 10 Aug 2021 04:38:34 -0400
X-MC-Unique: xwgUS7_PMDGJSbtj274NqA-1
Received: by mail-wm1-f70.google.com with SMTP id
 f25-20020a1c6a190000b029024fa863f6b0so785892wmc.1
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 01:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PCwe09+T/nbcl7nGNXFGlGTq8XyDhVrvst3EJqT4lSw=;
 b=FR6+jiu3rv4SwWVr/cFpFv5y7PJ8mi9gkeFpAYZrJ4mQSov5/4ADXVF+Zk3KBYDZzH
 g/nsv/c0sVBC72tlmrHSc3OAbHDmY5s85lVMhiQLVgg0PYV5VWeSI8pLPcEzactrzO5n
 zDUJAi/e0YBfjw9Te7okfe5BrrmOsUktVqJCEkSeN9ejMn/eqi6HGxWsgo9e29qqIy34
 d9FozOs7Rz8gl/ArmcW+VNbEiohmDu6akuK9o76eGDqq3Tp2P+SoBVQhD9xkYfFXCE+c
 TYPYpec04u16VA8J+N91bPfO51klhvJMHiZp/B2BY+jIKFwzv5IEM7STXYQzqphvhxRy
 RBsg==
X-Gm-Message-State: AOAM530pPPEZEmirF6hwKVxABWR6XFri7gJv4c2csLQLuhJUfuXDTR9I
 0slgUZSnIBU1R3JvRFduMtB+bX1GxxT6KyotxbzqLEn35HjWiN8in+P4PRAQHAGjks2G7aNlP5q
 ajiTMFDFaYUvsx2w=
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr29893465wrn.195.1628584713260; 
 Tue, 10 Aug 2021 01:38:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI3C6JNnSzD7rZhQBA0Hg6PchqWWCckZuMpTsvEFPODWbaPW6/2/Uqg1L5ED58gxFVITWIMw==
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr29893446wrn.195.1628584713083; 
 Tue, 10 Aug 2021 01:38:33 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 z5sm1995383wmp.26.2021.08.10.01.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 01:38:32 -0700 (PDT)
Subject: Re: [PATCH v3 10/10] virtiofsd: Add lazy lo_do_find()
To: Vivek Goyal <vgoyal@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-11-mreitz@redhat.com> <YRF9Q+MSjrbeybd2@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <dfebe39a-35d4-1e1c-c63f-2312586aa97d@redhat.com>
Date: Tue, 10 Aug 2021 10:38:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRF9Q+MSjrbeybd2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.08.21 21:08, Vivek Goyal wrote:
> On Fri, Jul 30, 2021 at 05:01:34PM +0200, Max Reitz wrote:
>> lo_find() right now takes two lookup keys for two maps, namely the file
>> handle for inodes_by_handle and the statx information for inodes_by_ids.
>> However, we only need the statx information if looking up the inode by
>> the file handle failed.
>>
>> There are two callers of lo_find(): The first one, lo_do_lookup(), has
>> both keys anyway, so passing them does not incur any additional cost.
>> The second one, lookup_name(), though, needs to explicitly invoke
>> name_to_handle_at() (through get_file_handle()) and statx() (through
>> do_statx()).  We need to try to get a file handle as the primary key, so
>> we cannot get rid of get_file_handle(), but we only need the statx
>> information if looking up an inode by handle failed; so we can defer
>> that until the lookup has indeed failed.
> So IIUC, this patch seems to be all about avoiding do_statx()
> call in lookup_name() if file handle could be successfully
> generated.
>
> So can't we just not modify lookup_name() to not call statx()
> if file handle could be generated. And also modfiy lo_find()
> to use st/mnt_id only if fhandle==NULL.
>
> That probably is much simpler change as compared to passing function
> pointers around.

Definitely, but I don’t know whether it’s correct.

Or, we can just drop this patch and say that we don’t need to 
over-optimize C virtiofsd.

Hanna


