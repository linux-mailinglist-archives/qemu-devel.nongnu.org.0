Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83C0310DCE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:24:28 +0100 (CET)
Received: from localhost ([::1]:46740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83uF-0006Dw-NY
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83rj-000412-ES
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:21:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83rc-0004IM-Ci
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612542102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDbjm/haSmigZwpXJlprOtvjKXK8IoLK6idelUA2OE0=;
 b=VLPZgelwKv2Tu8JZ0Dqjs+yFQ412MArboynI+p9xElvQEFjMUMeGWtbRcvWlqoMJ7dI4+y
 QADV6RfnwT95hIX0ArFOD69wg2PoRWA7AXC4PwnRN97V6xVcH9f0F5yEn80q6etVLDSrEH
 VDRkt9aYiRrCMIvnPAe7HX1kgYU6LqY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-G4eicWvOPtKV_3gv3wCWYA-1; Fri, 05 Feb 2021 11:21:41 -0500
X-MC-Unique: G4eicWvOPtKV_3gv3wCWYA-1
Received: by mail-ed1-f72.google.com with SMTP id w14so7202956edv.6
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:21:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UDbjm/haSmigZwpXJlprOtvjKXK8IoLK6idelUA2OE0=;
 b=KEV85t0QdkYTg/ZP1Ds8LLXdmiDHO0OvIWpOjzwkvmPxQN8aKDZyyecH/I6hV1eMCB
 4Sgdmt/JiYYk+ly+sMRXGSD72ZOHT+q3FuhRF3xPvAPUY8Yh/nWCrnCO4I2ifYKSB/WE
 UWJdXB2BemrCRvI0N9Yaibt1uVB1QivdpCHz7BxvGjhIkBjGAIrRNcZ/NsQ42lCYME/W
 o825qK61CUpaadY5ptcRa8gitiEBhzlCzt9IEX0TBXMsmJ4e3+Abk/uLfhpWIe7cp/NI
 vALNafR6J/YWlFVEfv0qxF2B/y2UKpq59BqFvjmJ7QHiA5JcProjQAaqdQwlJDr4S7dC
 xhmg==
X-Gm-Message-State: AOAM533AjYUUWRGwlD4uUmIta93SLmsfEDrPapVqiMRdA4aw2C7Idq4/
 NQHn2H8jAt3w0xEiV3RoWiDfofvq/uKy1KERue9w9LnIbX+rinZ0MmnM2Sfqa4WQqT4TtH/ciaH
 DfSeKzIYnOPClXcg=
X-Received: by 2002:a05:6402:402:: with SMTP id
 q2mr4289658edv.116.1612542099950; 
 Fri, 05 Feb 2021 08:21:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCEwe2k95uIXEwlSaRABUIqoLlD6NkVyG3RknkYcWAdPYlVe+7Q/ELH7uuFOFSYNnlKMGkVw==
X-Received: by 2002:a05:6402:402:: with SMTP id
 q2mr4289638edv.116.1612542099805; 
 Fri, 05 Feb 2021 08:21:39 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r6sm1111214edq.43.2021.02.05.08.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 08:21:39 -0800 (PST)
Subject: Re: [PATCH 10/33] migration: push Error **errp into
 loadvm_postcopy_handle_advise()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-11-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9e014c9e-c78c-17f6-e125-86c776b4d69f@redhat.com>
Date: Fri, 5 Feb 2021 17:21:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-11-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 6:18 PM, Daniel P. Berrangé wrote:
> This is an incremental step in converting vmstate loading code to report
> via Error objects instead of printing directly to the console/monitor.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  migration/savevm.c | 43 +++++++++++++++++++++----------------------
>  1 file changed, 21 insertions(+), 22 deletions(-)
...

>  
>      if (ram_postcopy_incoming_init(mis)) {
> +        error_setg(errp, "Postcopy RAM incoming init failed");

We gain error precision, OK.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>          return -1;
>      }


