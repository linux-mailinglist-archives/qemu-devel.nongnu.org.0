Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0665B30FFCB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 23:02:46 +0100 (CET)
Received: from localhost ([::1]:47414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7mi5-0008CK-3s
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 17:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7mgd-0007Qs-By
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:01:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7mgb-0001gr-NT
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612476072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1oriF+kIvBeKa4heV6ZE8pY2qVvIO3YCN8VJnKHQcbo=;
 b=i0nqUYzAsIlC8JbrF/PUUazSLKT/xUTbqDVf67i5r77hcLfb8Fahft16LE9Tl8jXA2rYVr
 O5m+m8xtylNTbqstwnkp3GgSKTRQ62FhTAwzzDmnZC9gItPH5rkLAZ0rkWstWaIHLNzTvK
 9t57n80jO18IX7bznBbBbb7PQfmr0hw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-orenHvWlN7qBUfjSIr_Xng-1; Thu, 04 Feb 2021 17:01:07 -0500
X-MC-Unique: orenHvWlN7qBUfjSIr_Xng-1
Received: by mail-ej1-f72.google.com with SMTP id yd11so3991162ejb.9
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 14:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1oriF+kIvBeKa4heV6ZE8pY2qVvIO3YCN8VJnKHQcbo=;
 b=d2k53R/eaTWx8PUKpJL8cQGah5Sz+l8lNXOgx33N4caFUDMkx/xnAxGXBhlMVJMjDj
 2U3xpRRY082lsLvrRuUq9CrHUCW3i92+eqjNsfij5pI9eTT47/0quUfe+Qxc5UmyZlOZ
 cHOvue13ywDZWde0XKOWsr2n6KPPkAR6jInd+dDolt7YzHbkamt0/AD/6L6wBwjJXnxT
 uenAKvXnIt3/hFxLdlwnx2uYaqGZn0zMEunz9jtAJrfDNa53sUcWllzjiwrf0C8JxYQu
 RtQZX204MWaspZ6txIifyFMDvSJUlc6eB5I2xvzAknfBuISjybvFIj+/49NT6aCu3HHw
 W7sg==
X-Gm-Message-State: AOAM531Mt+8msvKXjFXFf0PLxFYwMrtWPxheZYZg2Zr7ZXp+VBVE7rus
 7LJgjaxwYBzNx19ithnqCVMprT6WGBuU2mNe6WRqAFCXdVHB07ay6/ktwtopeNIBq0QsgXrpcKB
 SkojaHtmkrTIC7TU=
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr1092999ejk.297.1612476066777; 
 Thu, 04 Feb 2021 14:01:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz14lCPUT9VpRGQl7usAWk/Eim72qslMuq6DP1Z4LTbm9bj2Xzv0DjU1Z5HATYwRBBmx7SXmg==
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr1092983ejk.297.1612476066586; 
 Thu, 04 Feb 2021 14:01:06 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id d5sm3088511edu.12.2021.02.04.14.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 14:01:05 -0800 (PST)
Subject: Re: [PATCH 04/33] migration: push Error **errp into
 qemu_load_device_state()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-5-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bab5299f-112b-16a0-6ca0-46febca85851@redhat.com>
Date: Thu, 4 Feb 2021 23:01:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-5-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
>  migration/colo.c   | 3 +--
>  migration/savevm.c | 4 ++--
>  migration/savevm.h | 2 +-
>  3 files changed, 4 insertions(+), 5 deletions(-)
...

> -int qemu_load_device_state(QEMUFile *f)
> +int qemu_load_device_state(QEMUFile *f, Error **errp)
>  {
>      MigrationIncomingState *mis = migration_incoming_get_current();
>      int ret;
> @@ -2734,7 +2734,7 @@ int qemu_load_device_state(QEMUFile *f)
>      /* Load QEMU_VM_SECTION_FULL section */
>      ret = qemu_loadvm_state_main(f, mis);
>      if (ret < 0) {
> -        error_report("Failed to load device state: %d", ret);
> +        error_setg(errp, "Failed to load device state: %d", ret);

error_setg_errno(), otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>          return ret;
>      }


