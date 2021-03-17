Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31933EAFB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 09:01:34 +0100 (CET)
Received: from localhost ([::1]:50000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMR7V-0001IJ-IM
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 04:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMR60-0000pZ-TQ
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 04:00:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMR5x-0005SN-Pq
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 04:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615967995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TOLjbzpSeNRBZx9cDkE494O5BsLe/X98e/4w9zrABk=;
 b=EFmVSDG3Ej/uPTMYMuJo2JhCaLHKhSfkw69FK2QJvQIfQ0mDu6Luo+SQ9lcdPvTEtn7KFW
 620AukCVKGwlV1gvDXew4ZFIqnEYXfIP+Gp4AdOXXThUmtW0rqLinxRsTZp3QQsgHkyG1k
 h8HYXI5bgNBlqDEGVIYPRPZI9e7Xywk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-KdcKhBalPiao_cXUobjknQ-1; Wed, 17 Mar 2021 03:59:51 -0400
X-MC-Unique: KdcKhBalPiao_cXUobjknQ-1
Received: by mail-wr1-f69.google.com with SMTP id n17so18024338wrq.5
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2TOLjbzpSeNRBZx9cDkE494O5BsLe/X98e/4w9zrABk=;
 b=liiL/8Zx+iFiv2QKSgjouyprV4TilujBxNY3r9YgN2T8KM3QN3kMK5g0fRhykjrQks
 UJAfFLjshaaDzlb5KjFaVQolqRfzwT5HyuD5rjmmQf6eHpA+KFUjwnhO5iIYYXm7CM9h
 Yu9w7CVJ8WsDVASipw/Q8Y+l43urjBe8OUrXBkAhxFL+eduMB7MOWSqwjvSH38OwkQB1
 YHkJVnLNMYqu3Kp9bf6dW/xWRPU9wKgTnFdBWtDIIUmS97uYawBw4vr17Qy+FT+CAzpX
 pVTEfnXDWoB9MNf1wufKF++dVYhVPRBDGhyepI6CK9qK5AgOalQ0Hph2V0nx5ddy8fqS
 Y6aQ==
X-Gm-Message-State: AOAM530SZZ5Bj2iimuccdm4cnEgqLxZb2n4lCk08dgVBpeo9b6a6QHAD
 7b6HhWuMFkOum6SI0s3jr1zL++f6NE9lLSWgdh4JH/S+ha7HXADSUJ2iTOtGHMLc632rdNpmsE5
 Eha2XyTTA4SsdIz8=
X-Received: by 2002:a5d:4e48:: with SMTP id r8mr1170208wrt.276.1615967990253; 
 Wed, 17 Mar 2021 00:59:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy17WzhZEviyrplRAONMVnsa3zeJFKnIjpTyXzRSQwlzDJSpf9tWl2nhuEcJmURiQ/ZMrDl0A==
X-Received: by 2002:a5d:4e48:: with SMTP id r8mr1170194wrt.276.1615967990074; 
 Wed, 17 Mar 2021 00:59:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s16sm24515133wru.91.2021.03.17.00.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 00:59:49 -0700 (PDT)
Subject: Re: [PATCH 0/4] esp: fix asserts/segfaults discovered by fuzzer
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu
References: <20210316233024.13560-1-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d4b1bdcf-82e9-b921-9e28-d7a6a0ddf39a@redhat.com>
Date: Wed, 17 Mar 2021 08:59:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210316233024.13560-1-mark.cave-ayland@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/03/21 00:30, Mark Cave-Ayland wrote:
> Recently there have been a number of issues raised on Launchpad as a result of
> fuzzing the am53c974 (ESP) device. I spent some time over the past couple of
> days checking to see if anything had improved since my last patchset: from
> what I can tell the issues are still present, but the cmdfifo related failures
> now assert rather than corrupting memory.
> 
> This patchset applied to master passes my local tests using the qtest fuzz test
> cases added by Alexander for the following Launchpad bugs:
> 
>    https://bugs.launchpad.net/qemu/+bug/1919035
>    https://bugs.launchpad.net/qemu/+bug/1919036
>    https://bugs.launchpad.net/qemu/+bug/1910723
>    https://bugs.launchpad.net/qemu/+bug/1909247
>    
> I'm posting this now just before soft freeze since I see that some of the issues
> have recently been allocated CVEs and so it could be argued that even though
> they have existed for some time, it is worth fixing them for 6.0.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

They are certainly something that we can fix for 6.0.  However, please 
include the testcases even if they are ugly, they can be cleaned up 
later or (if never cleaned up) they still count as regression tests.

Paolo


