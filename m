Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433AF316F28
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 19:48:57 +0100 (CET)
Received: from localhost ([::1]:36810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9uXn-0007md-P4
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 13:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1l9uVx-0007JG-Ds
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 13:47:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1l9uVo-0005iM-1Z
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 13:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612982810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SwcL9PZMbg9z2uTi+mMYcC9LGdJl5elvlNiYMxW5g6I=;
 b=cUq0eQo4znMKziJh9Ie3oCE+W8odLStEer3TbZW7acmGqp117bGT465o5n/thzXIoQ8Poo
 wL/xygUPVk5qazab46IjAJ7jbeZieBIg10VTPEDh+AEAiGBW+nwddeJ/U5XeH99LJ2HeQX
 welrigAayN7TurvJLVnUcvhaQRQbyEA=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-JVhLpFt4Oh2eqvUN7Gy4bw-1; Wed, 10 Feb 2021 13:46:48 -0500
X-MC-Unique: JVhLpFt4Oh2eqvUN7Gy4bw-1
Received: by mail-ot1-f69.google.com with SMTP id m7so1493063ots.4
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 10:46:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SwcL9PZMbg9z2uTi+mMYcC9LGdJl5elvlNiYMxW5g6I=;
 b=GD+Glgyq4SJCgOWEYedDUHMsSDumAaXVm403LXFPnL6P2yXYjJYfhiRnmakW9er40i
 R0pJQ2BbTInwROKz8AoPZR/U7M1LxXY5ZMVsPTRZjJ89BaqeKjKv8nibpxyNTq0Bzd+l
 GZqrazycRfmOT3MjE0R2DLwiEemFJPBa995dtXFYg9842k7n06F22+g+pIidccFtezxt
 A/ZVPNefk6jiWMc359WgnKAsorBYQTGkwOTz25jSYQ4jmZjuakZ3lfBnoPzSb72sSpFR
 AZlaj24bE/J5CwfTDfFN+JwXjDxWRTVF9xTPSpnOEgK1msjaDHSJCBh9s/igdNLOPCwX
 QfMA==
X-Gm-Message-State: AOAM531aQPBR+GHMr0rFy8o6bJnB7FeMrQzyx7l92xTPxWbVTJVsGD5h
 0Aq5cQYV8B1C5yjgc/o296L86EkPzOwo+V6kjqz8RaHIoD1n/q4PAJLchXFlAtQlMvexeWbrNGg
 HnC3GQIQ5pzoIrf8=
X-Received: by 2002:a54:400b:: with SMTP id x11mr240494oie.71.1612982807533;
 Wed, 10 Feb 2021 10:46:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmI3YLn1CbQoBWqexk9qOh4FqvWIpDmD457Kj0/8kA1GwOvIFE6WkYo+SXVhQBkuyyA0Azow==
X-Received: by 2002:a54:400b:: with SMTP id x11mr240477oie.71.1612982807314;
 Wed, 10 Feb 2021 10:46:47 -0800 (PST)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 e84sm613004oib.43.2021.02.10.10.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 10:46:47 -0800 (PST)
Subject: Re: Interactive launch over QMP socket?
To: jejb@linux.ibm.com, qemu-devel@nongnu.org
References: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
 <ac1a5075878d86b0a46db20cb6e579b5fec74d87.camel@linux.ibm.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <ef2db65a-f9bd-5cf7-7c1a-9ba07dd4bda0@redhat.com>
Date: Wed, 10 Feb 2021 12:46:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ac1a5075878d86b0a46db20cb6e579b5fec74d87.camel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: npmccallum@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 12:14 PM, James Bottomley wrote:
>> I would like to add a message type to QMP which allows guest owners
>> to supply this data over a socket and _not_ require these components
>> a priori via command line arguments. In doing so, this would allow
>> for a 100% remote attestation process over the socket. However, I'm
>> not sure how to express this interactive "waiting" for this data to
>> become available with internal APIs (assuming it's not supplied as a
>> command  line argument).
> 
> Well, I never understood why qemu can't deduce the value of cbitpos ...
> it even errors out if you get it wrong.  However, other things like the
> policy and the session file have to be present at start of day.
> They're not things that can be passed in after qemu starts building the
> machine image because they need to be present to begin building it.

Right, I didn't mean to include cbitpos in consideration for this. I'm 
only interested in supplying the session, policy, and certificate info 
over the socket.

Shouldn't the session, policy, and certificate information only be 
required in time for the KVM_SEV_LAUNCH_START ioctl call? This is the 
place I'm interested in waiting for the relevant data.

> The patch for remote attestation (which was only recently added to the
> PSP protocol) is here:
> 
> https://lore.kernel.org/kvm/20210105163943.30510-1-brijesh.singh@amd.com/

Thank you! I didn't see this, I'll read up on it.

Connor


