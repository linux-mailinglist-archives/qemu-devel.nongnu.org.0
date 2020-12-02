Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE92CBEB5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 14:52:29 +0100 (CET)
Received: from localhost ([::1]:59628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkSYW-00077X-3c
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 08:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkSX3-0006g0-DQ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:50:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkSWz-0007g5-3j
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606917051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhSt0Vnzg0S29wT7BT/wGfOGVZZGB2FKwUhBfNYidc8=;
 b=K9cX7uXbaGztJburAYnNjmwOINEWBocyVVk5LNRN4P/YgBK54USzBDzDqIDb/DUtuPP/Up
 bf8TKPRGgT24TOpXrb7v7U62KVYoy2VYgvmIG7masj5hLs/XAXOpz2n6BNqCvsFzDZyCvC
 rQCauO2AhE9BoBLl2qvSdojzS+GlhRQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-hL1Te5zINTOel0wj8oZIGg-1; Wed, 02 Dec 2020 08:50:47 -0500
X-MC-Unique: hL1Te5zINTOel0wj8oZIGg-1
Received: by mail-wm1-f71.google.com with SMTP id k23so3941340wmj.1
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 05:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KhSt0Vnzg0S29wT7BT/wGfOGVZZGB2FKwUhBfNYidc8=;
 b=Sp7QhNpDNiNV8OcUm2avKHmlskfF6wtxwifGyd1PtRaj8MyheLnP2KGwQeSfDjWccm
 OKaewfG4nmwkZzM0JGTkQMyU+WFzuMlFkwO2V5ILftyLDna/SyYnxgZsl+5QSOEmMQHo
 PU5tbOuLxPA6RIwOTY50FNU5oGRPOpZnPfEU5ARbORj3XhM9NOKiqnUhyvD8NwcV+J/V
 DZfI+NEVAFMRvnhnRxXK5+8Df8qY0VulI6Veujakcn47V/HI5jXQS0WRxMLgVR8OXbaP
 HeDBvjaZKovF+EuZzDHZGxbbYJ0zxFKYmqcz7yVhqRUxFFZ4x0B0qcqRDkYigpYydUAM
 jTSA==
X-Gm-Message-State: AOAM533rtwTH1FajJ3wzWkegrpz8Yw4ywu8e13qSB5cpaPVQ3jp6Hqks
 a7yLFY8h3heH5XclC4pV96HkI/ADOYH2BitMHHh1/gHPVMDmr9VCyb/PN/B6SKlKzozgBmjH5Ci
 pN0IqosKwPzDe7Lo=
X-Received: by 2002:a5d:62cb:: with SMTP id o11mr3632176wrv.25.1606917046524; 
 Wed, 02 Dec 2020 05:50:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwK5U2PS//FKElkMVSUCRJVm9ZyMczB1UtgvM9VWSMFoy7ebKIC63ERuutPjOMdLE6doQ4BZw==
X-Received: by 2002:a5d:62cb:: with SMTP id o11mr3632146wrv.25.1606917046269; 
 Wed, 02 Dec 2020 05:50:46 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id g192sm2142114wme.48.2020.12.02.05.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 05:50:45 -0800 (PST)
Subject: Re: [PATCH v1 1/1] security-process: update process information
To: P J P <ppandit@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <20201130134907.348505-1-ppandit@redhat.com>
 <20201130134907.348505-2-ppandit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d48ca955-b84e-429d-3abf-c275ff2ede52@redhat.com>
Date: Wed, 2 Dec 2020 14:50:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130134907.348505-2-ppandit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Prasad,

On 11/30/20 2:49 PM, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
...
> +## How we respond:
> +
> +* Process of handling security issues can be divided in two halves.
> +

Maybe:

     0) **Acknowledge reception**
       - A non-automated response email is sent to acknowledge the
         reception of the request.
         This is the starting date for the maximum **60 days** required
         to process the issue, including bullets 1) and 2).

> +  1) **Triage:**
> +    - Examine the issue details and confirm whether the issue is genuine
> +    - Validate if it can be misused for malicious purposes
> +    - Determine its worst case impact and severity
> +      [Low/Moderate/Important/Critical]
> +
> +  2) **Response:**
> +    - Negotiate embargo timeline (if required, depending on severity)
> +    - Request a CVE and open an upstream
> +      [bug](https://bugs.launchpad.net/qemu/+bug/)
> +      or a [GitLab](https://gitlab.com/groups/qemu-project/-/issues) issue
> +    - Create an upstream fix patch

         with the proper Buglink/CVE/Reported-by tags.

       - Participate in the review process until the patch is merged.
         Test the fix updates with the private reproducer if required.
       - Close the upstream [bug] with 'Fix released', including the
         commit SHA-1 of the fix.

> +
> +* Above security lists are operated by select analysts, maintainers and/or
> +  representatives from downstream communities.
> +
> +* List members follow a **responsible disclosure** policy. Any non-public
> +  information you share about security issues, is kept confidential within the
> +  respective affiliated companies. Such information shall not be passed on to
> +  any third parties, including Xen Security Project, without your prior
> +  permission.
> +
> +* We aim to process security issues within maximum of **60 days**. That is not
> +  to say that issues will remain private for 60 days, nope. After the triaging
> +  step above
> +    - If issue is found to be less severe, an upstream public bug (or an
> +      issue) will be created immediately.
> +    - If issue is found to be severe, an embargo process below is followed,
> +      and public bug (or an issue) will be opened at the end of the set
> +      embargo period.
> +
> +  This will allow upstream contributors to create, test and track fix patch(es).
>  
>  Email sent to us is read and acknowledged with a non-automated response. For
>  issues that are complicated and require significant attention, we will open an

   ^^^ You can remove that, as now covered by bullet 0).

Regards,

Phil.


