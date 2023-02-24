Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF476A192D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:54:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUmU-0003Fi-JN; Fri, 24 Feb 2023 04:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pVUmS-0003D6-FC
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:54:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pVUmQ-0007kP-Qm
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677232457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YhGWjaxOGHWH0INrlJJMaW4C9H1eIc0jshVKpRma5ac=;
 b=KuzRDK/CPkOfWSCfwVjmTDAzlJjxA7geYJBhkXoS0F4efifNoq5+AzpL/0PUFvnGJ8SrOb
 OrEMSkHFIlyyjVKL776oZ4oY80swO/FKvuL63r36KUAG0Oam53k8tz3wvQtARnHRyLc4RC
 FUYZiGaxXFMyXLS2zJSu75tcKRskf8c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-gwkf5tqDNhWFrweXur7GXA-1; Fri, 24 Feb 2023 04:54:14 -0500
X-MC-Unique: gwkf5tqDNhWFrweXur7GXA-1
Received: by mail-ed1-f71.google.com with SMTP id
 cy28-20020a0564021c9c00b004acc6cf6322so18872608edb.18
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 01:54:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YhGWjaxOGHWH0INrlJJMaW4C9H1eIc0jshVKpRma5ac=;
 b=WxjQEk4/ZN/K1G10BTNO4FTc3cYQalPso+H1xWlZzLUG/jz8PKHcbqHFwlKm29Mnj3
 g+c8+Ha7abNH0rYO6YXbK0j2YtPecXpQYSDyVnErpCIvJXBjQCNKN/X1XOItdc/ujs7C
 56VUjIUvqibWyoYJdPHj/2XdYcN3IAYKrQS+XLmSTGPdkgOeBC7giNSYCQNcoSBhs/7H
 bC1OzzvEylRik6rFPauj1tQeDTZIzH8ZM57o+FspCJlxfTvrtsKUP+lBy3HKNJMdqidN
 MD1e/xQRiGoo/MlnXW7jWmqlgetiXlldfXiO5RF1P7uDvW1m6nuuKM265n2kESsK80EA
 4JYA==
X-Gm-Message-State: AO0yUKXvw/NSMFG9Kc2m+eEnulaEfqslUCIidt8kILqC53xlBykpsOaT
 DrSi5MVQ2zAmmiI0q4nTZWBA56f3AXAmP+WKXfAMIqcFxGbIqUDXKmgd7muuqIdAP61qOw+cq0X
 I3E4FZ0W5drfe+BQLWZbv
X-Received: by 2002:a17:907:62a6:b0:8ed:5a7e:5e44 with SMTP id
 nd38-20020a17090762a600b008ed5a7e5e44mr5611543ejc.34.1677232453098; 
 Fri, 24 Feb 2023 01:54:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9xbKbwG81E2YURo39GsD2e3/kx/bopuiShnhzXSGuxbx1Tf31MBMy73H1xXBoun6NOKlW5YA==
X-Received: by 2002:a17:907:62a6:b0:8ed:5a7e:5e44 with SMTP id
 nd38-20020a17090762a600b008ed5a7e5e44mr5611533ejc.34.1677232452828; 
 Fri, 24 Feb 2023 01:54:12 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 w10-20020a170906480a00b008d2d2990c9fsm6208212ejq.93.2023.02.24.01.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 01:54:12 -0800 (PST)
Message-ID: <5c76bc82-3fe2-fd1f-3845-7de8508c0523@redhat.com>
Date: Fri, 24 Feb 2023 10:54:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: out of CI pipeline minutes again
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ben Dooks <qemu@ben.fluff.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <20230223152836.dpn4z5fy6jg44wqi@hetzy.fluff.org>
 <Y/eHLCKcdYk0V4Tt@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y/eHLCKcdYk0V4Tt@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/23/23 16:33, Daniel P. Berrangé wrote:
> On Thu, Feb 23, 2023 at 03:28:37PM +0000, Ben Dooks wrote:
>> On Thu, Feb 23, 2023 at 12:56:56PM +0000, Peter Maydell wrote:
>>> Hi; the project is out of gitlab CI pipeline minutes again.
>>> In the absence of any other proposals, no more pull request
>>> merges will happen til 1st March...
>>
>> Is there a way of sponsoring more minutes, could people provide
>> runner resources to help?
> 
> IIUC, we already have available compute resources from a couple of
> sources we could put into service. The main issue is someone to
> actually configure them to act as runners *and* maintain their
> operation indefinitely going forward. The sysadmin problem is
> what made/makes gitlab's shared runners so incredibly appealing.

Indeed, that's the main issue.  Now that GNOME is hosting 
download.qemu.org, we have much more freedom about how to use the 
credits that we get from the Azure open source sponsorship program. 
Currently we only have 2 VMs running but we could even reduce that to 
just one.

Using the Kubernetes executor for GitLab would be both cheap and 
convenient because we would only pay (use sponsorship credits) when the 
CI is in progress.  Using beefy containers (e.g. 20*16 vCPUs) is 
therefore not out of question.  Unfortunately, this is not an easy thing 
to set up especially for people without much k8s experience.

Paolo


