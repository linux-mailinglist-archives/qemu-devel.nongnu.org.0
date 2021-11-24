Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B045C86A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 16:17:10 +0100 (CET)
Received: from localhost ([::1]:51318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpu1F-0002oY-J6
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 10:17:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mpu0L-0001ii-5p
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:16:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mpu0G-0005dD-Rs
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637766967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DyiEafrPKTan+hsnDjZLhzDtXLsEEkjaVRtiuuI3Vs=;
 b=fR39wT6bSGPIQnaTa6WAkSL2Bl/u6HDtRbbBMfZeC2hmnVJh7OAmgl5Dcm7gQ/sT9AagIv
 niVyKv/lV3lvvlpIMCA35OmBh1iH/AMe5dPxOUM9n5nOvtrFTZ/Pqy11oiRcIy4nBB1fmq
 qwd7+Sm7o/yZh4gBQqVsPBrrCjeCpao=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-ti9fl9B_OyuiiAk2sDpSGg-1; Wed, 24 Nov 2021 10:16:02 -0500
X-MC-Unique: ti9fl9B_OyuiiAk2sDpSGg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso1637316wms.1
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 07:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1DyiEafrPKTan+hsnDjZLhzDtXLsEEkjaVRtiuuI3Vs=;
 b=h24/PhS5UVgH817XbsdZf0Vv0G3fnX5aQA1Y35S3dBB+GuJDo1WkspFMSz/H/om9cV
 R3Kapql4WUG8erGC6f9HmlzLwHfiXr4wLeNgZWLjnCqBs7lTSWIXzvTbO0AHkr1ZHveZ
 XF2ag5SJmiuaikkoYuYxj7YUwE8HJOIASTqHdb8FJj6/ZTAfh8CECkFB/JxFnfm+6kSj
 w43LW8NWTVC17xrPLuXxEg24Vlu0lUcjRw1+gcK5Krh4MjVr0YYbeT0nF1wik1CyE2CC
 3fD25WxDMJgDx/q0HbEtlyyzOHclxW6DbuMBCgUN97TAf8YohJ9zYJrRFKvI5AuWep29
 FdzQ==
X-Gm-Message-State: AOAM533+0lmcdEtqojSMqqYtTm0lDZSKmWNG1/G3lsMXYGII+fLNH+FE
 +bIBb5i+4L9KyIOC1vhBsI4DK/cSHBPI7/b0VWeWqsiamLTAvJ9DUrE9pyKpwYv/+pNY0dsOgBz
 Wjv2ybO60xFbQZiY=
X-Received: by 2002:a05:600c:ce:: with SMTP id
 u14mr15846920wmm.83.1637766960861; 
 Wed, 24 Nov 2021 07:16:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymBO6izBrnExaGXrT4LeeWaoB6/NNRE5XqR/O76tnLiaAhEdL6Eefgy9PU18LJD7sV1i7NwA==
X-Received: by 2002:a05:600c:ce:: with SMTP id
 u14mr15846867wmm.83.1637766960629; 
 Wed, 24 Nov 2021 07:16:00 -0800 (PST)
Received: from [10.34.245.34] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id e12sm177749wrq.20.2021.11.24.07.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 07:16:00 -0800 (PST)
Message-ID: <052bedf2-e48e-2fe7-9376-eb943923b7cd@redhat.com>
Date: Wed, 24 Nov 2021 16:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: RFC: extending QGA guest-network-get-interfaces
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
References: <CAJ+F1C+HXNBbfROqQBU1Wrt5fiVa9xrSpgg9ymSO2wR+WPRqBA@mail.gmail.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <CAJ+F1C+HXNBbfROqQBU1Wrt5fiVa9xrSpgg9ymSO2wR+WPRqBA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: oshoval@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 15:00, Marc-André Lureau wrote:
> Hi
> 
> Or Shoval filed two RFE for guest-network-get-interfaces:
> - "Guest agent should report the interface Permanent address"
> https://bugzilla.redhat.com/show_bug.cgi?id=2025303
> <https://bugzilla.redhat.com/show_bug.cgi?id=2025303>

As I've replied in the BZ, this is something that Libvirt can improve
on. What happens when guest changes a MAC address is that
NIC_RX_FILTER_CHANGED event is emitted and libvirt processes it (mostly
to update guest XML, but not limited only to that). But, Libvirt does
not forward this event further to users. Therefore, if a mgmt app on the
top of Libvirt wants to keep track of MAC addresses, it can't do that
simply.

> - "Guest agent should report interfaces from non root network
> namespaces"  https://bugzilla.redhat.com/show_bug.cgi?id=2025296
> <https://bugzilla.redhat.com/show_bug.cgi?id=2025296>

This is a bit tricky to achieve. There's no easy way to list all nsids
(they don't form a hierarchy like other NSs). We could traverse all
mount points (be aware of mount namespaces), all PIDs (be aware of PID
namespaces) and hope we covered all net NSs (a net namespace can have no
nsid).

IOW, network NSs behave different to other namespaces.

Michal


