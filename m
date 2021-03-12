Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B53389D1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:16:22 +0100 (CET)
Received: from localhost ([::1]:36834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeqD-00013f-91
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:16:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKehj-0006XH-3Y
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:07:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKehg-0005hx-Gw
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jXx1Edpx0znjOCAJ1iXkZ/5mHMHpNWQ5KDawXrGwc4U=;
 b=fJXndRDc/6ELoqju2LSSFMIEtlwxm1fdNCIo6JTIO6SMF3bT5JGe7eC+NPdRtzF5LHaar7
 IZTe4BJ8g0Dvkhfe/IEnVjGhuvqaCw7KEjigSzn0rtko9AsH0s3/pVZxGjB1N0XHVFS+j4
 Ma4hv+paHA5SEDwFeQUTVVbk9B8TU6Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-8Bi0VPvUPsWQqVMXZRirqA-1; Fri, 12 Mar 2021 05:07:29 -0500
X-MC-Unique: 8Bi0VPvUPsWQqVMXZRirqA-1
Received: by mail-wm1-f71.google.com with SMTP id a3so1919811wmm.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 02:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jXx1Edpx0znjOCAJ1iXkZ/5mHMHpNWQ5KDawXrGwc4U=;
 b=LKoQbj7cUR+AV/4wVvK/EvqLndNW2UvhzIX/I/K9eBD0E9R8eT+Haj+Yh+gDhCSaL9
 fYtBKFfHJm1+DbMj+pD8IPAqW8CidTiSyQFLg1ugQ+5GGdzjUhWWzRT5R+wFxHCSSAF+
 2SDezNDp2nGg5DLULsohZsc5zKFe/NSl7AZZU469APnPieYvwHepvgrfITk8vc2E/haF
 FwCFYaPPgbByTo8QP2v2e/HI5Fq419hf1bnGb6C8ZGvLBLdCldl+PXmrWkua3zBOnRzA
 b7/zEZK/uYav+qogdM3px8dSguVIMG8k7kyZPRY6Z8xHYyZg4/kFdxq47yAI9W1JiFrF
 NUNg==
X-Gm-Message-State: AOAM531dn0Z2GKSQFX1KA5aauqcVSalIn2kEGnArAUI6T8hqEBTos8H6
 xQEWskIdrIEtKeQ2f+KrDI0gPh5EJZjyQxo9dV505Cf1Olx5oesFPYf2zKwE5N84QvQGlfU9mpN
 vDu7uUSIh46jfNs4DcN2adgeKv8Fe7xU/XXsGQyYXtJ2S7oNJtheKzbzT+Rza4v53nIQ=
X-Received: by 2002:a5d:528f:: with SMTP id c15mr13151995wrv.142.1615543647883; 
 Fri, 12 Mar 2021 02:07:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyKVNO/1BL0qQVk1o7ASl6tOshhfMQZ+M7dGQ9krolmnhjQ7e2OTMS3yy71ztwWXy8D2IJlg==
X-Received: by 2002:a5d:528f:: with SMTP id c15mr13151974wrv.142.1615543647734; 
 Fri, 12 Mar 2021 02:07:27 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id q19sm1586388wmc.44.2021.03.12.02.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 02:07:27 -0800 (PST)
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
 <a81c0a8d-af3c-4b40-bcb4-9b120b5eee93@redhat.com>
 <ec7f83ae-8529-3a0e-4b00-73c856b28a3e@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <be88d88a-dd9d-547d-9f3d-7444f0f8bbc6@redhat.com>
Date: Fri, 12 Mar 2021 11:07:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ec7f83ae-8529-3a0e-4b00-73c856b28a3e@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 10:58, Claudio Fontana wrote:
> Not really, but I have been using the accel class init function on x86 to register the TCG OPS,
> 
> and this instead requires a bit more thought for ARM,
> 
> because we currently register for the ARM M Profile the TCG Ops at arm_v7m_class_init time,
> which is called already at select_machine() time,
> 
> so when we select the accelerator, and we call the tcg_cpu_class_init, we run the risk of overriding the existing tcg_ops
>
> Ideas? Looks horrible?

Not horrible, but wrong.  The class_init function must be idempotent: 
classes have no side effect until they're instantiated (and even then, 
usually we delay that to later, e.g. realized for devices or complete 
for user-creatable objects).

Why can't you register ops in the machine init function for the accelerator?

Paolo


