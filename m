Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363E82FB51C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:05:07 +0100 (CET)
Received: from localhost ([::1]:34242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1nso-00080p-Am
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1nqV-0006vy-BK
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:02:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1nqT-0002eP-KG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611050561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=999kM/8JeH93c7rhp/LBUusKOueQ7TLLLJT1sm4MioA=;
 b=THf0TTU9KCGEwk6hL7oi+xwtkrteZfI67HLcqU7KCrvw3tDLZAQ9eUWHfwdsCT8ONic0Jh
 IU8YpGgPGLFcIu7qGxXiSS0f44jq4cVGNCLjBUO8GgCExCQ+GNLiVrEsFbHauN6MK7M7rH
 ZKai6gIGQ2Tp+KKr3fTsU6n28FEBZhc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-tOPvmFghNraZl9DHEsQQfQ-1; Tue, 19 Jan 2021 05:02:38 -0500
X-MC-Unique: tOPvmFghNraZl9DHEsQQfQ-1
Received: by mail-wr1-f72.google.com with SMTP id d7so495524wri.23
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 02:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=999kM/8JeH93c7rhp/LBUusKOueQ7TLLLJT1sm4MioA=;
 b=oX2RYg1lfh0Q+6KH3Np4F8MC6NwrffJQeDfKwdtCzQPOE7yYBSWNIpB5OqwwExWSIV
 wUf9o0VnV6d+vp54Ri9rZnAYknItB/0VBO+JOPwO8Il9vBVchZDmh7oSo/OXj2hX123B
 SbdPvFEHrgAJzOjLSyjJYkmbbA4dLjleXtfebzTeAGz31hiHgqpqP+SR5CmV3fkx+ISO
 6sgCYtOjnV0B41FeLrpqvy747OYDgglUJL/y7/GnUmMDVct1hyC8pxR6wZVIalVD2vXS
 wgM+aQSdpdMtgbnJvAv5XZq3eRWlbMKoLTYZB77MJEfCtYVv7QENaGyVQE64JpHQ9ojv
 D8lg==
X-Gm-Message-State: AOAM530+DGM6bFLWbGt3xsN7yujvcHqByeXNdLTioTmmfdeYGHTUqUoY
 agWGtnSpFEVf0T8emkHTt+lRglxS+xfMPSWu0GrPnzmui/KgROfGLIP3gMasNZijhvWHsw69fw7
 Ch5bk3MX3POAvoME=
X-Received: by 2002:a7b:c407:: with SMTP id k7mr3349437wmi.159.1611050557080; 
 Tue, 19 Jan 2021 02:02:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx17HYBZFTjwt1pIeVD48g2iaPPNUx99zz6qQf4esAJpUleYMz2ODX5VygzQwT3BaM6CiuQsg==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr3349420wmi.159.1611050556877; 
 Tue, 19 Jan 2021 02:02:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i131sm3438662wmi.25.2021.01.19.02.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 02:02:36 -0800 (PST)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210119093746.293342-1-pbonzini@redhat.com>
 <20210119095329.GA1830870@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [qemu-web PATCH] deploy to qemu-project.org from GitLab CI
Message-ID: <5c37612e-a1d8-37b6-43f5-2b9706ffb983@redhat.com>
Date: Tue, 19 Jan 2021 11:02:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119095329.GA1830870@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/21 10:53, Daniel P. Berrangé wrote:
> On Tue, Jan 19, 2021 at 10:37:46AM +0100, Paolo Bonzini wrote:
>> Currently, the website is rebuilt on qemu-project.org using
>> an update hook.  We can reuse instead the Jekyll output of
>> GitLab's CI.
> 
> Are there any files present on the qemu-project.org webroot
> other than the published output of Jekyll ?  QEMU had the
> good sense to use sub-domains git.qemu-project.org and
> download.qemu-project.org for other content. So maybe you
> just turn the root qemu-project.org and www.qemu-project.org
> domains into CNAME records pointing to the gitlab pages site ?

There are other files in the webroot at 
https://www.qemu.org/docs/master/, even though they're handled server 
side with the httpd Alias directive.

Right now they are built outside CI, from a cron job, but the plan is to 
do the same as qemu-web and deploy them during the GitLab CI run.

>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 5fa3041..08b6d20 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -1,6 +1,11 @@
>>   
>> +stages:
>> +  - build
>> +  - update
>> +
>>   pages:
>>     image: centos:8
>> +  stage: build
>>     cache:
>>       paths:
>>         - vendor
>> @@ -14,3 +19,26 @@ pages:
>>     artifacts:
>>       paths:
>>        - public
>> +
>> +deploy:
>> +  image: centos:8
>> +  stage: update
>> +  needs:
>> +    - job: pages
>> +      artifacts: true
>> +  before_script:
>> +    - dnf install -y openssh-clients rsync
>> +    - eval $(ssh-agent -s)
>> +    - cat "$SSH_PRIVATE_KEY_FILE" | tr -d '\r' | ssh-add -
>> +    - mkdir -m700 -p ~/.ssh
>> +    - - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config'
>> +  script:
>> +    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && mkdir new && rsync -avz root/ new"
> 
> Why copy the old root into the new root ? This means that any time we delete
> a file in git, it will never be removed from the live webroot.

To speed up the rsync below.  The website is small, but it doesn't hurt. 
  However, you're right that "--delete" must be added to the next line.

Paolo

>> +    - rsync -avz public/ $SSH_DEPLOY_DESTINATION:/var/www/qemu-project.org/new
>> +    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && rm -rf old && mv root old && mv new root"
> 
> 
> 
> Regards,
> Daniel
> 


