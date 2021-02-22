Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE59321EE6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:13:54 +0100 (CET)
Received: from localhost ([::1]:55716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFiT-0000dl-JJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEFbB-0002n0-42
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:06:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEFb9-0004e7-Ez
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614017178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nOCAogmNcvmJRjZzxHyxKLo97icjS31VSnD4tVobpJs=;
 b=Fx/YueaXNln0JVhG+C3/5i2hjuXtWmJCmDVsn1cLXP1z/4X2kn01RPHjzjugyk/vd7UkFn
 MnOd49dDNF6iykoqhJ7HYS891W5oMTbf9l4R+PQQEEYjQpIVQ2CJZn6fXVF9wSFo9fkJE2
 +pJ66Zhn4qHMY6PqxeQ368dab9gdG5U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-6TgVK_BSOjecy5a2CDXm6A-1; Mon, 22 Feb 2021 13:06:17 -0500
X-MC-Unique: 6TgVK_BSOjecy5a2CDXm6A-1
Received: by mail-ed1-f69.google.com with SMTP id h1so6739378edq.1
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 10:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nOCAogmNcvmJRjZzxHyxKLo97icjS31VSnD4tVobpJs=;
 b=c66c6poP4lU3cXQtPVsHBtbILF/w8LkNMF4u/9lKpTPvGnAxCMdqBb45g17NRyVx7i
 ZjI80/mHbJDq9fYtr8Uf4zfxR49pjNtaSEk2MSjwH6tCpfn+cbTD7bZ9QSGYuWsbTEh7
 MPG0eNPeLICpWPQ8xTvFktRb7h8z7FpY7kXDxjisjKUPOzyQJcsnmMCbvgH6NqH7yGSv
 VijNtKi2j/lY75ILeaBRVn3jI69Y31eNiJvQu4sd7oxFMLXj0V4rhbwFhNSkrum/fdA9
 tjEqvBBrjaL1YVIgGl0o80OnbcvfAXJuX96BGoSFmMBgCOrx3bDpKSztYJjqfFhfON+u
 TJSA==
X-Gm-Message-State: AOAM532+7Em58LzeE/gwZsRqRg0EioZRLH2LoKe60KYpgqnfuDAUrNuR
 9SXd50Xrvk/PEzJBnVIC46+62Ayy0DfqHuok4gEMBw08b0f83nOE02ZYPnmPCF6ym/p/Th9ecNc
 NJVcvGTkcbcjpEfs=
X-Received: by 2002:a17:907:b16:: with SMTP id
 h22mr21412811ejl.393.1614017175581; 
 Mon, 22 Feb 2021 10:06:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2xudRasvNP+bFXOV0NtjqWyZS1/7tbXHoDUNhCFrsm+pm/eCdjKDBLpkMw0m8HEGmREBb9w==
X-Received: by 2002:a17:907:b16:: with SMTP id
 h22mr21412800ejl.393.1614017175463; 
 Mon, 22 Feb 2021 10:06:15 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m7sm10835563ejk.52.2021.02.22.10.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 10:06:14 -0800 (PST)
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <875z2knoa5.fsf@dusky.pond.sub.org> <YDPMs1Hu8LDRJUhX@redhat.com>
 <c5d13648-445d-92b9-6bff-95bd2b99d52e@redhat.com>
 <YDPv7Bk6/DNq/lCn@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <35483639-7580-f8dc-5828-66dfd535a1d1@redhat.com>
Date: Mon, 22 Feb 2021 19:06:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDPv7Bk6/DNq/lCn@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/21 18:54, Daniel P. Berrangé wrote:
>> These are sent to QEMU as double-quoted strings (the single-quoted JSON is
>> parsed to get interpolation and printed back; commit 563890c7c7, "libqtest:
>> escape strings in QMP commands, fix leak", 2014-07-01). However, doing the
>> interpolation requires a parser that recognizes the single-quoted strings.
>
> IMHO this is the wrong solution to the problem.  Consider the equivalent
> libvirt code that uses a standard JSON library underneath and has a high
> level API to serialize args into the command
> 
>        qemuMonitorJSONMakeCommand("qom-get",
>                                   "s:path", id,
> 				 "s:property", "temperature");
> 
> Of course this example is reasonably easy since it is a flat set of
> arguments. Nested args get slightly more complicated, but still always
> preferrable to doing string interpolation IMHO.

I don't disagree. I'm just stating why I wanted a clarification from Markus.

Paolo


