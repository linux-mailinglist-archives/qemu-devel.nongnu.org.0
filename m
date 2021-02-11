Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF86631897E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:33:40 +0100 (CET)
Received: from localhost ([::1]:55506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAE7-0002RD-Oq
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lAABO-0001i0-4E
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:30:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lAABH-0004k5-SR
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613043041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5vGO9JRVEGKmvV34gfIpVwKUE3i3j/K2h9mbksC/9A=;
 b=d6IM2fga0pxk/IstYxkK5/UkIic122Xzjg6b4JVCLTnbVttNtAWDLCVcZr2JDtH56AuSSP
 hEJ8Z/jsuRM/VpNM4T3ucKFszkYHke9YtBjn+Bam3O076tGZ0ClHeyg710HaP1ITgiqAig
 /TOHRdK5dd5puOXKR9OcdvCtk4Gp9qY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-QEJGOGRINl6V9Z1NERuk3Q-1; Thu, 11 Feb 2021 06:30:40 -0500
X-MC-Unique: QEJGOGRINl6V9Z1NERuk3Q-1
Received: by mail-wr1-f69.google.com with SMTP id o10so2327318wru.11
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 03:30:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w5vGO9JRVEGKmvV34gfIpVwKUE3i3j/K2h9mbksC/9A=;
 b=Q+hIJ2DDN5Qaslgggy2dRPZ34N1O64QXHyM1LFxURZg6o/+rulhp31UkM1Kig0dCf0
 +auHVdahd4eP2P+zUNM9DirvvVvulhQw4Gm0PxYxHGy1oj3b0tP3U3Y3Ze8Fd/sZdXWd
 BwCI7fm55VawwESzJbz89eqpTsW7aXj1JU3QYS5a9RvrhFWwKTBhe7EAbTWNl569Jugp
 CibNaHfu+ugkUsrw3JbkG0on2QfKeWfCGqQxlcX15aAOy0+q5qCS84kf/hNF7yZHg1+3
 j3sWzJ1sDxW5a4ZiOOU9t6SUx0EfvvBPC3qlyPq5i8s6c2EfD0HrT8YrxwQAgX3S9jLX
 FWqg==
X-Gm-Message-State: AOAM532yb/p1blIGlpQ5wJUYrRGMGrVgWSQlekL/VTX/jLGXAP4D7TIh
 oeCU9oTh4w5pKWUNhDI3b4Uuad7tzjMq4ZE7XdYKCS3r5/wxsoWiKiINl+YX0FNMu9X7mF/VsLL
 iuSOUf+QZocQ8SGFBgd7CKsx5ubo0HZXZefm4+xUv5ZnVwjSZ8sNLlHV39EZtUvZFCas=
X-Received: by 2002:a5d:618e:: with SMTP id j14mr3306547wru.377.1613043037580; 
 Thu, 11 Feb 2021 03:30:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrcGvzSQmQfjrcd6ASrRHm9ue4st/dQPKAnwwWxazz07gH5XyAc015++nUqwqEiN6qsoccdw==
X-Received: by 2002:a5d:618e:: with SMTP id j14mr3306533wru.377.1613043037398; 
 Thu, 11 Feb 2021 03:30:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h13sm4513724wrv.20.2021.02.11.03.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 03:30:36 -0800 (PST)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210209174541.150011-1-pbonzini@redhat.com>
 <20210209175834.GW1166421@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: adjust timeouts for some slower tests
Message-ID: <725dd339-1eee-4791-fda8-2922a5d19a44@redhat.com>
Date: Thu, 11 Feb 2021 12:30:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209175834.GW1166421@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/02/21 18:58, Daniel P. Berrangé wrote:
> On Tue, Feb 09, 2021 at 06:45:41PM +0100, Paolo Bonzini wrote:
>> Adjust the timeouts for the longest running tests.  These are the
>> times that I measured and the corresponding timeouts.  For generic
>> qtests, the target that reported the longest runtime is included.
>>
>> unit tests:
>>      test-crypto-tlscredsx509        13.15s   60s
>>      test-crypto-tlssession          14.12s   60s
> 
> The default meson timeout is 30 seconds which is enough for these
> tests. Of course larger timeouts give more headroom.

This was a relatively fast run, I've had them take as little as 7s and 
as much as 25s on the same machine.  I suspect it's because the machine 
has a very slow NFS home directory (yes those things still exist :)). 
In general a 2x-ish headroom makes sense in case someone is doing a 
build at the same time as a test run.

By the way, with Meson 0.57 there's the possibility of specifying 
"infinite timeout", and this could be used for the benchmarks.  Giving 
slower tests a higher priority is also a good idea, and even though this 
is not guaranteed in theory, Make ends up taking into account the 
priority as well.  With these tweaks "meson test" and "make check" 
(minus check-block of course) both clock at 2:20s, which is exactly the 
time it takes to run the longest-running test.

I will also give "meson test" a shot on the GitLab runners before 
posting v2, and see if it needs a timeout multiplier.

Paolo


