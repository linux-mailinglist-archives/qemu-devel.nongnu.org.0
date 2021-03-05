Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C82F32E66B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 11:30:31 +0100 (CET)
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI7j4-0001Oz-Mz
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 05:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lI7gT-0000Iv-4v
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:27:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lI7gO-0004yA-3m
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614940062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynJqjMPq2VeQ1KGJnjXQjrrHSQhxWis2CNDdCm+IHl0=;
 b=gjfapm0Uno/oQq0uEjPmxvLlMS0YM8dKs/RbnOt1OhT9WptEn1YnkTjNYfk047Z7sNrTFE
 uP20Zvl50+5xYM+mABLEZJrn3l8JP6BLrzPsEHva14nhZ1oxmQnBRBKq6it0FJGbUKU3k3
 QehUYw51H5UmlmH1Jm998IHBIihwa4g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-Tfvlf9_DOrOy3eqMxUvrgg-1; Fri, 05 Mar 2021 05:27:40 -0500
X-MC-Unique: Tfvlf9_DOrOy3eqMxUvrgg-1
Received: by mail-wr1-f70.google.com with SMTP id b15so877481wrm.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 02:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ynJqjMPq2VeQ1KGJnjXQjrrHSQhxWis2CNDdCm+IHl0=;
 b=sfHImNg5jaYQva6in7LMXlS2IlYn8D/lbygpdUQeCSqFjSwOWuGRMP7Mk+b116vqr9
 Kgd6U976jEmYai8Q5sHtEOF9tfIs8qg5p8dGBfXnXFPKcklSo6OgcLouCIEmc3SqUIZ/
 vhDjI2O7vipP0q2+MdJNvIJpLptA+ufjlYlUWJtQfZPP4UjIF8OScZrYDzIBuI0XLnEV
 BIzHTeq4qJ1p/Z9icjFI7WvunPscmv63v46dVFRBtfCLDeO4qRJhGIiFwBQuUHtmKQ3Y
 5pdP2H/FOskAGq8EWMnNWgBs39HfDWeeYqNBM6Pday9/hrPVf303fzNX7ygCTEV05Mh5
 bTjg==
X-Gm-Message-State: AOAM533qLGeLbetgkyLIgi8EgJN9Cbwhcz9pquEG3dq+R1Rv84hyHd/o
 S5egXYhxMr3CZmKa9sJqt0ytc59m8JSGbOrU0/FQ9r2JnjI+ShWu3+hndofwmSwR/oG+dm/minN
 JWsr4i+9GN6PW5Gc=
X-Received: by 2002:adf:f186:: with SMTP id h6mr8700216wro.290.1614940059557; 
 Fri, 05 Mar 2021 02:27:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/dwP+riWuo2rALDwgnVnxLVvFG2maVn7ja/nEgnVqgW+6052pmM9xkxytEILvKxRgcUwyfA==
X-Received: by 2002:adf:f186:: with SMTP id h6mr8700194wro.290.1614940059393; 
 Fri, 05 Mar 2021 02:27:39 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h10sm3971246wrp.22.2021.03.05.02.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 02:27:38 -0800 (PST)
Subject: Re: [PATCH v5 0/4] GitLab Custom Runners and Jobs (was: QEMU Gating
 CI)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210219215838.752547-1-crosa@redhat.com>
 <0acfe9de-c7c9-ef1e-8ed4-6f7e42859dcc@redhat.com>
Message-ID: <1e6e8f6b-c73e-a54c-8d64-b6a617428ec2@redhat.com>
Date: Fri, 5 Mar 2021 11:27:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0acfe9de-c7c9-ef1e-8ed4-6f7e42859dcc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 11:14 AM, Philippe Mathieu-Daudé wrote:
> Hi Cleber,
> 
> On 2/19/21 10:58 PM, Cleber Rosa wrote:
>> TL;DR: this should allow the QEMU maintainer to push to the staging
>> branch, and have custom jobs running on the project's aarch64 and
>> s390x machines.  Jobs in this version are allowed to fail, to allow
>> for the inclusion of the novel machines/jobs without CI disruption.
>> Simple usage looks like:
>>
>>    git push remote staging
>>    ./scripts/ci/gitlab-pipeline-status --verbose --wait
>>
>> Long version:
>>
>> The idea about a public facing Gating CI for QEMU was summarized in an
>> RFC[1].  Since then, it was decided that a simpler version should be
>> attempted first.
>>
>> At this point, there are two specific runners (an aarch64 and an s390x)
>> registered with GitLab, at https://gitlab.com/qemu-project, currently
>> setup to the "qemu" repository.

Also we are interested in testing virtualization with these runners.

If KVM is available, we need to document the gitlab-runner user needs
to be in the KVM group, and it would be helpful to have a 'kvm' tag
in the runner taglist, so we could assign specific jobs to these
runners.

> Our CI is heavily based on containerized testing, your scripts/document
> don't cover that.
> 
> Should we document how to install a container service (we mostly
> use Docker and Podman)?
> 
> Or should we simply explicit these are only "native" runners and
> container support will be considered later eventually?
> 
> Regards,
> 
> Phil.
> 


