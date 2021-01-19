Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C192FB517
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:02:53 +0100 (CET)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1nqe-0006C1-9s
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1nol-00053f-Ux
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:00:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1noj-0001wD-J4
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611050448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClMlZqo1RvvCr8ey/6h3WcdRwE2huwxzdUqeKoaWrCo=;
 b=CVaL+5VSgO79Hy32i+XWYxo56Ao4JfwHP3PVQ09pt+GxSOcrMG2sckRCFPKaPdOegS6iDr
 n2WDBqu7FQnmos7qhFVf6MibfKdWOlSOK9B10Pc7PFH1kCLuVB13Pw76mgZPqLkpgbeVrB
 I/bb2VxKVIhvYIeQ1HVSUyMrayctssU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-LkF8l4l9NzyPd8kNksEsPw-1; Tue, 19 Jan 2021 05:00:46 -0500
X-MC-Unique: LkF8l4l9NzyPd8kNksEsPw-1
Received: by mail-wr1-f72.google.com with SMTP id o17so9654678wra.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 02:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ClMlZqo1RvvCr8ey/6h3WcdRwE2huwxzdUqeKoaWrCo=;
 b=DL+6VhpnVnmJKa4G+OFWQmJQzDB7+QqPpeJ4mZM/gEhSkrMxwAo5tM0+MtLtTZZ/G8
 DLhyqIZalghzvLb2iZI/jrp6+s7t3KLrUdFRJV0swvSdGrmIjp1nq+dGdbec7+LGD/uZ
 CmARh+L+tkZPJwn1s0qJkONolWUFQCSDmETJU0Qtqh4EXaLx4BR0yH+SNucCbH1syv1e
 3oRIC7FtOXdXqJkoRaC3t1X1tzALWPC3h/E/Ur+bWWpCCkiF4soHUdek0sFbd5TooId0
 NYasleZUSye7sdQQhixyduofDG1dOnKQ1mmvX9gaBNFxqQ9MxOxB7CMrIKt4XyRIY2XL
 ji4g==
X-Gm-Message-State: AOAM533hl1DSvRkVn2uc6gA8pjlsjZDK5UW4E7wlo8dD9qROP+wSkmVx
 UiqCvjUNi0iPLTdPoQHWz7Q/JP5YuQseLK+XFcARpPQj1m50Cm1eOhrEu5AzVffwa8/Pd5Y7bsd
 xtTULxhrRLFENXms=
X-Received: by 2002:adf:c18d:: with SMTP id x13mr3473562wre.128.1611050445414; 
 Tue, 19 Jan 2021 02:00:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHciMW9EZKyAeRvZb/TPP/XdDqxI0ynDypmsgoEgSWENyuyOOIsgsybK8rjco1RP5LdmtGag==
X-Received: by 2002:adf:c18d:: with SMTP id x13mr3473542wre.128.1611050445254; 
 Tue, 19 Jan 2021 02:00:45 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x128sm3911573wmb.29.2021.01.19.02.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 02:00:44 -0800 (PST)
Subject: Re: [qemu-web PATCH] deploy to qemu-project.org from GitLab CI
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210119093746.293342-1-pbonzini@redhat.com>
 <2898ef99-ead9-a9bd-0138-dcb88a2155ac@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e8d7bed7-888d-1fb1-ca4f-d45fe791dfee@redhat.com>
Date: Tue, 19 Jan 2021 11:00:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2898ef99-ead9-a9bd-0138-dcb88a2155ac@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/21 10:58, Thomas Huth wrote:
> On 19/01/2021 10.37, Paolo Bonzini wrote:
>> Currently, the website is rebuilt on qemu-project.org using
>> an update hook.  We can reuse instead the Jekyll output of
>> GitLab's CI.
>>
>> To do so, a new user qemu-deploy has been created on qemu.org.
>> The private key is stored into a file variable SSH_PRIVATE_KEY_FILE
>> (be careful to include the trailing newline after "---END OPENSSH
>> PRIVATE KEY---"!).
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   .gitlab-ci.yml | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 5fa3041..08b6d20 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -1,6 +1,11 @@
>> +stages:
>> +  - build
>> +  - update
> 
> There is already "stages" section a the beginning of the yml file, so 
> I'd suggest to extend that instead.

Are you sure?  This is the qemu-web CI.

Paolo


