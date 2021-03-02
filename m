Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C72332AC26
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:18:02 +0100 (CET)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCP3-0007sb-Cz
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHC9g-0000Ua-Oz
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHC9f-0001QH-9Y
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614718926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2aj6vrArQbKQ0qBxFPlrD7E8t70Px4bxQ/EmWWtj4ZQ=;
 b=h6/E776JOhZEj2Ga5KnCci4MophsqjcUiiyDMEcXdc9eXoKxLmLqcNi1vvbo/Ua2iEPp5w
 YQchONKr2XkdEv2S3vDy3xvxy8cKL8Np53pvum2TCVu2AARBBjVuXP5+xVoX7gTby0oJBv
 BjXnBh882D76yGcNnbsxFoGSTyqb8dU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-Vkd0rz-HO0uVvCWpWUcWyA-1; Tue, 02 Mar 2021 16:02:05 -0500
X-MC-Unique: Vkd0rz-HO0uVvCWpWUcWyA-1
Received: by mail-ed1-f69.google.com with SMTP id a2so3001244edx.0
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 13:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2aj6vrArQbKQ0qBxFPlrD7E8t70Px4bxQ/EmWWtj4ZQ=;
 b=eF8jJmMCyShGrT+wlRg+GSqgH25whEJiP9sWQQ9abzqzE6WYlL1y8rVQsIbV2hUT6p
 tJ6KdmPr6Y90hPoqH416mDT3pICYvPpk8yPmw880a9sAhuS8DnlawaFcZibVpf5Nbfii
 ygnHLe9Sy9F27RiDdro9m5R5fJQKAVWLKlq9ZcVnJkrybMQ2sPJ/pV7eRw2gqPFSwkRg
 q0aHYqdD148HEU6c102MYxwG6nvMmyYKnf3VHgQ1HYBKdUt/AlUsH0pEP7dCCasRhFRQ
 iXLYr51pLZB/5wukZqLyHPZw2zrPP1TP+mj+2+P6xrZ1SPaGlONMENyHBpTJsSDZVREt
 Bo8A==
X-Gm-Message-State: AOAM5314lpPbeurgt/SDSlliHew41RKPgNi3NITsR8G6SRyROxARXgv2
 3SbI+n/JMdD4/7wRgYU4zAcan8KG+JKx4e9AjJm+YaiBKmDRtKnFTz/HB88SA8t5QzNS/tTVVKs
 bUWPugXCrnVJnmNA=
X-Received: by 2002:a05:6402:12cf:: with SMTP id
 k15mr4142916edx.192.1614718923893; 
 Tue, 02 Mar 2021 13:02:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBCJzr7ev9mZH1IApTfeoue8BfMGFDSMWxgz4mnCzhsvDnzt2m9RqoG3HLb52sfdUyyGHp6Q==
X-Received: by 2002:a05:6402:12cf:: with SMTP id
 k15mr4142895edx.192.1614718923742; 
 Tue, 02 Mar 2021 13:02:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id kz4sm19194975ejc.38.2021.03.02.13.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 13:02:02 -0800 (PST)
Subject: Re: [PATCH 3/3] qapi: provide a friendly string representation of
 QAPI classes
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-4-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0e60ba89-76ce-0895-ee7c-a718ee53de45@redhat.com>
Date: Tue, 2 Mar 2021 22:02:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302175524.1290840-4-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 6:55 PM, Daniel P. Berrangé wrote:
> If printing a QAPI schema object for debugging we get the classname and
> a hex value for the instance. With this change we instead get the
> classname and the human friendly name of the QAPI type instance.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  scripts/qapi/schema.py | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


