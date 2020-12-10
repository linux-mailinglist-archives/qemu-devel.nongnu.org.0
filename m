Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276872D6471
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 19:07:13 +0100 (CET)
Received: from localhost ([::1]:54720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knQLQ-0005Dl-2D
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 13:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knQEv-0001Zc-0q
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 13:00:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knQEf-0000H2-Fn
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 13:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607623211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R41GMw1T5YoWopNRTE+pUbr700wp0qy3I048Z6Lr/PU=;
 b=AhOMCTV/MG0et3ak6pcI4/9y9FPmF31I/ZKSgjjOZbZKZBv4+4aAYCQF5/07YWfhXhGSob
 cnjkbFNZEd+mpFU0xg3PdMDLtuE5NZW4ByJdRVZPNq5jA+VS8dV8L/1Lovtvdg8XOCtaQa
 D1ovtscVNxNvYaixVVCg1GTuKE2tfjo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-98GwghdNOzuU1wALtmrLaQ-1; Thu, 10 Dec 2020 13:00:09 -0500
X-MC-Unique: 98GwghdNOzuU1wALtmrLaQ-1
Received: by mail-ej1-f70.google.com with SMTP id bm18so1880774ejb.6
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 10:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R41GMw1T5YoWopNRTE+pUbr700wp0qy3I048Z6Lr/PU=;
 b=NXuXvMPNge9xxbxurAdpvqxlteNAWD5B7PCdOj/INBH+4j2bNjsduY9WdTqYZ8kqI8
 E7uVg4npB4j+2ZMd+xmbe3UronUW/k5hXOfRv4KIydQHU2HVbrXD7Bf50qDf+KVXl+G8
 7O8zSKoowLii0w/6iIbMIv8VEEXIIITUY9mL7MzuRPQ4Z/qZCE2FFac9sahZNqwACccf
 8zCa9aH2HbjYZ1Q0ukoUlScIu6J2QoCngmAAy9xLqJADSODoigvtAlcaMiJKdq+dBPca
 eER3uXkyZXFyxUp5R/mcnrWF2+PTqnrS4k+bxOg5dpvr7Ful4i28Fcgl7c98o3KLmNmt
 1L4Q==
X-Gm-Message-State: AOAM5322QX4rbxBYsVb296LW3MVCQMYoC+KDoBzT9FYtM114I2D8VyQ8
 ILm1Jyp4qcnWbTZTAFJnSaU1mXSjohcen0oNmX41quSNG/fhAIxP8ol1XPhRPymv378YX7dHHdw
 2ySup7acG/uZYW+E=
X-Received: by 2002:a17:906:3881:: with SMTP id
 q1mr7617277ejd.490.1607623207074; 
 Thu, 10 Dec 2020 10:00:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRvJ88a/2ef1LB75m2Iy6XKPt74EEv0pqQtAl4m4lHd0iI8rQ34iVjUUigRsdehJ0PpNZXjQ==
X-Received: by 2002:a17:906:3881:: with SMTP id
 q1mr7617193ejd.490.1607623206354; 
 Thu, 10 Dec 2020 10:00:06 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id z24sm5572736edr.9.2020.12.10.10.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 10:00:05 -0800 (PST)
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, qemu-devel@nongnu.org
References: <1607536336-24701-1-git-send-email-alejandro.j.jimenez@oracle.com>
 <1607536336-24701-4-git-send-email-alejandro.j.jimenez@oracle.com>
 <99a5b268-f37f-b7a3-c976-3342e1145157@redhat.com>
 <12769054-aa3a-161b-2b25-6804d547d41c@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 3/4] qmp: Allow setting -action parameters on the fly
Message-ID: <b02bb673-1128-799d-1310-62b43e359982@redhat.com>
Date: Thu, 10 Dec 2020 19:00:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <12769054-aa3a-161b-2b25-6804d547d41c@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: david.edmondson@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 04:21, Alejandro Jimenez wrote:
> I misunderstood your request in v1. 

Oh ypu're right, in v1 you had multiple commands.  My fault then.

> 
> { 'command': 'set-action',
> 'data' : {
>      '*reboot': 'RebootAction',
>      '*shutdown': 'ShutdownAction',
>      '*panic': 'PanicAction',
>      '*watchdog': 'WatchdogAction' } }
> ?
> 
> Or is it better to encapsulate all of those optional fields inside a new 
> struct definition (RunStateActions?) so that the command would be:
> 
> { 'command': 'set-action', 'data': 'actions' : 'RunStateActions' }

Any of the two is fine; the QMP stream is the same.  I used 
actions->reboot because that's what you did in v2.

While at it, you might add

    'allow-preconfig': true,

as well.  (Right now there are relatively few allow-preconfig commands, 
but I'm in the process of adding it to all commands where it makes sense).

Thanks,

Paolo


