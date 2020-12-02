Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173222CBE76
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 14:38:26 +0100 (CET)
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkSKv-0004g0-6o
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 08:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkSJH-0003sL-Ui
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:36:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkSJG-0005zJ-4G
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606916201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+S8PVutQeX1gYsliql8x8zWLlo4p1y99pWiFHhX8bkA=;
 b=UGajTFUD+tkCRwrMMyUnx6Nw0tKGBO6KEO4nmhXuduNFurZFzLUoWox/UhugteldLNJbs7
 1EckhnRi6x06H5UrBWi0Wdpen0gHXozFrjDXSvsfKIb5y17xOo1WJDs0IBLfI2sNbSxMhR
 6IYZsVRNOHzrGgMfQI3OsDPalJ1PEAM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-PamxIQ_kN-GIqdC9QNdLxw-1; Wed, 02 Dec 2020 08:36:39 -0500
X-MC-Unique: PamxIQ_kN-GIqdC9QNdLxw-1
Received: by mail-ed1-f72.google.com with SMTP id s7so3099454eds.17
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 05:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+S8PVutQeX1gYsliql8x8zWLlo4p1y99pWiFHhX8bkA=;
 b=AdSGl2/UKbddBa/Lf0w/3I9dMkNYzt+zpgjFdCjE5nULl7X8Kbidl+JL/mhXH4pzIB
 mLA0fq3xE1iKmqKTLDgmaN5WfnSQmml8gPjPi/onVJMhinGBD8Y9560FmLJ73bpQWcF9
 C+UtQPawgx07Udnv0PZx45O+vpg3ZJe8+Kp9/60+ceEeiWbC4ZuF5u3WnDtyIGu5AYcj
 zProbkq+ZrluIOuY40Vkj4Mh00hKd1uDAG4av8Ij2avQXkq73GB6/wzWMW5awoXXFQac
 U8DdIwXFWfkCikiBIyi7WiQ+WGSkV4K3NWE0PBFUWywrcYs1q9YjMp7tg2ol5XpAr3+t
 n1IA==
X-Gm-Message-State: AOAM533dLi3J55ZDILOkuagzszLLli2L7XAE1t5OFyUOu9GC7DkrbOj7
 A4fONedyzQL38hl7b+Rb83nPqLDJ4SN5x7M8aKS7FNY0efBIt0Vrp+qKYOiHTzDU+2hnGQ1Mf5Z
 SB6B62xrj/IldnoVZgX6Ky7jacEIs7o+RcQuhL4d7eDq1vvpZcmWfiIVtkbsExzEWW7U=
X-Received: by 2002:a50:9f4a:: with SMTP id b68mr2549650edf.296.1606916198066; 
 Wed, 02 Dec 2020 05:36:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6bh3WcKhz4zbs+VnVB+vYaAzkPNLtmUidmqlQcrqGyY3J+7rTu/mIrqOXrI00lkDVzZJGBA==
X-Received: by 2002:a50:9f4a:: with SMTP id b68mr2549612edf.296.1606916197546; 
 Wed, 02 Dec 2020 05:36:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f18sm1207732edt.60.2020.12.02.05.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 05:36:36 -0800 (PST)
Subject: Re: [PATCH 24/29] migration, vl: start migration via
 qmp_migrate_incoming
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-25-pbonzini@redhat.com>
 <20201120163408.7740a92f@redhat.com>
 <0562d6fa-b619-7dc3-ef94-242a39436cfa@redhat.com>
 <20201202131037.GF3226@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3a14b300-9288-bfb8-57cd-653ebfd76e66@redhat.com>
Date: Wed, 2 Dec 2020 14:36:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202131037.GF3226@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/20 14:10, Dr. David Alan Gilbert wrote:
> I'm more worried about how this stops a repeated 'migrate incoming'
> or a 'migrate_incoming' that's issued following a qemu that's been
> started with -incoming tcp:... but which a socket hasn't yet connected
> to.

Good question, fortunately it is simply handled answer:

void qmp_migrate_incoming(const char *uri, Error **errp)
{
     Error *local_err = NULL;
     static bool once = true;

     if (!once) {
         error_setg(errp, "The incoming migration has already been 
started");
         return;
     }
     if (!runstate_check(RUN_STATE_INMIGRATE)) {
         error_setg(errp, "'-incoming' was not specified on the command 
line");
         return;
     }

     qemu_start_incoming_migration(uri, &local_err);

     if (local_err) {
         error_propagate(errp, local_err);
         return;
     }

     once = false;
}

This patch can simplify things because every incoming migrations (no 
matter if '-incoming defer' or '-incoming tcp:...') goes through the 
qmp_migrate_incoming function above.

Paolo


