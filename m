Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8E9296D57
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 13:06:51 +0200 (CEST)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVuuI-0002E1-3x
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 07:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVush-00018M-OI
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 07:05:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVusg-0003T3-6A
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 07:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603451108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7thcG5OIYW2AYFn33wwz7LzvkZCNi78ZqWF3sTW6h0=;
 b=cSl3mkY8MvbFfWjC1FcdzympcbkYXKIixe7wKcf3BvHN55em+8m+FSILtqvVS1oxeWrL5r
 wuveQf14JlfL7AQN9xalhyUGwCUslUQ3fMjNqgM+j6NySuff4jvS1I3fj8WTgTZbVQUJef
 ojBnq2U7L7QgnpC7/YIlBim40k9FsyY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-1x8UjnhyOumGZmL_jLjNSg-1; Fri, 23 Oct 2020 07:05:05 -0400
X-MC-Unique: 1x8UjnhyOumGZmL_jLjNSg-1
Received: by mail-wr1-f72.google.com with SMTP id h8so465137wrt.9
 for <qemu-devel@nongnu.org>; Fri, 23 Oct 2020 04:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b7thcG5OIYW2AYFn33wwz7LzvkZCNi78ZqWF3sTW6h0=;
 b=PjJ2TB+GlTBlGwO+PduN/cECLSO6j7tAFvfCA0nelp6boWY6EP+aBYxuSftTJnVGU5
 6bBr6XJlun2+OqGCBlgNsNw51uBpsgUT7WDMlMq9KZpHKFLaupi+oPsUM0+QEUkzY46V
 kACLggpbQ4b0cBARvl1BniZkjd7IKguBtH8shDeHoOrBJ3N4P0NXJRZ8/DYI+DV6gcgK
 33NSBqKbefARs1XILCWoN6zEqDeyxU1+qNdZjqZQqUnQbGbkK6bCev74/mpIPLpgkE0m
 AqyS08Y11VUXI1at4O2v2YrMSv8Di3k7RThONQh7UtrfY6VkVksLF+r1BrFPb/gPTOpv
 9Qkw==
X-Gm-Message-State: AOAM532P74slLJbuh7kosrG13SO7qbhWGpU9rmaBVvJzQrgfxYIUb4XM
 4rXsrdAm0grCw8b0BfPZTaTW0B3XCkiW9g+bISz4FXpxl45xeoJYic/64TXEGI3fkEENAU6Zgla
 ygIuACzqvKSZP0SA=
X-Received: by 2002:adf:fa01:: with SMTP id m1mr2147019wrr.220.1603451103856; 
 Fri, 23 Oct 2020 04:05:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5chh2Ul7v6+eACqSJNGB6K8s0K33jRHlqy0FpL4C9lok39sxSCjlp32Gn1xwOs9ii5unP9w==
X-Received: by 2002:adf:fa01:: with SMTP id m1mr2146992wrr.220.1603451103572; 
 Fri, 23 Oct 2020 04:05:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n4sm2388707wrr.91.2020.10.23.04.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 04:05:02 -0700 (PDT)
Subject: Re: [PATCH 0/6] qemu-storage-daemon: QAPIfy --chardev
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20201023101222.250147-1-kwolf@redhat.com>
 <20201023103603.GG445638@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fa6e6577-c0e5-af4a-ddf8-e31667185e77@redhat.com>
Date: Fri, 23 Oct 2020 13:05:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201023103603.GG445638@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.108, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/10/20 12:36, Daniel P. Berrangé wrote:
> IOW, if we're considering our ideal long term configuration goals
> for QEMU, then I think we should be looking at a solution to bridge
> the gap, so that we can get the best of both worlds, and have a single
> way todo things.
> 
> IMHO, ideally none of -netdev, -chardev, -device, etc would exist
> in any "modern" CLI, they would just be considered legacy syntax.
> Essentially everything would be created using the same -object arg
> and object_add  commands.

I agree, especially for -chardev which should be the easiest of the
three to make user-creatable.  Devices have magic bus properties and
netdevs aren't QOM objects at all, but character devices have neither of
these issues.

On the other hand, chardevs do not yet have properties, which means the
transition to -object is not going to be trivial.  But it is surely at
least worth trying to see what the issues it introduces (perhaps QOM
properties with struct and union types?), how they could be solved and
whether it's worth it.

Thanks,

Paolo


