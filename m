Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CE140AB63
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:04:50 +0200 (CEST)
Received: from localhost ([::1]:38910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5J2-0006HV-RN
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ5HD-0005Lb-W4
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 06:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ5HB-00007y-5F
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 06:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631613772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2X08XaZQxpxFM5Gsg9inCj0LEleCCEDgcB8+FCBRwvI=;
 b=gd2QfqSny/eIP1z82qt17D54jC9ijgWIGmUfiwbck+2UEuCBMEJ1QCPqwK2DrdM493dn+m
 B2CE0hC6y5eMuTeFcj+CWwOsbJGUQe3G3bRbWlUcsg/YIE18Oucg9wBfGDTyuclOdpMhGV
 53q1Y4YcuWjulYBIbho/D3fSDus/hIY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482--1trqdMFNGe-TzPgAQfBSA-1; Tue, 14 Sep 2021 06:02:43 -0400
X-MC-Unique: -1trqdMFNGe-TzPgAQfBSA-1
Received: by mail-wr1-f69.google.com with SMTP id
 m1-20020a056000180100b0015e1ec30ac3so466329wrh.8
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 03:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2X08XaZQxpxFM5Gsg9inCj0LEleCCEDgcB8+FCBRwvI=;
 b=yWY9YWsrWhdi8UD9CetHkv7/rgte61GsC7aT6KIWDdIar0A+JyBmPuLTjqTgMWkznP
 JIskdTVU32H5ApX+qdzSvnQ4vcSnJzw3+eD9V29p8ybbAkjONN73PwXbge5D3V1+6h5p
 kLYnjFE6M9ZSnZCQEEE/Fx0EL7B0hBRsr/SdzGYI49eC3qEVNu8vczDaZaY/fhyXc6Yu
 FamoKKQ9STCBu5SIGizB2R3FQ5g9ye9iVfOdjH6VDhysU7RnjU5y/CWvBjgDg5+uYW+h
 gBxwS4a34V1iGoipjjI8pxiDGMfFkH5eXotxOu/3H6Sc51t7nAi6ZW8Vt8NhTnpuqtmE
 kDOg==
X-Gm-Message-State: AOAM531Ae9G+vuIvzO+gOPwBjB9JgPWzprUhzv3xK7/hJOyfQeIZaGgC
 nU8mmHe4d8vm8Z00meEPkElKQL6jEWGZA46wf0gg4e/BMDmP6a33ebaVOJKmxDsqNjaehDgi1CS
 S7/mYTD9I7bCD++U=
X-Received: by 2002:a7b:cf09:: with SMTP id l9mr1197377wmg.115.1631613761699; 
 Tue, 14 Sep 2021 03:02:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFPbkInbNHeLt2p78iRwJn+B2bID6pjUJk3cFaHeYJQQ/yVSBFZFlK6s9peXOsDKooiKY5vg==
X-Received: by 2002:a7b:cf09:: with SMTP id l9mr1197354wmg.115.1631613761403; 
 Tue, 14 Sep 2021 03:02:41 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id c9sm10595739wrf.77.2021.09.14.03.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 03:02:40 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Update FUSE block export blog post
To: Eric Blake <eblake@redhat.com>
References: <20210906162916.21714-1-hreitz@redhat.com>
 <20210907175216.dze5fvinpo5pxlt2@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <54f35e50-0276-76b2-070c-74132a9d4201@redhat.com>
Date: Tue, 14 Sep 2021 12:02:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907175216.dze5fvinpo5pxlt2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Klaus Kiwi <kkiwi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.09.21 19:52, Eric Blake wrote:
> On Mon, Sep 06, 2021 at 06:29:16PM +0200, Hanna Reitz wrote:
>> Because I forgot to CC Thomas on the discussion adding this post, it was
>> merged prematurely.  This patch updates the post to incorporate the
>> feedback I received on it:
>>
> Overall, nice!  I see it's already live, but another tweak you might
> want to make:
>
>> +## File mounts
>>   
>> -A perhaps little-known fact is that, on Linux, filesystems do not need to have
>> -a root directory, they only need to have a root node.  A filesystem that only
>> -provides a single regular file is perfectly valid.
>> +To transparently translate a file into a different format, like we did above, we
>> +make use of two little-known facts about filesystems and the VFS on Linux.  The
>> +first one of these we can explain immediately, for the second one we will need
>> +some more information about how FUSE exports work, so that secret will be lifted
> s/lifted/revealed/

Ah, yes.  I don’t think I’ll send another update just for this, but I 
will include it if I need to send an update for some other reason.

Hanna


