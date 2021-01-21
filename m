Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE062FEE35
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 16:16:01 +0100 (CET)
Received: from localhost ([::1]:55122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2bgm-00027z-J6
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 10:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2bfQ-0001Sf-0o
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:14:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2bfI-0000Tg-MT
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611242068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VYsXy5o/+HCzfnJVJDDmC2o0j1sLLPEaJHhsaOQMtKE=;
 b=Kc++2J4qz0OE1MVhyWUfNz+MJ7eWnTrRir75Xw2LrHq+erVrFBPoI4UvsyLOpGVso0/qho
 U4fCoJAAYr/yoc+meAxsGavWC2l9uH5cttpdi1mhlMrrbTBCmaImXCFQt+crttmO/H3duc
 1ZOjlvDg0GTKAzHYzf7RR2iDXB+zk4s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-2yWUkpiXP8udFGqH5l7EWA-1; Thu, 21 Jan 2021 10:14:25 -0500
X-MC-Unique: 2yWUkpiXP8udFGqH5l7EWA-1
Received: by mail-wr1-f72.google.com with SMTP id l10so1255629wry.16
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 07:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VYsXy5o/+HCzfnJVJDDmC2o0j1sLLPEaJHhsaOQMtKE=;
 b=jPNWNtMdOHit4qP/xFYZRpAukLqZZ6jXCovgvMFYymiQ3iuWuqdMDIyJnDOPach5WH
 cWdHZfy4pelCgj+MpMPFt6cQ8WwOHWvmOnF6lW/hXRwm4db7CknQEZtp1q5GONLxp+MH
 5vkDHQg7dSpOiu4uNx2ClN2gX5JGJAUjuSJ9sZGNz2RGRJdy4kv2ZnaO94Gtv2Z2cROB
 bUD02KPraW5mdJm7NHvlX//CD2yyQkk+ZixwTmIXFCYMuU56431WRkLsoaKsuSjdOFos
 K3XoaPVOE5mPFdTNJjQ3aKT7YYTEoyfbbwixcKCgKyFI6BTHVhDoUWLJLeOPnhceLMxv
 ETtQ==
X-Gm-Message-State: AOAM533vkUJxfO2Qws/11lrSPWREj4ZLNGYpBR58AqKdU5EnzhRmxcug
 +iAxbG/yXQkNqlZU1cWEcTZoA7Woa3m6PT/WgVFeWDSk6maa30sTczOjF77vhHWlp9j+AJ4za0Y
 TxkHzAaEpdLsOv3I=
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr15060138wrt.396.1611242063994; 
 Thu, 21 Jan 2021 07:14:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBQ6BPjgfXeu+FGi3DifTMmAnIVVQaykNdY11Cy9YWpot5amWurqZ8myhvqDlbu864sZoURA==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr15060115wrt.396.1611242063802; 
 Thu, 21 Jan 2021 07:14:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id h9sm8873717wre.24.2021.01.21.07.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 07:14:22 -0800 (PST)
Subject: Re: Thread safety of coroutine-sigaltstack
To: Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <62d5d33c-fe2a-228b-146d-632c84d09fd5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <30457fa0-6d7c-4e81-2623-8551d8bf2674@redhat.com>
Date: Thu, 21 Jan 2021 16:14:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <62d5d33c-fe2a-228b-146d-632c84d09fd5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/21 10:27, Max Reitz wrote:
> 
> Sure, I can do that.
> 
> I agree that there probably are better solutions than to wrap everything 
> in a lock.  OTOH, it looks to me like this lock is the most simple 
> solution.  If Daniel is right[1] and we should drop 
> coroutine-sigaltstack altogether (at some point...), perhaps it is best 
> to go for the most simple solution now.
> 
> [1]
> https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00808.html

Yes, between coroutine-ucontext and the upcoming coroutine-asm[1] (which 
I have shelved because it was mostly a requirement for x86 CET; but it 
will come back some day), sooner or later there will be no reason to 
keep coroutine-sigaltstack.  Porting coroutine-asm to a new architecture 
is easy, I even managed to do it for s390. ;)

Paolo

[1] https://patchew.org/QEMU/20190504120528.6389-1-pbonzini@redhat.com/


